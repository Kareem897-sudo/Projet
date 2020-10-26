<?php

namespace App\Controller;

use App\Form\EditProfilType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;



class HomepageController extends AbstractController
{
    /**
     * @Route("/", name="index")
     */
    public function index()
    {
        return $this->render('homepage/index.html.twig');
    }

    /**
     * @Route("/comedie", name="comedie_page")
     */
    public function comedie()
    {
        return $this->render('homepage/comedie.html.twig');
    }

    /**
     * @Route("/drame", name="drame_page")
     */
    public function drame()
    {
        return $this->render('homepage/drame.html.twig');
    }

    /**
     * @Route("/action", name="action_page")
     */
    public function action()
    {
        return $this->render('homepage/action.html.twig');
    }

    /**
     * @Route("/western", name="western_page")
     */
    public function western()
    {
        return $this->render('homepage/western.html.twig');
    }

    /**
     * @Route("/historique", name="historique_page")
     */
    public function historique()
    {
        return $this->render('homepage/historique.html.twig');
    }


    /**
     * @Route("/triller", name="triller_page")
     */
    public function triller()
    {
        return $this->render('homepage/triller.html.twig');
    }


    /**
     * @Route("/fantastique", name="fantastique_page")
     */
    public function fantastique()
    {
        return $this->render('homepage/fantastique.html.twig');
    }


    /**
     * @Route("/Sciences_fiction", name="sf_page")
     */
    public function sciencesFiction()
    {
        return $this->render('homepage/sciencesFiction.html.twig');
    }

    /**
     * @Route("/catastrophe", name="catastrophe_page")
     */
    public function catastrophe()
    {
        return $this->render('homepage/catastrophe.html.twig');
    }

    /**
     * @Route("/aventure", name="aventure_page")
     */
    public function aventure()
    {
        return $this->render('homepage/aventure.html.twig');
    }

    /**
     * @Route("/opera", name="opera_page")
     */
    public function opera()
    {
        return $this->render('homepage/opera.html.twig');
    }

    /**
     * @Route("/fantasy", name="fantasy_page")
     */
    public function fantasy()
    {
        return $this->render('homepage/fantasy.html.twig');
    }



    /**
     * @Route("/politiques_De_confidentialite", name="politiques_de_confidentialite")
     */
    public function politique()
    {
        return $this->render('homepage/politiquesDc.html.twig');
    }


    /**
     * @Route("/compte", name="compte")
     */

    public function compte()
    {
        return $this->render('security/compte.html.twig');
    }

    /**
     * @Route("profil_modification", name="modifier_profil")
     */
    public function editProfile(Request $request, EntityManagerInterface $entitymanager)
    {
        $user = $this->getUser();
        $form = $this->createForm(EditProfilType::class, $user);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $entitymanager->persist($user);
            $entitymanager->flush();

            $this->addFlash('message', 'Profil mis à jour');
            return $this->redirectToRoute('compte');
        }

        return $this->render('security/editProfil.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("pass_modifier", name="modifier_motdepasse")
     */
    public function editPass(Request $request, UserPasswordEncoderInterface $passwordEncoder)
    {
        if ($request->isMethod('POST')) {
            $em = $this->getDoctrine()->getManager();

            $user = $this->getUser();

            // On vérifie si les 2 mots de passe sont identiques
            if ($request->request->get('pass') == $request->request->get('pass2')) {
                $user->setPassword($passwordEncoder->encodePassword($user, $request->request->get('pass')));
                $em->flush();
                $this->addFlash('message', 'Mot de passe mis à jour avec succès');

                return $this->redirectToRoute('compte');
            } else {
                $this->addFlash('error', 'Les deux mots de passe ne sont pas identiques');
            }
        }

        return $this->render('security/editpass.html.twig');
    }
}

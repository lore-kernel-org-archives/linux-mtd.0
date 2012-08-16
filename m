Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T1yfi-00023V-AI
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 11:55:30 +0000
Message-ID: <1345118411.3393.219.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 3/4] UBI: use the whole MTD device size to get
 bad_peb_limit
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 16 Aug 2012 15:00:11 +0300
In-Reply-To: <CACQ1gAgqYPAWvpCs-buhZfoxDfvsKYge=pq+Xg0eGAuURbNjxw@mail.gmail.com>
References: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
 <1341937423-16516-4-git-send-email-richard.genoud@gmail.com>
 <1345043331.3393.151.camel@sauron.fi.intel.com>
 <CACQ1gAgqYPAWvpCs-buhZfoxDfvsKYge=pq+Xg0eGAuURbNjxw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Lytkzn62nGvs0gyuZXRz"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Lytkzn62nGvs0gyuZXRz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-16 at 10:13 +0200, Richard Genoud wrote:
> > +         To put it differently, if this value is 20, UBI will try
> to reserve
> > +         about 1.9% of physical eraseblocks for bad blocks
> handling. And that
> > +         will be 1.9% of eraseblocks on the entire NAND chip, not
> just the MTD
> > +         partition UBI attaches. This means that if you have, say,
> if a NAND
> I don't quite understand this sentence.
> Maybe you meant:
> This means that if you have, say, a NAND flash chip that admits a
> maximum of 40 bad eraseblocks [...]
> (but I'm not a native english speaker !)

Fixed, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Lytkzn62nGvs0gyuZXRz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLODLAAoJECmIfjd9wqK0gwIP+gJa70MK4NH6mvMuRfAcB0pm
b4PUW7iY3hYnfQFRUru0VH0ObYVMhlYM8z+yK0whe0CwA+5J7C6/pVfPy4QCV4Kf
1o2OZU1IWczkBcmiSy3TRI2/Ep1wIVMiKVkgCvJJCm9Zl155AGz61axSL3aKv9AG
J+KHT2Kktmlo+zjxUNbXk8s+vAyydtfphq6Q/g3629ELAO05P4zpDllPRJK5njQO
G4fiEbKvNy5I6xc+l3zBUld/eYCz88Ybq0GuasHVdyXWiViDbQUfcPnCqZimmUVn
Uy+1QOozjSjj+56NbzntrkR8sWNv1wO8Mibku8Wqy+N3N6/iMvcxaB/flSI6+/B3
W1Ga0fXN1wJ/tQUhtl8YMiCUxxBNOX1axU0wulB/BuKW1RWdowMwaPliXHnISvjx
ck2IRDHbkatL3Z3MNgWmmDrxi240HxIhfEnriNFS7tW6LRz99B2CDtrbscfCFH9T
+86G50ivGknxRFIdpQLJI0rFias3u8z9Blag443KGsBXFFaSK14t+HNynWGxTl/E
0CiRpUxjt/KxU/GQilMsAIu2R7LX+4+3+oAD1OHMhvjG6r9XSvBQMX53mSYVEcU7
nUWTUco05eDv9JWWkSwR+bST82/zgs4IOzlcx2N11RBk49oAl60NoXPm/c25K1qa
TVBsg7bcuH2dsbL1sokJ
=GEmn
-----END PGP SIGNATURE-----

--=-Lytkzn62nGvs0gyuZXRz--

Received: from ash.lnxi.com ([207.88.130.242])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Cn4s-0004BN-VA
	for <linux-mtd@lists.infradead.org>; Mon, 05 May 2003 22:00:51 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Michael Moedt <xemc@yahoo.com>
In-Reply-To: <20030505205152.72756.qmail@web13904.mail.yahoo.com>
References: <20030505205152.72756.qmail@web13904.mail.yahoo.com>
Message-Id: <1052168461.1171.11504.camel@tubarao>
Mime-Version: 1.0
Date: 05 May 2003 15:01:01 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-F1H/PLvyfSOj0X3Wc9Z8"
cc: linux-mtd@lists.infradead.org
Subject: Re: Error: Wacky! Unable to decode failure status
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-F1H/PLvyfSOj0X3Wc9Z8
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-05-05 at 14:51, Michael Moedt wrote:
> Thanks!  I guess that was the problem.  However, I
> think that it should compare CFIDEV_BUSWIDTH_ 1,2,4
> and 8 instead of 1,2,3,4.  Here's the corrected patch.

I have no explanation as to how that happened - the patch worked just
fine when I didn't try to compile it 8-)

Once I get around to doing some local testing and _really_compiling_it_,
I'll commit it to CVS.

--=20
Thayne Harbaugh
Linux Networx

--=-F1H/PLvyfSOj0X3Wc9Z8
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+ttENfsBPTKE6HMkRAuTQAJwKLkLDXUCOom4p+LeeUN5NlPVtyQCfYal8
8EeIAtqtE6zg8BtMjaCJjXU=
=xtrp
-----END PGP SIGNATURE-----

--=-F1H/PLvyfSOj0X3Wc9Z8--

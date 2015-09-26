Received: from 18.mo1.mail-out.ovh.net ([46.105.35.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zfn7W-0003eC-HV
 for linux-mtd@lists.infradead.org; Sat, 26 Sep 2015 10:54:23 +0000
Received: from mail191.ha.ovh.net (gw6.ovh.net [213.251.189.206])
 by mo1.mail-out.ovh.net (Postfix) with SMTP id 5EB19101C041
 for <linux-mtd@lists.infradead.org>; Sat, 26 Sep 2015 12:53:56 +0200 (CEST)
Date: Sat, 26 Sep 2015 11:55:07 +0100
From: Paul Barker <paul@paulbarker.me.uk>
To: linux-mtd@lists.infradead.org, Fabien Proriol <fabien.proriol@jdsu.com>
Subject: Fixing off_t handling in flashcp
Message-ID: <20150926105507.GA2711@bang.betafive.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

flashcp uses "%lu" to print values of type off_t. For example, from line 30=
7 of
flashcp.c, with formatting butchered to fit in 80 cols:

    log_printf (LOG_NORMAL,"\rWriting data: %dk/%luk (%lu%%)",
                KB (written + i),
                KB (filestat.st_size),
                PERCENTAGE (written + i,filestat.st_size));

The KB() macro doesn't change the type of filestat.st_size, which is 64 bits
when large file support is enabled. On a 32-bit system this should be print=
ed as
"%llu" not "%lu".

Looking through the archives there is already a patch to address this but it
doesn't seem to have been applied or replied to:
http://lists.infradead.org/pipermail/linux-mtd/2014-November/056410.html

I'd like to see this fixed as the current display output is ugly on our sys=
tems.
Could someone take another look at this patch from Fabien? I'll also test t=
his
at work this week to ensure it works correctly.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJWBnmLAAoJEBwoJlo7UPQDuc8H/jaOfOvy0Q8XWheZhrL3XVG0
mTIuLBq9CaDebvEWp7c8FPDCIoAoUfghpU8AkywAWYjMq1koOG0/FjwoYXHnOMO7
vUbLPE7vj2/sZMiMg05UCg5v9Qult02wV7n+n74rOtNE3qKiHq5UBhCPRlFdlzdz
2asB+LHweXM4TuNuTBOc11J2TfcUdK5AAYtShyXyUaY/Bh5yKJkScczchT7tSL8l
+W86EUo27Zrj3aEqIpw1wQsWOG4xwPbBPfBOBeFfOq98CmzSBp7+iJIgZ/7x7Jro
TXcAMVPwJFjpDfSDUK/Pl+Df34RHbxbQo8jdZIIJYv3O9DMZatv0pSIVdQtFBX8=
=5mbn
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--

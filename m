Received: from mail-in-07.arcor-online.net ([151.189.21.47])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1azVSC-0002wm-RE
 for linux-mtd@lists.infradead.org; Sun, 08 May 2016 20:37:29 +0000
Received: from mail-in-03-z2.arcor-online.net (mail-in-03-z2.arcor-online.net
 [151.189.8.15])
 by mx.arcor.de (Postfix) with ESMTP id 3r2xN25WmFzBs4L
 for <linux-mtd@lists.infradead.org>; Sun,  8 May 2016 22:05:54 +0200 (CEST)
Received: from mail-in-09.arcor-online.net (mail-in-09.arcor-online.net
 [151.189.21.49])
 by mail-in-03-z2.arcor-online.net (Postfix) with ESMTP id B9D3C1F6307
 for <linux-mtd@lists.infradead.org>; Sun,  8 May 2016 22:05:54 +0200 (CEST)
Received: from [192.168.178.23] (p549AC2AE.dip0.t-ipconnect.de
 [84.154.194.174]) (Authenticated sender: giorgio.nicole@arcor.de)
 by mail-in-09.arcor-online.net (Postfix) with ESMTPA id 3r2xN23tvlzB3vy
 for <linux-mtd@lists.infradead.org>; Sun,  8 May 2016 22:05:54 +0200 (CEST)
To: linux-mtd@lists.infradead.org
From: Giorgio <giorgio.nicole@arcor.de>
Subject: mtd: spi-nor.c: wrong test in stm_unlock()
Message-ID: <73b50470-a187-2ecb-4c0a-082fb5508a63@arcor.de>
Date: Sun, 8 May 2016 22:05:48 +0200
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="8qdpHd9QlN1IPEnSOviei5ev1VgBAhH3u"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8qdpHd9QlN1IPEnSOviei5ev1VgBAhH3u
Content-Type: multipart/mixed; boundary="0Cv0OQRdqA0DEdEkEOMhjedT98UEniu9n"
From: Giorgio <giorgio.nicole@arcor.de>
To: linux-mtd@lists.infradead.org
Message-ID: <73b50470-a187-2ecb-4c0a-082fb5508a63@arcor.de>
Subject: mtd: spi-nor.c: wrong test in stm_unlock()

--0Cv0OQRdqA0DEdEkEOMhjedT98UEniu9n
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I noticed a wrong test within the function stm_unlock() in spi-nor.c in
the kernel 4.6-rc5:

static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
{
	struct mtd_info *mtd =3D &nor->mtd;
	int status_old, status_new;
	u8 mask =3D SR_BP2 | SR_BP1 | SR_BP0;
=2E..
=2E..
	/* Don't protect status register if we're fully unlocked */
	if (lock_len =3D=3D mtd->size)
		status_new &=3D ~SR_SRWD;
=2E..

This last if test should be:

	if (lock_len =3D=3D 0)
		status_new &=3D ~SR_SRWD;

giorgio


--0Cv0OQRdqA0DEdEkEOMhjedT98UEniu9n--

--8qdpHd9QlN1IPEnSOviei5ev1VgBAhH3u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlcvnCEACgkQYqbc2h3T5VC47QCgqeFSNgoKdWX5P7e7sCKAqy+1
VhQAn1HrEGElL4no5B9a4VorO6ZI/x2Z
=GOdg
-----END PGP SIGNATURE-----

--8qdpHd9QlN1IPEnSOviei5ev1VgBAhH3u--

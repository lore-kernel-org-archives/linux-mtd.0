Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15cndj-0000C0-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2001 13:43:16 +0100
Date: Fri, 31 Aug 2001 14:50:05 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: ashok mp <ashok_mp@rediffmail.com>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: Erase Sector Size
Message-ID: <20010831145005.A18114@crystal.2d3d.co.za>
References: <20010831124235.27912.qmail@mailweb26.rediffmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
In-Reply-To: <20010831124235.27912.qmail@mailweb26.rediffmail.com>; from ashok_mp@rediffmail.com on Fri, Aug 31, 2001 at 12:42:35 -0000
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi ashok!

> iam using 2.4.2 rmk2 np1 kernel
> while make menuconfig under
> *MTD
> *RAM/ROM(Flash Chip Driver)
>  () Flash cmd/Qurey data swapping
>=20
> what should i select here (iam using assabet board)
> ()NO
> ()BIG_ENDIAN_BYTE
> ()LITTLE_ENDIAN_BYTE.

Have you read Vipin's mtd-jffs HOWTO yet? It covers these kind of questions.
You can also ask around on the MTD mailinglist.

I don't have a Assabet board myself, but iirc it uses Intel StrataFlash, so
you want CFI support, it's corresponding mapping driver, etc. etc.

--=20

Regards
 Abraham

Tuesday After Lunch is the cosmic time of the week.

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7j4f9zNXhP0RCUqMRAvm1AJ9F2gpMDCZgmIV0LcdM/wp9Px+p9ACfTO1M
4+vrnnH/ODEqXlT+m9SUjrI=
=oO24
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--

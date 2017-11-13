Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eELKR-00027h-2S
 for linux-mtd@lists.infradead.org; Mon, 13 Nov 2017 20:27:37 +0000
Date: Mon, 13 Nov 2017 21:27:01 +0100
From: Lukasz Majewski <lukma@denx.de>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>
Subject: [NAND] Question regarding -EIO error
Message-ID: <20171113212701.01de0c47@jawa>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VC0QQOWaPUTbKZgizdcvV=M"; protocol="application/pgp-signature"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Sig_/VC0QQOWaPUTbKZgizdcvV=M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear All,

I was investigating the -EIO issue for page write from 2.6.26 kernel up
till 4.14-rc7.

A foreword:
-----------

Before the commit (v4.4):
mtd: nand: increase ready wait timeout and report timeouts [1]
b70af9bef49bd9a5f4e7a2327d9074e29653e665

The timeout for nand memory write (nand_page_write()) was ignored (as
mentioned in [1]).
The nand_write_page() (@nand_base.c) only checks for NAND_STATUS_FAIL
(and returns -EIO).

In the old days it also used CONFIG_MTD_NAND_VERIFY_WRITE to check if
correct data is written (if not -EIO was returned immediately).
This was removed with [2]:
"mtd: kill MTD_NAND_VERIFY_WRITE"
657f28f8811c92724db10d18bbbec70d540147d6

The commit:
"mtd: nand_wait: warn if the nand is busy on exit"
f251b8dfdd0721255ea11751cdc282834e43b74e

added WARN_ON() on timeout.

Setup:
-----

I've run mtd_*.ko tests on several kernels and two memories.

With mtd_torture tests (and timeout set to 20ms):
modprobe mtd_torturetest dev=3D${device} check=3D1 cycles_count=3D100 gran=
=3D10

forces both memories to timeout (at random execution place) with -EIO
error returned.

Please correct me if I'm wrong:
-------------------------------

With the new kernel (v4.14-rc7) we rely on:

1. Page write timeout increased from 20ms -> 400 ms (as in [1])

2. The WARN_ON() is displayed when we leave nand_wait() with ongoing
NAND controller operation.

3. As written in [2] the correctness of written data is check in upper
layers (fs) -> when memory return no fails, but internal controller
still writes data.


Problem:
--------

Normally to exit nand_wait loop I do read RnB GPIO pin
(chip->dev_ready).=20

When we got a timeout passed status from one memory is 0x81.
Second one returns no errors (0x80) - but the write data check fails.
According to spec bits 5 and 6 (of status register) are 0 -> Internal
data operation Busy and overall Busy.

The problem here is that we exit nand_wait with NAND memory controller
still being busy. Timeout change[1] from 20ms -> 400ms just 'masked'
this issue.


Question:
---------

Shall not we wait more (@nand_wait) for internal operations to be
finished?


To reproduce:
-------------

Change back the timeout value from 400ms to 20m and run mtd_*.ko tests.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/VC0QQOWaPUTbKZgizdcvV=M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAloKABUACgkQAR8vZIA0
zr1cPwgA2R2b9TRnDan2Yfn7SekZxRGmb6qtn7cBE1CC+ZfpeBhGEbg3JiZf9wns
pS/It4wFTLiOw2LuDC+iy4bqxW5KOUMWQ+xFrEgxAAzEiXBw9A7UPf4nR+kjcuAz
/g2n0hxxFPl/SDjEMuDwR1vbwvkz5TzGGywXBORlyKsb3C8IWqqpfrOHzSlMIIKn
ELcCuXY1Oj/Z4vNOwzhPzkZqGSCKyM4HsxkMA9itF8tbOEkKCDQRcfbVZp9jDRMK
wIXoopRtH/Mv8ZcrB/j1IFPEFEQ1ZPji6hVs7rKazb2pXxWuE2W17qzixfaq8LIc
5C0lHzTbLuCaNWy/p9K+YrWjR56eIw==
=0Nf2
-----END PGP SIGNATURE-----

--Sig_/VC0QQOWaPUTbKZgizdcvV=M--

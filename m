Received: from mail-oln040092003013.outbound.protection.outlook.com
 ([40.92.3.13] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eoa8A-0006vR-Tj
 for linux-mtd@lists.infradead.org; Wed, 21 Feb 2018 19:32:44 +0000
From: Bean Huo <beanhuo@outlook.com>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "boris.brezillon@free-elections.com"
 <boris.brezillon@free-elections.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
CC: beanhuo <beanhuo@micron.com>
Subject: [PATCH v1 0/3] mtd: add support for the dual-die stack parallel NOR
Date: Wed, 21 Feb 2018 19:32:29 +0000
Message-ID: <DM2PR12MB0014E20BA4896461BD477FDAA6CE0@DM2PR12MB0014.namprd12.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: beanhuo <beanhuo@micron.com>

The dual-die stacked parallel NOR flash comprises the two identical dies
in parallel. the second/upper die should be selected through its unlock
cycle command addresses, maximum address line A[max]. when the=20
A[max] =3D=3D 1, the second/upper die is activated, when  A[max] =3D=3D 0, =
the=20
first/lower die is activated.
Because CFI table doesn't exist one entry that can tell us this is a dual
die device, I only add this information in the devicetree binding.

This patch now will update following funcitons:
otp_enter()
otp_exit()
do_write_oneword()
do_write_buffer()
do_panic_write_oneword()
do_erase_oneblock()
do_ppb_xxlock()

For the Micron dual-die stacked PNOR,since there are two dies now,
the following functions need to be changed, but not in this series
patch. Because I am not 100% sure if other parallel NOR vendors'
dual-die stacked PNOR need, still studying.
do_otp_lock()
cfi_amdstd_otp_walk()
do_erase_chip()

beanhuo (3):
  mtd: physmap: add dual die entry in devicetree binding
  mtd: probe: probe dual die entry from devicetree binding
  drivers: mtd: chips: add support for the dual die stacked PNOR

 .../devicetree/bindings/mtd/mtd-physmap.txt        |   2 +
 drivers/mtd/chips/cfi_cmdset_0002.c                | 144 ++++++++++++++++-=
----
 drivers/mtd/chips/cfi_probe.c                      |   7 +
 include/linux/mtd/cfi.h                            |   8 ++
 4 files changed, 130 insertions(+), 31 deletions(-)

--=20
2.7.4

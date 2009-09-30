Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MsmxX-0005Z4-Gj
	for linux-mtd@lists.infradead.org; Wed, 30 Sep 2009 00:22:24 +0000
From: "Scott Branden" <sbranden@broadcom.com>
To: "Leo (Hao) Chen" <leochen@broadcom.com>,
	"David Woodhouse" <dwmw2@infradead.org>
Date: Tue, 29 Sep 2009 17:22:05 -0700
Subject: RE: [PATCH] [MTD] bcmring: mtd nand driver
Message-ID: <9383297B60843144AC17878B479520F110AEE53D35@SJEXCHCCR01.corp.ad.broadcom.com>
In-Reply-To: <20090930000220.GA3812@broadcom.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org=20
> [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=20
> Leo (Hao) Chen
> Sent: September 29, 2009 5:02 PM
> To: David Woodhouse
> Cc: Linux MTD
> Subject: Re: [PATCH] [MTD] bcmring: mtd nand driver
>=20
> Hi,
>=20
> Please check the updated version of this patch for bcmring nand driver
> support.
>=20
> I've removed superfluous comments, added platform resource,=20
> added a new
> kernel option to replace the USE_HWECC macro.
>=20
> Please comment.
>=20
> Thanks,
>=20
> Leo
>=20
> From 398b8fbfd219ee20f2eb76101992d6153ce8b52e Mon Sep 17 00:00:00 2001
> From: Leo Chen <leochen@broadcom.com>
> Date: Mon, 28 Sep 2009 14:11:49 -0700
> Subject: [PATCH] add bcmring mtd nand driver support
>=20
> Add mtd umi driver for bcmring arm arch.
> Add header files, register definition files,
> add entry in Kconfig and Makefile.
>=20
> remove superfluous comments from bcm nand driver
> use platform resource
>=20
> add CONFIG_MTD_NAND_BCM_UMI_HWECC option to replace USE_HWECC macro
>=20
> diff --git a/arch/arm/configs/bcmring_defconfig=20
> b/arch/arm/configs/bcmring_defconfig
> index bcc0bac..789794e 100644
> --- a/arch/arm/configs/bcmring_defconfig
> +++ b/arch/arm/configs/bcmring_defconfig
> @@ -416,6 +416,7 @@ CONFIG_MTD_NAND_VERIFY_WRITE=3Dy
>  CONFIG_MTD_NAND_IDS=3Dy
>  CONFIG_MTD_NAND_BCM_UMI=3Dy
>  CONFIG_MTD_NAND_BCM_UMI_HWCS=3Dy
> +CONFIG_MTD_NAND_BCM_UMI_HWECC=3Dy

There is no need for an additional CONFIG option.  Just always use HWECC an=
d delete the soft code.

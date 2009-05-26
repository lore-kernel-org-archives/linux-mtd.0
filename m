Received: from mail-ew0-f173.google.com ([209.85.219.173])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M8tn1-0002nL-OQ
	for linux-mtd@lists.infradead.org; Tue, 26 May 2009 10:21:54 +0000
Received: by ewy21 with SMTP id 21so3884382ewy.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 May 2009 03:21:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <72795ccb0905260247p6c204cc4w78eaafd28ffc3cf8@mail.gmail.com>
References: <72795ccb0905250844w13ed9798me95d70614050f676@mail.gmail.com>
	<1243323142.21646.129.camel@localhost.localdomain>
	<72795ccb0905260240q6389dd35j681dbe50a6d4990f@mail.gmail.com>
	<1243331031.21646.134.camel@localhost.localdomain>
	<72795ccb0905260247p6c204cc4w78eaafd28ffc3cf8@mail.gmail.com>
Date: Tue, 26 May 2009 12:21:46 +0200
Message-ID: <72795ccb0905260321n3b4646brb9adc90425b5304b@mail.gmail.com>
Subject: Re: [PATCH] mtd: Nand Atmel: add On Flash BBT support
From: simon polette <spolette@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
Cc: Gregory CLEMENT <gclement@adeneo.eu>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-arm-kernel@lists.arm.linux.org.uk, spolette@adetelgroup.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/5/26 simon polette <spolette@gmail.com>:
> 2009/5/26 Artem Bityutskiy <dedekind@infradead.org>:
>> On Tue, 2009-05-26 at 11:40 +0200, simon polette wrote:
>>> 2009/5/26 Artem Bityutskiy <dedekind@infradead.org>:
>>> > On Mon, 2009-05-25 at 17:44 +0200, simon polette wrote:
>>> >> +config =9A =9A =9A MTD_NAND_ATMEL_FLASH_BBT
>>> >> + =9A =9A bool "Use On-Flash Bad Block Table"
>>> >> + =9A =9A depends on MTD_NAND_ATMEL
>>> >> + =9A =9A help
>>> >> + =9A =9A =9A This enables the On-Flash BBT, which mean that the bad=
 blocks
>>> >> + =9A =9A =9A will be scanned one time then the BBT will be stored
>>> >> + =9A =9A =9A in flash, so scanning Nand flash for bad blocks will b=
e no more
>>> >> + =9A =9A =9A necessary for the next boots.
>>> >> +
>>> >
>>> > I do not think you need a config option for this. It should be
>>> > a module parameter instead.
>>> >
>>> > --
>>> > Best regards,
>>> > Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>>> >
>>> >
>>>
>>> Yes, good idea, but do you think that I can keep a config option to
>>> define the default state of that param, it means doing something like
>>> :
>>> #ifdef CONFIG_MTD_NAND_ATMEL_FLASH_BBT
>>> static int use_on_flash_bbt =3D 1;
>>> #else
>>> static int use_on_flash_bbt =3D 0;
>>> #endif
>>> module_param(use_on_flash_bbt, int, 0);
>>
>> I think it is generally bad idea if each nand driver will
>> introduce a separate config option for this kind of stuff.
>>
>> You may always boot your kernel with something like
>> atmel_nand.on_flash_bbt=3D1 in the kernel parameters.
>>
>> --
>> Best regards,
>> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>>
>>
>
> Ok, I asked this question cause it's what have been done in the nand
> diskonchip driver.
> I'll send you a new patch soon.
>
> Best regards,
>
> Simon Polette
> Adeneo - Adetelgroup
>

So here is the new patch :

Signed-off-by: Simon Polette <spolette@adetelgroup.com>
---
 drivers/mtd/nand/atmel_nand.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 47a33ce..e113594 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -24,6 +24,7 @@

 #include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>Signed-off-by: Simon Polette
<spolette@adetelgroup.com>
@@ -47,6 +48,9 @@
 #define no_ecc		0
 #endif

+static int on_flash_bbt =3D 0;
+module_param(on_flash_bbt, int, 0);
+
 /* Register access macros */
 #define ecc_readl(add, reg)				\
 	__raw_readl(add + ATMEL_ECC_##reg)
@@ -465,6 +469,11 @@ static int __init atmel_nand_probe(struct
platform_device *pdev)
 		}
 	}

+	if (on_flash_bbt) {
+		printk("atmel_nand: Use On Flash BBT\n");
+		nand_chip->options |=3D NAND_USE_FLASH_BBT;
+	}
+
 	/* first scan to find the device and get the page size */
 	if (nand_scan_ident(mtd, 1)) {
 		res =3D -ENXIO;
--=20
1.6.0.4

--
Best regards,

Simon Polette
Adeneo - Adetelgroup

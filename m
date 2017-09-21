Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1duzF8-0003k7-M8
 for linux-mtd@lists.infradead.org; Thu, 21 Sep 2017 11:02:08 +0000
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
 [209.85.161.179]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id v8LB1Fx9000459
 for <linux-mtd@lists.infradead.org>; Thu, 21 Sep 2017 20:01:16 +0900
Received: by mail-yw0-f179.google.com with SMTP id w22so3763916ywa.13
 for <linux-mtd@lists.infradead.org>; Thu, 21 Sep 2017 04:01:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <25edd455-ad6c-f222-f552-2aa3d807112a@pengutronix.de>
References: <25edd455-ad6c-f222-f552-2aa3d807112a@pengutronix.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 21 Sep 2017 20:00:34 +0900
Message-ID: <CAK7LNASR_1OsR+Dp3J7=Mtii_Ysp72DhWFXSYoeFVLiFPXu2AA@mail.gmail.com>
Subject: Re: nand: denali: issue with 4.13
To: Oleksij Rempel <ore@pengutronix.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

2017-09-21 15:44 GMT+09:00 Oleksij Rempel <ore@pengutronix.de>:
> Hi Masahiro,
>
> you are probably the expert of denali nand driver.
> With kernel v4.13 i have following issue, it works on FPGASoC 5CSEBA5U...
> but is now working on FPGASoC 5CSXFC6C6U... both of them have same NAND
> chip, and seems to have similar IP core.
>
> FPGASoC 5CSXFC6C6U...:
> ====================================================================
> [    0.095899] console [ttyS0] disabled
> [    0.095941] ffc02000.serial0: ttyS0 at MMIO 0xffc02000 (irq = 38,
> base_baud = 6250000) is a 16550A
> [    0.702041] console [ttyS0] enabled
> [    0.706986] brd: module loaded
> [    0.716232] loop: module loaded
> [    0.720074] nand: device found, Manufacturer ID: 0x00, Chip ID: 0x2c


This line is strange.  It failed to read Manufacturer ID.
The 0x2c should be Manufacturer ID, not Chip ID.


I am guessing we need to wait a bit
after the NAND_CMD_READID.

Please try the following ugly patch.



diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index bcc8cef1..2443e3d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -744,10 +744,11 @@ static void nand_command(struct mtd_info *mtd,
unsigned int command,
        case NAND_CMD_ERASE2:
        case NAND_CMD_SEQIN:
        case NAND_CMD_STATUS:
-       case NAND_CMD_READID:
        case NAND_CMD_SET_FEATURES:
                return;
-
+       case NAND_CMD_READID:
+               udelay(5);
+               return;
        case NAND_CMD_RESET:
                if (chip->dev_ready)
                        break;
@@ -874,10 +875,11 @@ static void nand_command_lp(struct mtd_info
*mtd, unsigned int command,
        case NAND_CMD_ERASE2:
        case NAND_CMD_SEQIN:
        case NAND_CMD_STATUS:
-       case NAND_CMD_READID:
        case NAND_CMD_SET_FEATURES:
                return;
-
+       case NAND_CMD_READID:
+               udelay(5);
+               return;
        case NAND_CMD_RNDIN:
                nand_ccs_delay(chip);
                return;



-- 
Best Regards
Masahiro Yamada

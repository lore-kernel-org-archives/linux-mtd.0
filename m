Received: from mail-qa0-x22f.google.com ([2607:f8b0:400d:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WygXn-0002G1-5W
 for linux-mtd@lists.infradead.org; Sun, 22 Jun 2014 12:06:47 +0000
Received: by mail-qa0-f47.google.com with SMTP id hw13so4709815qab.34
 for <linux-mtd@lists.infradead.org>; Sun, 22 Jun 2014 05:06:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1403259137-22171-1-git-send-email-david@protonic.nl>
References: <1403259137-22171-1-git-send-email-david@protonic.nl>
Date: Sun, 22 Jun 2014 20:06:23 +0800
Message-ID: <CAE94FHELXgoZ9Jm1E3_YT6D1SB=VAGWthZSjbsR+qqkUWn97PA@mail.gmail.com>
Subject: Re: [FRC] [PATCH] MTD: nand_base.c: Enable support for Samsung E-die
 SLC NAND
From: Ted Juan <ted.juan@gmail.com>
To: David Jander <david@protonic.nl>, "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=UTF-8
Cc: sjhill@realitydiluted.com, tglx@linutronix.de,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
   I recently do the power cut test with this Samsung NAND flash
K9F1G08U0E with TI AM3352 chip.
I have set the NAND_NO_SUBPAGE_WRITE parameter and checked all the
flash timing that are all correct.
But it still happened uncorrectable error that bit-flip more than 8
bits no matter erase page or not.
The below is the wrong data with erase page that bit-flip more than 8 bits .

Does anyone have the same experience?

PS. The Samsung D-die SLC NAND is test OK in the same environment. And
the TI driver code is base on the latest l2-mtd git tree.

regards,
Ted


[    7.129791] [0x0000] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.136138] [0x0010] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.142486] [0x0020] 0xfbfdffff 0xffffffff 0xffffffff 0xffffffff
[    7.148864] [0x0030] 0xffbfffff 0xffff7fff 0xffffffff 0xffffffff
[    7.155212] [0x0040] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.161590] [0x0050] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.167938] [0x0060] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.174316] [0x0070] 0xf7ffffff 0xfffffcff 0xffffffff 0xffffffff
[    7.180664] [0x0080] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.187042] [0x0090] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.193389] [0x00a0] 0xffbfffff 0xffffffff 0xffffffff 0xffffffff
[    7.199737] [0x00b0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.206115] [0x00c0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.212463] [0x00d0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.218841] [0x00e0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.225189] [0x00f0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.231567] [0x0100] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.237915] [0x0110] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.244293] [0x0120] 0xffdfffff 0xffffffff 0xffffffff 0xffffffff
[    7.250640] [0x0130] 0xffffffff 0xffff7fff 0xffffffff 0xffffffff
[    7.256988] [0x0140] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.263366] [0x0150] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.269714] [0x0160] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.276092] [0x0170] 0xffffffff 0xffffffdf 0xffffffff 0xffffffff
[    7.282440] [0x0180] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.288818] [0x0190] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.295166] [0x01a0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.301544] [0x01b0] 0xffffffff 0xffffdfff 0xffffffff 0xffffffff
[    7.307891] [0x01c0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.314270] [0x01d0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    7.320617] [0x01e0] 0xbfffffff 0xffffffff 0xffffffff 0xffffffff
[    7.326995] [0x01f0] 0xffffffff 0xfffff7af 0xffffffff 0xffffffff

2014-06-20 18:12 GMT+08:00 David Jander <david@protonic.nl>:
> Samsung E-die SLC NAND doesn't support partial writes anymore and there
> seems to be no other way of detecting this than looking at bits 0 & 1
> of the 5th ID byte. Those bits were "reserved" and 00 for all older
> chips. On E-die chips, "01" seems to indicate 21nm feature size. This
> patch assumes that all later revisions (if they will ever come) will have
> this characteristic as well and disables sub-page writes in this case.
>
> Signed-off-by: David Jander <david@protonic.nl>
> ---
>  drivers/mtd/nand/nand_base.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 41167e9..e68e0c7 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3468,6 +3468,16 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
>                         mtd->oobsize = 32 * mtd->writesize >> 9;
>                 }
>
> +               /*
> +                * Samsung E-die SLC NAND doesn't support partial writes
> +                * anymore. The only way to distinguish this die-revision
> +                * is by checking bits 0 and 1 of id_data[4], which seem
> +                * to indicate feature size (previous => 00, 21nm => 01).
> +                */
> +               if (id_data[0] == NAND_MFR_SAMSUNG && nand_is_slc(chip) &&
> +                               (id_data[4] & 0x03) /* 21nm or newer */) {
> +                       chip->options |= NAND_NO_SUBPAGE_WRITE;
> +               }
>         }
>  }
>
> --
> 1.9.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

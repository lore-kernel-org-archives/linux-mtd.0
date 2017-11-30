Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKJXm-0005kF-Uk
 for linux-mtd@lists.infradead.org; Thu, 30 Nov 2017 07:46:05 +0000
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
 [209.85.217.174]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id vAU7jGwG021638
 for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2017 16:45:17 +0900
Received: by mail-ua0-f174.google.com with SMTP id p33so5150094uag.9
 for <linux-mtd@lists.infradead.org>; Wed, 29 Nov 2017 23:45:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171107145419.22717-2-miquel.raynal@free-electrons.com>
References: <20171107145419.22717-1-miquel.raynal@free-electrons.com>
 <20171107145419.22717-2-miquel.raynal@free-electrons.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 30 Nov 2017 16:44:35 +0900
Message-ID: <CAK7LNATWXZci_M8EqeU-8KSEviWzAT7p1KSdkuqAkSAuj-Zj6w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/6] mtd: nand: provide several helpers to do
 common NAND operations
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mark Rutland <mark.rutland@arm.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Stefan Agner <stefan@agner.ch>, Wenyou Yang <wenyou.yang@atmel.com>,
 Nadav Haklai <nadavh@marvell.com>, Marek Vasut <marek.vasut@gmail.com>,
 Han Xu <han.xu@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Josh Wu <rainyfeeling@outlook.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-11-07 23:54 GMT+09:00 Miquel Raynal <miquel.raynal@free-electrons.com>:

> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 5124f8ae8c04..ca8d3414d252 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -645,8 +645,6 @@ static void denali_oob_xfer(struct mtd_info *mtd, struct nand_chip *chip,
>                             int page, int write)
>  {
>         struct denali_nand_info *denali = mtd_to_denali(mtd);
> -       unsigned int start_cmd = write ? NAND_CMD_SEQIN : NAND_CMD_READ0;
> -       unsigned int rnd_cmd = write ? NAND_CMD_RNDIN : NAND_CMD_RNDOUT;
>         int writesize = mtd->writesize;
>         int oobsize = mtd->oobsize;
>         uint8_t *bufpoi = chip->oob_poi;
> @@ -658,11 +656,11 @@ static void denali_oob_xfer(struct mtd_info *mtd, struct nand_chip *chip,
>         int i, pos, len;
>
>         /* BBM at the beginning of the OOB area */
> -       chip->cmdfunc(mtd, start_cmd, writesize, page);
>         if (write)
> -               chip->write_buf(mtd, bufpoi, oob_skip);
> +               nand_prog_page_begin_op(chip, page, writesize, bufpoi,
> +                                       oob_skip);
>         else
> -               chip->read_buf(mtd, bufpoi, oob_skip);
> +               nand_read_page_op(chip, page, writesize, bufpoi, oob_skip);
>         bufpoi += oob_skip;
>
>         /* OOB ECC */
> @@ -675,30 +673,35 @@ static void denali_oob_xfer(struct mtd_info *mtd, struct nand_chip *chip,
>                 else if (pos + len > writesize)
>                         len = writesize - pos;
>
> -               chip->cmdfunc(mtd, rnd_cmd, pos, -1);
>                 if (write)
> -                       chip->write_buf(mtd, bufpoi, len);
> +                       nand_change_write_column_op(chip, pos, bufpoi, len,
> +                                                   false);
>                 else
> -                       chip->read_buf(mtd, bufpoi, len);
> +                       nand_change_read_column_op(chip, pos, bufpoi, len,
> +                                                  false);
>                 bufpoi += len;
>                 if (len < ecc_bytes) {
>                         len = ecc_bytes - len;
> -                       chip->cmdfunc(mtd, rnd_cmd, writesize + oob_skip, -1);
>                         if (write)
> -                               chip->write_buf(mtd, bufpoi, len);
> +                               nand_change_write_column_op(chip, writesize +
> +                                                           oob_skip, bufpoi,
> +                                                           len, false);
>                         else
> -                               chip->read_buf(mtd, bufpoi, len);
> +                               nand_change_read_column_op(chip, writesize +
> +                                                          oob_skip, bufpoi,
> +                                                          len, false);
>                         bufpoi += len;
>                 }
>         }
>
>         /* OOB free */
>         len = oobsize - (bufpoi - chip->oob_poi);
> -       chip->cmdfunc(mtd, rnd_cmd, size - len, -1);
>         if (write)
> -               chip->write_buf(mtd, bufpoi, len);
> +               nand_change_write_column_op(chip, size - len, bufpoi, len,
> +                                           false);
>         else
> -               chip->read_buf(mtd, bufpoi, len);
> +               nand_change_read_column_op(chip, size - len, bufpoi, len,
> +                                          false);
>  }
>
>  static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
> @@ -788,16 +791,12 @@ static int denali_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
>                             int page)
>  {
>         struct denali_nand_info *denali = mtd_to_denali(mtd);
> -       int status;
>
>         denali_reset_irq(denali);
>
>         denali_oob_xfer(mtd, chip, page, 1);
>
> -       chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> -       status = chip->waitfunc(mtd, chip);
> -
> -       return status & NAND_STATUS_FAIL ? -EIO : 0;
> +       return nand_prog_page_end_op(chip);
>  }
>
>  static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
> @@ -951,7 +950,7 @@ static int denali_erase(struct mtd_info *mtd, int page)
>         irq_status = denali_wait_for_irq(denali,
>                                          INTR__ERASE_COMP | INTR__ERASE_FAIL);
>
> -       return irq_status & INTR__ERASE_COMP ? 0 : NAND_STATUS_FAIL;
> +       return irq_status & INTR__ERASE_FAIL ? -EIO : 0;
>  }

Does this change keep the equivalent behavior?

Changing NAND_STATUS_FAIL to -EIO is OK
(but, not mentioned in the git-log)

I am not 100% sure about
  INTR__ERASE_COMP  ->  INTR__ERASE_FAIL.


Theoretically, there could be three cases:
  [1] INTR__ERASE_COMP interrupt is asserted
  [2] INTR__ERASE_FAIL interrupt is asserted
  [3] Nothing is asserted (bailout by timeout)


If you change this, I must consult our hardware engineers
whether [3] happens or not in erase operation.


-- 
Best Regards
Masahiro Yamada

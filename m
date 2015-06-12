Received: from mail-yh0-x236.google.com ([2607:f8b0:4002:c01::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z3Lb1-0002Qe-2f
 for linux-mtd@lists.infradead.org; Fri, 12 Jun 2015 09:49:56 +0000
Received: by yhak3 with SMTP id k3so11905098yha.2
 for <linux-mtd@lists.infradead.org>; Fri, 12 Jun 2015 02:49:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1434038402-26365-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
References: <1434038402-26365-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
Date: Fri, 12 Jun 2015 11:49:31 +0200
Message-ID: <CAFLxGvzSosfd50=UUcSRgjiVw=48FP8hgxb9bhL9UDGHTBz9yw@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: nand: support for Toshiba BENAND (Built-in ECC
 NAND)
From: Richard Weinberger <richard.weinberger@gmail.com>
To: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 11, 2015 at 6:00 PM, KOBAYASHI Yoshitake
<yoshitake.kobayashi@toshiba.co.jp> wrote:
> This patch enables support for Toshiba BENAND.
> BENAND is a SLC NAND solution that automatically generates ECC inside
> NAND chip.
>
> Some of the comments in the following discussion may need to be considerd.
>   https://lkml.org/lkml/2015/3/25/310

Yep.

> +void nand_benand_init(struct mtd_info *mtd)
> +{
> +       struct nand_chip *chip = mtd->priv;
> +
> +       pr_info("%s\n", __func__);

Please kill all these prints. Use ftrace to trace function calls.

> +       chip->ecc.size = mtd->writesize;
> +       chip->ecc.strength = 1;

BENAND can correct only one bit?
This would explain why you consider it as fast. ;-)

> +int nand_benand_status_chk(struct mtd_info *mtd, struct nand_chip *chip)
> +{
> +       unsigned int bitflips = 0;
> +       u8 status;
> +
> +       pr_debug("%s\n", __func__);
> +
> +       /* Check Read Status */
> +       chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
> +       status = chip->read_byte(mtd);
> +
> +       /* timeout */
> +       if (!(status & NAND_STATUS_READY)) {
> +               pr_info("BENAND : Time Out!\n");
> +               return -EIO;
> +       }
> +
> +       /* uncorrectable */
> +       else if (status & NAND_STATUS_FAIL) {
> +               pr_info("BENAND : Uncorrectable!\n");
> +               mtd->ecc_stats.failed++;
> +       }
> +
> +       /* correctable */
> +       else if (status & NAND_STATUS_RECOM_REWRT) {
> +               pr_info("BENAND : Recommended to rewrite!\n");
> +               bitflips = chip->ecc.strength;

In your case this might be okay, as you set strength to 1.
Otherweise you'd have to report the real number of bitflips.

-- 
Thanks,
//richard

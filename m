Received: from mail-vn0-x22e.google.com ([2607:f8b0:400c:c0f::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2amb-0001jp-E7
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 07:50:46 +0000
Received: by vnbg1 with SMTP id g1so6658813vnb.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 00:50:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1433920119-16303-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
References: <1433920119-16303-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
Date: Wed, 10 Jun 2015 09:50:22 +0200
Message-ID: <CAFLxGvx7epkW9OA5PotBWbQr-FH_9uCMUZAtRP0oX16WcyiWLQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: support for Toshiba BENAND (Built-in ECC NAND)
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

On Wed, Jun 10, 2015 at 9:08 AM, KOBAYASHI Yoshitake
<yoshitake.kobayashi@toshiba.co.jp> wrote:
> This patch enables support for Toshiba BENAND.
> Toshiba BENAND is a SLC NAND solution that automatically generates ECC
> inside NAND chip. Newer generation SLC NAND devices of today need multi-bit
> hardware ECC by NAND controller in SoC. BENAND solution is ECC free,
> has high performance and backward compatibility in NAND chip trend.

Do you have performance numbers?
How fast is it compared to a decent HW ECC engine?

Did you see my On-Die ECC series and Brian's comments on it?
https://lkml.org/lkml/2015/3/25/310
I suspect some of his comments will apply to you as well.

> Signed-off-by: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
> ---
>  drivers/mtd/nand/Kconfig     |   16 ++++++++++++++++
>  drivers/mtd/nand/Makefile    |    1 +
>  drivers/mtd/nand/nand_base.c |   32 ++++++++++++++++++++++++++++++--
>  include/linux/mtd/nand.h     |    3 +++
>  4 files changed, 50 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 5897d8d..2f11d43 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -22,6 +22,22 @@ menuconfig MTD_NAND
>
>  if MTD_NAND
>
> +config MTD_NAND_BENAND
> +       tristate
> +       depends on MTD_NAND_BENAND_ENABLE
> +       default MTD_NAND
> +
> +config MTD_NAND_BENAND_ENABLE
> +       bool "Support for Toshiba BENAND (Built-in ECC NAND)"
> +       default y
> +       help
> +               Toshiba BENAND is a SLC NAND solution that automatically
> +               generates ECC inside NAND chip.
> +               Newer generation SLC NAND devices of today need multi-bit
> +               hardware ECC by NAND controller in SoC.
> +               BENAND solution is ECC free, has high performance and
> +               backward compatibility in NAND chip trend.
> +
>  config MTD_NAND_BCH
>         tristate
>         select BCH
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 582bbd05..afd26f0 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -3,6 +3,7 @@
>  #
>
>  obj-$(CONFIG_MTD_NAND)                 += nand.o
> +obj-$(CONFIG_MTD_NAND_BENAND)  += nand_benand.o

nand_benand.c is not part of this patch.
Forgot a git add? :-)

-- 
Thanks,
//richard

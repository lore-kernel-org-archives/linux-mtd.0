Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7G35-0005IF-M1
 for linux-mtd@lists.infradead.org; Thu, 17 Nov 2016 06:19:52 +0000
Received: by mail-wm0-x243.google.com with SMTP id g23so18043392wme.1
 for <linux-mtd@lists.infradead.org>; Wed, 16 Nov 2016 22:19:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1476628518-20450-7-git-send-email-boris.brezillon@free-electrons.com>
References: <1476628518-20450-1-git-send-email-boris.brezillon@free-electrons.com>
 <1476628518-20450-7-git-send-email-boris.brezillon@free-electrons.com>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Thu, 17 Nov 2016 14:19:29 +0800
Message-ID: <CAAyFORJR5xUCxp=jQ2kzxp7H3ArLijWAPafOgFWP19Vj97naRw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] mtd: nand: raw: make BBT code more generic
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-kernel@vger.kernel.org,
 "peterpandong@micron.com" <peterpandong@micron.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Sun, Oct 16, 2016 at 10:35 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> BBT support is currently tightly tied to raw NAND, though this is the kind
> of code we could share across all NAND based devices, no matter what
> physical interface is to communicate with the NAND chip.
>
> Make BBT code interface agnostic by replacing all occurrence of
> struct nand_chip by struct nand_device, and move functions that are
> specific to raw NANDs to drivers/mtd/nand/rawnand/nand_base.c.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c |  78 ++++-
>  drivers/mtd/nand/raw/nand_bbt.c  | 609 ++++++++++++++++++---------------------
>  include/linux/mtd/nand.h         |   8 +
>  include/linux/mtd/rawnand.h      |   4 -
>  4 files changed, 361 insertions(+), 338 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index b86f4a1bfbe1..4930b3569de9 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -471,7 +471,7 @@ static int nand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
>
>         /* Mark block bad in BBT */
>         if (chip->bbt) {

Should be "if (!nand->bbt.bbt)".

> -               res = nand_markbad_bbt(mtd, ofs);
> +               res = nand_markbad_bbt(mtd_to_nand(mtd), ofs);
>                 if (!ret)
>                         ret = res;
>         }

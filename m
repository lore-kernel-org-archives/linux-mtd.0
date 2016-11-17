Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7Fy7-0003GC-QG
 for linux-mtd@lists.infradead.org; Thu, 17 Nov 2016 06:14:44 +0000
Received: by mail-wm0-x244.google.com with SMTP id m203so17899312wma.3
 for <linux-mtd@lists.infradead.org>; Wed, 16 Nov 2016 22:14:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1476628518-20450-4-git-send-email-boris.brezillon@free-electrons.com>
References: <1476628518-20450-1-git-send-email-boris.brezillon@free-electrons.com>
 <1476628518-20450-4-git-send-email-boris.brezillon@free-electrons.com>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Thu, 17 Nov 2016 14:14:21 +0800
Message-ID: <CAAyFORLqjZTZ78XOdJbqUXvSFtsWmbtw_wpmjvBwu2Z4cYCvdQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] mtd: nand: add a nand.h file to expose basic NAND
 stuff
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
> Now that raw NAND header has been moved to rawnand.h, we can add a new
> nand.h file and define the common nand stuff in there.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  include/linux/mtd/nand.h | 480 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 480 insertions(+)
>  create mode 100644 include/linux/mtd/nand.h
>
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> new file mode 100644
> index 000000000000..b9b5d3c1bdf9
> --- /dev/null
> +++ b/include/linux/mtd/nand.h
[...]
> +
> +/**
> + * nand_offs_to_die - Convert an absolute offset to a die number
> + * @nand: NAND device
> + * @offs: absolute offset
> + *
> + * Returns the die number containing @offs.
> + */
> +static inline int nand_offs_to_die(struct nand_device *nand, loff_t offs)
> +{
> +       u64 die = offs;
> +
> +       do_div(die, nand->memorg.diesize);
> +
> +       return die;

Is it proper to use do_div here?. If I'm right, the divisor of do_div is 32bit.
It may cause division 0 exception when die size is larger than 4GB.
div64_u64 may be better.

Thanks,
Peter Pan

Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctnkr-0000wG-GG
 for linux-mtd@lists.infradead.org; Fri, 31 Mar 2017 04:01:43 +0000
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
 [209.85.161.181]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id v2V414MA006841
 for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2017 13:01:05 +0900
Received: by mail-yw0-f181.google.com with SMTP id d191so33324534ywe.2
 for <linux-mtd@lists.infradead.org>; Thu, 30 Mar 2017 21:01:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1490861708-27813-4-git-send-email-yamada.masahiro@socionext.com>
References: <1490861708-27813-1-git-send-email-yamada.masahiro@socionext.com>
 <1490861708-27813-4-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 31 Mar 2017 13:01:03 +0900
Message-ID: <CAK7LNATdSKsF7KH8Pgs9Vf6XMVCAZUwHFzaPJRhFjLmjLXAVsg@mail.gmail.com>
Subject: Re: [PATCH v3 34/37] mtd: nand: allow drivers to request minimum
 alignment for passed buffer
To: linux-mtd@lists.infradead.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
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


2017-03-30 17:15 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> In some cases, nand_do_{read,write}_ops is passed with unaligned
> ops->datbuf.  Drivers using DMA will be unhappy about unaligned
> buffer.
>
> The new struct member, buf_align, represents the minimum alignment
> the driver require for the buffer.  If the buffer passed from the
> upper MTD layer does not have enough alignment, nand_do_*_ops will
> use bufpoi.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> I was hit by this problem when I ran
>   # mount -t jffs2 /dev/mtdblock*  /mnt
>
> The buffer passed to nand_do_*_ops has 4 byte offset.
> The Denali IP cannot do DMA to/from this buffer because it
> requires 16 byte alignment for DMA.
>
>
> Changes in v3:
>   - Newly added
>
> Changes in v2: None
>
>  drivers/mtd/nand/nand_base.c | 12 ++++++++----
>  include/linux/mtd/nand.h     |  2 ++
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index e9d3195..b528ffa 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1953,9 +1953,10 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>
>                 if (!aligned)
>                         use_bufpoi = 1;
> -               else if (chip->options & NAND_USE_BOUNCE_BUFFER)
> -                       use_bufpoi = !virt_addr_valid(buf);
> -               else
> +               else if (chip->options & NAND_USE_BOUNCE_BUFFER) {
> +                       use_bufpoi = !virt_addr_valid(buf) ||
> +                              !IS_ALIGNED((unsigned long)buf, chip->buf_align);
> +               } else
>                         use_bufpoi = 0;


I noticed I added unneeded braces here by mistake.
(When I was testing this part, I inserted printk here,
then I forgot to remove the {} . )

Can you fix-up it?

If requested, I can re-send it.





-- 
Best Regards
Masahiro Yamada

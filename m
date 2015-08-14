Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQHbW-00069X-FN
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 16:13:15 +0000
Received: from localhost (localhost [127.0.0.1])
 by arrakis.dune.hu (Postfix) with ESMTP id 2394E280871
 for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2015 18:12:06 +0200 (CEST)
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
 [209.85.215.41])
 by arrakis.dune.hu (Postfix) with ESMTPSA id CE5ED28B84F
 for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2015 18:11:58 +0200 (CEST)
Received: by labd1 with SMTP id d1so46882216lab.1
 for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2015 09:12:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1438612286-16070-2-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1438612286-16070-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1438612286-16070-2-git-send-email-ezequiel@vanguardiasur.com.ar>
From: Jonas Gorski <jogo@openwrt.org>
Date: Fri, 14 Aug 2015 18:12:22 +0200
Message-ID: <CAOiHx==8WbSqy=1XPGR5G4=hFouV55bNe_Y82k1Pby4+Yn+rxw@mail.gmail.com>
Subject: Re: [PATCH 1/2] nand: pxa3xx: Increase READ_ID buffer and make the
 size static
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, antoine.tenart@free-electrons.com,
 robert.jarzmik@free.fr
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, Aug 3, 2015 at 4:31 PM, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> The read ID count should be made as large as the maximum READ_ID size,
> so there's no need to have dynamic size. This commit sets the hardware
> maximum read ID count, which should be more than enough on all cases.
> Also, we get rid of the read_id_bytes, and use a macro instead.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 28 ++++++----------------------
>  1 file changed, 6 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 1259cc5..0815f11 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -126,6 +126,8 @@
>  #define EXT_CMD_TYPE_LAST_RW   1 /* Last naked read/write */
>  #define EXT_CMD_TYPE_MONO      0 /* Monolithic read/write */
>
> +#define READ_ID_BYTES          7 /* Large enough to read 'JEDEC' */
> +
>  /* macros for registers read/write */
>  #define nand_writel(info, off, val)    \
>         writel_relaxed((val), (info)->mmio_base + (off))
> @@ -173,8 +175,6 @@ struct pxa3xx_nand_host {
>         /* calculated from pxa3xx_nand_flash data */
>         unsigned int            col_addr_cycles;
>         unsigned int            row_addr_cycles;
> -       size_t                  read_id_bytes;
> -
>  };
>
>  struct pxa3xx_nand_info {
> @@ -910,13 +910,13 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
>                 break;
>
>         case NAND_CMD_READID:
> -               info->buf_count = host->read_id_bytes;
> +               info->buf_count = READ_ID_BYTES;
>                 info->ndcb0 |= NDCB0_CMD_TYPE(3)
>                                 | NDCB0_ADDR_CYC(1)
>                                 | command;
>                 info->ndcb1 = (column & 0xFF);
>
> -               info->data_size = 8;
> +               info->data_size = READ_ID_BYTES;

You are reducing ->data_size from 8 to 7 here, is this intentional?


Jonas

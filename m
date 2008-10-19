Received: from ti-out-0910.google.com ([209.85.142.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KrXSg-0000YK-T5
	for linux-mtd@lists.infradead.org; Sun, 19 Oct 2008 12:32:47 +0000
Received: by ti-out-0910.google.com with SMTP id a21so672574tia.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Oct 2008 05:32:43 -0700 (PDT)
Message-ID: <ea11fea30810190532l44289012tbc18cc6ac5c1b92f@mail.gmail.com>
Date: Sun, 19 Oct 2008 18:02:43 +0530
From: "Manish Katiyar" <mkatiyar@gmail.com>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: Fix compilation warnings in
	drivers/mtd/nand/cs553x_nand.c
In-Reply-To: <ea11fea30810141113i81694depeb69c50a373fcf3e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <ea11fea30810141113i81694depeb69c50a373fcf3e@mail.gmail.com>
Cc: mkatiyar@gmail.com, akpm@linux-foundation.org,
	kernel-janitors@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 14, 2008 at 11:43 PM, Manish Katiyar <mkatiyar@gmail.com> wrote:
> Below patch fixes the following compilation warnings.
> drivers/mtd/nand/cs553x_nand.c:293: warning: unused variable 'mtd_parts'
> drivers/mtd/nand/cs553x_nand.c:292: warning: unused variable 'mtd_parts_nb'
>
>
> Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
>
> ---
>  drivers/mtd/nand/cs553x_nand.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/cs553x_nand.c b/drivers/mtd/nand/cs553x_nand.c
> index 3370a80..9f1b451 100644
> --- a/drivers/mtd/nand/cs553x_nand.c
> +++ b/drivers/mtd/nand/cs553x_nand.c
> @@ -289,8 +289,10 @@ static int __init cs553x_init(void)
>        int i;
>        uint64_t val;
>
> +#ifdef CONFIG_MTD_PARTITIONS
>        int mtd_parts_nb = 0;
>        struct mtd_partition *mtd_parts = NULL;
> +#endif
>
>        /* If the CPU isn't a Geode GX or LX, abort */
>        if (!is_geode())
> --
> 1.5.4.3
>

Resending it adding kernel-janitors, since I didn't get any response
from the linux-mtd list.

Thanks -
Manish


> Thanks -
> Manish
>

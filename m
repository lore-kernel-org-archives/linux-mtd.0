Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Llzlh-0004Tb-Eu
	for linux-mtd@lists.infradead.org; Tue, 24 Mar 2009 06:05:52 +0000
Subject: Re: [RFC/PATCH] flash_eraseall: extra care if NOR flash is not
	BIT_WRITEABLE
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <1237848138-18157-4-git-send-email-sebastian@breakpoint.cc>
References: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
	<1237848138-18157-4-git-send-email-sebastian@breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Mar 2009 08:05:27 +0200
Message-Id: <1237874727.14602.95.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-03-23 at 23:42 +0100, Sebastian Andrzej Siewior wrote:
> this is difficult because it depends on CONFIG_JFFS2_FS_WRITEBUFFER
> 
> Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
> ---
>  flash_eraseall.c |   14 +++++++++++++-
>  1 files changed, 13 insertions(+), 1 deletions(-)
> 
> diff --git a/flash_eraseall.c b/flash_eraseall.c
> index 0a4010e..3591db5 100644
> --- a/flash_eraseall.c
> +++ b/flash_eraseall.c
> @@ -64,12 +64,24 @@ static int prepare_clean_marker(mtd_info_t *meminfo)
>  
>  	cleanmarker.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
>  	cleanmarker.nodetype = cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER);
> +	cleanmarker.totlen = cpu_to_je32(sizeof(struct jffs2_unknown_node));
>  
>  	switch (meminfo->type) {
>  	case MTD_ROM:
>  	case MTD_RAM:
> +		break;
> +
>  	case MTD_NORFLASH:
> -		cleanmarker.totlen = cpu_to_je32(sizeof(struct jffs2_unknown_node));
> +		/* only if the kernel is compiled with
> +		 * CONFIG_JFFS2_FS_WRITEBUFFER
> +		 * Now, how to check that?
> +		 */
> +		if (!(meminfo->flags & MTD_BIT_WRITEABLE)) {
> +			int l;
> +
> +			l = meminfo->writesize > 16 ? meminfo->writesize : 16;
> +			cleanmarker.totlen = cpu_to_je32(l);
> +		}

Sorry, not sure which problem this patch is trying to solve?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)

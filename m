Received: from mail-fx0-f210.google.com ([209.85.220.210])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTv8A-00076C-2i
	for linux-mtd@lists.infradead.org; Sun, 10 Jan 2010 10:34:50 +0000
Received: by fxm2 with SMTP id 2so18211663fxm.5
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Jan 2010 02:34:43 -0800 (PST)
Subject: Re: [PATCH 5/6] mtdblock: Replace array of block cache info with
	pointers in struct mtd_info
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Hutchings <bhutchings@solarflare.com>
In-Reply-To: <1262704951.2837.14.camel@achroite.uk.solarflarecom.com>
References: <1262704951.2837.14.camel@achroite.uk.solarflarecom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 10 Jan 2010 12:34:41 +0200
Message-Id: <1263119681.7315.156.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-01-05 at 15:22 +0000, Ben Hutchings wrote:
>  	mutex_lock(&mtdblk->cache_mutex);
>  	write_cached_data(mtdblk);
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 0f32a9b..5c1b1ac 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -177,6 +177,10 @@ struct mtd_info {
>  	 */
>  	struct backing_dev_info *backing_dev_info;
>  
> +#if defined(CONFIG_MTD_BLOCK) || defined(CONFIG_MTD_BLOCK_MODULE)
> +	/* Block device state */
> +	struct mtdblk_dev *blk_dev;
> +#endif

I think injecting this to mtd_info is conceptually very wrong. It breaks
layering. Block devices sit on top of MTD devices, not vice-versa. Lower
layer (MTD) should not know anything about the higher layer (block).

I think you should a global list or rb-tree instead of the
'mtdblks[MAX_MTD_DEVICES]' array. But you should not inject block device
fields to 'struct mtd_info'.

Moreover, all this mtdblock stuff is legacy, and coupling it tighter to
'struct mtd_info' is not a good idea.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

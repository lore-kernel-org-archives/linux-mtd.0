Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIQRY-0004yI-N1
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 08:45:03 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Peter Menzebach <pm@mw-itcon.de>
In-Reply-To: <4332A3E8.8020002@mw-itcon.de>
References: <432812E8.2030807@mw-itcon.de>  <4332A3E8.8020002@mw-itcon.de>
Content-Type: text/plain
Date: Thu, 22 Sep 2005 16:44:19 +0400
Message-Id: <1127393059.20014.105.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: data  loss on jffs2 filesystem on dataflash
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-09-22 at 14:30 +0200, Peter Menzebach wrote:
> OK guys,
> here we are with a patch for it. I made several tests now with
> wbuf->pagesize of 1056 and 8*1056 and erase size of 8*1056 and it looks
> good so far.
> 
> Open is now the question, if we should implement a possibility to adjust
> the wbuf_pagesize independently from the jffs2 sectorsize. For my
> purposes I can live with a wbuf_size = jffs2 sector_size = 8*1056, but
> if we find a nice solution, I would implement it...
You can leave. But do you want to have more CPU load, more Flash IO,
faster flash wear, more lost data after Unclean reboot?

If no, make wbuf_size = DataFlash page size. And IMO, it is *MUST* for
CVS commit.

> IMHO the cleanest solution would be, that the dataflash/mtd layer
> reports it's true erase_size = smallest write size = 528/1056 bytes, and
> should not make a further guess about later use.
I thinks the cleanest if it reports *both* sizes. Let the upper (above
MTD) layers decide what erasesize to use.

> P.S. Sry I can't manage to send the patch as attachment. (it get's 
> rejected by the mailing list)
That's usual thing, unfortunately.


> -#ifndef CONFIG_JFFS2_FS_WRITEBUFFER
> +/*
>   #define SECTOR_ADDR(x) ( ((unsigned long)(x) & ~(c->sector_size-1)) )
> +*/
What for this comment ?

>   	struct kvec outvecs[3];
> @@ -654,7 +645,7 @@
>   	   erase block. Anything else, and you die.
>   	   New block starts at xxx000c (0-b = block header)
>   	*/
> -	if (SECTOR_ADDR(to) != SECTOR_ADDR(c->wbuf_ofs)) {
> +	if (PAGE_DIV(to) != PAGE_DIV(c->wbuf_ofs)) {
Why this change ?

>   	if (!c->mtd->block_markbad)
> -		return 1; // What else can we do?
> +		return 1;
Why this change ?

> 
>   	D1(printk(KERN_WARNING "jffs2_write_nand_badblock(): Marking bad 
> block at %08x\n", bad_offset));
>   	ret = c->mtd->block_markbad(c->mtd, bad_offset);
> diff -urN mtda/drivers/mtd/mtdpart.c mtdb/drivers/mtd/mtdpart.c
> --- mtda/drivers/mtd/mtdpart.c	2005-02-08 18:11:13.000000000 +0100
> +++ mtdb/drivers/mtd/mtdpart.c	2005-09-14 13:20:18.000000000 +0200
> @@ -465,8 +465,9 @@
I think this is better to send as a distinct patch.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIRB4-000673-1J
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 09:32:07 -0400
Message-ID: <4332B24F.2050305@mw-itcon.de>
Date: Thu, 22 Sep 2005 15:31:59 +0200
From: Peter Menzebach <pm@mw-itcon.de>
MIME-Version: 1.0
To: dedekind@infradead.org
References: <432812E8.2030807@mw-itcon.de> <4332A3E8.8020002@mw-itcon.de>
	<1127393059.20014.105.camel@sauron.oktetlabs.ru>
In-Reply-To: <1127393059.20014.105.camel@sauron.oktetlabs.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: data  loss on jffs2 filesystem on dataflash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityutskiy wrote:
> On Thu, 2005-09-22 at 14:30 +0200, Peter Menzebach wrote:
> 
>>OK guys,
>>here we are with a patch for it. I made several tests now with
>>wbuf->pagesize of 1056 and 8*1056 and erase size of 8*1056 and it looks
>>good so far.
>>
>>Open is now the question, if we should implement a possibility to adjust
>>the wbuf_pagesize independently from the jffs2 sectorsize. For my
>>purposes I can live with a wbuf_size = jffs2 sector_size = 8*1056, but
>>if we find a nice solution, I would implement it...
> 
> You can leave. But do you want to have more CPU load, more Flash IO,
> faster flash wear, more lost data after Unclean reboot?
> 
> If no, make wbuf_size = DataFlash page size. And IMO, it is *MUST* for
> CVS commit.
> 
But in this case mtd_info structure has to be changed/extended. 
Otherwise the information does not get to the jffs2 layer. How 
should/could this be managed?

> 
>>IMHO the cleanest solution would be, that the dataflash/mtd layer
>>reports it's true erase_size = smallest write size = 528/1056 bytes, and
>>should not make a further guess about later use.
> 
Problem is here, how does the user get the information about the erase 
size used by jffs2?

> I thinks the cleanest if it reports *both* sizes. Let the upper (above
> MTD) layers decide what erasesize to use.
> 
Are these two values typically existing? In the dataflash case, it's 
only one value.

If they make sense, we have a write_chunk_size, and an erasesize size...

>>-#ifndef CONFIG_JFFS2_FS_WRITEBUFFER
>>+/*
>>  #define SECTOR_ADDR(x) ( ((unsigned long)(x) & ~(c->sector_size-1)) )
>>+*/
> 
> What for this comment ?
gets out (I commented out instead of removing)

>>-	if (SECTOR_ADDR(to) != SECTOR_ADDR(c->wbuf_ofs)) {
>>+	if (PAGE_DIV(to) != PAGE_DIV(c->wbuf_ofs)) {
> Why this change ?
c->sector_size != c->wbuf_ofs

>>  	if (!c->mtd->block_markbad)
>>-		return 1; // What else can we do?
>>+		return 1;
> 
> Why this change ?
C++ comment

> 
>>diff -urN mtda/drivers/mtd/mtdpart.c mtdb/drivers/mtd/mtdpart.c
>>--- mtda/drivers/mtd/mtdpart.c	2005-02-08 18:11:13.000000000 +0100
>>+++ mtdb/drivers/mtd/mtdpart.c	2005-09-14 13:20:18.000000000 +0200
>>@@ -465,8 +465,9 @@
> 
> I think this is better to send as a distinct patch.
> 
OK


Best regards
Peter
-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1

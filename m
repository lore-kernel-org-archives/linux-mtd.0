Received: from msr87.hinet.net ([168.95.4.187] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cjjw-0004kN-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 10:37:56 +0100
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "'Thomas Gleixner'" <tglx@linutronix.de>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: RE: NAND Configuration
Date: Thu, 8 Aug 2002 17:37:40 +0800
Message-ID: <002c01c23ebf$40a81c70$5501a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1028797894.9586.8.camel@thomas.tec.linutronix.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Maybe I found the problem here. I find jffs2 will write to the page that
was used. The proble is that jffs2_wbuf_process make
jffs2_do_reserve_space caculate wrong ofs.

In jffs2_wbuf_process, when free_size is smaller than (c->wbuf_pagesize
- c->wbuf_len), jffs2_flush_wbuf(c, 1) was called, but free_size will
not be assigned right value. In the case, the block can not be used
anymore because the last page in the block was used here, but
jffs2_do_reserve_space does not know. 
jffs2_do_reserve_space will use the block, if minsize > jeb->free_size
and it maybe happen here. 



jffs2_wbuf_process
==============
if(!c->nextblock || (c->nextblock->free_size < (c->wbuf_pagesize -
c->wbuf_len)))
	jffs2_flush_wbuf(c, 1); /* pad only */   <========== should take
care free_size here
else			
	jffs2_flush_wbuf(c, 2); /* pad and adjust nextblock */



static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t
minsize, uint32_t *ofs, uint32_t *len)
{
	struct jffs2_eraseblock *jeb = c->nextblock;
	
 restart:
	if (jeb && minsize > jeb->free_size) {          <====== if
minisize > free_size, the block will be used
		/* Skip the end of this block and file it as having some
dirty space */
		/* If there's a pending write to it, flush now */
		if (c->wbuf_len) {


I add the following codes and I am still testing it. 

		if(!c->nextblock || (c->nextblock->free_size <
(c->wbuf_pagesize - c->wbuf_len))){
			jffs2_flush_wbuf(c, 1); /* pad only */
			c->dirty_size += c->nextblock->free_size;
			c->free_size  -= c->nextblock->free_size;
			c->nextblock->dirty_size +=
c->nextblock->free_size;
			c->nextblock->free_size = 0;
		}	
		else			
			jffs2_flush_wbuf(c, 2); /* pad and adjust
nextblock */


Steve Tsai



> 
> Can you please do the following ?
> 
> Update to latest CVS code.
> Erase the partition, you can use erase(all) /dev/mtdX
> echo 9 >/proc/sys/kernel/printk
> Start log
> mount
> do your mkdir, cp ...
> 
> if this happens again, please send a dump of the concerned 
> page and the logfile 
> 

Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JiNk-0000Y1-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 22:52:40 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6M00BY0BLWK5@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Thu, 05 Dec 2002 00:22:45 +0100 (MET)
Date: Thu, 05 Dec 2002 00:20:44 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Problem: 51MB partition max size on jffs2
In-reply-to: <40170F3C-07DD-11D7-937A-000393467F1A@arlut.utexas.edu>
To: Ken Offer <koffer@arlut.utexas.edu>
Cc: LinuxMTD <linux-mtd@lists.infradead.org>
Reply-to: tglx@linutronix.de
Message-id: <200212050020.44734.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <40170F3C-07DD-11D7-937A-000393467F1A@arlut.utexas.edu>
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

On Thursday 05 December 2002 00:08, Ken Offer wrote:
> On Wednesday, December 4, 2002, at 04:02  PM, Thomas Gleixner wrote:
> > On Wednesday 04 December 2002 23:00, Ken Offer wrote:
> >> On Wednesday, December 4, 2002, at 11:47  AM, Thomas Gleixner wrote:
> >>> Latest CVS code ?
> >>
> >> I tried it with an older version (circa 20020819) and the latest code
> >> (20021202).  Same result.  I am going to try the change Dave Ellis
> >> <DGE@sixnetio.com> suggested.
> >
> > Strange. Could you please tell me, what output the latest CVS code
> > produces
>
> Well, I was getting a mount failure.  There wasn't much info other than
> that.  If you look in the latest (20021202) jffs2 build.c file, you can
> see if the kmalloc of c->blocks fails in jffs2_do_mount_fs, no debug
> message is printed.  Only a non-mem error is returned.  That is
> consistent with what I was seeing, even with the highest verbosity
> debugging on.
>
> I made the change to use vmalloc/vfree for c->blocks and that seemd to
> fix the problem.  kmalloc is indeed limited to 128KB.  Of course, I
> made the change to the 20020819 code.  I'll try the vmalloc change with
> the latest CVS code as well and see how that holds up.
Please wait. 
Could you please verify, if the code in fs. c does, what it should do ?

int jffs2_do_fill_super(struct super_block *sb, void *data, int silent)
{
SNIP
	c->flash_size = c->mtd->size;
	/* 
	 * Check, if we have to concatenate physical blocks to larger virtual blocks
	 * to reduce the memorysize for c->blocks. (kmalloc allows max. 128K 
allocation)
	 */
	blocks = c->flash_size / c->mtd->erasesize;
	while ((blocks * sizeof (struct jffs2_eraseblock)) > (128 * 1024))
		blocks >>= 1;
	
	c->sector_size = c->flash_size / blocks;
	if (c->sector_size != c->mtd->erasesize)
		printk(KERN_INFO "jffs2: Erase block size too small (%dKiB). Using virtual 
blocks size (%dKiB) instead\n", 
			c->mtd->erasesize / 1024, c->sector_size / 1024);

This is processed before calling jffs2_do_mount_fs. There is calculated:

	c->nr_blocks = c->flash_size / c->sector_size;
	c->blocks = kmalloc(sizeof(struct jffs2_eraseblock) * c->nr_blocks, 
GFP_KERNEL);
	if (!c->blocks)
		return -ENOMEM;

So it should rely on the previous adjusted sectorsize.

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de

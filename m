Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17guNi-0004hX-00
	for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2002 22:48:14 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H1400KDJ1VHI2@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Mon, 19 Aug 2002 23:47:42 +0200 (MEST)
Date: Mon, 19 Aug 2002 23:47:28 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: No free space left for GC
In-reply-to: <1029623727.2142.495.camel@thomas.tec.linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Message-id: <1029793649.22781.129.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <1029623727.2142.495.camel@thomas.tec.linutronix.de>
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

Some more information:

I tried to trigger GC instead of flushing the writebuffer. In principle
it works. But when do we stop GC again ? I decided to do it, when the
replacement node is written complete. Fine, if we hit a small file. If
it's rather large, we dirty a lot of space and trigger GC again, if we
are near the GC_TRESHHOLD. So we spend a lot of time in GC and increase
the erasecycles unneccecary. This depends really on the application and
on the filesizes on the filesystem. Padding can make a block dirty too,
but we get rid of the padding during GC, and can produce another
padding, when we run into wbuf_timeout. 

The 0xc4 request is sizeof(jffs2_raw_inode) + JFFS2_MIN_DATA_LEN). This
happens rather often, that it doesn't fit anymore in the block. So we
put this block on the dirty list and raised an endless gc cycle. These
blocks should be put into the clean list.

Then we have a lot of blocks with 4 bytes unused space. These blocks
should definitly always end on the clean list. 

We could put the blocks, which have more than 4 bytes dirty space on the
dirty list at mount time. When a block gets full and has less than 256
byte dirty space, we put it on the clean list to inhibit endless gc
loops on a nearly 100% full filesystem. 

On a 8MB partition I have an average dirty size of 20 bytes in 490
blocks. Not too bad. And more acceptable than loosing 48K, if one 16K
block dies. I have already 2 bad blocks there. So I accept 10k penalty
for having 96K usable flashspace. For NOR this should be no problem as
the sectorsizes are usually 64K - 128K.

On a 64MB partition I ended up with an average dirty size of 14 byte in
3200 blocks, which is a total of 58k. A lot of space, but better than
screwing up if we get near 100%. The 0xc4 request, which does not fit
into the remaining free space hits us too often to ignore it. Better to
have 58k less disk space than no chance to repair my full filesystem
other than erasing it.

The new decision function for gc and reserve_space takes only those
blocks into account, which are on the dirty and very dirty list. The
dirty space in the clean_list is ignored. This is neccecary to avoid
endless GC loops. 

Any suggestions ?

-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de

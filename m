Received: from chaingun.noernet.de ([62.154.254.10] ident=exim)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15oVLm-0002Rb-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2001 20:37:06 +0100
Date: Tue, 2 Oct 2001 21:45:59 +0200 (CEST)
From: dennis noermann <dennis.noermann@noernet.de>
To: David Woodhouse <dwmw2@infradead.org>
cc: Larry Doolittle <ldoolitt@recycle.lbl.gov>,
     <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2_RESERVED_BLOCKS_* 
In-Reply-To: <30731.1002040544@redhat.com>
Message-ID: <Pine.LNX.4.33.0110022139240.18002-100000@chaingun.noernet.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

I am using

#define JFFS2_RESERVED_BLOCKS_BASE 0
#define JFFS2_RESERVED_BLOCKS_WRITE (JFFS2_RESERVED_BLOCKS_BASE + 1)
#define JFFS2_RESERVED_BLOCKS_DELETION (JFFS2_RESERVED_BLOCKS_BASE + 1)
#define JFFS2_RESERVED_BLOCKS_GCTRIGGER (JFFS2_RESERVED_BLOCKS_BASE + 2)
#define JFFS2_RESERVED_BLOCKS_GCBAD (JFFS2_RESERVED_BLOCKS_BASE + 1)
#define JFFS2_RESERVED_BLOCKS_GCMERGE (JFFS2_RESERVED_BLOCKS_BASE)

for an 640kb partition on 2*intelF320 (8MB)
so 128 kb are wastet , it is working fine , till i am copying more than
the 512kb free space in the partition , then deleting doesnt work

i think there is only 1 littel mistake in my config , but i was to lazy to
figger out the problem
JFFS2_RESERVED_BLOCKS_DELETION has to be set to 0 i think , i will try it
next time i have time :)

dennis

On Tue, 2 Oct 2001, David Woodhouse wrote:

>
> ldoolitt@recycle.lbl.gov said:
> >  Maybe my use is atypical, and maybe 5 blocks is a theoretical
> > minimum.  I don't want to sound like a complainer, either -- this file
> > system certainly looks like it meets my needs. I guess I just want to
> > point out the superficial imbalance between the amount of sweat people
> > pour out on projects like busybox to reduce code size by a few kB,
> > when there is 320 kB "just lying around" on any JFFS2 on a 64 kB erase
> > block chip.
>
> Theoretical minimum is one block, not five. Give me formal proof that
> this is also the _practical_ minimum, and we can drop the
> overly-conservative limits.
>
> Actually, we'd drop it to two, to allow for at least one block going bad on
> us. More than two on NAND flash.
>
> --
> dwmw2
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

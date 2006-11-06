Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GhFTK-0005yj-Pj
	for linux-mtd@lists.infradead.org; Mon, 06 Nov 2006 20:09:53 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e6.ny.us.ibm.com (8.13.8/8.12.11) with ESMTP id kA71A3h3006998
	for <linux-mtd@lists.infradead.org>; Mon, 6 Nov 2006 20:10:03 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	kA719jJL117034
	for <linux-mtd@lists.infradead.org>; Mon, 6 Nov 2006 20:09:45 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	kA719jFn014898
	for <linux-mtd@lists.infradead.org>; Mon, 6 Nov 2006 20:09:45 -0500
Subject: Re: UBI and OneNand
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: John Smith <John.Smith@arrows.demon.co.uk>
In-Reply-To: <loom.20061106T205324-87@post.gmane.org>
References: <Pine.LNX.4.33.0611040819560.26940-100000@arrows.demon.co.uk>
	<1162806360.5636.19.camel@localhost.localdomain>
	<loom.20061106T205324-87@post.gmane.org>
Content-Type: text/plain
Date: Mon, 06 Nov 2006 14:54:51 -0600
Message-Id: <1162846491.31460.15.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-11-06 at 20:16 +0000, John Smith wrote:
> Frank Haverkamp <haver <at> vnet.ibm.com> writes:
> 
> > 
> > Hi John,
> > 
> > On Sat, 2006-11-04 at 08:22 +0000, John wrote:
> > > I have a board with a MIPS core and a OneNAND flash.  ...
> > > 
> > > I have made the kernel from ubi-2.6.git run on my board. Now I would be
> > > grateful for answers to some questions to help me get UBI going.
> > > 
> > >   1. Should I expect UBI to run on OneNAND without change, or should I
> > >      expect to have to write or adapt some code?
> > 
> > UBI should run on mostly any mtd device. I tried it on NAND as well as
> > NOR mtds.
> 
> I have now tried it. It does run. 

Excellent news!

> > Mhm, I wonder if we should remove the argp parsing again and replace it
> > by more portable code. I am not sure about this yet.
> 
> I did get the ubi-tools to compile with argp code from gnulib.
> There is probably an elegant solution using automake and friends 
> and the sources from gnulib. But I just hacked a Makefile and a config.h 
> together, and changed the names of two functions from getopt.h 
> to avoid clashes with my uclibc implementation.

The tools might get a little rip up and rewrite eventually.  We can look
at removing the argp stuff then.  I personally don't like it much, but
never found it to be too big of an issue.

As for automake and friends... we tend to avoid those like the plague.

> I think the following commands just worked:
> 
>   mkdir /mnt/nvm
>   flash_eraseall /dev/mtd6
>   mount -t jffs2 /dev/mtdblock6 /mnt/nvm 
> 
> 
> I wonder whether this is the first attempt to run a kernel using
> jffs2 and ubi and mtd and onenand and mips? First or not, it seems to work. 

Yes, it is.  For both onenand and MIPS.  That is good news.  Thanks for
testing!

If you find any issues, feel free to email the list.

josh

Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GhBBW-0002rt-25
	for linux-mtd@lists.infradead.org; Mon, 06 Nov 2006 20:35:13 +0000
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1GhBBO-00023z-JO
	for linux-mtd@lists.infradead.org; Mon, 06 Nov 2006 21:35:02 +0100
Received: from arrows.demon.co.uk ([83.105.72.193])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 Nov 2006 21:35:02 +0100
Received: from John.Smith by arrows.demon.co.uk with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 Nov 2006 21:35:02 +0100
To: linux-mtd@lists.infradead.org
From: John Smith <John.Smith@arrows.demon.co.uk>
Subject: Re: UBI and OneNand
Date: Mon, 6 Nov 2006 20:16:59 +0000 (UTC)
Message-ID: <loom.20061106T205324-87@post.gmane.org>
References: <Pine.LNX.4.33.0611040819560.26940-100000@arrows.demon.co.uk>
	<1162806360.5636.19.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Frank Haverkamp <haver <at> vnet.ibm.com> writes:

> 
> Hi John,
> 
> On Sat, 2006-11-04 at 08:22 +0000, John wrote:
> > I have a board with a MIPS core and a OneNAND flash.  ...
> > 
> > I have made the kernel from ubi-2.6.git run on my board. Now I would be
> > grateful for answers to some questions to help me get UBI going.
> > 
> >   1. Should I expect UBI to run on OneNAND without change, or should I
> >      expect to have to write or adapt some code?
> 
> UBI should run on mostly any mtd device. I tried it on NAND as well as
> NOR mtds.

I have now tried it. It does run. 

> 
> > 
> >   3. My attempt to build the ubi tools from the git
> >      users/haver/mtd-utils.git failed.  The tools use the argp
> >      functions to parse command line args, but my root file system
> >      based on uclibc doesn't support argp. I propose to collect argp
> >      sources following instructions in
> >      http://savannah.gnu.org/cvs/?group=gnulib and try again. Any
> >      better suggestions?
> 
> Mhm, I wonder if we should remove the argp parsing again and replace it
> by more portable code. I am not sure about this yet.

I did get the ubi-tools to compile with argp code from gnulib.
There is probably an elegant solution using automake and friends 
and the sources from gnulib. But I just hacked a Makefile and a config.h 
together, and changed the names of two functions from getopt.h 
to avoid clashes with my uclibc implementation.

In the ubi-tools directory there is a script "ubi_test.sh". 
This script appeared to run successfully as well.

> 
> > 
> >   5. What is the way to get jffs2 running on an UBI partition?  Should
> >      I still be aiming to use gluebi to provide an MTD partition on
> >      top of a UBI partition (whatever that means)? Cook book
> >      instructions would be very helpful.
> 
> Yes, gluebi is used to create the MTD which can be used by JFFS2. We had
> some iterations over the code, and finally came up with the code
> available in our ubi-2.6.git. The original from Joern was reworked by
> Artem, the currently available solution has only very few changes to
> JFFS2.
> 

I think the following commands just worked:

  mkdir /mnt/nvm
  flash_eraseall /dev/mtd6
  mount -t jffs2 /dev/mtdblock6 /mnt/nvm 


I wonder whether this is the first attempt to run a kernel using
jffs2 and ubi and mtd and onenand and mips? First or not, it seems to work. 

Thanks,
John Smith

Received: from e4.ny.us.ibm.com ([32.97.182.144])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gh13s-0005YX-1G
	for linux-mtd@lists.infradead.org; Mon, 06 Nov 2006 04:46:44 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e4.ny.us.ibm.com (8.13.8/8.12.11) with ESMTP id kA69kQKO028808
	for <linux-mtd@lists.infradead.org>; Mon, 6 Nov 2006 04:46:26 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay02.pok.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	kA69k4dL291510
	for <linux-mtd@lists.infradead.org>; Mon, 6 Nov 2006 04:46:04 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	kA69k3qn028079
	for <linux-mtd@lists.infradead.org>; Mon, 6 Nov 2006 04:46:04 -0500
Subject: Re: UBI and OneNand
From: Frank Haverkamp <haver@vnet.ibm.com>
To: John <john@arrows.demon.co.uk>
In-Reply-To: <Pine.LNX.4.33.0611040819560.26940-100000@arrows.demon.co.uk>
References: <Pine.LNX.4.33.0611040819560.26940-100000@arrows.demon.co.uk>
Content-Type: text/plain
Date: Mon, 06 Nov 2006 10:46:00 +0100
Message-Id: <1162806360.5636.19.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi John,

On Sat, 2006-11-04 at 08:22 +0000, John wrote:
> I have a board with a MIPS core and a OneNAND flash.  I plan to split
> the OneNAND into a small partition for the boot loader, and a big
> partition for the rest. The big partition will be split using UBI into:
>   a partition for the Kernel
>   a partition for a readonly root file system (squashfs?)
>   a read/write JFFS2 partition for persistant data
>   a partition for the root file system for use when the box boots next
> time
>   etc....
> The concepts of UBI seem just right.
> 
> I have made the kernel from ubi-2.6.git run on my board. Now I would be
> grateful for answers to some questions to help me get UBI going.
> 
>   1. Should I expect UBI to run on OneNAND without change, or should I
>      expect to have to write or adapt some code?

UBI should run on mostly any mtd device. I tried it on NAND as well as
NOR mtds.

> 
>   2. Which git provides the best mtd-utils? Should I get mtd-tools and
>      ubi-tools from different gits?

Unfortunately yes. I need to talk to David or maybe Josh to integrate
the ubi-tools into the main mtd-utils.git. Until than take my version.

> 
>   3. My attempt to build the ubi tools from the git
>      users/haver/mtd-utils.git failed.  The tools use the argp
>      functions to parse command line args, but my root file system
>      based on uclibc doesn't support argp. I propose to collect argp
>      sources following instructions in
>      http://savannah.gnu.org/cvs/?group=gnulib and try again. Any
>      better suggestions?

Mhm, I wonder if we should remove the argp parsing again and replace it
by more portable code. I am not sure about this yet.

> 
>   4. The UBI faq
>      http://www.linux-mtd.infradead.org/faq/ubi.html#L_run_ubi says
>      that when UBI is compiled into the Kernel, you should call
>      ubi_attach_mtd_dev() to launch the UBI code.  But
>      ubi_attach_mtd_dev() is now declared static, so I guess the
>      advice is out of date.  How should UBI be started when compiled
>      into the kernel?

We decided that the connection between UBI and its mtd should be made at
the kernel command line, instead of exporting a function to do this.

The syntax is:

  [ubi.]mtd=content[,<vid-hdr-offs>,<data-offs>] ...
               ^
               |
             name of the MTD

If compiled in the kernel the ubi. prefix must be used, if used as module
it works without it. You can offer multiple of those options after each
other to connect more than one MTD with UBI.

The vid-hdr-offs and data-offs parameters are optional. UBI will choose
hopefully resonable default values. If you are not happy with the
defaults, use the parameters to define different ones.

> 
>   5. What is the way to get jffs2 running on an UBI partition?  Should
>      I still be aiming to use gluebi to provide an MTD partition on
>      top of a UBI partition (whatever that means)? Cook book
>      instructions would be very helpful.

Yes, gluebi is used to create the MTD which can be used by JFFS2. We had
some iterations over the code, and finally came up with the code
available in our ubi-2.6.git. The original from Joern was reworked by
Artem, the currently available solution has only very few changes to
JFFS2.

Frank

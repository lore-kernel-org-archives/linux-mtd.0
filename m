Received: from arrows.demon.co.uk ([83.105.72.193])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GgIKt-0002h2-S1
	for linux-mtd@lists.infradead.org; Sat, 04 Nov 2006 05:01:17 -0500
Date: Sat, 4 Nov 2006 08:22:56 +0000 (GMT)
From: John <john@arrows.demon.co.uk>
To: <linux-mtd@lists.infradead.org>
Subject: UBI and OneNand
Message-ID: <Pine.LNX.4.33.0611040819560.26940-100000@arrows.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a board with a MIPS core and a OneNAND flash.  I plan to split
the OneNAND into a small partition for the boot loader, and a big
partition for the rest. The big partition will be split using UBI into:
  a partition for the Kernel
  a partition for a readonly root file system (squashfs?)
  a read/write JFFS2 partition for persistant data
  a partition for the root file system for use when the box boots next
time
  etc....
The concepts of UBI seem just right.

I have made the kernel from ubi-2.6.git run on my board. Now I would be
grateful for answers to some questions to help me get UBI going.

  1. Should I expect UBI to run on OneNAND without change, or should I
     expect to have to write or adapt some code?

  2. Which git provides the best mtd-utils? Should I get mtd-tools and
     ubi-tools from different gits?

  3. My attempt to build the ubi tools from the git
     users/haver/mtd-utils.git failed.  The tools use the argp
     functions to parse command line args, but my root file system
     based on uclibc doesn't support argp. I propose to collect argp
     sources following instructions in
     http://savannah.gnu.org/cvs/?group=gnulib and try again. Any
     better suggestions?

  4. The UBI faq
     http://www.linux-mtd.infradead.org/faq/ubi.html#L_run_ubi says
     that when UBI is compiled into the Kernel, you should call
     ubi_attach_mtd_dev() to launch the UBI code.  But
     ubi_attach_mtd_dev() is now declared static, so I guess the
     advice is out of date.  How should UBI be started when compiled
     into the kernel?

  5. What is the way to get jffs2 running on an UBI partition?  Should
     I still be aiming to use gluebi to provide an MTD partition on
     top of a UBI partition (whatever that means)? Cook book
     instructions would be very helpful.

Thanks to all for MTD,

John Smith

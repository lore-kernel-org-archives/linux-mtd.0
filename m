Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13ECwd-0007LK-00
	for mtd-list@infradead.org; Mon, 17 Jul 2000 16:36:35 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13ECwb-0007LD-00
	for mtd@infradead.org; Mon, 17 Jul 2000 16:36:34 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39732117.94E3C0BB@auriga.ru> 
References: <39732117.94E3C0BB@auriga.ru>  <39731CC4.65600194@matrox.com> 
To: Nick Ivanter <nick@auriga.ru>
Cc: =?koi8-r?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>, mtd@infradead.org
Subject: Re: Compiling MTD in the kernel 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 17 Jul 2000 16:36:31 +0100
Message-ID: <24865.963848191@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


nick@auriga.ru said:
> You probably did not patch init/main.c and fs/filesystems.c to call
> init_mtd() and init_jffs_fs() correspondingly.

Should be there.

passion /home/dwmw2/working/mtd/patches $ diffstat mtd-patch-2.2.16 
 Makefile               |    5 +++++
 arch/alpha/config.in   |    2 ++
 arch/arm/config.in     |    2 ++
 arch/i386/config.in    |    2 ++
 arch/m68k/config.in    |    2 ++
 arch/mips/config.in    |    2 ++
 arch/ppc/config.in     |    2 +-
 arch/s390/config.in    |    3 +++
 arch/sparc/config.in   |    2 ++
 arch/sparc64/config.in |    1 +
 drivers/Makefile       |   11 ++++++++++-
 fs/Config.in           |    1 +
 fs/Makefile            |   10 +++++++++-
 fs/filesystems.c       |    8 ++++++++
 include/linux/module.h |    1 +
 init/main.c            |    7 ++++++-
 kernel/ksyms.c         |    1 +
 kernel/module.c        |   21 ++++++++++++++++++++-


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

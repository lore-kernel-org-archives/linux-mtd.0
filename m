Received: from eve.speakeasy.net ([216.254.0.17])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ZHDc-0003DE-00
	for <linux-mtd@lists.infradead.org>; Fri, 08 Feb 2002 20:02:00 +0000
Received: from localhost (joemojo@localhost)
	by eve.speakeasy.net (8.11.6/8.11.6) with ESMTP id g18KDAM13507
	for <linux-mtd@lists.infradead.org>; Fri, 8 Feb 2002 12:13:10 -0800
Date: Fri, 8 Feb 2002 12:13:10 -0800 (PST)
From: <joe@glitchpop.net>
To: <linux-mtd@lists.infradead.org>
Subject: doc-lilo hang?
Message-ID: <Pine.LNX.4.33.0202081147460.10715-100000@eve.speakeasy.net>
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

  I'm using the doc-lilo from the M-Systems linux package as the bootloader for 
a Linux distro I built on a 96mb DiskOnChip 2000.  Although lilo starts up 
okay, displays a list of images, and begins to load my kernel, it hangs right 
at the 'Loading linux...' message.  

  Any idea what I'm doing wrong here?  The system must be able to see the boot 
loader, is the system map not pointing to the kernel location?  The kernel I am 
loading boots up fine from floppy on the same system, although I'm using normal 
lilo there.

  Thanks,
  Joe Martin

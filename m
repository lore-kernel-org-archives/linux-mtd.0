Received: from snail.directvbroadband.net ([216.227.60.197])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14yL2f-0003CZ-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 May 2001 23:05:47 +0100
Received: from snail.directvbroadband.net (snail.directvbroadband.net [216.227.60.197])
	by snail.directvbroadband.net (Build 101 8.9.3/NT-8.9.3) with SMTP id PAA06989
	for <linux-mtd@lists.infradead.org>; Fri, 11 May 2001 15:25:17 -0700
Message-ID: <617933180D08D311AB500090273F1F96016767EB@storm.corp.directvbroadband.net>
From: "Fry, Dan" <dfry@bb.directv.com>
To: linux-mtd@lists.infradead.org
Subject: Mips compiler controversy
Date: Fri, 11 May 2001 15:09:20 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi list,

	Mips doesn't seem to compile the JFFS2 code as is.  In write.c
within function jffs2_new_inode there is an undefined reference to
new_inode().  I've greped through the kernel source and can't find a
new_inode().  Is this function responsible for anything more than 
this:
	/* some kind of kmalloc for an inode */
	inode->sb=sb; 

I replaced the new_inode call with the above, and got the code to compile.
I can mount the chips, however any witting or deletion causes:

Unable to handle kernel paging request at virtual address 00000004, epc ==
80150
Oops in fault.c do_page_fault, line 159

And then the system locks up after spitting out tons of hex. Funny thing is
that after reboot the file or directory I created show up but trying to
access them causes the kernel lockup again.

Any ideas??

Cheers,
	- Dan

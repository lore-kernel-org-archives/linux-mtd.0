Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1230mU-0001RE-00
	for mtd-list@infradead.org; Tue, 28 Dec 1999 17:51:34 +0000
Received: from awpi.com
	([204.241.40.2] helo=sisko.awpi.com ident=michalk)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 1230mR-0001R8-00
	for mtd@imladris.mvhi.com; Tue, 28 Dec 1999 17:51:32 +0000
Received: (from michalk@localhost)
	by sisko.awpi.com (8.9.0/8.9.0) id LAA27404
	for mtd@imladris.mvhi.com; Tue, 28 Dec 1999 11:44:53 -0600
From: "Brian K. Michalk" <michalk@sisko.awpi.com>
Message-Id: <199912281744.LAA27404@sisko.awpi.com>
Subject: fdisk oddities
To: mtd@imladris.mvhi.com
Date: Tue, 28 Dec 1999 11:44:52 -0600 (CST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I have been having some problems (still).  I thought I would sit 
back and listen, but it's been quiet lately.

It seems as though the doc2000 is not storing cylinders, sectors or
heads after fdisk exits.  I manually set them, and used very small
values just in case there was some sort of problem with the 72 MB
doc I have.  Here is the script:

Script started on Mon Dec 27 23:49:09 1999
embed:~/mtd-19991025/kernel# fdisk /dev/nftla1
You must set heads sectors and cylinders.
You can do this from the extra functions menu.

Command (m for help): p

Disk /dev/nftla1: 0 heads, 0 sectors, 0 cylinders
Units = cylinders of 1 * 512 bytes

       Device Boot    Start       End    Blocks   Id  System
/dev/nftla1p1            10      2304      1147+  83  Linux native

Command (m for help): x

Expert command (m for help): c
Number of cylinders (1-65535): 16

Expert command (m for help): h
Number of heads (1-256): 16

Expert command (m for help): s
Number of sectors (1-63): 9
Warning: setting sector offset for DOS compatiblity

Expert command (m for help): r

Command (m for help): p

Disk /dev/nftla1: 16 heads, 9 sectors, 16 cylinders
Units = cylinders of 144 * 512 bytes

       Device Boot    Start       End    Blocks   Id  System
/dev/nftla1p1             1        16      1147+  83  Linux native

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.
Syncing disks.
Re-read table failed with error 22: Invalid argument.
Reboot your system to ensure the partition table is updated.

WARNING: If you have created or modified any DOS 6.x
partitions, please see the fdisk manual page for additional
information.

-- 
Brian Michalk  <http://www.awpi.com/michalk>
Life is what you make of it ... never wish you had done something.
Aviator, experimental aircraft builder, motorcyclist, SCUBA diver
musician, home-brewer, entrepreneur and SINGLE!


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

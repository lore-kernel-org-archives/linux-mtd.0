Received: from pophost.cs.tamu.edu
	([128.194.130.106] helo=cs.tamu.edu ident=0)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18dy2w-0007EG-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2003 19:38:54 +0000
Received: from unix.cs.tamu.edu (unix [128.194.138.13])
	by cs.tamu.edu (8.11.0/8.11.0) with ESMTP id h0TK9rR22553
	for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2003 14:09:53 -0600 (CST)
Received: from localhost (choudhri@localhost)
	by unix.cs.tamu.edu (8.10.2+Sun/8.10.2) with ESMTP id h0TK9qR21944
	for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2003 14:09:52 -0600 (CST)
Date: Wed, 29 Jan 2003 14:09:52 -0600 (CST)
From: Siddharth Choudhuri <choudhri@cs.tamu.edu>
To: linux-mtd@lists.infradead.org
Subject: Problems writing to mounted jffs...
Message-ID: <Pine.GSO.4.44.0301291359440.296-100000@unix.cs.tamu.edu>
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

I am following the mtd-jffs howto to have jffs on LART(ARM processor with
4MB Intel D28F160 Flash).

I did the following on the board running Linux 2.4.18-rmk2-pxa2:
o erase /dev/mtd2
o cp jffs_image /dev/mtd2
o mount -t jffs /dev/mtdblock2 /mnt/jffs

When I do ls/cat (read operations) on /mnt/jffs it works fine, but if I
give anything like `touch foo` inside /mnt/jffs, I get this message
running forever...

lart: write error at address 0x00100d64. //This address keeps increasing
Didn't write all bytes in flash_safe_writev(). Returned -5
JFFS: jffs_write_node: Failed to write, requested 64, wrote 1

I looked at errno for -5 is I/O error. Any ideas where I am going wrong ?

TIA
-siddharth

_____________________________________________________________________
     Unix is user friendly - its just picky about its friends.
_____________________________________________________________________

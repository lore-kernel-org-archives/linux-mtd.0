Received: from pop-tawny.atl.sa.earthlink.net ([207.69.195.67])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EV4s7-0007FY-97
	for linux-mtd@lists.infradead.org; Thu, 27 Oct 2005 06:20:36 -0400
Received: from cpe-66-1-91-99.az.sprintbbd.net ([66.1.91.99]
	helo=[192.168.0.254])
	by pop-tawny.atl.sa.earthlink.net with esmtp (Exim 3.36 #10)
	id 1EV4s4-0001wc-00
	for linux-mtd@lists.infradead.org; Thu, 27 Oct 2005 06:20:33 -0400
From: Brent Roberts <randd@globalopensource.net>
To: MTD list <linux-mtd@lists.infradead.org>
Date: Thu, 27 Oct 2005 03:22:13 -0700
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200510270322.13555.randd@globalopensource.net>
Subject: MTD_open:  permission denied
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all. 

When attempting to do a 'flash_eraseall /dev/mtd1" I get "/dev/mtd1: 
permission denied".  It seems that MTD_open attempts but fails here.

I'm using a  DiskOnChip TSOP 192 MB.  All neccesary kernel drivers are 
compiled into the kernel as far as I know.  I am able to fdisk and 
mkfs.ext2 /dev/inftla1, and mount it, write to it, etc.

/proc/mtd looks like this:
mtd0: 0c000000 00004000 "DiskOnChip 2000 (INFTL Model)"
mtd1: 00010000 00004000 " DiskOnChip BDK partition"
mtd2: 0bfdc000 00004000 " DiskOnChip BDTL partition"

Any suggestions as to why permission is denied?

Thanks.

-Brent Roberts

Received: from rodin.i2r.a-star.edu.sg ([192.122.139.27])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DABrZ-00007f-U5
	for linux-mtd@lists.infradead.org; Sat, 12 Mar 2005 14:01:27 -0500
Received: from rodin.i2r.a-star.edu.sg (localhost [127.0.0.1])
	by rodin.i2r.a-star.edu.sg (8.13.1/8.13.1) with ESMTP id j2CIlRBD029624
	for <linux-mtd@lists.infradead.org>;
	Sun, 13 Mar 2005 02:47:27 +0800 (SGT)
Received: from newmailhost.i2r.a-star.edu.sg ([192.122.134.76])
	by rodin.i2r.a-star.edu.sg (8.13.1/8.13.1) with ESMTP id j2CIlRXr029621
	for <linux-mtd@lists.infradead.org>;
	Sun, 13 Mar 2005 02:47:27 +0800 (SGT)
Received: from localhost.localdomain ([192.168.152.135])
	by mailhost.lit.org.sg (Sun Java System Messaging Server 6.1 HotFix
	0.06 (built Nov 11 2004)) with ESMTP id
	<0ID900ET75J3ZN00@mailhost.lit.org.sg> for
	linux-mtd@lists.infradead.org; Sun, 13 Mar 2005 02:47:27 +0800 (SGT)
Date: Sun, 13 Mar 2005 02:47:28 +0800
From: "Sukanta K. Hazra" <sukanta@i2r.a-star.edu.sg>
To: linux-mtd@lists.infradead.org
Message-id: <20050312184728.GA16267@i2r.a-star.edu.sg>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
Subject: 64 MB DiskOnChip 2000 causes kernel to hang
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

I have the following setup:

Linux kernel 2.6.8
MTD enabled

CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
CONFIG_NFTL=y
CONFIG_NFTL_RW=y
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_IDS=y
CONFIG_MTD_NAND_DISKONCHIP=y
CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=y


This setup works fine for an 8 MB DOC. The DOC is detected and everything
works fine. However, when I put a 64 MB DOC in the slot, the kernel
hangs after the following message:

====
DiskOnChip found at 0xd8000
DiskOnChip 2000 responds to DWORD access
NAND device: Manufacturer ID: 0xec, Chip ID: 0x75 (Samsung NAND 32MiB
3,3V 8-bit)
====

I have tried using kernel 2.6.11; the same problem persists. It's
unlikely that the DOC is faulty, I replaced it with another unit (64
MB), no improvement.


Does anyone know how to solve this problem?

Thanks in advance for any help.

Regards,
Sukanta

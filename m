Received: from smtp43.singnet.com.sg ([165.21.103.151])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FnsX3-0004VN-Oe
	for linux-mtd@lists.infradead.org; Wed, 07 Jun 2006 03:32:59 -0400
Received: from [167.116.151.204] ([63.150.136.42])
	by smtp43.singnet.com.sg (8.13.6/8.13.6) with ESMTP id k577Vhu4009420
	for <linux-mtd@lists.infradead.org>; Wed, 7 Jun 2006 15:31:48 +0800
Message-ID: <4486809B.6050600@singnet.com.sg>
Date: Wed, 07 Jun 2006 15:30:35 +0800
From: Terence Soh <gopher@singnet.com.sg>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: NAND oob bad blocks
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm using 2.6.11 kernel with the MTD drivers from kernel.org. On my 
board, u-boot is reporting 2 bad blocks while the kernel is reporting 
only 1 bad block.

Looking at the MTD Nand Driver Programming Interface, it says the bad 
block marker only applies fo the first page in a block. However, both 
u-boot and the Samsung documentation(K9F1208X0B)says that either the 1st 
  or 2nd page of every initial block has non-FFh data at the column 
address of 517.

What am I missing here or is this a case of old code/documentation?

Thanks,
Terence.

Received: from mxfep02.bredband.com ([195.54.107.73])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D6cro-00030m-PT
	for linux-mtd@lists.infradead.org; Wed, 02 Mar 2005 18:02:58 -0500
Received: from mxfep02 ([195.54.107.73] [195.54.107.73])
	by mxfep02.bredband.com with SMTP
	id <20050302230248.ZTMQ27886.mxfep02.bredband.com@mxfep02>
	for <linux-mtd@lists.infradead.org>; Thu, 3 Mar 2005 00:02:48 +0100
From: <extabe@bredband.net>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 2 Mar 2005 23:02:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-Id: <20050302230248.ZTMQ27886.mxfep02.bredband.com@mxfep02>
Subject: Driver howto? =?iso-8859-1?q?Can=B4t?= write to nandflash.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have made a nand flash driver whitch find my nandchip and i can use flash_rase whitout errors. I can allso mount /dev/mtdblock0 and put jffs on it, but when I try to write data on I always get:

"nand_write_ecc: Attempt to write not page aligned data
JFFS: jffs_write_node: Failed to write, requested 64, wrote -22"

Do I need to make my own nand_write_ecc function?

I´m kind of new to this flashin thing and don´t know where to start my debugging. 

/Andre

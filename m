Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D6le9-0004vb-7k
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 03:25:26 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: extabe@bredband.net
In-Reply-To: <20050302230248.ZTMQ27886.mxfep02.bredband.com@mxfep02>
References: <20050302230248.ZTMQ27886.mxfep02.bredband.com@mxfep02>
Content-Type: text/plain
Date: Thu, 03 Mar 2005 09:25:13 +0100
Message-Id: <1109838313.5398.0.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Driver howto? =?iso-8859-1?q?Can=B4t?= write to nandflash.
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-03-02 at 23:02 +0000, extabe@bredband.net wrote:
> I have made a nand flash driver whitch find my nandchip and i can use flash_rase whitout errors. I can allso mount /dev/mtdblock0 and put jffs on it, but when I try to write data on I always get:
> 
> "nand_write_ecc: Attempt to write not page aligned data
> JFFS: jffs_write_node: Failed to write, requested 64, wrote -22"

JFFS is not NAND FLASH aware. Use JFFS2 instead.

tglx

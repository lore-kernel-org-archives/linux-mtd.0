Received: from mxfep04.bredband.com ([195.54.107.79])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D7I16-0003aW-9J
	for linux-mtd@lists.infradead.org; Fri, 04 Mar 2005 13:59:17 -0500
Received: from mxfep04 ([195.54.107.79] [195.54.107.79])
	by mxfep04.bredband.com with SMTP
	id <20050304184957.KWQO1243.mxfep04.bredband.com@mxfep04>
	for <linux-mtd@lists.infradead.org>; Fri, 4 Mar 2005 19:49:57 +0100
From: <extabe@bredband.net>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 4 Mar 2005 18:49:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-Id: <20050304184957.KWQO1243.mxfep04.bredband.com@mxfep04>
Subject: Trying to get 1Gb Samsung nand flash working
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The flash works well in U-boot enviroment with jffs2 but I can´t get it running i Linux.
The chip i detected but then it reads badblocks on the entire chip.

"Scanning device for bad blocks
nand_read_oob: from = 0x00000000, len = 2
Bad eraseblock 0 at 0x00000000"
..and so on.
 I´ve used the same driver running a 64Mb nandflash with good result.

Anyone else who used this chip?


/Andre

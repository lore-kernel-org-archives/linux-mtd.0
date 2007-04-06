Received: from pop.scorch.co.nz ([203.167.210.162] helo=firstline.co.nz)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HZvH5-0006qt-HP
	for linux-mtd@lists.infradead.org; Fri, 06 Apr 2007 16:43:12 -0400
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: mtd_info/mtd_info_user>size wrong type
Date: Sat, 7 Apr 2007 08:49:37 +1200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200704070849.38048.manningc2@actrix.gen.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Folks
As people are starting to use larger NAND partitions (4GB+), an inconsistency 
in the size field has become apparent.

This is a unint32_t which is clearly too small for modern NAND arrays.

The read/write funcions use loff_t which is correct.

It would seem that size needs to be increated to loff_t too.

-- Charles

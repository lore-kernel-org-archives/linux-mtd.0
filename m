Received: from mail.gmx.net ([213.165.64.20])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IZVD4-00053Y-Be
	for linux-mtd@lists.infradead.org; Sun, 23 Sep 2007 13:25:35 -0400
Message-ID: <46F67A3C.9070104@gmx.net>
Date: Sun, 23 Sep 2007 16:37:48 +0200
From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: 2.6.23-rc7-git3: MTD cafe_nand warning
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

when compiling 2.6.23-rc7-git3 with a config which resembles
allmodconfig, I get the following warning in modpost:

WARNING: Can't handle masks in drivers/mtd/nand/cafe_nand:FFFF0

Regards,
Carl-Daniel

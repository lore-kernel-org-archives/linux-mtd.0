Received: from fnoeppeil48.netpark.at ([217.175.205.176]
	helo=roarinelk.homelinux.net)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ISRmt-000188-Rn
	for linux-mtd@lists.infradead.org; Tue, 04 Sep 2007 02:21:26 -0400
Date: Tue, 4 Sep 2007 08:21:14 +0200
From: Manuel Lauss <mano@roarinelk.homelinux.net>
To: linux-mtd@lists.infradead.org
Subject: Au1550nd.c and Samsung K9F1G08 NAND problem
Message-ID: <20070904062114.GA15966@roarinelk.homelinux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm trying to get the au1550nd.c driver to play nice with the
Samsung K9F1G08 128MB nand flash on a Au1200 system.  The chip
is recognized, however create_bbt() marks every single block
as defective. (WinCE reads/writes the chip without any problems;
but then again it only issues read/write/erase commands and no
READ_OOB).

Any hints on how to get this chip working are greatly appreciated!

Thanks,
	Manuel Lauss

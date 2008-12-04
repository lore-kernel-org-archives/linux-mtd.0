Received: from web58908.mail.re1.yahoo.com ([66.196.100.237])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L8Ge1-00046X-LV
	for linux-mtd@lists.infradead.org; Thu, 04 Dec 2008 16:01:38 +0000
Date: Thu, 4 Dec 2008 08:01:36 -0800 (PST)
From: Philip Rakity <prakity@yahoo.com>
Subject: JFFS2 and NAND cleanamarker ?
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <830440.56187.qm@web58908.mail.re1.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Thanks for the information on mkfs and nand flash.  I have been using

flash_eraseall -j
and a mkfs.jffs2 script similar to yours without the --no-cleanmarkers option set.

Things do appear to work.

WHEN should I set or not set this option ?

Philip



      

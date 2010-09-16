Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by bombadil.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ow9DX-000752-MF
	for linux-mtd@lists.infradead.org; Thu, 16 Sep 2010 07:49:16 +0000
Content-Type: text/plain; charset="utf-8"
Date: Thu, 16 Sep 2010 09:49:11 +0200
From: "Klaus Rudolph" <lts-rudolph@gmx.de>
Message-ID: <20100916074911.142030@gmx.net>
MIME-Version: 1.0
Subject: multiple mtd partitions with mtdram
To: linux-mtd@lists.infradead.org
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I want to simulate our embedded device on a standard desktop linux os and need a way to have multiple mtd partitions /dev/mtdx. With the mtdram driver module I actually can get only the /dev/mtd0 device. Is there a way to have multiple devices available, maybe with different size?

Thanks!
 Klaus

-- 
Neu: GMX De-Mail - Einfach wie E-Mail, sicher wie ein Brief!  
Jetzt De-Mail-Adresse reservieren: http://portal.gmx.net/de/go/demail

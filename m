Received: from mlbmx2.corp.harris.com ([137.237.90.74])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WWhb-00020G-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 06:25:19 +0100
Message-ID: <8D4C69676E66D511A1CB00508BBBB1921BCE9B@ranmx1.ran.harris.com>
From: "Walser, Martin" <mwalser@harris.com>
To: linux-mtd@lists.infradead.org
Subject: nftl_format: Erase size not 8Kb - I'm confused
Date: Tue, 14 Aug 2001 01:30:37 -0400
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I'm using a MD2202-D16. At startup a message is shown 
Could not find valid boot record
Could not mount NFTL device 

So I tried nftl_format /dev/mtd0 but this results in "Erase size not 8Kb - I'm
confused".
The entry in /proc/mtd shows an erasesize of 0x4000.

Any ideas?

best regards 
Martin

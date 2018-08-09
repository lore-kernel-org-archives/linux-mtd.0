Received: from gateway34.websitewelcome.com ([192.185.149.222])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fnnRo-0003Nx-Jc
 for linux-mtd@lists.infradead.org; Thu, 09 Aug 2018 16:06:02 +0000
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id 89B2E85F8C
 for <linux-mtd@lists.infradead.org>; Thu,  9 Aug 2018 11:05:34 -0500 (CDT)
Date: Thu, 9 Aug 2018 11:05:13 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] mtd: block2mtd: mark expected switch fall-throughs
Message-ID: <20180809160513.GA21180@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In preparation to enabling -Wimplicit-fallthrough, mark switch cases
where we are expecting to fall through.

Addresses-Coverity-ID: 402015 ("Missing break in switch")
Addresses-Coverity-ID: 402016 ("Missing break in switch")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/mtd/devices/block2mtd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index c9e4249..410a321 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -329,8 +329,10 @@ static int ustrtoul(const char *cp, char **endp, unsigned int base)
 	switch (**endp) {
 	case 'G' :
 		result *= 1024;
+		/* fall through */
 	case 'M':
 		result *= 1024;
+		/* fall through */
 	case 'K':
 	case 'k':
 		result *= 1024;
-- 
2.7.4

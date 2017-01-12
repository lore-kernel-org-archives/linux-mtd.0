Received: from mout.web.de ([212.227.15.14])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRchp-0004rW-0d
 for linux-mtd@lists.infradead.org; Thu, 12 Jan 2017 10:34:07 +0000
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/3] MTD-FTL: Fine-tuning for two function implementations
Message-ID: <4a5a265e-96c8-5fe6-487a-92a0d47a91da@users.sourceforge.net>
Date: Thu, 12 Jan 2017 11:33:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 12 Jan 2017 11:24:12 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use kmalloc_array() in build_maps()
  Delete an error message for a failed memory allocation in ftl_add_mtd()
  Improve another size determination in ftl_add_mtd()

 drivers/mtd/ftl.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

-- 
2.11.0

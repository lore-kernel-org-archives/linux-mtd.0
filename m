Received: from [212.176.242.38] (helo=vaxon.spb.rtsoft.ru)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Id5sp-0008E7-RZ
	for linux-mtd@lists.infradead.org; Wed, 03 Oct 2007 16:11:34 +0100
Date: Wed, 3 Oct 2007 18:05:28 +0400
From: Valentine Barshak <vbarshak@ru.mvista.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] mtd: remove unnecessary memset from physmap_of driver
Message-ID: <20071003140528.GA11871@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18178.55231.813138.369480@cargo.ozlabs.ibm.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

No need for memset to zero memory here, since we use kzalloc.

Signed-off-by: Valentine Barshak <vbarshak@ru.mvista.com>
---
 drivers/mtd/maps/physmap_of.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index cf75a56..aeed9ea 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -232,7 +232,6 @@ static int __devinit of_flash_probe(struct of_device *dev,
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (!info)
 		goto err_out;
-	memset(info, 0, sizeof(*info));
 
 	dev_set_drvdata(&dev->dev, info);
 
-- 
1.5.2.4

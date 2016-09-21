Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmeC9-0001gc-4H
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:52:50 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 24/46] mtd: nandsim: Wire up NANDSIM_MODE_CACHEFILE ioctl
 mode
Date: Wed, 21 Sep 2016 11:51:57 +0200
Message-Id: <37e36b3fc2c97ae93d729c07a260dfb020facce2.1474450296.git.dwalter@sigma-star.at>
In-Reply-To: <cover.1474450295.git.dwalter@sigma-star.at>
References: <cover.1474450295.git.dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

Allow the userspace control tool also to setup a cache file.
In contrast to the cache_file module parameter the ioctl() only
accepts a fd. So, userspace should hand in an fd pointing to
a temp file.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 56a2904..0e8574e 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -2536,10 +2536,15 @@ static int ns_ctrl_new_instance(struct ns_new_instance_req *req)
 		case NANDSIM_BACKEND_RAM:
 			nsparam->bops = &ns_ram_bops;
 		break;
+
 		case NANDSIM_BACKEND_FILE:
 			nsparam->bops = &ns_file_bops;
 		break;
 
+		case NANDSIM_BACKEND_CACHEFILE:
+			nsparam->bops = &ns_cachefile_bops;
+		break;
+
 		default:
 			kfree(nsparam);
 			return -EINVAL;
-- 
2.8.3

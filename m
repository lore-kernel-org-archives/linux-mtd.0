Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyG-0004sk-1X
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:11 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 24/46] mtd: nandsim: Wire up NANDSIM_MODE_CACHEFILE ioctl mode
Date: Wed, 31 Aug 2016 09:28:31 +0200
Message-Id: <20160831072853.27822-25-dwalter@sigma-star.at>
In-Reply-To: <20160831072853.27822-1-dwalter@sigma-star.at>
References: <20160831072853.27822-1-dwalter@sigma-star.at>
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
index f936157..47d8d41 100644
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

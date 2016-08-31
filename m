Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyT-0004sh-TK
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:24 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 44/46] mtd: nandsim: Wire up NANDSIM_IOC_DESTROY_INSTANCE
Date: Wed, 31 Aug 2016 09:28:51 +0200
Message-Id: <20160831072853.27822-45-dwalter@sigma-star.at>
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

The logic for destroying nandsim instances now also ready.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 4145ab6..8a63812 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -2922,6 +2922,19 @@ static long ns_ctrl_ioctl(struct file *file, unsigned int cmd,
 			ret = ns_ctrl_new_instance(&req, argp + sizeof(req));
 			break;
 		}
+		case NANDSIM_IOC_DESTROY_INSTANCE:
+		{
+			struct ns_destroy_instance_req req;
+
+			ret = copy_from_user(&req, argp, sizeof(struct ns_destroy_instance_req));
+			if (ret) {
+				ret = -EFAULT;
+				goto out;
+			}
+
+			ret = ns_ctrl_destroy_instance(&req);
+			break;
+		}
 
 		default:
 			ret = -ENOTTY;
-- 
2.8.3

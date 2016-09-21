Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmeHd-0007QM-FC
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:57:43 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 43/46] mtd: nandsim: Wire up NANDSIM_IOC_NEW_INSTANCE
Date: Wed, 21 Sep 2016 11:57:17 +0200
Message-Id: <7c19d07912a8c93d2ea7fd9c7e3b08d704241b3c.1474450296.git.dwalter@sigma-star.at>
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

Since we have now all what we need we can arm NANDSIM_IOC_NEW_INSTANCE.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index d0cc24d..bb30763 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -2900,10 +2900,35 @@ out:
 static long ns_ctrl_ioctl(struct file *file, unsigned int cmd,
 			  unsigned long arg)
 {
-	if (!capable(CAP_SYS_RESOURCE))
-		return -EPERM;
+	int ret;
+	void __user *argp = (void __user *)arg;
+
+	if (!capable(CAP_SYS_RESOURCE)) {
+		ret = -EPERM;
+		goto out;
+	}
+
+	switch (cmd) {
+		case NANDSIM_IOC_NEW_INSTANCE:
+		{
+			struct ns_new_instance_req req;
+
+			ret = copy_from_user(&req, argp, sizeof(struct ns_new_instance_req));
+			if (ret) {
+				ret = -EFAULT;
+				goto out;
+			}
 
-	return -ENOTTY;
+			ret = ns_ctrl_new_instance(&req, argp + sizeof(req));
+			break;
+		}
+
+		default:
+			ret = -ENOTTY;
+	}
+
+out:
+	return ret;
 }
 
 #ifdef CONFIG_COMPAT
-- 
2.8.3

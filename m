Received: from co9ehsobe005.messaging.microsoft.com ([207.46.163.28]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UY9ai-0000kE-Gw
 for linux-mtd@lists.infradead.org; Fri, 03 May 2013 06:35:45 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 2/4] mtd: add a new sys node to show the ecc step size
Date: Fri, 3 May 2013 14:21:42 +0800
Message-ID: <1367562104-8955-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1367562104-8955-1-git-send-email-b32955@freescale.com>
References: <1367562104-8955-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a new sys node to show the ecc step size.
The application then can uses this node to get the ecc step
size.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/mtdcore.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e513fc4..2ed2827 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -287,6 +287,16 @@ static DEVICE_ATTR(bitflip_threshold, S_IRUGO | S_IWUSR,
 		   mtd_bitflip_threshold_show,
 		   mtd_bitflip_threshold_store);
 
+static ssize_t mtd_ecc_size_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE, "%lu\n", (unsigned long)mtd->ecc_size);
+
+}
+static DEVICE_ATTR(ecc_size, S_IRUGO, mtd_ecc_size_show, NULL);
+
 static struct attribute *mtd_attrs[] = {
 	&dev_attr_type.attr,
 	&dev_attr_flags.attr,
@@ -298,6 +308,7 @@ static struct attribute *mtd_attrs[] = {
 	&dev_attr_numeraseregions.attr,
 	&dev_attr_name.attr,
 	&dev_attr_ecc_strength.attr,
+	&dev_attr_ecc_size.attr,
 	&dev_attr_bitflip_threshold.attr,
 	NULL,
 };
-- 
1.7.1

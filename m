Date: Thu, 5 Dec 2013 17:53:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [patch v2] mtd: sm_ftl: heap corruption in
 sm_create_sysfs_attributes()
Message-ID: <20131205145349.GA13302@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52A06B00.7070309@bfs.de>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 walter harms <wharms@bfs.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We always put a NUL terminator one space past the end of the "vendor"
buffer.  Walter Harms also pointed out that this should just use
kstrndup().

Fixes: 7d17c02a01a1 ('mtd: Add new SmartMedia/xD FTL')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2:  Use kstrndup().
     Don't subtract 1 from the strnlen() limiter for the NUL.  I think
     it's ok to go over?

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index 4b8e89583f2a..cf49c22673b9 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -59,15 +59,12 @@ static struct attribute_group *sm_create_sysfs_attributes(struct sm_ftl *ftl)
 	struct attribute_group *attr_group;
 	struct attribute **attributes;
 	struct sm_sysfs_attribute *vendor_attribute;
+	char *vendor;
 
-	int vendor_len = strnlen(ftl->cis_buffer + SM_CIS_VENDOR_OFFSET,
-					SM_SMALL_PAGE - SM_CIS_VENDOR_OFFSET);
-
-	char *vendor = kmalloc(vendor_len, GFP_KERNEL);
+	vendor = kstrndup(ftl->cis_buffer + SM_CIS_VENDOR_OFFSET,
+			  SM_SMALL_PAGE - SM_CIS_VENDOR_OFFSET, GFP_KERNEL);
 	if (!vendor)
 		goto error1;
-	memcpy(vendor, ftl->cis_buffer + SM_CIS_VENDOR_OFFSET, vendor_len);
-	vendor[vendor_len] = 0;
 
 	/* Initialize sysfs attributes */
 	vendor_attribute =
@@ -78,7 +75,7 @@ static struct attribute_group *sm_create_sysfs_attributes(struct sm_ftl *ftl)
 	sysfs_attr_init(&vendor_attribute->dev_attr.attr);
 
 	vendor_attribute->data = vendor;
-	vendor_attribute->len = vendor_len;
+	vendor_attribute->len = strlen(vendor);
 	vendor_attribute->dev_attr.attr.name = "vendor";
 	vendor_attribute->dev_attr.attr.mode = S_IRUGO;
 	vendor_attribute->dev_attr.show = sm_attr_show;

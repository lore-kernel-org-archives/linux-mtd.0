Date: Thu, 5 Dec 2013 14:02:36 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [patch] mtd: sm_ftl: heap corruption in sm_create_sysfs_attributes()
Message-ID: <20131205110235.GA14728@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We always put a NUL terminator one space past the end of the "vendor"
buffer.  Also I think the strnlen() limiter is off by one so I have made
it smaller.

Fixes: 7d17c02a01a1 ('mtd: Add new SmartMedia/xD FTL')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis stuff.  Untested.

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index 4b8e89583f2a..7c452714df8d 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -59,11 +59,12 @@ static struct attribute_group *sm_create_sysfs_attributes(struct sm_ftl *ftl)
 	struct attribute_group *attr_group;
 	struct attribute **attributes;
 	struct sm_sysfs_attribute *vendor_attribute;
+	int vendor_len;
+	char *vendor;
 
-	int vendor_len = strnlen(ftl->cis_buffer + SM_CIS_VENDOR_OFFSET,
-					SM_SMALL_PAGE - SM_CIS_VENDOR_OFFSET);
-
-	char *vendor = kmalloc(vendor_len, GFP_KERNEL);
+	vendor_len = strnlen(ftl->cis_buffer + SM_CIS_VENDOR_OFFSET,
+			     SM_SMALL_PAGE - SM_CIS_VENDOR_OFFSET - 1);
+	vendor = kmalloc(vendor_len + 1, GFP_KERNEL);
 	if (!vendor)
 		goto error1;
 	memcpy(vendor, ftl->cis_buffer + SM_CIS_VENDOR_OFFSET, vendor_len);

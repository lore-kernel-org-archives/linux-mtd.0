Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PxgqQ-0006be-A4
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2011 14:28:03 +0000
Received: by gyh3 with SMTP id 3so731017gyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Mar 2011 06:28:00 -0800 (PST)
Date: Thu, 10 Mar 2011 22:31:39 +0800
From: Xiaochen Wang <wangxiaochen0@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] check kmalloc return value in mtd/sm_rtl.c
Message-ID: <20110310143139.GA15778@chii>
References: <20110310054230.GA6022@chii> <1299763298.6676.12.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1299763298.6676.12.camel@localhost>
Cc: Xiaochen Wang <wangxiaochen0@gmail.com>, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org
Reply-To: Xiaochen Wang <wangxiaochen0@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Artem
> > +	if (!attributes)
> > +		got error3;
I'm so sorry for that:(
> Please, compile-check patches before sending them out :-)
Thanks for your advice, I'll do it.

The new patch , which has been compile-checked, is here:

Description:
Because malloc/kzalloc may fail, we should check kmalloc/kzalloc return value 
 in sm_create_sysfs_attributes(), mtd/sm_rtl.c and do error handling.
Meanwhile, we should check sm_create_sysfs_attributes return value.

Signed-off-by: Xiaochen Wang <wangxiaochen0@gmail.com>
---
 drivers/mtd/sm_ftl.c |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index ac0d6a8..2b0daae 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -64,12 +64,16 @@ struct attribute_group *sm_create_sysfs_attributes(struct sm_ftl *ftl)
 					SM_SMALL_PAGE - SM_CIS_VENDOR_OFFSET);
 
 	char *vendor = kmalloc(vendor_len, GFP_KERNEL);
+	if (!vendor)
+		goto error1;
 	memcpy(vendor, ftl->cis_buffer + SM_CIS_VENDOR_OFFSET, vendor_len);
 	vendor[vendor_len] = 0;
 
 	/* Initialize sysfs attributes */
 	vendor_attribute =
 		kzalloc(sizeof(struct sm_sysfs_attribute), GFP_KERNEL);
+	if (!vendor_attribute)
+		goto error2;
 
 	sysfs_attr_init(&vendor_attribute->dev_attr.attr);
 
@@ -83,12 +87,24 @@ struct attribute_group *sm_create_sysfs_attributes(struct sm_ftl *ftl)
 	/* Create array of pointers to the attributes */
 	attributes = kzalloc(sizeof(struct attribute *) * (NUM_ATTRIBUTES + 1),
 								GFP_KERNEL);
+	if (!attributes)
+		goto error3;
 	attributes[0] = &vendor_attribute->dev_attr.attr;
 
 	/* Finally create the attribute group */
 	attr_group = kzalloc(sizeof(struct attribute_group), GFP_KERNEL);
+	if (!attr_group)
+		goto error4;
 	attr_group->attrs = attributes;
 	return attr_group;
+error4:
+	kfree(attributes);
+error3:
+	kfree(vendor_attribute);
+error2:
+	kfree(vendor);
+error1:
+	return NULL;
 }
 
 void sm_delete_sysfs_attributes(struct sm_ftl *ftl)
@@ -1178,6 +1194,8 @@ static void sm_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	}
 
 	ftl->disk_attributes = sm_create_sysfs_attributes(ftl);
+	if (!ftl->disk_attributes)
+		goto error6;
 	trans->disk_attributes = ftl->disk_attributes;
 
 	sm_printk("Found %d MiB xD/SmartMedia FTL on mtd%d",
-- 
1.7.2.3

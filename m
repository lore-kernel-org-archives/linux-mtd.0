Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C9EC7115F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 09:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8w1vgbYGPPKe0M+MaUsvr4JKBeT3ZwSTgpMXGSeGcwo=; b=zEsJm+4xbx/s0U
	1WirWaxskMyN8NJuMo1DMXDBugihy5QmVTqTqzn0JXbfNvc8E8DSKR6nnNb6JKtW17/BXWmy4zmBZ
	dYjTpvktSmrMEMnaVGgh5UH59fei/b6w2YcMlHePyy0X7HQpyWcVc3cXxuM10HnuLIchga+X/XWMZ
	8W1gtxxQjGbAwWehKksAR0BdQ+TCqLlQhFqvE6MnBrKEEUFpy20eIvcrodqNpvEOvwtRHy9AfgoLz
	UOAwKJ01gz5TvAQjePT1jrsUpsnV+1eRMfU0GwYs3SbcInUviSQVadhdgj41HD54oCKsR0qCmRzC8
	57nBGnpMe5TzO3ir1v4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRouH-00000009VgV-1XFd;
	Wed, 18 Jun 2025 09:16:33 +0000
Received: from relay16.mail.gandi.net ([2001:4b98:dc4:8::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoZM-00000009Tpe-2xPT
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 08:54:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 052B944A23;
	Wed, 18 Jun 2025 08:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750236886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MDMMEYwKSSJr5IocxXidxrP5yOeo0O7DKS3k3lwfqgw=;
	b=Ol6Vw8C1YijwQMaUSRd1ebsc6ys9VFskRTEaGeHaf7p4kqnSN4ipv1kCed6FyUKgAjCmkY
	Frx1//eHrExicdVSuM82dkTZmx8zgLj4Si7B+wO4Yffdg9co6t6gEwLRX3YbAktlc9caU3
	HwLXWQ+7d0qZyNgBrfHy1w6KupuSaxzedLFKvIzj/ZOkowQjTzDRhwXMA4MFEWaPXc3Gnj
	++5jqo2Dqnqn/4mrBYQAqoBJK+mfNZq6P36g5ja7JT3wE+gTFNyMpCRKazDZ+Cn21OEiQq
	GzDmMmSSNqH5dYMuyNcieomLe+eOjjoJAdGvfTXDM8W5rfLzvv5FBFsoQTpEDQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2] Revert "mtd: core: always create master device"
Date: Wed, 18 Jun 2025 10:54:44 +0200
Message-ID: <20250618085444.1649852-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeetfeduleefjeffheevleeggfdtvdduhfdugeeuieejveejiedvhfdugfettdehnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidrrddpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvr
 ggurdhorhhgpdhrtghpthhtoheprghlvgigrghnuggvrhdruhhshihskhhinhesihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigsehrohgvtghkqdhushdrnhgvth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_015457_228311_FB99FF8B 
X-CRM114-Status: GOOD (  28.53  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The idea behind this patch was to always let a "master" mtd device
available to anchor runtime PM. Historically, there was no mtd device
representing the whole storage as soon as partitions were coming into
play. The introduction of CONFIG_MTD_PARTITIONED_MASTER allowed to keep
this "master" device, but was not enabled by default to avoid breaking
existing users (otherwise the mtd device numbering would be totally
messed up with an off by 1, at least).

The approach of adding an mtd_master class on top of partitioned mtd
devices is breaking the mtd core in many creative ways, so better think
again this approach and revert the faulty changes for now.

This reverts commit 0aa7b390fc40a871267a2328bbbefca8b37ad307.

Fixes: 0aa7b390fc40 ("mtd: core: always create master device")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v2:
- Add missing 'Fixes:' tag.
---
 drivers/mtd/mtdchar.c          |   2 +-
 drivers/mtd/mtdcore.c          | 152 +++++++++------------------------
 drivers/mtd/mtdcore.h          |   2 +-
 drivers/mtd/mtdpart.c          |  16 ++--
 include/linux/mtd/partitions.h |   2 +-
 5 files changed, 51 insertions(+), 123 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 391d81ad960c..8dc4f5c493fc 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -559,7 +559,7 @@ static int mtdchar_blkpg_ioctl(struct mtd_info *mtd,
 		/* Sanitize user input */
 		p.devname[BLKPG_DEVNAMELTH - 1] = '\0';
 
-		return mtd_add_partition(mtd, p.devname, p.start, p.length, NULL);
+		return mtd_add_partition(mtd, p.devname, p.start, p.length);
 
 	case BLKPG_DEL_PARTITION:
 
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 429d8c16baf0..5ba9a741f5ac 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -68,13 +68,7 @@ static struct class mtd_class = {
 	.pm = MTD_CLS_PM_OPS,
 };
 
-static struct class mtd_master_class = {
-	.name = "mtd_master",
-	.pm = MTD_CLS_PM_OPS,
-};
-
 static DEFINE_IDR(mtd_idr);
-static DEFINE_IDR(mtd_master_idr);
 
 /* These are exported solely for the purpose of mtd_blkdevs.c. You
    should not use them for _anything_ else */
@@ -89,9 +83,8 @@ EXPORT_SYMBOL_GPL(__mtd_next_device);
 
 static LIST_HEAD(mtd_notifiers);
 
-#define MTD_MASTER_DEVS 255
+
 #define MTD_DEVT(index) MKDEV(MTD_CHAR_MAJOR, (index)*2)
-static dev_t mtd_master_devt;
 
 /* REVISIT once MTD uses the driver model better, whoever allocates
  * the mtd_info will probably want to use the release() hook...
@@ -111,17 +104,6 @@ static void mtd_release(struct device *dev)
 	device_destroy(&mtd_class, index + 1);
 }
 
-static void mtd_master_release(struct device *dev)
-{
-	struct mtd_info *mtd = dev_get_drvdata(dev);
-
-	idr_remove(&mtd_master_idr, mtd->index);
-	of_node_put(mtd_get_of_node(mtd));
-
-	if (mtd_is_partition(mtd))
-		release_mtd_partition(mtd);
-}
-
 static void mtd_device_release(struct kref *kref)
 {
 	struct mtd_info *mtd = container_of(kref, struct mtd_info, refcnt);
@@ -385,11 +367,6 @@ static const struct device_type mtd_devtype = {
 	.release	= mtd_release,
 };
 
-static const struct device_type mtd_master_devtype = {
-	.name		= "mtd_master",
-	.release	= mtd_master_release,
-};
-
 static bool mtd_expert_analysis_mode;
 
 #ifdef CONFIG_DEBUG_FS
@@ -657,13 +634,13 @@ static void mtd_check_of_node(struct mtd_info *mtd)
 /**
  *	add_mtd_device - register an MTD device
  *	@mtd: pointer to new MTD device info structure
- *	@partitioned: create partitioned device
  *
  *	Add a device to the list of MTD devices present in the system, and
  *	notify each currently active MTD 'user' of its arrival. Returns
  *	zero on success or non-zero on failure.
  */
-int add_mtd_device(struct mtd_info *mtd, bool partitioned)
+
+int add_mtd_device(struct mtd_info *mtd)
 {
 	struct device_node *np = mtd_get_of_node(mtd);
 	struct mtd_info *master = mtd_get_master(mtd);
@@ -710,17 +687,10 @@ int add_mtd_device(struct mtd_info *mtd, bool partitioned)
 	ofidx = -1;
 	if (np)
 		ofidx = of_alias_get_id(np, "mtd");
-	if (partitioned) {
-		if (ofidx >= 0)
-			i = idr_alloc(&mtd_idr, mtd, ofidx, ofidx + 1, GFP_KERNEL);
-		else
-			i = idr_alloc(&mtd_idr, mtd, 0, 0, GFP_KERNEL);
-	} else {
-		if (ofidx >= 0)
-			i = idr_alloc(&mtd_master_idr, mtd, ofidx, ofidx + 1, GFP_KERNEL);
-		else
-			i = idr_alloc(&mtd_master_idr, mtd, 0, 0, GFP_KERNEL);
-	}
+	if (ofidx >= 0)
+		i = idr_alloc(&mtd_idr, mtd, ofidx, ofidx + 1, GFP_KERNEL);
+	else
+		i = idr_alloc(&mtd_idr, mtd, 0, 0, GFP_KERNEL);
 	if (i < 0) {
 		error = i;
 		goto fail_locked;
@@ -768,18 +738,10 @@ int add_mtd_device(struct mtd_info *mtd, bool partitioned)
 	/* Caller should have set dev.parent to match the
 	 * physical device, if appropriate.
 	 */
-	if (partitioned) {
-		mtd->dev.type = &mtd_devtype;
-		mtd->dev.class = &mtd_class;
-		mtd->dev.devt = MTD_DEVT(i);
-		dev_set_name(&mtd->dev, "mtd%d", i);
-		error = dev_set_name(&mtd->dev, "mtd%d", i);
-	} else {
-		mtd->dev.type = &mtd_master_devtype;
-		mtd->dev.class = &mtd_master_class;
-		mtd->dev.devt = MKDEV(MAJOR(mtd_master_devt), i);
-		error = dev_set_name(&mtd->dev, "mtd_master%d", i);
-	}
+	mtd->dev.type = &mtd_devtype;
+	mtd->dev.class = &mtd_class;
+	mtd->dev.devt = MTD_DEVT(i);
+	error = dev_set_name(&mtd->dev, "mtd%d", i);
 	if (error)
 		goto fail_devname;
 	dev_set_drvdata(&mtd->dev, mtd);
@@ -787,7 +749,6 @@ int add_mtd_device(struct mtd_info *mtd, bool partitioned)
 	of_node_get(mtd_get_of_node(mtd));
 	error = device_register(&mtd->dev);
 	if (error) {
-		pr_err("mtd: %s device_register fail %d\n", mtd->name, error);
 		put_device(&mtd->dev);
 		goto fail_added;
 	}
@@ -799,13 +760,10 @@ int add_mtd_device(struct mtd_info *mtd, bool partitioned)
 
 	mtd_debugfs_populate(mtd);
 
-	if (partitioned) {
-		device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1, NULL,
-			      "mtd%dro", i);
-	}
+	device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1, NULL,
+		      "mtd%dro", i);
 
-	pr_debug("mtd: Giving out %spartitioned device %d to %s\n",
-		 partitioned ? "" : "un-", i, mtd->name);
+	pr_debug("mtd: Giving out device %d to %s\n", i, mtd->name);
 	/* No need to get a refcount on the module containing
 	   the notifier, since we hold the mtd_table_mutex */
 	list_for_each_entry(not, &mtd_notifiers, list)
@@ -813,16 +771,13 @@ int add_mtd_device(struct mtd_info *mtd, bool partitioned)
 
 	mutex_unlock(&mtd_table_mutex);
 
-	if (partitioned) {
-		if (of_property_read_bool(mtd_get_of_node(mtd), "linux,rootfs")) {
-			if (IS_BUILTIN(CONFIG_MTD)) {
-				pr_info("mtd: setting mtd%d (%s) as root device\n",
-					mtd->index, mtd->name);
-				ROOT_DEV = MKDEV(MTD_BLOCK_MAJOR, mtd->index);
-			} else {
-				pr_warn("mtd: can't set mtd%d (%s) as root device - mtd must be builtin\n",
-					mtd->index, mtd->name);
-			}
+	if (of_property_read_bool(mtd_get_of_node(mtd), "linux,rootfs")) {
+		if (IS_BUILTIN(CONFIG_MTD)) {
+			pr_info("mtd: setting mtd%d (%s) as root device\n", mtd->index, mtd->name);
+			ROOT_DEV = MKDEV(MTD_BLOCK_MAJOR, mtd->index);
+		} else {
+			pr_warn("mtd: can't set mtd%d (%s) as root device - mtd must be builtin\n",
+				mtd->index, mtd->name);
 		}
 	}
 
@@ -838,10 +793,7 @@ int add_mtd_device(struct mtd_info *mtd, bool partitioned)
 fail_added:
 	of_node_put(mtd_get_of_node(mtd));
 fail_devname:
-	if (partitioned)
-		idr_remove(&mtd_idr, i);
-	else
-		idr_remove(&mtd_master_idr, i);
+	idr_remove(&mtd_idr, i);
 fail_locked:
 	mutex_unlock(&mtd_table_mutex);
 	return error;
@@ -859,14 +811,12 @@ int add_mtd_device(struct mtd_info *mtd, bool partitioned)
 
 int del_mtd_device(struct mtd_info *mtd)
 {
-	struct mtd_notifier *not;
-	struct idr *idr;
 	int ret;
+	struct mtd_notifier *not;
 
 	mutex_lock(&mtd_table_mutex);
 
-	idr = mtd->dev.class == &mtd_class ? &mtd_idr : &mtd_master_idr;
-	if (idr_find(idr, mtd->index) != mtd) {
+	if (idr_find(&mtd_idr, mtd->index) != mtd) {
 		ret = -ENODEV;
 		goto out_error;
 	}
@@ -1106,7 +1056,6 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 			      const struct mtd_partition *parts,
 			      int nr_parts)
 {
-	struct mtd_info *parent;
 	int ret, err;
 
 	mtd_set_dev_defaults(mtd);
@@ -1115,30 +1064,25 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	if (ret)
 		goto out;
 
-	ret = add_mtd_device(mtd, false);
-	if (ret)
-		goto out;
-
 	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER)) {
-		ret = mtd_add_partition(mtd, mtd->name, 0, MTDPART_SIZ_FULL, &parent);
+		ret = add_mtd_device(mtd);
 		if (ret)
 			goto out;
-
-	} else {
-		parent = mtd;
 	}
 
 	/* Prefer parsed partitions over driver-provided fallback */
-	ret = parse_mtd_partitions(parent, types, parser_data);
+	ret = parse_mtd_partitions(mtd, types, parser_data);
 	if (ret == -EPROBE_DEFER)
 		goto out;
 
 	if (ret > 0)
 		ret = 0;
 	else if (nr_parts)
-		ret = add_mtd_partitions(parent, parts, nr_parts);
-	else if (!IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
-		ret = mtd_add_partition(parent, mtd->name, 0, MTDPART_SIZ_FULL, NULL);
+		ret = add_mtd_partitions(mtd, parts, nr_parts);
+	else if (!device_is_registered(&mtd->dev))
+		ret = add_mtd_device(mtd);
+	else
+		ret = 0;
 
 	if (ret)
 		goto out;
@@ -1158,14 +1102,13 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 		register_reboot_notifier(&mtd->reboot_notifier);
 	}
 
-	return 0;
 out:
-	nvmem_unregister(mtd->otp_user_nvmem);
-	nvmem_unregister(mtd->otp_factory_nvmem);
+	if (ret) {
+		nvmem_unregister(mtd->otp_user_nvmem);
+		nvmem_unregister(mtd->otp_factory_nvmem);
+	}
 
-	del_mtd_partitions(mtd);
-
-	if (device_is_registered(&mtd->dev)) {
+	if (ret && device_is_registered(&mtd->dev)) {
 		err = del_mtd_device(mtd);
 		if (err)
 			pr_err("Error when deleting MTD device (%d)\n", err);
@@ -1324,7 +1267,8 @@ int __get_mtd_device(struct mtd_info *mtd)
 		mtd = mtd->parent;
 	}
 
-	kref_get(&master->refcnt);
+	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+		kref_get(&master->refcnt);
 
 	return 0;
 }
@@ -1418,7 +1362,8 @@ void __put_mtd_device(struct mtd_info *mtd)
 		mtd = parent;
 	}
 
-	kref_put(&master->refcnt, mtd_device_release);
+	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+		kref_put(&master->refcnt, mtd_device_release);
 
 	module_put(master->owner);
 
@@ -2585,16 +2530,6 @@ static int __init init_mtd(void)
 	if (ret)
 		goto err_reg;
 
-	ret = class_register(&mtd_master_class);
-	if (ret)
-		goto err_reg2;
-
-	ret = alloc_chrdev_region(&mtd_master_devt, 0, MTD_MASTER_DEVS, "mtd_master");
-	if (ret < 0) {
-		pr_err("unable to allocate char dev region\n");
-		goto err_chrdev;
-	}
-
 	mtd_bdi = mtd_bdi_init("mtd");
 	if (IS_ERR(mtd_bdi)) {
 		ret = PTR_ERR(mtd_bdi);
@@ -2619,10 +2554,6 @@ static int __init init_mtd(void)
 	bdi_unregister(mtd_bdi);
 	bdi_put(mtd_bdi);
 err_bdi:
-	unregister_chrdev_region(mtd_master_devt, MTD_MASTER_DEVS);
-err_chrdev:
-	class_unregister(&mtd_master_class);
-err_reg2:
 	class_unregister(&mtd_class);
 err_reg:
 	pr_err("Error registering mtd class or bdi: %d\n", ret);
@@ -2636,12 +2567,9 @@ static void __exit cleanup_mtd(void)
 	if (proc_mtd)
 		remove_proc_entry("mtd", NULL);
 	class_unregister(&mtd_class);
-	class_unregister(&mtd_master_class);
-	unregister_chrdev_region(mtd_master_devt, MTD_MASTER_DEVS);
 	bdi_unregister(mtd_bdi);
 	bdi_put(mtd_bdi);
 	idr_destroy(&mtd_idr);
-	idr_destroy(&mtd_master_idr);
 }
 
 module_init(init_mtd);
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index 2258d31c5aa6..b014861a06a6 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -8,7 +8,7 @@ extern struct mutex mtd_table_mutex;
 extern struct backing_dev_info *mtd_bdi;
 
 struct mtd_info *__mtd_next_device(int i);
-int __must_check add_mtd_device(struct mtd_info *mtd, bool partitioned);
+int __must_check add_mtd_device(struct mtd_info *mtd);
 int del_mtd_device(struct mtd_info *mtd);
 int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *, int);
 int del_mtd_partitions(struct mtd_info *);
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 5a3db36d734e..994e8c51e674 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -86,7 +86,8 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 	 * parent conditional on that option. Note, this is a way to
 	 * distinguish between the parent and its partitions in sysfs.
 	 */
-	child->dev.parent = &parent->dev;
+	child->dev.parent = IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) || mtd_is_partition(parent) ?
+			    &parent->dev : parent->dev.parent;
 	child->dev.of_node = part->of_node;
 	child->parent = parent;
 	child->part.offset = part->offset;
@@ -242,7 +243,7 @@ static int mtd_add_partition_attrs(struct mtd_info *new)
 }
 
 int mtd_add_partition(struct mtd_info *parent, const char *name,
-		      long long offset, long long length, struct mtd_info **out)
+		      long long offset, long long length)
 {
 	struct mtd_info *master = mtd_get_master(parent);
 	u64 parent_size = mtd_is_partition(parent) ?
@@ -275,15 +276,12 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
 	list_add_tail(&child->part.node, &parent->partitions);
 	mutex_unlock(&master->master.partitions_lock);
 
-	ret = add_mtd_device(child, true);
+	ret = add_mtd_device(child);
 	if (ret)
 		goto err_remove_part;
 
 	mtd_add_partition_attrs(child);
 
-	if (out)
-		*out = child;
-
 	return 0;
 
 err_remove_part:
@@ -415,7 +413,7 @@ int add_mtd_partitions(struct mtd_info *parent,
 		list_add_tail(&child->part.node, &parent->partitions);
 		mutex_unlock(&master->master.partitions_lock);
 
-		ret = add_mtd_device(child, true);
+		ret = add_mtd_device(child);
 		if (ret) {
 			mutex_lock(&master->master.partitions_lock);
 			list_del(&child->part.node);
@@ -592,6 +590,9 @@ static int mtd_part_of_parse(struct mtd_info *master,
 	int ret, err = 0;
 
 	dev = &master->dev;
+	/* Use parent device (controller) if the top level MTD is not registered */
+	if (!IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) && !mtd_is_partition(master))
+		dev = master->dev.parent;
 
 	np = mtd_get_of_node(master);
 	if (mtd_is_partition(master))
@@ -710,7 +711,6 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 		if (ret < 0 && !err)
 			err = ret;
 	}
-
 	return err;
 }
 
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 5daf80df9e89..b74a539ec581 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -108,7 +108,7 @@ extern void deregister_mtd_parser(struct mtd_part_parser *parser);
 		      deregister_mtd_parser)
 
 int mtd_add_partition(struct mtd_info *master, const char *name,
-		      long long offset, long long length, struct mtd_info **part);
+		      long long offset, long long length);
 int mtd_del_partition(struct mtd_info *master, int partno);
 uint64_t mtd_get_device_size(const struct mtd_info *mtd);
 
-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

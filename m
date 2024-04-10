Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788A8CD128A
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 22:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IVVRq9+s5wEzqM4t0AdJ7i15z1DObIq/hvTJsAxwpMk=; b=4U53eUu6shyy02
	/5zzCunv8Zw+kHa9ebDhabYXFkth1+Unqr094tvNc/sv/sEy/5Ful1ltINKeGMbhN0qvKvlPRazJB
	OUuKwRejFhnOQ7rbrXh2tDSbAVUNoLN3egCu/2HENQjGXNtRxcsY1hA20IHV8Dt/H2+UlM9oN8881
	2c17vrf3X34C2qcq5DOQGIkQAmtOIg4k7KVrz/6iuFNJ/fASYKVL3NO0iRcNWRQyxexNcxVw7OAJI
	MweFkysNVomkfpVVlF0Z21uJ5B76Inig0yKBuQh7ZqArQ17E4lx+9/fJy2xuSqU7gGo6zhfTsOZaR
	q5dNmuXIzUHMnUyKJ8zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rugeh-00000009Guh-2C8U;
	Wed, 10 Apr 2024 22:42:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rugee-00000009GsY-0104
	for linux-mtd@lists.infradead.org;
	Wed, 10 Apr 2024 22:42:57 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4155819f710so57055155e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2024 15:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1712788972; x=1713393772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrgXWBalUo3JWqOxX1Fx728CHz/FI28Q7rjY0txZfPc=;
        b=f+crTw81LMoIavn/RfQeCqpTZFtw6mOCkO3D6hUkiU7sAoh9Lur0aFNQdxTXzxCfId
         gdfDJ+xpTkQ4g7jmz+3zURGaUO2eYl1d4HOny68yoVlpGdmqdgGPsiqoAozIGyhX8p0b
         GRCSvkIcHPCdqorQKUr9sB2hplUNOZYkdi8Q9qfaRQBZFMmTdDObjaCRnUmoPv6t4MO+
         x+2eaWbII9p+2LUZBRa3IGEgX8+KdLW63GMEw6gIKE++jhMI3bP0hca1xf5KEZavOpFv
         +yuAha0qvVaKJgqWPVzpIOT5rS+5sO3Oow1OLs6heyMRiXQJyp12XDMihemTp5OQ4dfR
         F6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712788972; x=1713393772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrgXWBalUo3JWqOxX1Fx728CHz/FI28Q7rjY0txZfPc=;
        b=PkyjAKHbUsy3EZtb6GIMEtsm/JWCHJDQDsIFZoJgjhNH7aG5nDhJ1GMUlW9/fUNCQn
         MlFwBZAggoQvc39lDnNmyppEs4E5pGx3ivgQv7BQ0mBS0zOqG13qLY2k0RNnfrY01+9b
         BrH1znD+CVrJJ1dlM/uuFMqNK4Qq0aS73a7bDRQsmG+LfmjxK+y1luXRrvGN4x22n5tG
         lgVO8HVjB35/nGgv7nqsNBiCkr9OtAM2iDujB1w1kA4crXh3CskyoYXqCGXDI2ORmhPD
         N8fy1dNWE6bEwl/g5KcgBsiQk8F7tyP1RjmN4y5JN9h6MS18orjUThgYQW78zAj5KLEa
         yzFw==
X-Gm-Message-State: AOJu0YxdoUOkVG74hJp7lqyDGoizTCY9sJSQOtgtJ8rq4HIESrNQDhSl
	ISOYfxfeyEB0QMmvKVx8+K4u6QcyZMIvZHHVemPLV0po9ccb7S+GDTVUYIyTLpuHpHnnD4KT/k4
	xIKM=
X-Google-Smtp-Source: AGHT+IHrP1hBcjqWhOFZHheu4a+xpdzBeoiVKStDFZJItbpOKfLoPB77DDbrNLYrl1IhG+bCX9Owsw==
X-Received: by 2002:a05:600c:4f11:b0:414:95e0:388c with SMTP id l17-20020a05600c4f1100b0041495e0388cmr2886941wmq.8.1712788972107;
        Wed, 10 Apr 2024 15:42:52 -0700 (PDT)
Received: from cephalopod.i.decadent.org.uk (213.219.156.63.adsl.dyn.edpnet.net. [213.219.156.63])
        by smtp.gmail.com with ESMTPSA id c10-20020a5d4cca000000b0034698307cf8sm271337wrt.15.2024.04.10.15.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 15:42:51 -0700 (PDT)
From: Ben Hutchings <ben.hutchings@mind.be>
To: linux-mtd@lists.infradead.org
Cc: Ben Hutchings <ben.hutchings@mind.be>
Subject: [PATCH 2/2] mtd: ubi: Ignore all debugfs initialisation failures
Date: Thu, 11 Apr 2024 00:42:42 +0200
Message-Id: <ca32bed9956a00d1617ae801ca440ed02fe39570.1712788087.git.ben.hutchings@mind.be>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712788087.git.ben.hutchings@mind.be>
References: <cover.1712788087.git.ben.hutchings@mind.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_154256_081371_84523A64 
X-CRM114-Status: GOOD (  18.79  )
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

Drivers should never stop initialising or probing because of a failure
to create debugfs entries.  Such failures are harmless and could be
the intended result of setting the kernel parameter debugfs=off.

This was partially fixed in 2019, but some error checks were missed
and another one was been added since.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
Fixes: 2a734bb8d502 ("UBI: use debugfs for the extra checks knobs")
Fixes: c2d73ba892ea ("mtd: no need to check return value of ...")
Fixes: 6931fb44858c ("ubi: Use the fault injection framework to enhance ...")
---
 drivers/mtd/ubi/build.c | 10 ++--------
 drivers/mtd/ubi/debug.c | 33 +++++++--------------------------
 drivers/mtd/ubi/debug.h |  4 ++--
 3 files changed, 11 insertions(+), 36 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 50d78975b3ed..c07a4754b521 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1018,9 +1018,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	if (err)
 		goto out_detach;
 
-	err = ubi_debugfs_init_dev(ubi);
-	if (err)
-		goto out_uif;
+	ubi_debugfs_init_dev(ubi);
 
 	ubi->bgt_thread = kthread_create(ubi_thread, ubi, "%s", ubi->bgt_name);
 	if (IS_ERR(ubi->bgt_thread)) {
@@ -1064,7 +1062,6 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 
 out_debugfs:
 	ubi_debugfs_exit_dev(ubi);
-out_uif:
 	uif_close(ubi);
 out_detach:
 	ubi_wl_close(ubi);
@@ -1362,9 +1359,7 @@ static int __init ubi_init(void)
 		goto out_dev_unreg;
 	}
 
-	err = ubi_debugfs_init();
-	if (err)
-		goto out_slab;
+	ubi_debugfs_init();
 
 	err = ubiblock_init();
 	if (err) {
@@ -1390,7 +1385,6 @@ static int __init ubi_init(void)
 	ubiblock_exit();
 out_debugfs:
 	ubi_debugfs_exit();
-out_slab:
 	kmem_cache_destroy(ubi_wl_entry_slab);
 out_dev_unreg:
 	misc_deregister(&ubi_ctrl_cdev);
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index d57f52bd2ff3..505bc07d7dbb 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -248,13 +248,6 @@ static void dfs_create_fault_entry(struct dentry *parent)
 	struct dentry *dir;
 
 	dir = debugfs_create_dir("fault_inject", parent);
-	if (IS_ERR_OR_NULL(dir)) {
-		int err = dir ? PTR_ERR(dir) : -ENODEV;
-
-		pr_warn("UBI error: cannot create \"fault_inject\" debugfs directory, error %d\n",
-			 err);
-		return;
-	}
 
 	fault_create_debugfs_attr("emulate_eccerr", dir,
 				  &fault_eccerr_attr);
@@ -291,28 +284,18 @@ static void dfs_create_fault_entry(struct dentry *parent)
 /**
  * ubi_debugfs_init - create UBI debugfs directory.
  *
- * Create UBI debugfs directory. Returns zero in case of success and a negative
- * error code in case of failure.
+ * Try to create UBI debugfs directory.
  */
-int ubi_debugfs_init(void)
+void ubi_debugfs_init(void)
 {
 	if (!IS_ENABLED(CONFIG_DEBUG_FS))
-		return 0;
+		return;
 
 	dfs_rootdir = debugfs_create_dir("ubi", NULL);
-	if (IS_ERR_OR_NULL(dfs_rootdir)) {
-		int err = dfs_rootdir ? PTR_ERR(dfs_rootdir) : -ENODEV;
-
-		pr_err("UBI error: cannot create \"ubi\" debugfs directory, error %d\n",
-		       err);
-		return err;
-	}
 
 #ifdef CONFIG_MTD_UBI_FAULT_INJECTION
 	dfs_create_fault_entry(dfs_rootdir);
 #endif
-
-	return 0;
 }
 
 /**
@@ -585,10 +568,9 @@ static const struct file_operations eraseblk_count_fops = {
  * ubi_debugfs_init_dev - initialize debugfs for an UBI device.
  * @ubi: UBI device description object
  *
- * This function creates all debugfs files for UBI device @ubi. Returns zero in
- * case of success and a negative error code in case of failure.
+ * This function tries to create all debugfs files for UBI device @ubi.
  */
-int ubi_debugfs_init_dev(struct ubi_device *ubi)
+void ubi_debugfs_init_dev(struct ubi_device *ubi)
 {
 	unsigned long ubi_num = ubi->ubi_num;
 	struct ubi_debug_info *d = &ubi->dbg;
@@ -596,13 +578,13 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 	int n;
 
 	if (!IS_ENABLED(CONFIG_DEBUG_FS))
-		return 0;
+		return;
 
 	n = snprintf(d->dfs_dir_name, UBI_DFS_DIR_LEN + 1, UBI_DFS_DIR_NAME,
 		     ubi->ubi_num);
 	if (n > UBI_DFS_DIR_LEN) {
 		/* The array size is too small */
-		return -EINVAL;
+		return;
 	}
 
 	d->dfs_dir = debugfs_create_dir(d->dfs_dir_name, dfs_rootdir);
@@ -653,7 +635,6 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 						       (void *)ubi_num,
 						       &dfs_fops);
 #endif
-	return 0;
 }
 
 /**
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index b2fd97548808..1dc430d3f482 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -47,9 +47,9 @@ void ubi_dump_aeb(const struct ubi_ainf_peb *aeb, int type);
 void ubi_dump_mkvol_req(const struct ubi_mkvol_req *req);
 int ubi_self_check_all_ff(struct ubi_device *ubi, int pnum, int offset,
 			  int len);
-int ubi_debugfs_init(void);
+void ubi_debugfs_init(void);
 void ubi_debugfs_exit(void);
-int ubi_debugfs_init_dev(struct ubi_device *ubi);
+void ubi_debugfs_init_dev(struct ubi_device *ubi);
 void ubi_debugfs_exit_dev(struct ubi_device *ubi);
 
 /**
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71679D6DDEC
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2024 08:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MwMNgHrRz26J2Pj8kKQhk2pHO91poeX1GC+i1U8OJE8=; b=fTZXPkWxQUzBL2
	NBVsXRbTrQdaaBtkUJRh2bmGn+mxEoZhF7CcopkTnBw+/OH72amnNWrIB52oQHjYSupkvHFhWCBBA
	J0Z2Yjdcul3tEWyT6kKgWwA4dN9zl0X61V3EeUbxoAO7q3UzQuH4LYWln2OeuKl8KFoUjXkSdsI07
	LqBxobVA99qla+2KWdJQ2Fe11guwzOGzug2uSDmYyCER3ij4ejOyPeIgIjrUKJMKlhbNdRPeAYzRr
	3kHVDR4obtCFqvtXf02tkkrQtllpuCyhYA1fIXVuyaYjGm7I+gI1KwM0pGWXdW6wCe4dN5Y7c/kVm
	MjoxVaNoAnhpxxkQROeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBs87-000000026sf-2kCt;
	Fri, 15 Nov 2024 08:56:39 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBs7D-000000026jx-34iU
	for linux-mtd@lists.infradead.org;
	Fri, 15 Nov 2024 08:55:45 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a9ec86a67feso285293166b.1
        for <linux-mtd@lists.infradead.org>; Fri, 15 Nov 2024 00:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731660942; x=1732265742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WwPfvv1Vu4fpClWF94s2/7ENJKbUW5Fs/yycbUbmmqg=;
        b=O2Axzb2znJuABw1RO/je8Y0tbzGWbKcL0jGVHAzDoXVNUNSSuNHoVW2JH8lAz/qYE4
         GEhnuyN8t1RckLxYPTOSMhoGhGIqIoDxKJQXBdxW9iD7Iq03k4Bo8rAh0+JSyw2PB+0U
         6HPXngw59FJPENipt5w1vWUxAfh/thGXmxygV+/6RWfPu6VhVEGzGV0LupmwkTod/1GK
         zmGzd626iWbJE1HAmKmOCXRryEmNXOgnLfKgl57WMHJTS9La4DIDbC4qFOKsnCiIf/ai
         09w9rhiadVGeJHVBoKcC2f2W8Gm4B0d+zZJt0MkBCj+/G0JobFvprxH17acRdfJSm2Kv
         7Pjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731660942; x=1732265742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwPfvv1Vu4fpClWF94s2/7ENJKbUW5Fs/yycbUbmmqg=;
        b=eqhVdr7AQgTnXvZEUAbtDAl5uaqFHtNgP9eFs2dxrgInDZnENJM3kjNsBVBkxTkCPW
         jWFJ9BgFQu3fqmeKP7Dv9/kb3ONPoGsp6CNQ3+a8GqQ7Nmwd8go1oABn9ZfeHr+3EO3G
         f8lCuzwdHEySfsr+OSgjONynPMOxsRIdMEGhaO++NDQwBiBkqPOHZvZIZftvVaufS5Bk
         c3x/N4N7aMOGJqqMO3O1QpUFddrAgI9nk+iMVs+awQ0tVDoFm9JsxYT9iKE9LBYdZifr
         66Y+enM7cx7vsBjxlvm7pt9qhQ48ltUmrh92/OoufpX00vosGa+tOBb6x7vSwb0LQC48
         P99A==
X-Forwarded-Encrypted: i=1; AJvYcCUHpr/cbPNrl5MbDyZlUziex6j//bQYZif8vrZsI5qRnG9+3ylukO6VQeQFFTrC1VHOXUuTIy4aSN0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOUexKJfRXh7n0i4slgGlXsWLHD7zDl69VgzPp7pCFXqbdqFyj
	sRp94rZo4fA3khuiQv7C4DmB+CJ8ImkD4dy0jgPALrNvi/RM4IwH
X-Google-Smtp-Source: AGHT+IFpqTwtMjV+8xffCCbPSZs9XUvm9no//pS9duGs/44wrGoUxnGCitypnV5+QD7w0Kza5jeVVQ==
X-Received: by 2002:a17:907:844:b0:a9a:13dd:2734 with SMTP id a640c23a62f3a-aa483489f26mr173860666b.36.1731660941639;
        Fri, 15 Nov 2024 00:55:41 -0800 (PST)
Received: from enno-kaukura.lan ([147.161.234.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e081574sm157714866b.179.2024.11.15.00.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 00:55:41 -0800 (PST)
From: Andreas Oetken <ennoerlangen@gmail.com>
X-Google-Original-From: Andreas Oetken <andreas.oetken@siemens-energy.com>
To: 
Cc: Andreas Oetken <andreas.oetken@siemens-energy.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] mtd: core/part: trying to delete partition with usecount > 0 corrupt partition
Date: Fri, 15 Nov 2024 09:55:13 +0100
Message-ID: <20241115085516.1852668-1-andreas.oetken@siemens-energy.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_005543_801024_53253824 
X-CRM114-Status: GOOD (  19.80  )
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

Check for usecount before deleting debugfs and sysfs entries.
Otherwise deleting the partition a second time leads to a kernel panic.

Signed-off-by: Andreas Oetken <andreas.oetken@siemens-energy.com>
---
 drivers/mtd/mtdcore.c | 25 ++++++++++++++-----------
 drivers/mtd/mtdcore.h |  2 +-
 drivers/mtd/mtdpart.c |  7 +++----
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 1c8c40728678..19ade7e53024 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -714,30 +714,33 @@ int add_mtd_device(struct mtd_info *mtd)
  *	if the requested device does not appear to be present in the list.
  */
 
-int del_mtd_device(struct mtd_info *mtd)
+int del_mtd_device(struct mtd_info *mtd, const struct attribute *mtd_partition_attrs[])
 {
 	int ret;
 	struct mtd_notifier *not;
 
 	mutex_lock(&mtd_table_mutex);
-
-	debugfs_remove_recursive(mtd->dbg.dfs_dir);
-
 	if (idr_find(&mtd_idr, mtd->index) != mtd) {
 		ret = -ENODEV;
 		goto out_error;
 	}
 
-	/* No need to get a refcount on the module containing
-		the notifier, since we hold the mtd_table_mutex */
-	list_for_each_entry(not, &mtd_notifiers, list)
-		not->remove(mtd);
-
 	if (mtd->usecount) {
 		printk(KERN_NOTICE "Removing MTD device #%d (%s) with use count %d\n",
 		       mtd->index, mtd->name, mtd->usecount);
 		ret = -EBUSY;
 	} else {
+		/* No need to get a refcount on the module containing
+		 * the notifier, since we hold the mtd_table_mutex
+		 */
+		debugfs_remove_recursive(mtd->dbg.dfs_dir);
+
+		list_for_each_entry(not, &mtd_notifiers, list)
+			not->remove(mtd);
+
+		if (mtd_partition_attrs != NULL)
+			sysfs_remove_files(&mtd->dev.kobj, mtd_partition_attrs);
+
 		/* Try to remove the NVMEM provider */
 		if (mtd->nvmem)
 			nvmem_unregister(mtd->nvmem);
@@ -852,7 +855,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 
 out:
 	if (ret && device_is_registered(&mtd->dev))
-		del_mtd_device(mtd);
+		del_mtd_device(mtd, NULL);
 
 	return ret;
 }
@@ -878,7 +881,7 @@ int mtd_device_unregister(struct mtd_info *master)
 	if (!device_is_registered(&master->dev))
 		return 0;
 
-	return del_mtd_device(master);
+	return del_mtd_device(master, NULL);
 }
 EXPORT_SYMBOL_GPL(mtd_device_unregister);
 
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index b5eefeabf310..0f8e815e99b2 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -9,7 +9,7 @@ extern struct backing_dev_info *mtd_bdi;
 
 struct mtd_info *__mtd_next_device(int i);
 int __must_check add_mtd_device(struct mtd_info *mtd);
-int del_mtd_device(struct mtd_info *mtd);
+int del_mtd_device(struct mtd_info *mtd, const struct attribute *mtd_partition_attrs[]);
 int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *, int);
 int del_mtd_partitions(struct mtd_info *);
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 5725818fa199..96d4deb4d9b5 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -307,12 +307,11 @@ static int __mtd_del_partition(struct mtd_info *mtd)
 			return err;
 	}
 
-	sysfs_remove_files(&mtd->dev.kobj, mtd_partition_attrs);
-
-	err = del_mtd_device(mtd);
+	err = del_mtd_device(mtd, mtd_partition_attrs);
 	if (err)
 		return err;
 
+
 	list_del(&mtd->part.node);
 	free_partition(mtd);
 
@@ -334,7 +333,7 @@ static int __del_mtd_partitions(struct mtd_info *mtd)
 			__del_mtd_partitions(child);
 
 		pr_info("Deleting %s MTD partition\n", child->name);
-		ret = del_mtd_device(child);
+		ret = del_mtd_device(child, mtd_partition_attrs);
 		if (ret < 0) {
 			pr_err("Error when deleting partition \"%s\" (%d)\n",
 			       child->name, ret);
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

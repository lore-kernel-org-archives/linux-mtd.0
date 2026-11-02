Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7643606A324
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2026 08:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mwEFqIQi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bYcHxNNe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AX1RmJpo/BBV/7Fyy4+1SLSfDea79KFKQWGbfQHxMb4=; b=mwEFqIQiIjnCHkVHX/OdR00xR/
	P0RxYBL4Cvl4p8fhXnzpT5fhEXbI/kUX9rPLlSItJd6NbTLhylihQuJPTJLozrBiJbjxtu+5OxDbI
	LfSOaIkaKCRbqgmeqP9IcpK2m8FhqEwZyBO03GUDfLS2dCZqMn+0b9C2SFiTo3IT1Zl+T0rbfAPXA
	+9joF5HMnL+eAw3JxuObrGUb6M/dCfTPinBwjGVPwqqKQEN70pNvjlQprONCt4gQYbrJFJqkY8hqR
	7Tb761qiuICH+bU3Faz/RHzKydV08lq6PyAVdy/pAELLvapIeVH9+zulcgdtITdewOb0rMWFoOlKb
	n9LFgxVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnRS-0000000FsEg-0v4B;
	Mon, 02 Nov 2026 08:30:58 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnRO-0000000FsEJ-3rL6
	for linux-mtd@lists.infradead.org;
	Mon, 02 Nov 2026 08:30:56 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so1443353a91.1
        for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2026 00:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793608254; x=1794213054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8KAS6t6RcH5YSPgaYyaJ/vTgjaBHTXeGZTqVGqeK6VE=;
        b=bYcHxNNemtnSEAumqNeB0xGGYez8FCPrGkmW7/HJgyNffXMad95ELzvzl9RfLIxfnT
         /62OFSeThIMKVVBtZ9efRyoW1ySKjwsdHUo8+T4v9iTbGyVsJ0Fyp131AcfMOiplYmCf
         YU9j0IazYIs8jmTfC+nAhJbdbIbvdwCsrr5sfH9+jjMaLbcE7MqIyw1eNxp62qTwgEKC
         OPCexMKYcHkn4bYUaO7CAgV+Kp3P9NPKTVuRf9iJ/2JoUmBQP1ANwkiLCuIqGiOA8flk
         TKdmKtxRAh2Cbht76ZkqqJTGJNU9U7Z+MdCbNAQfvHVuAb3VAJVvXoDyfqQqsE4Z8ky0
         F5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608254; x=1794213054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KAS6t6RcH5YSPgaYyaJ/vTgjaBHTXeGZTqVGqeK6VE=;
        b=fr9VO9YYi0dhSafzB88IqZ7BkqJqtop6mYBQOXlpxW3pMHqdjIB+2RIBI3b3ayp5wk
         +c5D1fYNJ1OZvvgA5rJAyl3DXKIpnFObSji7SWstp4ghRnJlXjvdKqPvUx8yuhZLBc31
         WU8yIXc/LhTZ4oJd091CDvaMEDg0zOEshzdXiS1RXG2M60dUF/mDLUiHZ3CnUiWLVCjP
         8wXmLPXb5+3gBYoBvxAjJC0p0jAhrBdQ23gXyR4j/gTf+V5GLKnvVlqZmy0qm4przN+0
         SJDGS+mvm9XgMqIgmclpUvtDHrZKIzOHWwrNSx8+FVG1mmAM1BZjs/HVf8C3BFQeJdhs
         7TFw==
X-Forwarded-Encrypted: i=1; AKwUvBwqVBVJjR8GszxKudvG2XpMv042EcS1Rpq/PmPcqETQU6oxypUHksKfrauhoj+XTPa/TjMZvRcFEzs=@lists.infradead.org
X-Gm-Message-State: APuU4Z+pAgTuA0dciOiJoXf4kTgjLqr4osWZLt+6kEaLvnr/P50Gifh/
	VuE3Pl71Bpyta79XGX+19g64X1pr6K8B35oHhXz2UU2zSXPVc1NZ/PHO
X-Gm-Gg: AYBFou0a1o0KqB18OqTGwp5MvN4M4yK8Zp3v21lfSRDo7uZy5sQfAEELhw2XlMELV3E
	27L1FsCGvBAidQmfw7UKZ/p6kETWEtupOUrRcM2IOxbKGFcdOFiaqyPO6FDIdSwCHgFPBn/dozt
	q0dzBtO7grTo5WABmszXP0flBxJeThRH+TodBwfBjWJMNcADVBX3ogd65t9srBiCvTFvmRNBCIb
	xA+5tUCnZd7iH59ROz3H3kCfbEDSVWQle/zGRbD+SGqPsdI6ArJA2e+K7AE0rf28vO+xbW6Yt/U
	9Z6q211PWYBlX2Jy6v6ZeYKC6tuMzvROCfszNQk3HRlB0OHNFaRZQIkMtw/Vl+Golgr1v+DKGhm
	yXtG8hQZEisGKOG2PlhG3Pp+wzxwD7Z4f1gxN8E1LkA54lm+MflNdF7qf3C8oorDFmvzjalLd6k
	0MK+V8BsomA2y5V7mVRJGpLNlwHv2/t3kY8BEMqhmQLMImhyFlHs94MGs2bzjm3wzLZ3pAdBe7F
	a8ZlBgf5ZH2l0Q56zQpvUhI2VF2h8SU6LhZV8TdoK55m56woaqShxL/ZKmYfcP24smXdkEaFcNc
	GpHQEHem91I4ZRNrwrY7z1CCtaIWpPUoPPXWXh6vR+gmnOfB0HD8wX0Vvh0QXI5XENR27v6p0eH
	+
X-Received: by 2002:a17:90b:57c5:b0:3ac:b44c:2d84 with SMTP id 98e67ed59e1d1-3ae897cc815mr8182409a91.13.1793608253825;
        Mon, 02 Nov 2026 00:30:53 -0800 (PST)
Received: from localhost.localdomain ([155.69.168.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845ae5b9sm13365251a91.12.2026.11.02.00.30.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 00:30:53 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: amit.kumar-mahapatra@amd.com,
	luca.ceresoli@bootlin.com,
	harshit.m.mogalapalli@oracle.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] mtd: virt-concat: Tear the concat down when its master goes away
Date: Mon,  2 Nov 2026 16:30:45 +0800
Message-ID: <20261102083045.8512-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_003054_972838_8666C269 
X-CRM114-Status: GOOD (  31.26  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Partitions that are part of a virtual concatenation are never registered
on their own: add_mtd_partitions() hands them to mtd_virt_concat_add() and
skips them, so they are not on the parent's partition list either. The
concatenated device is registered with a copy of the first partition's
struct device, whose parent is the master's device.

When the master is unregistered, mtd_virt_concat_destroy() looks for a
concat item whose DT nodes include the master's of_node. The items hold
the partition nodes, so nothing ever matches: the concat stays registered
and keeps the master's device alive (it stays in the idr and in
/proc/mtd), while the driver frees the master. Reading /proc/mtd then
uses freed memory, and so does device_shutdown(). The concat's partitions
are leaked, and since the item's subdev count is never reset, binding the
driver again writes past the end of concat->subdev[].

The matching branch is reached only from the MTD core's module exit,
which cannot run while the concat is registered (it holds a reference on
the module). There, a failed add_mtd_device() frees the caller's mtd
instead of the child. The concat also puts references on its parts that
it never took.

Find the concats to tear down by the master of their parts instead.
Unregister each one that includes a partition of the master that goes
away, free those partitions and drop them from the item, which keeps its
DT nodes and the other parts, so the concat is joined again when the
master comes back. Do not put references that were never taken, and only
unregister a concat at module exit if it is registered.

Tested on QEMU (arm64 virt, TCG) with KASAN, with two partitions of the
CFI flash joined by part-concat-next, physmap and the MTD core as
modules: unbind physmap, bind it again, unbind it again, unload the
modules. Without this patch the first unbind leaves both devices behind
and each read of /proc/mtd gives KASAN slab-use-after-free reports in
mtd_proc_show(), binding again gives slab-out-of-bounds writes in
mtd_virt_concat_add(), the MTD core cannot be unloaded, and
device_shutdown() at power-off reports use-after-free and refcount_t
underflow. With it the concat is removed on unbind, created again and
readable after binding, and the MTD core unloads, with no reports. The
same steps without part-concat-next are clean with and without this
patch.

Fixes: 43db6366fc2d ("mtd: Add driver for concatenating devices")
Cc: stable@vger.kernel.org
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---

Notes:
    The bug was found with kbound, a research static analysis prototype
    (its report was the add_mtd_device() failure path in
    mtd_virt_concat_destroy(); running it showed the teardown problem).
    The patch, the changelog and the test setup were written with the help
    of an AI coding assistant (Claude); I have reviewed and tested them as
    described above.
    
    Not tested: a concat whose parts are on two different masters (QEMU virt
    has one flash), and a concat device held open while its master goes
    away, which this patch handles like a master that goes away while open.

 drivers/mtd/mtd_virt_concat.c | 106 ++++++++++++++--------------------
 include/linux/mtd/concat.h    |  13 ++---
 2 files changed, 49 insertions(+), 70 deletions(-)

diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
index 40b300021dda..ecd5b07d32ce 100644
--- a/drivers/mtd/mtd_virt_concat.c
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -57,94 +57,76 @@ static bool mtd_is_part_concat(struct device_node *dev)
 	return false;
 }
 
-static void mtd_virt_concat_put_mtd_devices(struct mtd_concat *concat)
+/* Unregister the concatenated device, if it is registered */
+static void mtd_virt_concat_unregister(struct mtd_concat *concat)
 {
-	int i;
-
-	for (i = 0; i < concat->num_subdev; i++)
-		put_mtd_device(concat->subdev[i]);
+	if (!concat->mtd.name)
+		return;
+
+	del_mtd_device(&concat->mtd);
+	kfree(concat->mtd.name);
+	concat->mtd.name = NULL;
+	if (concat->mtd.numeraseregions)
+		kfree(concat->mtd.eraseregions);
+	concat->mtd.numeraseregions = 0;
 }
 
 void mtd_virt_concat_destroy_joins(void)
 {
-	struct mtd_virt_concat_node *item, *tmp;
-	struct mtd_info *mtd;
+	struct mtd_virt_concat_node *item;
 
-	list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
-		mtd = &item->concat->mtd;
-		if (item->concat) {
-			mtd_device_unregister(mtd);
-			kfree(mtd->name);
-			mtd_virt_concat_put_mtd_devices(item->concat);
-			mtd_concat_destroy(mtd);
-		}
+	list_for_each_entry(item, &concat_node_list, head) {
+		mtd_virt_concat_unregister(item->concat);
+		mtd_concat_destroy(&item->concat->mtd);
+		item->concat = NULL;
 	}
 }
 
 /**
- * mtd_virt_concat_destroy - Destroy the concat that includes the mtd object
+ * mtd_virt_concat_destroy - Destroy the concats that include partitions of
+ *                           an MTD device
  * @mtd:        pointer to 'mtd_info'
  *
- * Return: 0 on success, -error otherwise.
+ * Called when the master of @mtd is unregistered. Partitions of that master
+ * that are part of a concatenation were never registered on their own, so
+ * unregister every concat that includes one of them and free them. The other
+ * parts stay with the concat item, which is joined again once all its parts
+ * are back.
+ *
+ * Return: 0.
  */
 int mtd_virt_concat_destroy(struct mtd_info *mtd)
 {
 	struct mtd_info *child, *master = mtd_get_master(mtd);
-	struct mtd_virt_concat_node *item, *tmp;
+	struct mtd_virt_concat_node *item;
 	struct mtd_concat *concat;
-	int idx, ret = 0;
-	bool is_mtd_found;
+	int idx, n;
 
-	list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
-		is_mtd_found = false;
+	list_for_each_entry(item, &concat_node_list, head) {
+		concat = item->concat;
 
-		/* Find the concat item that hold the mtd device */
-		for (idx = 0; idx < item->count; idx++) {
-			if (item->nodes[idx] == mtd->dev.of_node) {
-				is_mtd_found = true;
+		for (idx = 0; idx < concat->num_subdev; idx++) {
+			if (mtd_get_master(concat->subdev[idx]) == master)
 				break;
-			}
 		}
-		if (!is_mtd_found)
+		if (idx == concat->num_subdev)
 			continue;
-		concat = item->concat;
 
-		/*
-		 * Since this concatenated device is being removed, retrieve
-		 * all MTD devices that are part of it and register them
-		 * individually.
-		 */
-		for (idx = 0; idx < concat->num_subdev; idx++) {
+		mtd_virt_concat_unregister(concat);
+
+		for (idx = 0, n = 0; idx < concat->num_subdev; idx++) {
 			child = concat->subdev[idx];
-			if (child->dev.of_node != mtd->dev.of_node) {
-				ret = add_mtd_device(child);
-				if (ret)
-					goto out;
+			if (mtd_get_master(child) == master) {
+				kfree(child->name);
+				kfree(child);
+			} else {
+				concat->subdev[n++] = child;
 			}
 		}
-		/* Destroy the concat */
-		if (concat->mtd.name) {
-			del_mtd_device(&concat->mtd);
-			kfree(concat->mtd.name);
-			mtd_virt_concat_put_mtd_devices(item->concat);
-			mtd_concat_destroy(&concat->mtd);
-		}
-
-		list_del(&item->head);
-		for (idx = 0; idx < item->count; idx++)
-			of_node_put(item->nodes[idx]);
-
-		kfree(item);
+		concat->num_subdev = n;
 	}
-	return 0;
-out:
-	mutex_lock(&master->master.partitions_lock);
-	list_del(&child->part.node);
-	mutex_unlock(&master->master.partitions_lock);
-	kfree(mtd->name);
-	kfree(mtd);
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -309,10 +291,8 @@ int mtd_virt_concat_create_join(void)
 				name_sz += (strlen(concat->subdev[idx]->name) + 1);
 			name_sz += strlen(CONCAT_POSTFIX);
 			name = kmalloc(name_sz + 1, GFP_KERNEL);
-			if (!name) {
-				mtd_virt_concat_put_mtd_devices(concat);
+			if (!name)
 				return -ENOMEM;
-			}
 
 			ret = 0;
 			for (idx = 0; idx < concat->num_subdev; idx++) {
diff --git a/include/linux/mtd/concat.h b/include/linux/mtd/concat.h
index f8d4d6ac1fc1..ce9824567f98 100644
--- a/include/linux/mtd/concat.h
+++ b/include/linux/mtd/concat.h
@@ -62,16 +62,15 @@ bool mtd_virt_concat_add(struct mtd_info *mtd);
 int mtd_virt_concat_create_join(void);
 
 /**
- * mtd_virt_concat_destroy - Remove the concat that includes a specific mtd device
- *                           as one of its components.
+ * mtd_virt_concat_destroy - Remove the concats that include partitions of a
+ *                           specific mtd device as components.
  * @mtd: pointer to MTD device info structure.
  *
- * Returns 0 on succes, or a negative error code.
- *
- * If the mtd_info object is part of a concatenated device, all other MTD devices
- * within that concat are registered individually. The concatenated device is then
- * removed, along with its concatenation component.
+ * Returns 0.
  *
+ * Called when the master of @mtd is unregistered: every concatenated device
+ * with a partition of that master is unregistered, and those partitions are
+ * freed. The concatenation is created again when all its parts are back.
  */
 int mtd_virt_concat_destroy(struct mtd_info *mtd);
 

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

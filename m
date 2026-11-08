Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741AF606A33C
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=33lg6/xu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R5PEPVKk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=J1lJVqe7Zl68exSVeAv3Rdx5N0Gfv5LQwPt6uezDOOY=; b=33lg6/xu2DliHRZVxQXMDqO/Hj
	yngl7U+G7YRD4Xun/TTpPKevqU40rKBP/SxhVn8OkUsoR/SqidFSsrTXkCXHEi0fQCV2xdHp83IbV
	b3ODZ8wKWff7Jllsp23PvFZQEgjXNRtaoADEb8FiGV8EhJnBbNtu2sYjFay7QzZ4GfXA8+TjV3rbG
	uhMq7usU7vUlunaNDjO+bsUt4WenVqhhqXWGvL+7non1jAo6Dr4LkQvpZmIAEQWvCKOZ0KtwWNH8t
	0QY0D3cVzOa3J1Pn2nr8SonV6s9QFguhVcrstRcTCooH9ddAvH9r+d0L6fy1G0FqYIFr+hDEMGU1L
	4DfQxBVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQADE-0000000Gh8K-0dnC;
	Sun, 08 Nov 2026 21:14:04 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQADC-0000000Gh7J-2y3F
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:14:03 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-4e4a4d77e5bso199587b6e.0
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 13:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172441; x=1794777241; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1IOJVSSDS5Dlq9Y83GcHcwnK7PFbC7wYL08Prr18Rj0=;
        b=R5PEPVKkvsz5cvUE25tsyr/V8xXNEsCRF+mdyzJY9vCkudvrU/8tHxDM5lQYFB9/Zi
         q2Oc3Ww1YVfNIFPm06YPT5OntM/XDjmMDtdHURjSI4Nz6v8lSfNsxSR4NnvJiRt5sj+c
         DGx45QqMJEwey/f0M/WiWJ35Coduy7n5m+UyvxtugaUO1s2j4Ht7rSIMiAZShEn/eW/S
         W0wqDfT6taMh1imcuPCxfjbXRR0BVB2fOf/Qt08MVn+oqdmDSO5IlkYO0anfM/Rl/dCO
         wEhB2tm8gGI9OCP/wtA+YQRMIShR6mAPcb4Tkq6DZI0Z6s4TtKUfaEjK1FL0QWa/lJhY
         1H/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172441; x=1794777241;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1IOJVSSDS5Dlq9Y83GcHcwnK7PFbC7wYL08Prr18Rj0=;
        b=0/gzlCDq2G0YiNRPoZ6WqvcmwjiZLdaCKx8P0CJlmkk1+NJXNIy8BXNiaiLqKgK2wn
         VClMquLbiINvLDC9yjoL7fDP1bBfLPhEgJFbFNvM5aRuBy5W5U1DkaeL0pQEfCuiLq+u
         9CX7TaT68FCm/ixEZ/Vn9N4zlI6CZg+Om18knZJ7Y1sLrP3YWiO4b6fg8AqG/mmB1VjD
         OzxxkZKGWarUT6k3CKrUp4BixU3us01OPfIY4eRKWS/KU6fxclz8TLgQHLK8kwWBqyx6
         /5KnbSCaETI5vMekMaQn7cPzQybbi+LNVpPKjlBwBl76rFrlaXrMTSYcqc8sZSiwkiMf
         XbJA==
X-Gm-Message-State: APuU4Z+Ih+gcIuw7XOTc3wNRHk30XdsdkySul3ZbthD9ksD3KB+03mJY
	NJLsb4ti++X3/wh/Dr+375Oj6aWDxtvKBRmmjqYLVG6d35fO83kDdSmrvD4krA==
X-Gm-Gg: AYBFou273LikxaNMBBUUwUGsp4h+dws0myWYw9xogHZ9dJhsBdQTy/Jh125+pxVMKsd
	vZ5Uz/lRZS4Jr9ZqBgJrSOk5yN+c8eQ67vsc2Fjq/tpZ406gG2jRJTp944B771+w8WA5CeNLJiz
	ExEql0JHRztppgWqN4vT/eCisn+xpNfUBWjXqJei4D08bXY3PiD+unF0GKFl4W7QNJkL5KtrggZ
	CLwRPkY2fWYcKRdM8Q7iQw1CD3ln7yuD4yAYlMc9zosraRS1IcCdqQ1Qp+ewHtYT4ysRvV7Vmr2
	iYBrCWhlMOESacpwHo512TF755NGTV7P3VUsf3sm4H4CU8b0cWzTrj0p9cm2riJMfxtDGH5ujeV
	Ep4RpjGhHfy/kqV77h/SvipMP6A0FZ7aojVuwu33AGmE9KzwWuU0fHwAF9L1ADtFnNwE1XTzZrG
	i1Onv0YwuK5apL4JSqltJPZp5knCdYxnsoh1TyyzzM/ZS2c5uRjCeKhQP09v8+m54DajL1PYXXt
	hk9axSZI+B5Aq00ScXMmcXPr8hbSowg6ZJFSHP5jjicirfglumyzTFTT3M8I95/v16lk1i7YbDR
	CRxaT8RHU6AdFl+0QnqOSjlkwwA9eYZ9xmucVwEk8ESgfYWprhZJW4Kd9BYRlVTBQwWlWnLncS3
	hm93yew4tKC4GElbW86ZnmKsBd6HmDwkHacJoiqIkEV1RH+8/10RCOSZhGcDl5ylkrY3b3iTBzr
	c3BLV/tAG+bYn2gCAOSC4ZXYl86izVnyyueF89TqcjXkU8gHeZhU2Z
X-Received: by 2002:a05:6808:64cc:b0:568:2782:d1b4 with SMTP id 5614622812f47-5682782d3d2mr217683b6e.32.1794172441608;
        Sun, 08 Nov 2026 13:14:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54ff0sm2736089b6e.16.2026.11.08.13.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:14:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:13:59 -0700
Subject: [PATCH] mtd: serialize dynamic partition registration with removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-mtd-partition-publication-v1-v1-1-cbff20b1351e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN3QrCMAxGX2Xk2uBaRnW+injRn+giro62G8LYu
 5tuF4Gcj3wnK2RKTBluzQqJFs78jQLq1IAfbHwRchAG3WqjVHvFPLuRC44l4GRT4SIFnGb3YW/
 3fVHYGd076rtwIQNimhI9+bd/uT8OFs2bfKnqeuFsJnTJRj/USOznOkdr2/5x6dpQpwAAAA==
X-Change-ID: 20261108-submit-mtd-partition-publication-v1-4629be94d7e6
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_131402_794943_BBD2E6F2 
X-CRM114-Status: GOOD (  17.94  )
X-Spam-Score: -1.9 (-)
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

mtd_add_partition() drops partitions_lock after linking the new child
but before registering its MTD device and adding the partition sysfs
attributes. Concurrent removal can unlink that child before it has been
registered, or release it after registration but before the attributes
are added. It can also finish deleting partitions before a new child
is linked, leaving a partition published after master removal.

Keep partitions_lock held across allocation, publication and attribute
creation. Record that master unregistration has started under the same
lock and reject new dynamic partitions from that point. Check before
allocation, which can scan the parent's bad-block markers, so it cannot
start hardware access after removal has passed this synchronization point.

Initialize the state when registering the master, allowing drivers that
reuse their MTD object to register it again.

Fixes: 5daa7b21496a ("mtd: prepare partition add and del functions for ioctl requests")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c   |  5 +++++
 drivers/mtd/mtdpart.c   | 20 +++++++++++++-------
 include/linux/mtd/mtd.h |  2 ++
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..7a5205810bf0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -918,6 +918,7 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
 	INIT_LIST_HEAD(&mtd->partitions);
 	mutex_init(&mtd->master.partitions_lock);
 	mutex_init(&mtd->master.chrdev_lock);
+	mtd->master.unregistering = false;
 }
 
 static ssize_t mtd_otp_size(struct mtd_info *mtd, bool is_user)
@@ -1206,6 +1207,10 @@ int mtd_device_unregister(struct mtd_info *master)
 {
 	int err;
 
+	mutex_lock(&master->master.partitions_lock);
+	master->master.unregistering = true;
+	mutex_unlock(&master->master.partitions_lock);
+
 	if (master->_reboot) {
 		unregister_reboot_notifier(&master->reboot_notifier);
 		memset(&master->reboot_notifier, 0, sizeof(master->reboot_notifier));
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index ddded0dbe77e..c316cfe92c7e 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -278,28 +278,34 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
 	part.size = length;
 	part.offset = offset;
 
+	mutex_lock(&master->master.partitions_lock);
+	if (master->master.unregistering) {
+		ret = -ENODEV;
+		goto err_unlock;
+	}
+
 	child = allocate_partition(parent, &part, -1, offset);
-	if (IS_ERR(child))
-		return PTR_ERR(child);
+	if (IS_ERR(child)) {
+		ret = PTR_ERR(child);
+		goto err_unlock;
+	}
 
-	mutex_lock(&master->master.partitions_lock);
 	list_add_tail(&child->part.node, &parent->partitions);
-	mutex_unlock(&master->master.partitions_lock);
 
 	ret = add_mtd_device(child);
 	if (ret)
 		goto err_remove_part;
 
 	mtd_add_partition_attrs(child);
+	mutex_unlock(&master->master.partitions_lock);
 
 	return 0;
 
 err_remove_part:
-	mutex_lock(&master->master.partitions_lock);
 	list_del(&child->part.node);
-	mutex_unlock(&master->master.partitions_lock);
-
 	free_partition(child);
+err_unlock:
+	mutex_unlock(&master->master.partitions_lock);
 
 	return ret;
 }
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 8d10d9d2e830..cd7b4671c456 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -224,6 +224,7 @@ struct mtd_part {
  *		     not only the master partition list, but also all
  *		     sub-partitions.
  * @suspended: set to 1 when the device is suspended, 0 otherwise
+ * @unregistering: removal has started; protected by partitions_lock
  *
  * This struct is embedded in mtd_info and contains master-specific
  * properties/fields. The master is the root MTD device from the MTD partition
@@ -233,6 +234,7 @@ struct mtd_master {
 	struct mutex partitions_lock;
 	struct mutex chrdev_lock;
 	unsigned int suspended : 1;
+	bool unregistering;
 };
 
 struct mtd_info {

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261108-submit-mtd-partition-publication-v1-4629be94d7e6

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

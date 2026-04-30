Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A877ACCFA13
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2026 22:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=weXtU4iwwfAHn+5PPzJv82Qx7VoQvs7gnPMMvldkFzY=; b=w7+EjVODU24lcH
	w9xA9Lf2rhSbK4tpyI0AquY9boQGbR+LuWAh4n2K+RAIGyaDp1UBpJCeqsihJ4LlN4v7D9W/sgisi
	mTgljy++M9QjVn3QaqP6OnEeXXuZCnBDxQT+RDtzPPLBlWxMQiafOd7x948fW5dJzyWP41McMwDjV
	olcg46O4OUZ7FaTghLX7Ushp7hK6Eip1trxN4O6++iQloEiG1PyAzPrxlLNDKY5YRnq+iTByj4aGU
	lizkVeqiXp/WXyD2q6vqg0fiC09kUfYQHIVJxzW1Rtl0LzvdJ2OsvESy+BzH3rd8eDH89eYF+7/Ns
	ZH/wMRtw3oTIUMMKjZ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZXq-000000061Nj-1Bq4;
	Thu, 30 Apr 2026 22:07:42 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZXn-000000061NN-0gLi
	for linux-mtd@lists.infradead.org;
	Thu, 30 Apr 2026 22:07:40 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-35d971fb6f1so1604343a91.0
        for <linux-mtd@lists.infradead.org>; Thu, 30 Apr 2026 15:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777586857; x=1778191657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=io9P2rkHvmKPxGQBn5MKYkMRkO761qnxJqz17cwJFt0=;
        b=XW+3Sjj3Mi5JGnbkasHmf3l33ZIJ7Sm7CgDSrNdlHZ+mD/WCP/wIE9kTqvl+GITgWE
         Xf+ke49C49l8C2E85txdjV0AGeyVWWWSZ+lFuOjQvQJ22ZL9U0RrjOoun0En5bQPY/ww
         4QcTIJNd+FBBeYoJe3vCtCjMD1/zyuPna25t7IHPIRiCS3UeJmrdLbJtWRUgaz5ZlxzF
         WVhQg1ESVT/sykQBXr/8xhbUa/v3ZCEzEt6yPQV9JJe4HNvGreyJVpT7JlBAwJM0il0x
         +FVyWpN6Snn0UzKwM/LGvCb6eHgU0hrgShEqZAQolEjQUhkusxj89wot60G3y5WbJJnm
         64dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777586857; x=1778191657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=io9P2rkHvmKPxGQBn5MKYkMRkO761qnxJqz17cwJFt0=;
        b=IGSfV5XjA5rPWqz1ch2Y8pynfcwBrV9w8CZ7DPpjpaDj6zsIYEvPwINU0cdXdc/nI0
         xohkxK3Sf4/wRIpjkWAEct/gCwttnCFucg5Kvw96Cc4vpHVRoRInSNu/rU0tn3KYAwW3
         fk3ZUxFNjToO7vKkaDpvAOTRydaAwnPp6jsCTQcPM24vtYp+Ke8cPblZFztJC8+hiX0Q
         qRuMjWhhtG7LRzdU2vUbG92KduiL2cH3O8Sa0UYfoIUfUR0eIpZsizUFolmm3/evjA7z
         /zaomtKCWTblO6dMD4MCzvAvjs5EqPsqNzr6TyZr+hdFP2pmlJa5A1yqcH2ry3uOrMrC
         yH3g==
X-Gm-Message-State: AOJu0YyNxgFwCmhl8OHP4ltwhpJ84I24MQF9S2mphmVvuLXsIYvRY5Oi
	C93ygs1Bwifgkgq4X56FnDP79CHS3y/YinhxxgzFfOQY3Na4riRnsun1yPXmzykZ
X-Gm-Gg: AeBDietz2bwCOkUuN/Qe1YL/7FrDKH5gciZ7Agl1SDpBZ8897X0qd8KHFL49eUGcAOJ
	BdA+l38IFs0TzryOFomYzZL8MIzxA4s9HdTNPg4TC5fo7l/YYwosEMxVr2P4AcPrZr4jltCq4kj
	defvxsxkkK9OzRk6XOMAxpadAjNthWB4jfoR3+eC70eEWjkwbTCh6u/J1e8jo9GlcC4sIIRF5Pt
	cGtHcVlxuXpJ44I2c4UrG1XpwI84hF9S5rq4cP5rAeJUscg12Gq+UTZPUIi20bJcfLoqNUSflLM
	Yf3Lu7XPVq+HAKwGUsVo1rmn0cpKsAutTNVnBc+9BLIgm0PKk+XrUXAPFEGqOw7lj/wMnC2eZUl
	s4eu3WxF5PJQwFMDl5/hnaoQ6Eg1EjzrNkWULgv4h8nwvAZ4dyorqXkS9UFbDWxFbKDO0VB9cJL
	KpYAB05oT86pJHILuj4isTn9MoDDpyOAwyPa3p5MQawUowUkzlw2am2APxP0DKNIa1q9fBH4pG2
	UFnUB++87Op0iPY7/BWzsEhF0droKiJtmfntgtc61HjottuTgeiFzOS
X-Received: by 2002:a17:90b:4a51:b0:35f:ba8e:150d with SMTP id 98e67ed59e1d1-364c312dcc8mr4771553a91.14.1777586857335;
        Thu, 30 Apr 2026 15:07:37 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec00ad4dsm517183a91.11.2026.04.30.15.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 15:07:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: sm_ftl: allocate cis_buffer with main struct
Date: Thu, 30 Apr 2026 15:07:19 -0700
Message-ID: <20260430220719.77223-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_150739_228024_DEBBA5F0 
X-CRM114-Status: GOOD (  14.21  )
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

Use a flexible array member and kzalloc_flex() to do so. Simplifies
memory allocation slightly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/sm_ftl.c | 30 +++++++++++-------------------
 drivers/mtd/sm_ftl.h |  2 +-
 2 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index c8032755f9a4..fb0f97fb94f0 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -1133,7 +1133,7 @@ static void sm_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	struct sm_ftl *ftl;
 
 	/* Allocate & initialize our private structure */
-	ftl = kzalloc_obj(struct sm_ftl);
+	ftl = kzalloc_flex(*ftl, cis_buffer, SM_SECTOR_SIZE);
 	if (!ftl)
 		goto error1;
 
@@ -1145,25 +1145,20 @@ static void sm_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	/* Read media information */
 	if (sm_get_media_info(ftl, mtd)) {
 		dbg("found unsupported mtd device, aborting");
-		goto error2;
+		goto error1;
 	}
 
 
-	/* Allocate temporary CIS buffer for read retry support */
-	ftl->cis_buffer = kzalloc(SM_SECTOR_SIZE, GFP_KERNEL);
-	if (!ftl->cis_buffer)
-		goto error2;
-
 	/* Allocate zone array, it will be initialized on demand */
 	ftl->zones = kzalloc_objs(struct ftl_zone, ftl->zone_count);
 	if (!ftl->zones)
-		goto error3;
+		goto error2;
 
 	/* Allocate the cache*/
 	ftl->cache_data = kzalloc(ftl->block_size, GFP_KERNEL);
 
 	if (!ftl->cache_data)
-		goto error4;
+		goto error3;
 
 	sm_cache_init(ftl);
 
@@ -1171,7 +1166,7 @@ static void sm_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	/* Allocate upper layer structure and initialize it */
 	trans = kzalloc_obj(struct mtd_blktrans_dev);
 	if (!trans)
-		goto error5;
+		goto error4;
 
 	ftl->trans = trans;
 	trans->priv = ftl;
@@ -1184,12 +1179,12 @@ static void sm_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 
 	if (sm_find_cis(ftl)) {
 		dbg("CIS not found on mtd device, aborting");
-		goto error6;
+		goto error5;
 	}
 
 	ftl->disk_attributes = sm_create_sysfs_attributes(ftl);
 	if (!ftl->disk_attributes)
-		goto error6;
+		goto error5;
 	trans->disk_attributes = ftl->disk_attributes;
 
 	sm_printk("Found %d MiB xD/SmartMedia FTL on mtd%d",
@@ -1206,17 +1201,15 @@ static void sm_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	/* Register device*/
 	if (add_mtd_blktrans_dev(trans)) {
 		dbg("error in mtdblktrans layer");
-		goto error6;
+		goto error5;
 	}
 	return;
-error6:
-	kfree(trans);
 error5:
-	kfree(ftl->cache_data);
+	kfree(trans);
 error4:
-	kfree(ftl->zones);
+	kfree(ftl->cache_data);
 error3:
-	kfree(ftl->cis_buffer);
+	kfree(ftl->zones);
 error2:
 	kfree(ftl);
 error1:
@@ -1242,7 +1235,6 @@ static void sm_remove_dev(struct mtd_blktrans_dev *dev)
 	}
 
 	sm_delete_sysfs_attributes(ftl);
-	kfree(ftl->cis_buffer);
 	kfree(ftl->zones);
 	kfree(ftl->cache_data);
 	kfree(ftl);
diff --git a/drivers/mtd/sm_ftl.h b/drivers/mtd/sm_ftl.h
index 6aed8b60de16..1a1a54ce836a 100644
--- a/drivers/mtd/sm_ftl.h
+++ b/drivers/mtd/sm_ftl.h
@@ -39,7 +39,6 @@ struct sm_ftl {
 	int cis_block;			/* CIS block location */
 	int cis_boffset;		/* CIS offset in the block */
 	int cis_page_offset;		/* CIS offset in the page */
-	void *cis_buffer;		/* tmp buffer for cis reads */
 
 	/* Cache */
 	int cache_block;		/* block number of cached block */
@@ -56,6 +55,7 @@ struct sm_ftl {
 	int cylinders;
 
 	struct attribute_group *disk_attributes;
+	u8 cis_buffer[];		/* tmp buffer for cis reads */
 };
 
 struct chs_entry {
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7191FC77B6F
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Apr 2023 15:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W2BDg1ixU3vdzUCdRc2S3hP5KaDsgyHKmC/3o8CRNf8=; b=MqWMX5GGs94evL
	h/5HVc4NviiEaK8JfAfXlMEGTKroB+Gg88KQQMLhRtckvo175yT7jOyd+Uk6fMkQ9WY7YL2gUaDxe
	mpQBmvE+yPCz0MRg5vhrCra2DvPBotiqqoZCFDhgHArexhjaLvMH/j/FG9+OtXkk8258/K0fZg3O7
	nubAwTZvw8W5uJgfoRBZl0rzFF+EXGOoaBVXKVkeV5aeutqZDxg4L76/Ye/heVGvne7FEQmOj3Fl3
	AqkGja8q+l71hu4y3i3lLaK8TZ9CQfYVqEZ+tjGtWg/Vrm6Vrcayf+A9D1RC2kTBYZV2Qq9sRKhca
	unE2V/plUht19EzgUfEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmGIl-000UA2-1f;
	Tue, 11 Apr 2023 15:52:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmGIi-000U9I-2L;
	Tue, 11 Apr 2023 15:52:58 +0000
Received: by mail-pl1-x633.google.com with SMTP id y6so7183308plp.2;
        Tue, 11 Apr 2023 08:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681228373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/oG+epnuD83PJFUb1t02t41ha4irl9qgnZRV9WS+FJU=;
        b=LsSi16s2QaAhnD5StmBi3qTbTfu6k5otTIp04Kgepy4OBb/g3EV75jjw2fZ4qPtK4J
         6IWcwGzEMkbVCNc4GZJ1Cxn5YbdAChFrvivl1t1n0YwzFBCvTj6DQfh3H3zCElqbbRqG
         yrngWHTv3NUJp9du0NHTNGxPyIxCOTVzfY0PQatHPH2RDfxl24kq2036Du9OU44/6Ia0
         aNGBIFFhfAo1MwMBdlJqTq35nVZIDHE9FLZuZip9A/6Q7urdq9FMRXrsvZpb1+ReO4kO
         vKBQEfLc3aF3btYS4rqRTyBD+dbMdSgx3XG9NLfD7vs5/Q4abLA867CPbVe9wTxOmgxL
         espA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681228373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/oG+epnuD83PJFUb1t02t41ha4irl9qgnZRV9WS+FJU=;
        b=RUGZKGQGmWwV4aaIDT9XIJI2xrR/06qi7oEpMytWIoTso3eVGRfZYGc2ClFmMxhQXL
         Yg3bmCsIj0gt36WyL8Y1Pn6dTv5YZQxaGefb60vqHq/4Yjz0sSTAzzczydt+vqevfa0M
         SAHuG+A6KAbq1tJQiXYM+zQogyq9EYG3m8eDT0BGgpyHIuzJtWD59eXbmHY8vQdIiyE2
         Gr5ho+c/RaVNrnbC2fA++SdqE3YJ76e9O3ivCx6TafPFSgdn16V17asUhpglFUYHauAd
         snL69HaM39G7MLphGdDyHtgncll3rmRlbbLApgAB1LGb8OPEpDC0WPBYQY8UxR+W/6v1
         OCzQ==
X-Gm-Message-State: AAQBX9fJqN0KxISB6VntAFxY9rTCTc3gJa+LomVqxII6OBEFH93hFEzV
	WOHFTKC2RCy+5YvbfIr33JA=
X-Google-Smtp-Source: AKy350bP4ymDA4siTeWNM3hYExZR4vah/5d51CIzH8d82fybAJuDqzPeiRRg5VWjKUeDoSbGI8uAvA==
X-Received: by 2002:a17:902:f9c5:b0:1a5:f36:ae09 with SMTP id kz5-20020a170902f9c500b001a50f36ae09mr12465163plb.7.1681228373132;
        Tue, 11 Apr 2023 08:52:53 -0700 (PDT)
Received: from arm4c24g.vcn09251619.oraclevcn.com ([144.24.45.176])
        by smtp.gmail.com with ESMTPSA id jw23-20020a170903279700b0019e60c645b1sm3940765plb.305.2023.04.11.08.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 08:52:52 -0700 (PDT)
From: Xiaobing Luo <luoxiaobing0926@gmail.com>
To: richard@nod.at,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	Xiaobing Luo <luoxiaobing0926@gmail.com>
Subject: [PATCH] ubi: fastmap: Reserve PEBs and init fm_work when fastmap is used.
Date: Tue, 11 Apr 2023 15:46:34 +0000
Message-Id: <20230411154634.149350-1-luoxiaobing0926@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_085256_804904_761C874E 
X-CRM114-Status: GOOD (  11.83  )
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

Don't reserve the two fastmap PEBs when fastmap is disabled, then we can
use the two PEBs in small ubi device.
And don't init the fm_work when fastmap is disabled.

Signed-off-by: Xiaobing Luo <luoxiaobing0926@gmail.com>
---
 drivers/mtd/ubi/build.c      | 3 ++-
 drivers/mtd/ubi/fastmap-wl.c | 2 +-
 drivers/mtd/ubi/wl.c         | 6 +++++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index ad025b2ee417..a98a717b0e66 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1120,7 +1120,8 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 		kthread_stop(ubi->bgt_thread);
 
 #ifdef CONFIG_MTD_UBI_FASTMAP
-	cancel_work_sync(&ubi->fm_work);
+	if (!ubi->fm_disabled)
+		cancel_work_sync(&ubi->fm_work);
 #endif
 	ubi_debugfs_exit_dev(ubi);
 	uif_close(ubi);
diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 863f571f1adb..b3df17a782c7 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -344,7 +344,7 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
 		/* We cannot update the fastmap here because this
 		 * function is called in atomic context.
 		 * Let's fail here and refill/update it as soon as possible. */
-		if (!ubi->fm_work_scheduled) {
+		if (!ubi->fm_work_scheduled && !ubi->fm_disabled) {
 			ubi->fm_work_scheduled = 1;
 			schedule_work(&ubi->fm_work);
 		}
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 26a214f016c1..8906db89808f 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1908,7 +1908,11 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	ubi_assert(ubi->good_peb_count == found_pebs);
 
 	reserved_pebs = WL_RESERVED_PEBS;
-	ubi_fastmap_init(ubi, &reserved_pebs);
+
+#ifdef CONFIG_MTD_UBI_FASTMAP
+	if (!ubi->fm_disabled)
+		ubi_fastmap_init(ubi, &reserved_pebs);
+#endif
 
 	if (ubi->avail_pebs < reserved_pebs) {
 		ubi_err(ubi, "no enough physical eraseblocks (%d, need %d)",
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

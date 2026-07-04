Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A46C43602
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 08:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e0UUi6EU6B6ptMtL+rb0yn9edSkNm8iaKfnqEht6FJc=; b=gxSjp5fTtY/WwZ
	bkMLSHs82kGBzvoaq4AsW8gc4BUWWSpnonjRCB79K5iJBydj8uA2m/1r2EW6mtV9niy9LGtTK/ieF
	u1vmWPSr0dhccKIPgwJOdj1/OUwaFcv78WlhiSAwaERbp9ktUtTFSrgS2AB4Ww4xpIp8U8B8oTayV
	kC5gFp1yrI/gyXn4aeBM76RECKl4h8Ax+8R3ODNprl3/e67lwaVo1RPV1FQkU4vqFwrexAN1j5FRA
	pxggi7WJo9MUw+NvQKUAPsCQ5oZYOiNoL4t5t+hgXZ0EdwhbRyLIAt4/ZhD1FlYeyWJ72Dc0kSMEw
	t2g2oLUU0Ze6u8UAf4hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfvtb-00000008ITY-3sY0;
	Sat, 04 Jul 2026 08:38:43 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfvtY-00000008ISR-0axb
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 08:38:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hgQWj5P2sml/czjeKfWlsyvvYtmVlS3ccstXb/uQC7o=;
	b=2ffqdCpvUg5l5wT0aWlMTXUUIK2Lq7SnO1rMIPc4FXiMmtN9ZfpZW/nc8EuTCvhmufRyfVOGJ
	S+sJ1UfPuKt1Hyq1mFJmxIcpmy+O+IdFfcmX5jq5Pcy7LkGC8YlVat1Lt/94RChxHTF+kLht3br
	fvwTMUV4q8S6wP4xHgSwR0E=
Received: from canpmsgout05.his.huawei.com (unknown [172.19.92.145])
	by szxga04-in.huawei.com (SkyGuard) with ESMTPS id 4gskXr2Vvcz126Lwv
	for <linux-mtd@lists.infradead.org>; Sat,  4 Jul 2026 16:38:20 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hgQWj5P2sml/czjeKfWlsyvvYtmVlS3ccstXb/uQC7o=;
	b=2ffqdCpvUg5l5wT0aWlMTXUUIK2Lq7SnO1rMIPc4FXiMmtN9ZfpZW/nc8EuTCvhmufRyfVOGJ
	S+sJ1UfPuKt1Hyq1mFJmxIcpmy+O+IdFfcmX5jq5Pcy7LkGC8YlVat1Lt/94RChxHTF+kLht3br
	fvwTMUV4q8S6wP4xHgSwR0E=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gskLq4n3kz12Ljv;
	Sat,  4 Jul 2026 16:29:39 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 2594B40561;
	Sat,  4 Jul 2026 16:38:21 +0800 (CST)
Received: from huawei.com (10.50.85.155) by whupemo200011.china.huawei.com
 (7.152.185.179) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 4 Jul
 2026 16:38:20 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <chengzhihao1@huawei.com>,
	<yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 2/2] UBI: fastmap: Pass to_be_tortured when reusing old fastmap PEBs
Date: Sat, 4 Jul 2026 16:30:41 +0800
Message-ID: <20260704083042.459915-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260704083042.459915-1-chengzhihao1@huawei.com>
References: <20260704083042.459915-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_013840_684974_B0039D46 
X-CRM114-Status: GOOD (  11.92  )
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

In ubi_update_fastmap(), when no fresh PEB is available to replace an
old fastmap PEB, the old PEB is reused by erasing it synchronously
via ubi_sync_erase() with the torture flag hardcoded to zero.

However, old_fm->to_be_tortured[] may be non-zero: it is set during
fastmap scanning when ubi_io_read_data()/ubi_io_read_ec_hdr() reports
UBI_IO_BITFLIPS, meaning the PEB showed signs of bit decay and should
be tortured to verify it is still reliable.

When the old PEB is instead returned to the WL sub-system via
ubi_wl_put_fm_peb(), the to_be_tortured flag is honored. The
synchronous reuse path is inconsistent: it silently skips the torture
test for PEBs that exhibited bit-flips.

Fix it by passing &old_fm->to_be_tortured[i] to ubi_sync_erase().

Fixes: dbb7d2a88d2a ("UBI: Add fastmap core")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 98cc698d9c34..3f9fb7c181ff 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1488,7 +1488,7 @@ static void return_fm_pebs(struct ubi_device *ubi,
  */
 int ubi_update_fastmap(struct ubi_device *ubi)
 {
-	int ret, i, j, torture = 0;
+	int ret, i, j;
 	struct ubi_fastmap_layout *new_fm, *old_fm;
 	struct ubi_wl_entry *tmp_e;
 
@@ -1526,7 +1526,8 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 
 		if (!tmp_e) {
 			if (old_fm && old_fm->e[i]) {
-				ret = ubi_sync_erase(ubi, old_fm->e[i], &torture);
+				ret = ubi_sync_erase(ubi, old_fm->e[i],
+						    &old_fm->to_be_tortured[i]);
 				if (ret < 0) {
 					ubi_err(ubi, "could not erase old fastmap PEB");
 
@@ -1578,7 +1579,8 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 	if (old_fm) {
 		/* no fresh anchor PEB was found, reuse the old one */
 		if (!tmp_e) {
-			ret = ubi_sync_erase(ubi, old_fm->e[0], &torture);
+			ret = ubi_sync_erase(ubi, old_fm->e[0],
+					     &old_fm->to_be_tortured[0]);
 			if (ret < 0) {
 				ubi_err(ubi, "could not erase old anchor PEB");
 
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9A4C282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 06:57:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79C6F2133D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 06:57:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pOIjhxgC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79C6F2133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RZXpXMPlo2p1/zW5Nb6S/nbN8lmgjSOGk2/r1L4tFL4=; b=pOIjhxgCUdJr3G
	1XNxVF3PnQxS0HwHK4zDpaI8fVKHtS4btutLTi06r/2G3xYus7nZGCsKazk0fW5xGCkC42Cxp6lX0
	MIh2P0j6JogvNwnhEKGnk+jeu+9MzZzy4Y0bnKAobLFD42QO/RWvhSq+RKy9xKCHQ5nKypIEH49Yi
	gzGuUA1Mg2/P8x3Ur+K8aRrGaOJ+k6AUmblVTMK1Z20p+k858I1duNey+2IAzbAuP5iw6+RpjadHv
	CuTe1eVtwJiTZdHRs4pwA+dY1/Q4hQQRJGPYic/jMpo9BwafqbxZx0Bh0PIiJ/bJgOfae+ybWghoB
	l6r7OnYRSUyrzgCsPbMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmvR0-0002ye-S0; Fri, 25 Jan 2019 06:57:50 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmvQy-0002yG-8s
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 06:57:49 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 7B50B88222A513096BDA;
 Fri, 25 Jan 2019 14:57:43 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.408.0; Fri, 25 Jan 2019
 14:57:42 +0800
From: Yufen Yu <yuyufen@huawei.com>
To: <linux-mtd@lists.infradead.org>, <richard@nod.at>,
 <david.oberhollenzer@sigma-star.at>
Subject: [PATCH] mtd-utils: avoid to create two UBI_LAYOUT_VOLUME_ID volume
Date: Fri, 25 Jan 2019 15:01:24 +0800
Message-ID: <20190125070124.58260-1-yuyufen@huawei.com>
X-Mailer: git-send-email 2.16.2.dirty
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_225748_473885_69322170 
X-CRM114-Status: GOOD (  10.49  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

When we create a ubi image by ubinize, a UBI_LAYOUT_VOLUME_ID
volume will be created by ubigen_write_layout_vol().
However, after the commit 4c00cf2c5816 (ubiformat: remove
no-volume-table option), ubiformat remove novtbl args in format().
As a result, it will also create a layout volume.

When we attempt to do ubiattach, it will fail for ubi_compare_lebs error:
ubi0 error: ubi_compare_lebs: unsupported on-flash UBI format
ubi0 error: ubi_attach_mtd_dev: failed to attach mtd1, error -22

Signed-off-by: Yufen Yu <yuyufen@huawei.com>
---
 ubi-utils/ubiformat.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index 2ee14eb..aedb27b 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -542,7 +542,7 @@ out_close:
 
 static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 		  const struct ubigen_info *ui, struct ubi_scan_info *si,
-		  int start_eb)
+		  int start_eb, int novtbl)
 {
 	int eb, err, write_size;
 	struct ubi_ec_hdr *hdr;
@@ -597,7 +597,7 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 			continue;
 		}
 
-		if (eb1 == -1 || eb2 == -1) {
+		if ((eb1 == -1 || eb2 == -1) && !novtbl) {
 			if (eb1 == -1) {
 				eb1 = eb;
 				ec1 = ec;
@@ -642,6 +642,9 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 	if (!args.quiet && !args.verbose)
 		printf("\n");
 
+	if (novtbl)
+		goto out_free;
+
 	if (eb1 == -1 || eb2 == -1) {
 		errmsg("no eraseblocks for volume table");
 		goto out_free;
@@ -902,11 +905,15 @@ int main(int argc, char * const argv[])
 		if (err < 0)
 			goto out_free;
 
-		err = format(libmtd, &mtd, &ui, si, err);
+		/*
+		 * ubinize has create a UBI_LAYOUT_VOLUME_ID volume for image.
+		 * So, we don't need to create again.
+		 */
+		err = format(libmtd, &mtd, &ui, si, err, 1);
 		if (err)
 			goto out_free;
 	} else {
-		err = format(libmtd, &mtd, &ui, si, 0);
+		err = format(libmtd, &mtd, &ui, si, 0, 0);
 		if (err)
 			goto out_free;
 	}
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

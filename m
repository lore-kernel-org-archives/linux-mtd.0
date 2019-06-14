Return-Path: <SRS0=VbW+=UN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8FBC31E4C
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jun 2019 12:15:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7456208CA
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jun 2019 12:15:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hEOJrHct"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7456208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UhPcXD0hsHLNEXz2XmoFlpGQQyt7UlB437nE5HmhBR0=; b=hEOJrHctoOdpqq
	pCSbs46d5NCbGFm7kQIUdRTEjdRj/AHoE3Rkl5n/SxzyRbUghJfqDDseODHqvGP9h+WNWPkyp8Qt6
	5oTJwiuGkuRUgd6GmN1NUR+r+xVJRtMMapd8rEYQT3qsXs0GPZ2yfrJ2FyW2SAV9klDIDn814R1eT
	jq5CgGEbkY/H8vswEpnjAtHvAH+XLWhet6ePlbkyWmwQeXb546ODq9qWx7pBvLArrI59eA5ADopTL
	clwEILjlbZsEDdxphG4aHqSQK1vujuid4k/ZpaComA3L1SuCMWZWVzw1nx9VFZoXA7vbK/zZmANqK
	iYZNuhZ04PGr2J0oiDDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbl7F-0006wR-DA; Fri, 14 Jun 2019 12:15:33 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbl5D-00043j-Dc
 for linux-mtd@lists.infradead.org; Fri, 14 Jun 2019 12:13:29 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AA00B8BA90A42D58E026;
 Fri, 14 Jun 2019 20:13:23 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Fri, 14 Jun 2019
 20:13:15 +0800
From: <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>,
 <boris.brezillon@bootlin.com>, <david@sigma-star.at>,
 <artem.bityutskiy@linux.intel.com>, <yi.zhang@huawei.com>
Subject: [PATCH mtd-utils] ubi-tests: mkvol test: Checks return value 'ENOSPC'
 for 'ubi_mkvol'
Date: Fri, 14 Jun 2019 20:18:48 +0800
Message-ID: <1560514728-54932-1-git-send-email-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190614_051327_711305_D914BB17 
X-CRM114-Status: GOOD (  12.88  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: chengzhihao1@huawei.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Zhihao Cheng <chengzhihao1@huawei.com>

UBI tests try to create too many volumes in mkvol_bad and mkvol_basic.
Currently mtd-utils allows return value 'ENFILE' from 'ubi_mkvol', that
works fine in most situations. But what if the number of PEBs equals to
the maximum count of volumes? For example, mkvol_basic test will fail in
a 64MiB flash with 512KiB PEB size.
Following is the output of mkvol_basic test:

  ======================================================================
  ======================================================================
  ======================================================================
  Test on mtdram, fastmap enabled, VID header offset factor 1
  ======================================================================
  ======================================================================
  ======================================================================
  mtdram: 64MiB, PEB size 512KiB, fastmap enabled
  Running mkvol_basic /dev/ubi0
  [mkvol_basic] mkvol_multiple():182: function ubi_mkvol() failed with
  error 28 (No space left on device)
  [mkvol_basic] mkvol_multiple():183: vol_id 122
  Error: mkvol_basic failed
  FAILURE

The reason is that there is no available PEB to support a new volume. We
can see following verbose in dmesg:

  ubi0: attached mtd0 (name "mtdram test device", size 64 MiB)
  ubi0: user volume: 0, internal volumes: 1, max. volumes count: 128
  ubi0: available PEBs: 122, total reserved PEBs: 6, PEBs reserved for
  bad PEB handling: 0

The maximum count of volumes is 128, so we can create 128 volumes
theoretically. But there are 122 available PEBs becauese of existence of
reserved PEBs. In addition, a volume occupies at least one PEB. Actually,
we can only create 122 volumes, Therefore, 'ubi_mkvol' returns 'ENOSPC'
when mkvol_basic tries to create 123rd volume. And we can see
corresponding error message in dmesg:

  ubi0 error: ubi_create_volume [ubi]: not enough PEBs, only 0 available
  ubi0 error: ubi_create_volume [ubi]: cannot create volume 122, error -28

So, 'ENOSPC' can happen before 'ENFILE' in flash with a small amount of
PEBs. This patch checks return value 'ENOSPC' for 'ubi_mkvol' when mkvol
test is trying to create too many volumes.

----------------------------------------

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 tests/ubi-tests/mkvol_bad.c   | 2 +-
 tests/ubi-tests/mkvol_basic.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/ubi-tests/mkvol_bad.c b/tests/ubi-tests/mkvol_bad.c
index 7e46726..a5143e3 100644
--- a/tests/ubi-tests/mkvol_bad.c
+++ b/tests/ubi-tests/mkvol_bad.c
@@ -200,7 +200,7 @@ static int test_mkvol(void)
 			 * Note, because of gluebi we may be unable to create
 			 * dev_info.max_vol_count devices (MTD restrictions).
 			 */
-			if (errno == ENFILE)
+			if (errno == ENFILE || errno == ENOSPC)
 				break;
 			failed("ubi_mkvol");
 			errorm("vol_id %d", i);
diff --git a/tests/ubi-tests/mkvol_basic.c b/tests/ubi-tests/mkvol_basic.c
index c7c6984..cc3f7ba 100644
--- a/tests/ubi-tests/mkvol_basic.c
+++ b/tests/ubi-tests/mkvol_basic.c
@@ -178,7 +178,7 @@ static int mkvol_multiple(void)
 		req.name = nm;
 
 		if (ubi_mkvol(libubi, node, &req)) {
-			if (errno == ENFILE) {
+			if (errno == ENFILE || errno == ENOSPC) {
 				max = i;
 				break;
 			}
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

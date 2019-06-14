Return-Path: <SRS0=VbW+=UN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26856C31E44
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jun 2019 12:15:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D77BE208CA
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jun 2019 12:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bm95TsSh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D77BE208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yDgwmkpHwFXqqAoYnPqZxoKv8+HNtwyFVmNh7gNwO9w=; b=Bm95TsSh8HNtBa
	nc+ZcVVsrzFwxvNP3srGBHWfclMrX9DIqgpfJ/GiMETJK+7z6m2itTZn42p1yj5RWgL+SSEihQi6f
	A6wLdbH+P3YNaRb8KoyEQkILMDMNxSyzG59qIAtXaLYCDe76vo7GeOZL5MOdx6tKdXPEW+rzVD0QH
	2a7t7XboMnXvhyGA1qIjyJo3GaG4UgYl9u+J2mtvYb8oOd9B0JoP3ji0J6HeWu+nsnqL0WNsPvV7b
	I/0Lb1X7dn+tVCGdLrA4lrhrahKHdvbKqcMTiJxxgVXev1gCJTwlawLb3RyesyIivolOmsSUPwy2n
	hdIK2AMj0yHSLkqs1yZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbl6q-0005bn-P7; Fri, 14 Jun 2019 12:15:08 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbl4l-0003d9-Uw
 for linux-mtd@lists.infradead.org; Fri, 14 Jun 2019 12:13:02 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8DA29D3C080F3421CE99;
 Fri, 14 Jun 2019 20:12:53 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Fri, 14 Jun 2019
 20:12:44 +0800
From: <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>,
 <boris.brezillon@bootlin.com>, <david@sigma-star.at>,
 <artem.bityutskiy@linux.intel.com>, <yi.zhang@huawei.com>
Subject: [PATCH mtd-utils] ubi-tests: io_read: Filter invalid offset value
 before 'lseek' in io_read test
Date: Fri, 14 Jun 2019 20:18:16 +0800
Message-ID: <1560514696-54824-1-git-send-email-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190614_051300_807981_27D79A9A 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
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

There are many different offset values passed in 'lseek' during io_read
testing of ubi test. The offset value maybe a negative number or a big
number that exceeds the volume data size, which can lead to ubi tests
failure by passing invalid offset value to 'lseek'. For example:

Example 1: The data size of volume is 39525 bytes, offset = (sz) -
MAX_NAND_PAGE_SIZE - 1, where MAX_NAND_PAGE_SIZE is 65536. Here, offset
is a negative value passed to 'lseek', which leads to fail in io_read.

  ======================================================================
  ======================================================================
  ======================================================================
  Test on mtdram, fastmap enabled, VID header offset factor 1
  ======================================================================
  ======================================================================
  ======================================================================
  mtdram: 16MiB, PEB size 16KiB, fastmap enabled
  Running mkvol_basic /dev/ubi0
  Running mkvol_bad /dev/ubi0
  Running mkvol_paral /dev/ubi0
  Running rsvol /dev/ubi0
  Running io_basic /dev/ubi0
  Running io_read /dev/ubi0
  [io_basic] test_read3():189: function seek() failed with error 22
  (Invalid argument)
  [io_basic] test_read3():190: len = 1
  [io_basic] test_read2():237: offset = -26012
  [io_basic] test_read1():303: length = 1
  [io_basic] test_read():362: alignment = 7905
  Error: io_read failed
  FAILURE

Example 2: The data size of volume is 79035 bytes, offset = 2 *
MAX_NAND_PAGE_SIZE, where MAX_NAND_PAGE_SIZE is 65536. Here, offset is a
value exceeds volume size, which leads to fail in io_read.

  ======================================================================
  ======================================================================
  ======================================================================
  Test on mtdram, fastmap enabled, VID header offset factor 1
  ======================================================================
  ======================================================================
  ======================================================================
  mtdram: 16MiB, PEB size 16KiB, fastmap enabled
  Running mkvol_basic /dev/ubi0
  Running mkvol_bad /dev/ubi0
  Running mkvol_paral /dev/ubi0
  Running rsvol /dev/ubi0
  Running io_basic /dev/ubi0
  Running io_read /dev/ubi0
  [io_basic] test_read3():185: function seek() failed with error 22
  (Invalid argument)
  [io_basic] test_read3():186: len = 1
  [io_basic] test_read2():233: offset = 131072
  [io_basic] test_read1():299: length = 1
  [io_basic] test_read():358: alignment = 3
  Error: io_read failed
  FAILURE

This patch checks offset value before executing 'lseek', invalid offset
values are filtered.

----------------------------------------

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 tests/ubi-tests/io_read.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/ubi-tests/io_read.c b/tests/ubi-tests/io_read.c
index 3100ef1..f944a86 100644
--- a/tests/ubi-tests/io_read.c
+++ b/tests/ubi-tests/io_read.c
@@ -228,6 +228,10 @@ static int test_read2(const struct ubi_vol_info *vol_info, int len)
 				  vol_info->data_bytes);
 
 	for (i = 0; i < sizeof(offsets)/sizeof(off_t); i++) {
+		/* Filter invalid offset value */
+		if (offsets[i] < 0 || offsets[i] > vol_info->data_bytes)
+			continue;
+
 		if (test_read3(vol_info, len, offsets[i])) {
 			errorm("offset = %d", offsets[i]);
 			return -1;
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

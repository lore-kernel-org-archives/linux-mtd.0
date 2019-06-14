Return-Path: <SRS0=VbW+=UN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06034C31E44
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jun 2019 12:20:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA4F520850
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jun 2019 12:20:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tYUNvbP5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA4F520850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H0YhQxXYyzcZnR5jX7pKMFpV/187jEMO/NORiaZXb7Q=; b=tYUNvbP5UHJKJ5
	OupuVaVeoGwzHPwCwhaSIJkdNJRS4W0zwvjbPqhBNIK+bcrLzjAuxGf+/oRqPs/7CKVbnEyj/4XDh
	ROnprO3VedIytQdNNM1k0CcT48N4DW5eBs594pCgu4HQbmc+1FEF88tSb1k/7umJGGpmC7SZa3TxL
	X1Kw3lh8S6mDYVGyw+XezHA9HOM5WR+6MvyOfi9KRfmZ94bxTmjJNGRiMOtAN2T8us6hdk/bmsww7
	CREMGSK8tM0mgi5SrefcGfHdriWgMVTx/sNzTugbnmMqsJ7EguSOqt4qq3tqmtLv8QTnPu04OR3wv
	5UneZyamBy/U3dCGAMZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hblBz-0004M7-RU; Fri, 14 Jun 2019 12:20:27 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbl6C-0004sX-1K
 for linux-mtd@lists.infradead.org; Fri, 14 Jun 2019 12:14:29 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4CD46B2AEDDC10E6B47A;
 Fri, 14 Jun 2019 20:14:24 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Fri, 14 Jun 2019
 20:14:18 +0800
From: <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>,
 <boris.brezillon@bootlin.com>, <david@sigma-star.at>,
 <artem.bityutskiy@linux.intel.com>, <yi.zhang@huawei.com>
Subject: [PATCH mtd-utils] ubi-tests: fm_param: Replace 'fm_auto' with
 'fm_autoconvert'
Date: Fri, 14 Jun 2019 20:19:50 +0800
Message-ID: <1560514790-55222-1-git-send-email-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190614_051428_350241_04F8D3E0 
X-CRM114-Status: UNSURE (   8.41  )
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

The value of fm_param should be 'fm_autoconvert' rather than 'fm_auto' when
fastmap is supported by kernel. Currently, following verbose will appear in
dmesg when fm_param is set to 'fm_auto':

  ubi: unknown parameter 'fm_auto' ignored

This patch replace 'fm_auto' with 'fm_autoconvert' for fm_param, so ubi
kernel module can receive correct parameters.

----------------------------------------

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 tests/ubi-tests/ubi-stress-test.sh.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/ubi-tests/ubi-stress-test.sh.in b/tests/ubi-tests/ubi-stress-test.sh.in
index 42ccec5..657ef4b 100755
--- a/tests/ubi-tests/ubi-stress-test.sh.in
+++ b/tests/ubi-tests/ubi-stress-test.sh.in
@@ -117,7 +117,7 @@ run_test()
 		fm_param=
 	elif [ "$fm_supported" = "yes" ]; then
 		fastmap="disabled"
-		fm_param="fm_auto"
+		fm_param="fm_autoconvert"
 	else
 		echo "Fastmap is not supported, skip"
 		return 0
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

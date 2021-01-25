Return-Path: <SRS0=dx8R=G4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13570C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 12:46:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D28A22D04
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 12:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D28A22D04
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L3UKTZ9bvoY7fJD3CBeEnzFCRPf0KNk4aok814PhhpQ=; b=k0+JDjrJiEUdNNNf0M3m2f4AjS
	edLZ6pRsd0EIdK6GTEm4smxti3Qzo6ZGu0e/KuucOKHDauxYvqo4WBmloP/nP8yhmCMfqCC3zfZuG
	Io+ocptbec48NbrMqfVpJB/lVhSVElIHswID8ENqwvfBnMGBTwxNg52D4+ITufFs2SVtE19af0GQi
	TF3BootNsVy/vlETYbc6RHgo4BeEOkSrTXGIhAfCDfy0Beq97OxCslyNtI99AnaKbx+CdVII6Htse
	K+EqVV6+KTfcSSogaQjy3TKkb3POIBDhfAWHlsRN7XbndoYXtQTCENHz2G9AUA10K0/0w7eb46cXO
	rJBSMqGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l41Di-0001Vb-US; Mon, 25 Jan 2021 12:43:50 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l41Df-0001Up-VN
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2021 12:43:49 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DPTz53htWz15yJB;
 Mon, 25 Jan 2021 20:42:25 +0800 (CST)
Received: from code-website.localdomain (10.175.127.227) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Mon, 25 Jan 2021 20:43:26 +0800
From: yangerkun <yangerkun@huawei.com>
To: <zhongguohua1@huawei.com>, <joern@lazybastard.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <patrick@baymotion.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH V2] mtd: phram: use div_u64_rem to stop overwrite len in
 phram_setup
Date: Mon, 25 Jan 2021 20:49:36 +0800
Message-ID: <20210125124936.651812-1-yangerkun@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_074348_807239_0EBC9B3F 
X-CRM114-Status: UNSURE (   8.87  )
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
Cc: yangerkun@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

We now support user to set erase page size, and use do_div between len
and erase size to determine the reasonableness for the erase size.
However, do_div is a macro and will overwrite the value of len. Which
results a mtd device with unexcepted size. Fix it by use div_u64_rem.

Fixes: ffad560394de ("mtd: phram: Allow the user to set the erase page size.")
Signed-off-by: yangerkun <yangerkun@huawei.com>
---
 drivers/mtd/devices/phram.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index cfd170946ba4..5b04ae6c3057 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -222,6 +222,7 @@ static int phram_setup(const char *val)
 	uint64_t start;
 	uint64_t len;
 	uint64_t erasesize = PAGE_SIZE;
+	uint32_t rem;
 	int i, ret;
 
 	if (strnlen(val, sizeof(buf)) >= sizeof(buf))
@@ -263,8 +264,11 @@ static int phram_setup(const char *val)
 		}
 	}
 
+	if (erasesize)
+		div_u64_rem(len, (uint32_t)erasesize, &rem);
+
 	if (len == 0 || erasesize == 0 || erasesize > len
-	    || erasesize > UINT_MAX || do_div(len, (uint32_t)erasesize) != 0) {
+	    || erasesize > UINT_MAX || rem) {
 		parse_err("illegal erasesize or len\n");
 		goto error;
 	}
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

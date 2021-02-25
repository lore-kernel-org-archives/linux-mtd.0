Return-Path: <SRS0=cHBa=H3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6EF8C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 14:34:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DFFF64F06
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 14:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DFFF64F06
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rdQJDDZ5BPeXOTJH8yc4Qme9eeJkIcNPd7XybkQiMds=; b=2Dgg7VdkVe0OSnNCCcmYLUTRgq
	6x2T583gGH9vDiQaGEr2oEAtuFYLb93dIigwXws2hqInI+EEwYn7TMRgWcbDvn+3yU2UjBkWfMmAm
	NiUlOuWsMrl5cqmVfBQ74NEFZuyJ8u59r13ZKhiI+j+gPRUnAQHuIFZBvRm9A6AggSz2cucn1dzDC
	2deNaWsVzeO7h1o5CFDjSag2q+FgsUq14TWmOgV0e3NIGkUZpE+I6hDQIxE428iIzAmzH8L1oPFnW
	uthVHbXMNecuvNukhF4wAWNz7fvnak/tEPbAdgEK3X8T10Sj3JwbsAwLY9hJh0r7p7HC40iSLJOql
	bfXip4Vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFHiR-0001BU-LZ; Thu, 25 Feb 2021 14:34:07 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFHiO-0001B3-2l
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2021 14:34:05 +0000
IronPort-SDR: he49Ko7QOXPVo2HqqQyq2S7uyX8oYZriYIERHlj1rrJ+6I9BFgmK5h24CHgTnlflIJyvPkbknt
 TSYkC9HEgC5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9905"; a="249599583"
X-IronPort-AV: E=Sophos;i="5.81,205,1610438400"; d="scan'208";a="249599583"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2021 06:33:55 -0800
IronPort-SDR: 5hOqb448r80JPOcGcWTmbLuw32zVDPinUN8H55F5pcA9v166xEDX3WjDAYC7QQB4FWijIC9k+I
 XIDErPx4+5aw==
X-IronPort-AV: E=Sophos;i="5.81,205,1610438400"; d="scan'208";a="404298979"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2021 06:33:53 -0800
From: Tomas Winkler <tomas.winkler@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: mtdcore: constify name param in mtd_bdi_init
Date: Thu, 25 Feb 2021 16:33:29 +0200
Message-Id: <20210225143329.430012-1-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_093404_275501_925D17FB 
X-CRM114-Status: UNSURE (   9.41  )
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
Cc: Tomas Winkler <tomas.winkler@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The bdi name is not modified by the function, it should be const.

Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index db5167eacaa4..80fb69453ebe 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -2177,7 +2177,7 @@ static int mtd_proc_show(struct seq_file *m, void *v)
 /*====================================================================*/
 /* Init code */
 
-static struct backing_dev_info * __init mtd_bdi_init(char *name)
+static struct backing_dev_info * __init mtd_bdi_init(const char *name)
 {
 	struct backing_dev_info *bdi;
 	int ret;
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <SRS0=vqft=VM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8C6C76195
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jul 2019 13:39:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7954D2080A
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jul 2019 13:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hOsyt77T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7954D2080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaiser.cx
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=yFgJPB3uDB7qwV6+ZgrRomOKCgR1QVJpHF54CVX95Cs=; b=hOs
	yt77TYu4j7EhfJaSgWjjyp3S+ZaiiyJ8bcGhQ+FjA+WjWlRHy2oruRIkmLb29NliI34QWcrBzp972
	oC4Ik0FCgGR3F6sW4SpiP5PX3/cO/lYZvfBye6gFAIUPfG80vtpQPkfAtT5h5P69M1t3M4egWo4K1
	FRVdqc2eiJmXsJ9AFObqgypw3HSps1u8PHUVOPpM0lqGjVbL+bu/r4jGFQohKS9GB37t3uKZIW8Gg
	aUPwGllHBRl7CK3ELFAA6aasNT+NvvJ2WQKh3e/uEcnvK00XNsypOthfsKjlJY2OLcsp7EWlbw93r
	T72hJbv/UesDvfjOMIUXLuiNNT13z9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hn1CK-0005Fr-3r; Mon, 15 Jul 2019 13:39:20 +0000
Received: from viti.kaiser.cx ([2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hn1CH-0005Dw-JP
 for linux-mtd@lists.infradead.org; Mon, 15 Jul 2019 13:39:19 +0000
Received: from [46.114.7.152] (helo=martin-debian-1.paytec.ch)
 by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <martin@kaiser.cx>)
 id 1hn1C9-00085L-0Z; Mon, 15 Jul 2019 15:39:09 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: linux-mtd@lists.infradead.org
Subject: [PATCH mtd-utils] mkfs.ubifs: fix compilation without ZSTD
Date: Mon, 15 Jul 2019 15:38:58 +0200
Message-Id: <20190715133858.18723-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190715_063917_782472_BAE64A7C 
X-CRM114-Status: UNSURE (   8.09  )
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
Cc: Martin Kaiser <martin@kaiser.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fix a trivial typo to make sure that zstd.h is included only if
zstd is not disabled.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 ubifs-utils/mkfs.ubifs/compr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ubifs-utils/mkfs.ubifs/compr.c b/ubifs-utils/mkfs.ubifs/compr.c
index 6239835..83f52ef 100644
--- a/ubifs-utils/mkfs.ubifs/compr.c
+++ b/ubifs-utils/mkfs.ubifs/compr.c
@@ -28,7 +28,7 @@
 #include <lzo/lzo1x.h>
 #endif
 #include <linux/types.h>
-#ifndef WITHOUT_ZSTSD
+#ifndef WITHOUT_ZSTD
 #include <zstd.h>
 #endif
 
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <SRS0=BkV4=SR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94334C10F0E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 08:21:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65AEC20674
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 08:21:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lH3rfDSh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=schinagl.nl header.i=@schinagl.nl header.b="Byq0mIUs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65AEC20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=schinagl.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ovna64gluWUtB79MrigFNEkaJXSDzrodsoJ8bvSEI4=; b=lH3rfDShq9m9MH
	phNZoqvmd4NLamdow7q9s+P9DkdOw1e2IL/PDPIAEVPr/bHIJfekK7iZt0YjfdUpO4yCjJfNZA/xW
	yLhllhdj2OCRpVCR6iSQdfyyY/XHw1U5LYBfo8EBPSk0AAYKKeuEVkyGObjlSxn/QLTZiHfx+j1Ci
	oZB6sHUHF3wrbPme/GuKbEK5UbnmJB9rHtPBcsSkeO2nt/D9J1bYL9j6/fE9i0JT6PQ5kIQHD1ECc
	y5LdtKRJUb42EPgJ0b8vzNbf192fuSqZdc3+pazYZI1fj3s8fbN1nUuSnmXKRHUAxqtTGngu/TJiq
	BrjgTxF2he1OL7hk1/tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFwrK-0000xH-PJ; Mon, 15 Apr 2019 08:20:58 +0000
Received: from 7of9.schinagl.nl ([62.251.20.244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFwr3-0000ZV-Lu
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2019 08:20:43 +0000
Received: from 3of9.evbox.com (90-145-215-130.bbserv.nl [90.145.215.130])
 by 7of9.schinagl.nl (Postfix) with ESMTPA id 27A7FEE2612;
 Mon, 15 Apr 2019 10:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=schinagl.nl; s=7of9;
 t=1555316440; bh=ML9Om4vppTtzaBN5bfWSu7q2f3LXiISZQr6aetYyqC8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Byq0mIUssnS5Sf+BGKTEsnMjyKjSkaZnoiGeOEaR/5SyPZJ9JMAGbFaQ0rkW5x6Yn
 OPfd6r9okcBP42SzuQS6UPiEajCFvxXWWdU7wL/EDKxuA/xswiz+e8I/RVqB97tN04
 GeKka79asn+hwqRHF+vTdWXlltZc5mqABaUjrEvU=
From: Olliver Schinagl <oliver@schinagl.nl>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] unittests/libmtd_test: Include fcntl header
Date: Mon, 15 Apr 2019 10:20:30 +0200
Message-Id: <20190415082031.600-3-oliver@schinagl.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190415082031.600-1-oliver@schinagl.nl>
References: <20190415082031.600-1-oliver@schinagl.nl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_012041_873450_B0132342 
X-CRM114-Status: UNSURE (   7.27  )
X-CRM114-Notice: Please train this message.
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
Cc: Olliver Schinagl <oliver@schinagl.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The test library for the mtd unit tests include various type's and
macro's that officially live in fcntl. Each file and header should
always properly include what they use, so lets add the fcntl headers.

Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
---
 tests/unittests/libmtd_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/unittests/libmtd_test.c b/tests/unittests/libmtd_test.c
index 633d94a..176d2ef 100644
--- a/tests/unittests/libmtd_test.c
+++ b/tests/unittests/libmtd_test.c
@@ -1,3 +1,4 @@
+#include <fcntl.h>
 #include <stdarg.h>
 #include <setjmp.h>
 #include <stddef.h>
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

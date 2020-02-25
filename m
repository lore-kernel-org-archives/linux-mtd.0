Return-Path: <SRS0=ETWj=4N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62F5C35DF2
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2020 05:02:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9884F24683
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2020 05:02:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O6VzWKaz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="URPYq758"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9884F24683
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kXWQpDHRk4s3aH4XkzTYQ4H+fC4wSo+8UA3dsUS0JbI=; b=O6VzWKazrtpkVp
	yzl/drDTPcThOqJejHUygT6D1b4AxbDGh3mi4u/ew3qiNnmaGkKuIpd7vkQkyQxHzIa+vm+AiAf43
	yWCXJ04YBUg9EWGxqpRZwSRxiwUDOBiwfwooHh7pJcn3ZryvwtEojaZ9z3y+VGDBogNQsBd5sUppH
	5cbEUDB15Qwzia6llkL2yNjusesZ5pGq0EsU4nbX84IhuGdNezz7oaTjRq1me1MDU98vLw0P4ed3R
	Z7l9Lu/2mPw9fDP2lcj42X5hNsnSvhc1Y/wpgEacflZn1LEazv6yxSlKlyXBkhMDwhJILNLkA3z9P
	K7Bm1RDHR9J8Id2OyQsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6SMU-00030N-8Y; Tue, 25 Feb 2020 05:02:26 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6SMP-0002za-8V
 for linux-mtd@lists.infradead.org; Tue, 25 Feb 2020 05:02:24 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01P52C6L065708;
 Mon, 24 Feb 2020 23:02:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582606932;
 bh=U168JZui3XiEVZj9pBDK0n5lhhEniIXkbGQCalX7JLg=;
 h=From:To:CC:Subject:Date;
 b=URPYq758+W2UjP2CEfMHLK1Qdk+9q1P+dWOAamf0VxzTQR1BUuzwtpOLuq0iof1w/
 l0BovrBslYcWlM/0w+ZsUQ1KpR8iNwW8pL92KuJCFKPMpZFFKKa091Jgj+qRx06cb+
 zFFZgA1mnTZ8CFLSLiSKPyEXVZ4/O178/0OORN40=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01P52COh022172;
 Mon, 24 Feb 2020 23:02:12 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 24
 Feb 2020 23:02:12 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 24 Feb 2020 23:02:12 -0600
Received: from a0132425.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01P52Aju030280; 
 Mon, 24 Feb 2020 23:02:10 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>
Subject: [PATCH] MAINTAINERS: Add staging branch for HyperBus
Date: Tue, 25 Feb 2020 10:32:48 +0530
Message-ID: <20200225050248.20722-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_210221_382248_8D0FAD3C 
X-CRM114-Status: UNSURE (   8.79  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Update HyperBus entry with branch used to stage patches under
mtd.git

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a0d86490c2c6..4b9930263dc7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7769,6 +7769,9 @@ F:	Documentation/ABI/testing/debugfs-hyperv
 
 HYPERBUS SUPPORT
 M:	Vignesh Raghavendra <vigneshr@ti.com>
+L:	linux-mtd@lists.infradead.org
+Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git cfi/next
 S:	Supported
 F:	drivers/mtd/hyperbus/
 F:	include/linux/mtd/hyperbus.h
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

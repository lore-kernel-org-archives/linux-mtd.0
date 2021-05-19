Return-Path: <SRS0=R0RB=KO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC7EC433ED
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:48:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97EBF6135A
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97EBF6135A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AdvngGtRcqBKgpDNS1lVsMae+Dm51WLVzEBPQSqtNy8=; b=YXlYLwz85sfZUrZ2hXdcy+8xi
	fdT6Ze+2GOhbKGrdgz4zSoJhkBs2dXdP54Ss5fqgQzQVHqbBL7diFYgqGqrsJ7Db68PwqVkIIXEsK
	LZ2ADHKZP8s/d+Ltnuuqk3VaXKzmA2XjH/iK6aMdaQXm/Gl4DcZt8OTDmkW/CoV1PXhDwpgoauHv7
	x95MH/rgQOhuLFyhLaxAuJaQ3cC076yUAFfW7KJZhVySqAviT8MQpRa4P8DwvzUHNaAgo+HinA/XA
	6XGVnz/fiP0orN8scE0F0elpRtpSWqEU+7Xm8GvpD5YA3cqtV+jV8hOVGY5kNAra3Hk9NzGMZcnJu
	dmTJfb7ww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljRE5-004nmS-Kt; Wed, 19 May 2021 18:47:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuS-004lP9-G3
 for linux-mtd@desiato.infradead.org; Wed, 19 May 2021 18:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=pRyhPcsaqL4bzl64iPaqApmnyxI3hW5BFin/BUM1MMw=; b=TZYqN+xjjjRhaMcEvMaWAggQQA
 O3WALmT859ckUrbmjlu348lTkr+qrHWYyBbCZTTEhDbZSX1TTy+2K9QpOSUe8kqhpB4QAEcMXrWwy
 B7RxTLwQV/87JZhme2cyj13pTOmwbG0wF9DnK2WU+qiWNkLHXMfRgF5WNl6ZBdsoNb69D7fBYd5iN
 RvGep8q9CEsj3qa5/bYYQeY5epJeU8P+md+u/tzE7Wj5Tn7HWfG0J8AbKH6jATkSZzJVzgOBCIIox
 CExRkbYY3XbnaF3C7HRTmSzPptBogFhSmCuOPtZKaq/kS9eGbcTQTHNJOpkUjhnrpiEMDn3CRQ3OX
 5pGBxvTw==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuP-00Fh8t-Rx
 for linux-mtd@lists.infradead.org; Wed, 19 May 2021 18:27:07 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3FCB0C0005;
 Wed, 19 May 2021 18:27:03 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Helmut Grohne <helmut.grohne@intenta.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v20 14/19] memory: pl353-smc: Avoid useless acronyms in
 descriptions
Date: Wed, 19 May 2021 20:26:31 +0200
Message-Id: <20210519182636.1110080-15-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_112706_058349_73A51F19 
X-CRM114-Status: GOOD (  11.66  )
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

APER does not mean anything, while it seems legitimate to call this
clock the AXI peripheral clock.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/memory/pl353-smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/pl353-smc.c b/drivers/memory/pl353-smc.c
index 5b57926461a0..b913d68a7a41 100644
--- a/drivers/memory/pl353-smc.c
+++ b/drivers/memory/pl353-smc.c
@@ -17,7 +17,7 @@
 /**
  * struct pl353_smc_data - Private smc driver structure
  * @memclk:		Pointer to the peripheral clock
- * @aclk:		Pointer to the APER clock
+ * @aclk:		Pointer to the AXI peripheral clock
  */
 struct pl353_smc_data {
 	struct clk		*memclk;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

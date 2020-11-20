Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82E1C64E7C
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 18:38:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 709FA22464
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 18:38:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rY8MZ+Tr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lYKUxepI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 709FA22464
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KlNuanNw/BVn3vILuGTtR2z+NDemisJOhkhawOTdugM=; b=rY8MZ+TrUTX6VIT0/TpaffjSY
	n6kMSsQt4qMi8NZOs0d1dnU+hcHdEhgd3RKlnPa3qFLYy/IhbzbzlOf/KMaQ69XxzXls78BOOTd6p
	cpKVTLuZSmNPvwYediVNtXAFND+LHlwfre1R5BFVZi4214OdvYexZyC2uugNKSXbpReD1t1wZ90yy
	WmrYqAZXVT+ig9EBwZ+wpPfXJGuXQ6U9bYT+KPvc1eQY7f0QPJB6osIUGtvis4WK7H0APJsY22qOw
	C5LvQE1IEb5vfRkk4DQ4VuASyc97musQMDeZco3VWBekEUrEMZzM0TY81nojLQ7B1GAenzrRUxD0F
	COxjxTITQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgBHm-0002tO-Ur; Fri, 20 Nov 2020 18:37:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgBHk-0002si-Bm
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 18:37:29 +0000
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB2A224181;
 Fri, 20 Nov 2020 18:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605897447;
 bh=5dWhuUO/oHpV2V7fo9QOdb69sHzl2L5kSFQKxqFnL80=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lYKUxepI2Y9w7Lw0LEgaRaXfpYiNPDk7cSrwfrhgtlX4wbX37LTxU+4yapG4Vvgat
 mxlOkDrnSQPFM21TDicZaqiIHD9PcM3fBCC7TdYlKVrfyI8ySsuaXSpGv1Lq8Uqvg/
 WeuqxqMaZg/rNwgQcRAwfUKbsmm1RPaYih4erYWM=
Date: Fri, 20 Nov 2020 12:37:33 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 102/141] mtd: onenand: Fix fall-through warnings for Clang
Message-ID: <3579ecfc6f989699a1663ce0a7bcdd84f173c900.1605896060.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_133728_521099_537DFF2B 
X-CRM114-Status: GOOD (  13.99  )
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
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/mtd/nand/onenand/onenand_samsung.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/onenand/onenand_samsung.c b/drivers/mtd/nand/onenand/onenand_samsung.c
index 87b28e397d67..b64895573515 100644
--- a/drivers/mtd/nand/onenand/onenand_samsung.c
+++ b/drivers/mtd/nand/onenand/onenand_samsung.c
@@ -396,6 +396,7 @@ static int s3c_onenand_command(struct mtd_info *mtd, int cmd, loff_t addr,
 	case ONENAND_CMD_READOOB:
 	case ONENAND_CMD_BUFFERRAM:
 		ONENAND_SET_NEXT_BUFFERRAM(this);
+		break;
 	default:
 		break;
 	}
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <SRS0=O8Pa=FO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B003C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 03:24:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C84FF22A99
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 03:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C84FF22A99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfJvkUDQy6bxS/y7noQCRVEGvWrpQV3MqUfAOzjmgMs=; b=f2ZllnieuoA5dNdOJHepvkpL6c
	WBWvuJXvJJbLJc9LOcnhvyECk5sxuGhdcy3DPP1cZZ/sBWKALb9H8YP9PcS1HAvCAMt3TqgL4PSrL
	ya1yMQOi3623LfHWNkLdg0STmEONwtITshHzqYg64mu0gxDDkvwAyx86xUNDBCp6EvOewnVdAcy0h
	KE4fDv87ZWxKmTsrKSYbVkTut32MMtGqtRU72ciCjdwDNwjQTMLMk4twRDZgXGYDMm26sHaY8NkKO
	mG7Yl2gky72uTqO0wdKTqNRIBLuSYbrI9kDJLq5UhTGS47rvN+1Gppe62u2VFpLUtnQ1zsdqqiC2R
	6yQZNNYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knCXk-0002Js-1x; Thu, 10 Dec 2020 03:23:00 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knCXg-0002IS-1a
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2020 03:22:57 +0000
Received: from localhost.localdomain ([172.17.195.95])
 by TWHMLLG3.macronix.com with ESMTP id 0BA3MURf011440;
 Thu, 10 Dec 2020 11:22:36 +0800 (GMT-8)
 (envelope-from ycllin@mxic.com.tw)
From: YouChing Lin <ycllin@mxic.com.tw>
To: miquel.raynal@bootlin.com, vigneshr@ti.com
Subject: [PATCH 1/2] mtd: nand: ecc-bch: Fix the size of calc_buf/code_buf of
 the BCH
Date: Thu, 10 Dec 2020 11:22:08 +0800
Message-Id: <1607570529-22341-2-git-send-email-ycllin@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1607570529-22341-1-git-send-email-ycllin@mxic.com.tw>
References: <1607570529-22341-1-git-send-email-ycllin@mxic.com.tw>
X-MAIL: TWHMLLG3.macronix.com 0BA3MURf011440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_222256_522315_C0C4D6A0 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: juliensu@mxic.com.tw, ycllin@mxic.com.tw, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If eccbyte exceeds 64 bytes, the read operation will get wrong results.
For example: Flash with a page size of 4096 bytes (eccbyte: 104 bytes).
During the read operation, after executing nand_ecc_sw_bch_calculate(),
since the calc_buf/code_buf ranges overlap each other, the last three
steps of ecc_code (read from oob) will be changed.

The root cause is that the size of calc_buf/code_buf is limited to 64
bytes, although sizeof(mtd->oobsize) returns 4, kzalloc() will allocate
64 bytes (cache size alignment).

So we correct the size of calc_buf/code_buf to mtd->oobsize.

Signed-off-by: YouChing Lin <ycllin@mxic.com.tw>
---
 drivers/mtd/nand/ecc-sw-bch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/ecc-sw-bch.c b/drivers/mtd/nand/ecc-sw-bch.c
index 4d8a979..0a0ac11 100644
--- a/drivers/mtd/nand/ecc-sw-bch.c
+++ b/drivers/mtd/nand/ecc-sw-bch.c
@@ -237,8 +237,8 @@ int nand_ecc_sw_bch_init_ctx(struct nand_device *nand)
 
 	engine_conf->code_size = code_size;
 	engine_conf->nsteps = nsteps;
-	engine_conf->calc_buf = kzalloc(sizeof(mtd->oobsize), GFP_KERNEL);
-	engine_conf->code_buf = kzalloc(sizeof(mtd->oobsize), GFP_KERNEL);
+	engine_conf->calc_buf = kzalloc(mtd->oobsize, GFP_KERNEL);
+	engine_conf->code_buf = kzalloc(mtd->oobsize, GFP_KERNEL);
 	if (!engine_conf->calc_buf || !engine_conf->code_buf) {
 		ret = -ENOMEM;
 		goto free_bufs;
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

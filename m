Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B0BC433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 16:29:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABC39207E8
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 16:29:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bRLbtPmQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABC39207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VING4i3CL98zZF0kZOHaZ6pZuk3icb4H3GiKpYkEkng=; b=bRLbtPmQJG7LxA
	ULhqvxrPtopP8zvMSYLJLJoeUHrbg4FHDwTMHDU09utTNQNZwUDJrXVs+ujsgi4YPO+R1nG1LwZc1
	wruBHjnEgct0FYz9SwL4yczWToA/pGHRxEIrGQ164G1uJ0zRTRLeaQzZdDyFhhhcIljRdCJ0HlMRw
	t1+VH0SW2cs8h86hfyECiMf8ZrPHwHi1AhkzSGNQQFZfAo92ej8UuvkVdq33WHuDE2Wx1LOf7vZGj
	oifSzF5Gf8FWw8DwX3yrx+f/aCtf4SyKAZLSL8BKc9vNdGtS9oapXZ5sJkHSrRnc0oQvMBrMQXGRb
	/4a7rjraLycZ963NaURw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaidC-0006J9-En; Mon, 18 May 2020 16:28:46 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaid9-0006Gi-4B
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 16:28:44 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C366F2A0DB9;
 Mon, 18 May 2020 17:28:41 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-mips@vger.kernel.org
Subject: [PATCH v2 1/8] mtd: rawnand: Add an is_last flag to nand_subop
Date: Mon, 18 May 2020 18:28:30 +0200
Message-Id: <20200518162837.304471-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200518162837.304471-1-boris.brezillon@collabora.com>
References: <20200518162837.304471-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_092843_297284_F9D6CD37 
X-CRM114-Status: GOOD (  11.66  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some controllers need to know when they're passed the last subop so
they can de-assert the CE pin.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
* Add R-b
---
 drivers/mtd/nand/raw/nand_base.c | 2 ++
 include/linux/mtd/rawnand.h      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 169150a7c140..21f8771b00ba 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2169,6 +2169,8 @@ nand_op_parser_match_pat(const struct nand_op_parser_pattern *pat,
 	 */
 	ctx->subop.ninstrs = ninstrs;
 	ctx->subop.last_instr_end_off = instr_offset;
+	if (ctx->subop.instrs + ninstrs == end && !instr_offset)
+		ctx->subop.is_last = true;
 
 	return true;
 }
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 0f45b6984ad1..69f1c1652187 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -715,6 +715,7 @@ struct nand_op_instr {
  *			   of the sub-operation
  * @last_instr_end_off: offset to end at (excluded) for the last instruction
  *			of the sub-operation
+ * @is_last: this sub-operation is the last one
  *
  * Both @first_instr_start_off and @last_instr_end_off only apply to data or
  * address instructions.
@@ -728,6 +729,7 @@ struct nand_subop {
 	unsigned int ninstrs;
 	unsigned int first_instr_start_off;
 	unsigned int last_instr_end_off;
+	bool is_last;
 };
 
 unsigned int nand_subop_get_addr_start_off(const struct nand_subop *subop,
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

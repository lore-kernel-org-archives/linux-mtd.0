Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59189C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 17:08:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F49600CD
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 17:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05F49600CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z5QPSj5TX/v0nZnpUIE59yAWjBJHuxgyqRFyiR8rJJA=; b=DrrmjzjKr2yInrFxKqeROz74z
	JqJTBJSksD5tFTZ3/ONDjSMawftteb1ePfa2oBqPUI/ELIjo2DPK7MAcrUnMYT9hPgEs+mfjL/DsJ
	LM+31Gw7J5NWk6C60sUEs2dJ8h8RdBR7mINmFcFXOwF9GVxmEHyV8tE8NDO0iAp38dbRNFZcSfsqF
	TNwztC+THLI5ajV2zBkyKRW5UYj9q3Oc5ww59ri79X19MPz/lN35NsvpssRcwR6/2TmRTWNZzf7I3
	CG/3vRVg/0GbjEuyWH6Gt9neHSkT6DMu9h0nkjCWrtp4GWibKjTiWIUrjMoeZIMNVlrbb7vIu6HFd
	hhUgP0SwA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLqhH-00GSb3-Vc; Mon, 15 Mar 2021 17:08:04 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050::465:201])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLqgd-00GSSo-La
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 17:07:26 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4DzjXB3RWZzQjmW;
 Mon, 15 Mar 2021 18:07:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001; 
 t=1615828040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kEfGhvk0205DGLYNIaGn6nAyOPV/3LLcLVfkd/rAuiI=;
 b=DFBJlMSEHlnlWfNPJsddcUA/he6fgO365o48FKJ5JE0PYWMtsDi4fgT5PEQnjgqlrOnCiG
 GyG3JifXUTX1IhmxrzjkAQ1fceshPrAy/8Qa88zgHe/REwNeKYMz+jOh92oi6L7DsZrmk6
 OCRWIrFdr20GoozggL1ydkjSnsra8mXzzmGMH7kguuwrmFSvpdadWbK7s/WeUNKkbxHmb4
 /BQkaycR1xNA8Oe/nDgD8nCG/YVfAd0sJkr6xMWWascJrMPdK0XR+aoyRCqisU3hwcHbCc
 FoeM7BZMyh6+BMKblau6QjSv32e7Y3XR+MVVMrrLtbi0tVoeAk1SnfCamZ6YDQ==
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id NXLcqGeqilJu; Mon, 15 Mar 2021 18:07:19 +0100 (CET)
From: Hauke Mehrtens <hauke@hauke-m.de>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 rafal@milecki.pl, musashino.open@gmail.com,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH 1/2] mtd: parsers: trx: Allow to specify trx-magic in DT
Date: Mon, 15 Mar 2021 18:07:10 +0100
Message-Id: <20210315170711.567358-2-hauke@hauke-m.de>
In-Reply-To: <20210315170711.567358-1-hauke@hauke-m.de>
References: <20210315170711.567358-1-hauke@hauke-m.de>
MIME-Version: 1.0
X-MBO-SPAM-Probability: ***
X-Rspamd-Score: 3.39 / 15.00 / 15.00
X-Rspamd-Queue-Id: 568B7183B
X-Rspamd-UID: eec75f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_170723_862115_784DAF6B 
X-CRM114-Status: GOOD (  14.99  )
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

Buffalo uses a different TRX magic for every device, to be able to use
this trx parser, make it possible to specify the TRX magic in device
tree. If no TRX magic is specified in device tree, the standard value
will be used. This value should only be specified if a vendor chooses to
use a non standard TRX magic.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 .../bindings/mtd/partitions/brcm,trx.txt      |  5 +++++
 drivers/mtd/parsers/parser_trx.c              | 21 ++++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt b/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
index b677147ca4e1..715a18ca36bd 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
+++ b/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
@@ -28,6 +28,11 @@ detected by a software parsing TRX header.
 Required properties:
 - compatible : (required) must be "brcm,trx"
 
+Optional properties:
+
+- trx-magic: TRX magic, if it is different from the default magic
+	     0x30524448 as a u32.
+
 Example:
 
 flash@0 {
diff --git a/drivers/mtd/parsers/parser_trx.c b/drivers/mtd/parsers/parser_trx.c
index 8541182134d4..fd424587caa4 100644
--- a/drivers/mtd/parsers/parser_trx.c
+++ b/drivers/mtd/parsers/parser_trx.c
@@ -47,6 +47,24 @@ static const char *parser_trx_data_part_name(struct mtd_info *master,
 	return "rootfs";
 }
 
+static uint32_t parser_trx_get_magic(struct mtd_info *mtd)
+{
+	uint32_t trx_magic = TRX_MAGIC;
+	struct device_node *np;
+	int err;
+
+	np = mtd_get_of_node(mtd);
+	if (!np)
+		return trx_magic;
+
+	/* Get different magic from device tree if specified */
+	err = of_property_read_u32(np, "trx-magic", &trx_magic);
+	if (err != 0 && err != -EINVAL)
+		pr_err("failed to parse \"trx-magic\" DT attribute, use default: %d\n", err);
+
+	return trx_magic;
+}
+
 static int parser_trx_parse(struct mtd_info *mtd,
 			    const struct mtd_partition **pparts,
 			    struct mtd_part_parser_data *data)
@@ -56,6 +74,7 @@ static int parser_trx_parse(struct mtd_info *mtd,
 	struct trx_header trx;
 	size_t bytes_read;
 	uint8_t curr_part = 0, i = 0;
+	uint32_t trx_magic = parser_trx_get_magic(mtd);
 	int err;
 
 	parts = kcalloc(TRX_PARSER_MAX_PARTS, sizeof(struct mtd_partition),
@@ -70,7 +89,7 @@ static int parser_trx_parse(struct mtd_info *mtd,
 		return err;
 	}
 
-	if (trx.magic != TRX_MAGIC) {
+	if (trx.magic != trx_magic) {
 		kfree(parts);
 		return -ENOENT;
 	}
-- 
2.30.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

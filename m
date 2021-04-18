Return-Path: <SRS0=Qvgb=JP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E705EC433ED
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Apr 2021 21:47:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57BC5610C7
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Apr 2021 21:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57BC5610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UFwd7n6uAs/QamRQlooxYxsEiVXRiLJMk2xztIxR1RQ=; b=Bp4DYAFECmFfyfClIMYRAkqdn
	dDqtlfPafrOrpCmZwmAHekm50nuQ4Hs1UTAxHRby/QdiHFshQuL+cRJ7bGoCqSzez+tWUcLV9FaGO
	f3R/BWPqVpYWMfbEMrFyAnD4FCXk1CErUIZouFk3QQ3tAEzNKmyOWGQY3Ir+6czgEfI9HbKj7APgZ
	b5B1IROmBSqLJM26CPvax5CA3wWfeh9cwwVGJ2XXpG9Tvn+k0sm3a0P/nXcM4rtN8vQ/HCTu9SZEr
	Vp3aObSk1TIpIsfGivcoCnbtU1FrJxy/qcnna1SbEM9NyUVyDHQCCnKsxrGtWw21onKm3iqE+4lKU
	4hYqpk4HQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYFFj-008eIJ-B1; Sun, 18 Apr 2021 21:46:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYFFW-008eH2-V8
 for linux-mtd@desiato.infradead.org; Sun, 18 Apr 2021 21:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Bcn7lcMwbPSmuEHOqgikUEV4OWQ7ML3Pg1Ad6Brw2y4=; b=yG/GyKssIINqmF5/aV2ZizwpYJ
 P6gfysTGY9lfcQwB0flu08npC8eW83xpV3Fh9LW67bnrIE2X1OiNf9kJPXM6Qy2HLMUB6DMCkkLXs
 cvedLNr/n5kVgQihAURPTWIT4qhsGBdK4be2IRcKyMXtvROUTNR4yWet5LJNupePJhIGmd1eSxDIA
 QudjGUnSrTNtpUY7SVPJWumAWOI//pBdZcYZTRL6JMaONozp7K+27Og+838mlBTmC1sjb7oBK21ES
 GblpvjWPh8WOGaPBAgNHCYr32pifZsr8V6b19RnZKteuvtSU43GDxV13Pq6tLEJhgwz4mW2cLCxic
 byw644CQ==;
Received: from mout-p-201.mailbox.org ([2001:67c:2050::465:201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYFFT-00Ai3h-34
 for linux-mtd@lists.infradead.org; Sun, 18 Apr 2021 21:46:37 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4FNk6X3p7jzQjx6;
 Sun, 18 Apr 2021 23:46:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001; 
 t=1618782386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bcn7lcMwbPSmuEHOqgikUEV4OWQ7ML3Pg1Ad6Brw2y4=;
 b=GzASEr/wcqCUeqfPEi7Fo5GYIrBX79Ix7gqjNs19DCxD8+YCDJzpak3QaB58J4Ja9hWx+e
 Y+oVvM00b8GRiu3v4iUnzZ6ZkhNdVgujGLYvNXG6Fy7ysgt1M5/qeFiamK1lzk2Ri7OaBV
 IHtxzvLFu78saNK5jkrI3IRXsC6XohT7cNNE2hTA6qNJTIUfhJMiQorhIcJX2I36W53yj0
 uBHIEVhX4J4qtgt8BU0VwfxARdQGfTCNRRwd5nzKz+hXMbtgYDjOp233NIwRAlmZMUfqJN
 PS/Yy9/q2hVKl0hedEnp+Cc043yknCetBSaTdX01UpNb09wAjlIgAkaBcN5wXA==
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id uGXNupek66Fi; Sun, 18 Apr 2021 23:46:25 +0200 (CEST)
From: Hauke Mehrtens <hauke@hauke-m.de>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 rafal@milecki.pl, musashino.open@gmail.com,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v2 2/3] mtd: parsers: trx: Allow to specify brcm,
 trx-magic in DT
Date: Sun, 18 Apr 2021 23:46:15 +0200
Message-Id: <20210418214616.239574-3-hauke@hauke-m.de>
In-Reply-To: <20210418214616.239574-1-hauke@hauke-m.de>
References: <20210418214616.239574-1-hauke@hauke-m.de>
MIME-Version: 1.0
X-MBO-SPAM-Probability: **
X-Rspamd-Score: 2.57 / 15.00 / 15.00
X-Rspamd-Queue-Id: 8398817E5
X-Rspamd-UID: 9cac81
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_144635_302811_A8A51321 
X-CRM114-Status: GOOD (  12.64  )
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
 drivers/mtd/parsers/parser_trx.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/parser_trx.c b/drivers/mtd/parsers/parser_trx.c
index 8541182134d4..4814cf218e17 100644
--- a/drivers/mtd/parsers/parser_trx.c
+++ b/drivers/mtd/parsers/parser_trx.c
@@ -51,13 +51,20 @@ static int parser_trx_parse(struct mtd_info *mtd,
 			    const struct mtd_partition **pparts,
 			    struct mtd_part_parser_data *data)
 {
+	struct device_node *np = mtd_get_of_node(mtd);
 	struct mtd_partition *parts;
 	struct mtd_partition *part;
 	struct trx_header trx;
 	size_t bytes_read;
 	uint8_t curr_part = 0, i = 0;
+	uint32_t trx_magic = TRX_MAGIC;
 	int err;
 
+	/* Get different magic from device tree if specified */
+	err = of_property_read_u32(np, "brcm,trx-magic", &trx_magic);
+	if (err != 0 && err != -EINVAL)
+		pr_err("failed to parse \"brcm,trx-magic\" DT attribute, using default: %d\n", err);
+
 	parts = kcalloc(TRX_PARSER_MAX_PARTS, sizeof(struct mtd_partition),
 			GFP_KERNEL);
 	if (!parts)
@@ -70,7 +77,7 @@ static int parser_trx_parse(struct mtd_info *mtd,
 		return err;
 	}
 
-	if (trx.magic != TRX_MAGIC) {
+	if (trx.magic != trx_magic) {
 		kfree(parts);
 		return -ENOENT;
 	}
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

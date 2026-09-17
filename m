Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407C5C982CF
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 13:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KjagZNGp7crVu57crkTAgI3VKxX0/DNzvTIX02pwN08=; b=saEqIi+24NH1au
	f5LFVWDoyRRA5UNQuYRpZ2206Y4vOeH6HFbTD92Er06lcls5J4epoojg8ZatZfG+0saY/EKlWx2du
	CFXKeXbz3aKp5Nw/eMWBJ3XHD5gzqBPkxTikmoKhZA7vFJOWCThtqqvo5GkgEmSqTpG+Zwg3qBL4l
	VQ12q2YNKyXMyUl3edITrbYEw6PB+H+vZ8LY7DEjxKaHCGosvkJGBrZwTOuAzXzx2YDbJbo7Sfgb7
	Ny9ZcGpnX8yJeHlpfS+12VeASieSdWi+IyPDqqJO6Lc54IOi+nUxRMyzaUOG2KCg/2W8BGYT2oazv
	X23vuwMQibqDzELl7nXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BjQ-0000000BM9E-4Br4;
	Thu, 17 Sep 2026 13:00:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BjQ-0000000BM8o-1oxQ
	for linux-mtd@lists.infradead.org;
	Thu, 17 Sep 2026 13:00:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D132540B51;
	Thu, 17 Sep 2026 13:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B441EC2BCFA;
	Thu, 17 Sep 2026 13:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789650051;
	bh=M7K41bEmZRs8zEe7ciQ4rClIT6UHkTQUin6UUaJnqrw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DMbFsdVZryHSuLXAkoXUoHDyCQMI0m7RO0Gy7mcQbYVfmnlIm70l4NXQAbil9/nk+
	 M7QHaxVcdN1K2T1Ekfq9rv+M3bRiC3DlNv0ltHd5kFfNgsdA9j6UNSm2SpNAKLLtD1
	 tFkymnwkgxRwkoTQZVtJsI/5lZK0HN0R8Dk35bxW78e5HOdu0M8ZQW+cEBHtQN4RQb
	 NcDWNIYYQ8/iSAIUiz5jFVR1UQp503DI4apgSHhkhiPbPvGqM4NDDqY0H+1iPV0DMS
	 XuzBlwee9ITxeoz3NOsKZ/jM+9JunfnsqiErKr+SVLdw26DQ1mJyIKIk7L2ptnb2KV
	 DTfqmvj0kxYZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3F5C982D5;
	Thu, 17 Sep 2026 13:00:51 +0000 (UTC)
From: Peter-Simon Dieterich via B4 Relay <devnull+peter-simon.dieterich.vaillant-group.com@kernel.org>
Date: Thu, 17 Sep 2026 15:00:43 +0200
Subject: [PATCH 2/2] mtd: rawnand: Reflect that ESMT and GigaDevice share
 ID 0xc8
MIME-Version: 1.0
Message-Id: <20260917-esmt-gd9fu2g8f3a-v1-2-577c0ab2d31a@vaillant-group.com>
References: <20260917-esmt-gd9fu2g8f3a-v1-0-577c0ab2d31a@vaillant-group.com>
In-Reply-To: <20260917-esmt-gd9fu2g8f3a-v1-0-577c0ab2d31a@vaillant-group.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peter-Simon Dieterich <peter-simon.dieterich@vaillant-group.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789650050; l=1759;
 i=peter-simon.dieterich@vaillant-group.com; s=20260820;
 h=from:subject:message-id;
 bh=GVgrbaeNYYC74jEu4meBBZ7WRozFmcBvWG5whH/D0VM=;
 b=l0SsMisYo5Dfq77I3F5DLjARmFARoNm+su+9JXxGB+DtQTaQrbkkGFRcVSCRzJQ4zmwFZdYYk
 oLMu8xtFbkRASk2T/LZE2YjQ83lC8FgGTFHxMwqqWNHGT7upYXwwOT9
X-Developer-Key: i=peter-simon.dieterich@vaillant-group.com; a=ed25519;
 pk=YI8VL1pBCnAIu0GVWI3a6qn/SG0pMQhm9n/RZTI5KZg=
X-Endpoint-Received: by B4 Relay for
 peter-simon.dieterich@vaillant-group.com/20260820 with auth_id=965
X-Original-From: Peter-Simon Dieterich <peter-simon.dieterich@vaillant-group.com>
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
Reply-To: peter-simon.dieterich@vaillant-group.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Peter-Simon Dieterich <peter-simon.dieterich@vaillant-group.com>

JEDEC manufacturer ID 0xc8 is used by both ESMT and GigaDevice, so
nand_esmt.c handles chips from both vendors. Chips from either
vendor are currently reported as "ESMT", which is misleading when
debugging a GigaDevice part.

Rename the manufacturer entry to "ESMT/GigaDevice" and document the
collision next to the NAND_MFR_ESMT definition. The only behavioural
change is the manufacturer name printed at detection time.

Signed-off-by: Peter-Simon Dieterich <peter-simon.dieterich@vaillant-group.com>
---
 drivers/mtd/nand/raw/internals.h | 1 +
 drivers/mtd/nand/raw/nand_ids.c  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index b7162ced9efa..b8b29341b88c 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -19,6 +19,7 @@
 #define NAND_MFR_AMD		0x01
 #define NAND_MFR_ATO		0x9b
 #define NAND_MFR_EON		0x92
+/* ESMT and GigaDevice share the same manufacturer ID. */
 #define NAND_MFR_ESMT		0xc8
 #define NAND_MFR_FUJITSU	0x04
 #define NAND_MFR_HYNIX		0xad
diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index 08707ce9d7c0..9b2dd246398f 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -185,7 +185,7 @@ static const struct nand_manufacturer_desc nand_manufacturer_descs[] = {
 	{NAND_MFR_AMD, "AMD/Spansion", &amd_nand_manuf_ops},
 	{NAND_MFR_ATO, "ATO"},
 	{NAND_MFR_EON, "Eon"},
-	{NAND_MFR_ESMT, "ESMT", &esmt_nand_manuf_ops},
+	{NAND_MFR_ESMT, "ESMT/GigaDevice", &esmt_nand_manuf_ops},
 	{NAND_MFR_FUJITSU, "Fujitsu"},
 	{NAND_MFR_HYNIX, "Hynix", &hynix_nand_manuf_ops},
 	{NAND_MFR_INTEL, "Intel"},

-- 
2.55.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

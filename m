Return-Path: <SRS0=7c/v=ID=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A55CC433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 08:31:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC0ED6501A
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 08:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC0ED6501A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XoFaA76NOm8VGZPys/bR+rRly735B7HS8BOH1caXdBg=; b=DcNOuuKgnon2WZLAjw6ybrwGol
	i8RcwB6yu4v3PkxNFXnPVCEjAXFhIksHyqIa30QlVZKQhXZYaY7njavDcoCwdni5Dyjidn+ZnCR1t
	5PUP5LsshIVvBQ9nlHuLCbPvvxE6VeJmIvnNHm9KmWi/64YrfPMXZJzGc9jTAoK4mYkQ0bR5SyqZW
	ID9vrWRzxkDxmgFijnpqml6fQyZRvZEk1UIMJJIU/egxqATQSOCDRDA8b0Cu4Qkv1wzLA7m4oktjw
	Odf3TKF5EZlDU5vQJPEG0cv13XN5T3AvWfuGXOJCvb/cJ0tCm+pRmRz6Me1gKnnEeOoULyYFt4LKG
	1Z77vstA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI5qn-00E0OE-Du; Fri, 05 Mar 2021 08:30:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI5qQ-00E0IX-1M; Fri, 05 Mar 2021 08:30:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68A8D65011;
 Fri,  5 Mar 2021 08:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614932996;
 bh=9Roq1+ktzTZSK6gD+rBHK9mji+a80aPRur08v7e2wvY=;
 h=Date:From:To:Cc:Subject:From;
 b=o/KIh+GXKNRmP5lEF2qV1cyPu6qDmzDaCPJtTJzinhE5IJdfcIvK5SFVF9W6p6fev
 IRLsoPGPVVdovZu4e4mLsB4kIo1tNMo5hzduk8GfeLQgySFmOaTQyA0yCo+K7x1NF2
 yokgvx7yPhok1MS3EDomQ9YGP/xnE3bxEAa2qc5mrWO+V/zcmAijAjQ7/NCoEruE8J
 gB64g9qhY9FLOL+O5z2tOYBjhRBTykJU4huS5PIuKAqrB30j+katjW7yy1OyXhxCR2
 Zk1YtT8NtcwRVM2UrQVHy2B73gfdF61Zmirqa6hFYht+jZcLv52AfhSgSKggyOqzCI
 wdhnk+SfdHxCw==
Date: Fri, 5 Mar 2021 02:29:53 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v3][next] mtd: rawnand: stm32_fmc2: Fix fall-through warnings
 for Clang
Message-ID: <20210305082953.GA137771@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_082958_662738_2D4316B3 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
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

In preparation to enable -Wimplicit-fallthrough for Clang, fix a couple
of warnings by explicitly adding a couple of break statements instead
of letting the code fall through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v3:
 Update the changelog text according to the actual code change.

Changes in v2:
 Make use of a break statement instead of fallthrough for consistency.
 Link: https://lore.kernel.org/lkml/20201123093347.719a77cf@xps13/

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 550bda4d1415..1c277fbb91f2 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -531,6 +531,7 @@ static int stm32_fmc2_nfc_ham_correct(struct nand_chip *chip, u8 *dat,
 		switch (b % 4) {
 		case 2:
 			bit_position += shifting;
+			break;
 		case 1:
 			break;
 		default:
@@ -546,6 +547,7 @@ static int stm32_fmc2_nfc_ham_correct(struct nand_chip *chip, u8 *dat,
 		switch (b % 4) {
 		case 2:
 			byte_addr += shifting;
+			break;
 		case 1:
 			break;
 		default:
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

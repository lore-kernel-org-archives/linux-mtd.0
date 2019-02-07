Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769A3C282C4
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 10:51:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 472D521904
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 10:51:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MYpkwwcI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M73rrZ2+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 472D521904
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=j65Np7MM9em6jN4bTLx4kZXqSs+MhjoH1Z1PK81ZUjE=; b=MYp
	kwwcI92De2bEywCa2fzk8MmEFiaz0BRqERAIXFS4Injyuk/Tri4kEup6rkSmZycKtWSrESqZkNuow
	t6LiRwNi1youYMp+7i+1rcT5KGVNQGMRsOQq85VwI67lnhjFsbh4QwFf9ZICVLzQ4hXr8yk3Bl69p
	FCSz7z7ASJtC/e8NtNH6IgTGAHhLcSjrkblTmP5iT5ABbOkyGyWPs2fCBkIdo/9h3WeMYnfceRmU6
	N3KHZTmJT1JcN20zYXrUe5rDVJCkvJdh3FfkVNkokZvYdBW5MKZZROZxzYPzYmRug75w0rMobr1C4
	4nh9VrDm5INaQoSCH96ba1WSSEDPY1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grhGw-0005yk-Jz; Thu, 07 Feb 2019 10:51:10 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grhGt-0005yP-MD
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 10:51:09 +0000
Received: by mail-qk1-x743.google.com with SMTP id x9so2563382qkf.0
 for <linux-mtd@lists.infradead.org>; Thu, 07 Feb 2019 02:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7CjmbxfMisrlfpbjK4oLBz5EaPD9dYQZE6gfKm+VEiU=;
 b=M73rrZ2+QH91qqw6Wx9UdkfwYRE0IM+EugRcyhKsCYlKM44ims+uJ7ePuY1OEeN6jZ
 2kKY9bpxshmoek3OaUtAOvXo/ftOTXjaK4NTsl94Bw6LXBYQ9JzjlXkm/WHejALiwhms
 GjfRYER6mBRRwhIjNeGCzNA9xb5kL1YwKgJOmP5elPzHlzlHoHKGrEN8gx1nu7pUCVlY
 ulZTkStFOzC1r0d/3Qoz8BmEXMWwvnkAd/gPLyjkODJkBfFnQPGf2KggL80h7dlKp4mM
 3fPkmxQjrv1JmAdsBhZ0VXI4xIRG4s8NWfuuk1a9oYsickDHhBBGqOYnoCCisuQtZWX6
 qWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7CjmbxfMisrlfpbjK4oLBz5EaPD9dYQZE6gfKm+VEiU=;
 b=H9b5oyyYMHYjlm3BdpP9M+S2pEK+HXK1wqEeRRrazCe4Wj4PcmR5ptCf4cKGY/o0Cr
 9mTgChz4vVKsLhlVyc28Uezls5IWYn+gPHp5UKMeYtSd2Dk4nSRKPUG1zkFigAB5gAYu
 3fO+YRmPpQ7OiWUDOkk7FgDGsqYowsaRxrxUFVNrrcC14FQnirARhXKK9ArG6n6b+a+s
 jn2U80egCzkM8FAs3PxSJ/9P5RPso12i2JLYOBfXcOl2NLrFbzxid/+e33vdQqh0qNB4
 ALc6CjrW+s+rIWNTb61L1MYRtbKVZR9NbINwlcUyZeFuS2/BEzLoQa87dZkD0kYMd+j+
 mLMA==
X-Gm-Message-State: AHQUAuZGHIxdYiDuXYAmbjrvP7M035ql80588rJOnVAY8MdMdLj4iG6J
 Y/O7mKfWZ2J8Md1xN+DW1Xw=
X-Google-Smtp-Source: AHgI3IZjLZffg1SGo2ScaOkIMEIwD//y2QxM0AdWuA1auimr9klD9tWTSBRUX+oIbnHzbKhYxyfqFw==
X-Received: by 2002:ae9:e211:: with SMTP id c17mr7682723qkc.290.1549536666501; 
 Thu, 07 Feb 2019 02:51:06 -0800 (PST)
Received: from fabio-Latitude-E5450.nxp.com ([2804:14c:482:a73::1])
 by smtp.gmail.com with ESMTPSA id s48sm4256597qts.47.2019.02.07.02.51.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Feb 2019 02:51:05 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: bbrezillon@kernel.org
Subject: [PATCH] mtd: rawnand: gpmi: Introduce GPMI_IS_MXS() macro
Date: Thu,  7 Feb 2019 08:50:54 -0200
Message-Id: <20190207105055.10860-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_025107_755000_C0C7B882 
X-CRM114-Status: GOOD (  12.58  )
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
Cc: han.xu@nxp.com, martin.kepplinger@ginzinger.com,
 linux-mtd@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 miquel.raynal@bootlin.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Introduce a GPMI_IS_MXS() macro to take into account the cases
when mx23 or mx28 are used, which helps readability.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  | 6 ++----
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h | 1 +
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
index a4768df5083f..a8b26d2e793c 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
@@ -157,8 +157,7 @@ int gpmi_init(struct gpmi_nand_data *this)
 	 * Reset BCH here, too. We got failures otherwise :(
 	 * See later BCH reset for explanation of MX23 and MX28 handling
 	 */
-	ret = gpmi_reset_block(r->bch_regs,
-			       GPMI_IS_MX23(this) || GPMI_IS_MX28(this));
+	ret = gpmi_reset_block(r->bch_regs, GPMI_IS_MXS(this));
 	if (ret)
 		goto err_out;
 
@@ -266,8 +265,7 @@ int bch_set_geometry(struct gpmi_nand_data *this)
 	* chip, otherwise it will lock up. So we skip resetting BCH on the MX23.
 	* and MX28.
 	*/
-	ret = gpmi_reset_block(r->bch_regs,
-			       GPMI_IS_MX23(this) || GPMI_IS_MX28(this));
+	ret = gpmi_reset_block(r->bch_regs, GPMI_IS_MXS(this));
 	if (ret)
 		goto err_out;
 
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index ed405c9434fe..bcf5328cf239 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -171,7 +171,7 @@ static inline bool gpmi_check_ecc(struct gpmi_nand_data *this)
 	struct bch_geometry *geo = &this->bch_geometry;
 
 	/* Do the sanity check. */
-	if (GPMI_IS_MX23(this) || GPMI_IS_MX28(this)) {
+	if (GPMI_IS_MXS(this)) {
 		/* The mx23/mx28 only support the GF13. */
 		if (geo->gf_len == 14)
 			return false;
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
index d0b79bac2728..a804a4a5bd46 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
@@ -207,4 +207,5 @@ void gpmi_copy_bits(u8 *dst, size_t dst_bit_off,
 
 #define GPMI_IS_MX6(x)		(GPMI_IS_MX6Q(x) || GPMI_IS_MX6SX(x) || \
 				 GPMI_IS_MX7D(x))
+#define GPMI_IS_MXS(x)		(GPMI_IS_MX23(x) || GPMI_IS_MX28(x))
 #endif
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

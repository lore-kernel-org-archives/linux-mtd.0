Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5052C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Mar 2022 16:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fM4yYTFzUgIFQC7i2Ka9rnqc3PcNZtKoiUkWOsz6lRI=; b=jKMPOt29sQhlpM
	O/3jE8QW1hRDT9R4Ky/UccVc5iMGnqUcvpVuI+iSn/BWXpN8L+Z3/m4N1dBtPNr6QcarcSeJ49eSi
	wUPHd1H+BfJ0ID3qoh8TnY4hCcvacfBQsWOGC8wkyQZBi067UWWPguh4hPKl53tozuLXl02O8llxD
	nJwE1ExHziAuLDwqji5HfmrahupNtIEguBCewYewU+NlbxhgxsqPnPhE2rhvtk+SxNUmdl1qkEvG+
	Zqpa3SWjb5tYuui4ID6ICXwhI/2cKz0azDjHn1iYSEIbs2LFTZRXZL0M6/8MVGYO86kzTfnI55Y1s
	MIbbkAP9UgiL7sm1x9eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUAUE-009wlA-Ba; Tue, 15 Mar 2022 16:57:30 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUATt-009wex-6v
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2022 16:57:10 +0000
Received: by mail-pl1-x62c.google.com with SMTP id e13so16747722plh.3
 for <linux-mtd@lists.infradead.org>; Tue, 15 Mar 2022 09:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sZYOe+A3oC1fCNmMc9UqSewRIWLOsh6xjndXGY2xoNQ=;
 b=F66OOnf5YxYSQPa4Ft9NT8XE/vImYLd6gqhpRTNTTxeHTjEhdWe04IgrOtV2rzjDd0
 emgWslL4rZi8lRHu6TJTRTCN58AFPsS98P3xqsNVnmge1OiQr+KLY0fblAda+3L62VJb
 VGCV7Q8WA8oshFXVNK6kzTGveJ87rujbii9Zex/kvMdtTYWvhyJKI8jnrwDuFTW8Ug85
 NCArB/m7jDdcncUxgtGSVzXg+taFwgTviiCrC9oCIKXfluePt1rZ7tyGHB8ygR4mbavZ
 i63EGZYGcwuQV9MYAk6QwuCkgsEZU+0LsL3/0lrJnN9S2q0grSr9aS8LqtSeUwj02JEj
 dYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sZYOe+A3oC1fCNmMc9UqSewRIWLOsh6xjndXGY2xoNQ=;
 b=STvoFXZEnwLLu90Iz4qkpXov4WWadvKY/CuMQspofWrf4j7ogh3sjeCye2hSW39wz+
 hlWnXDFwSLU97UVE8Zj3N14csSEBBjR7/pf4pyoMNQ4OOagieanHu3oR+EZaLQ9K0UTl
 4UMJkd+VYIpfLh3Znq21cK3iHXSBzk4Sw+oDOlhXqBni88fJQlruDwSZJ834trgjvkg5
 KOhrMCCcSU+FlLzmY4H8pD7piLuBqaLoh/1KguScSBCasl7jOzBRkjZv9YSgVDCTxEkY
 S4fX/3mOVSkapuGPKqORAzWrXmaX8mCHkW2IXscFLcFCg7MCvfMOaEVOT3L3rVGt/lTK
 gDFg==
X-Gm-Message-State: AOAM533mzuwzZXChz/82P6uaVp7NErfOMQdljpLrM+/LN9YtWsnNt6fw
 ghPJHHdsM4U9websQA6p7yA=
X-Google-Smtp-Source: ABdhPJyfChb4/6khUHa/0Gd/YGba2eBXMUPIeZKQ91T5JOQbSyRIJmsREVHsJOK9n+7DxGl8vK4y7w==
X-Received: by 2002:a17:90b:4f8e:b0:1bf:8b95:da05 with SMTP id
 qe14-20020a17090b4f8e00b001bf8b95da05mr5666557pjb.216.1647363427230; 
 Tue, 15 Mar 2022 09:57:07 -0700 (PDT)
Received: from tokunori-desktop.flets-east.jp
 ([240b:10:2720:5500:3e36:8008:b94b:774d])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a056a00140a00b004c55d0dcbd1sm24835809pfu.120.2022.03.15.09.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 09:57:06 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami.t@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 stable@vger.kernel.org
Subject: [PATCH v3 3/3] mtd: cfi_cmdset_0002: Use chip_ready() for write on
 S29GL064N
Date: Wed, 16 Mar 2022 01:56:07 +0900
Message-Id: <20220315165607.390070-4-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220315165607.390070-1-ikegami.t@gmail.com>
References: <20220315165607.390070-1-ikegami.t@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_095709_277199_1A79EDC0 
X-CRM114-Status: GOOD (  13.72  )
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

As pointed out by this bug report [1], the buffered write is now broken on
S29GL064N. The reason is that changed the buffered write to use chip_good
instead of chip_ready. One way to solve the issue is to revert the change
partially to use chip_ready for S29GL064N since the way of least surprise.

[1] https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/

Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Tested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 8f3f0309dc03..fa11db066c99 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -867,10 +867,20 @@ static int __xipram chip_good(struct map_info *map, struct flchip *chip,
 	return chip_check(map, chip, addr, &expected);
 }
 
+static bool __xipram cfi_use_chip_ready_for_write(struct map_info *map)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+
+	return cfi->mfr == CFI_MFR_AMD && cfi->id == S29GL064N_MN12;
+}
+
 static int __xipram chip_good_for_write(struct map_info *map,
 					struct flchip *chip, unsigned long addr,
 					map_word expected)
 {
+	if (cfi_use_chip_ready_for_write(map))
+		return chip_ready(map, chip, addr);
+
 	return chip_good(map, chip, addr, expected);
 }
 
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

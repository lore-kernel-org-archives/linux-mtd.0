Return-Path: <SRS0=SnlB=FI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0E8C4361A
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Dec 2020 15:01:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF60C22B2D
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Dec 2020 15:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF60C22B2D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkXDvYryz0g2X214rWe/ugYHhb9QWsPclQcw/BFzl0w=; b=c2CKFv+mMKQrwIGsG47QmQvrFS
	b9tcQhU8+tGSDsx6GQsRYVK7oTvnxBOKzXnGDn+uzpI8lX05pNfls8fSYKipX7tw+Mwg9OYTsMUSX
	zIAbehKuWuSBTPwL4R43bCBUd0dXDkmahA3BzzQ1CbURpjBsEiNvij3fBbx/hU/JTL/zicpax42+q
	X7rMMhBXI1qjNSLxmXRu0gsZ0fEXTyzZgwp9jN5FEYWYD/iW6gHZH1qeflgUJoZ16CB7h5dBAk4VL
	slRHdSfg0fo2ySuY9yOQ44iB16zWCMFsdQCrSSPXjw/kCkkvkMPfvSmZ6g5jgjFMfQHj8VjgQp9CL
	3y4NYpqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klCZp-0000nE-2j; Fri, 04 Dec 2020 15:00:53 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klCZj-0000ko-GA
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2020 15:00:49 +0000
Received: by mail-qt1-x842.google.com with SMTP id l7so4068556qtp.8
 for <linux-mtd@lists.infradead.org>; Fri, 04 Dec 2020 07:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qleO8M+WXJdEU0AezE0Gsb+HzikHnU9EzBeKI5HtrQo=;
 b=kbTXpbUmXmHE8k/8nfqNo8Mem8w7ovGTrnER+sr/zSRfPnJ0O6zIKN3vYkFDj7CiJO
 oKMFIMl1deXNrmJYshWV2Evr0fbRLNE8d+EJ9WEntluL9wgK9zquY8pUFyFtHMTVhl8F
 00Psm6bsWZYEfEPeAKnuplcy7jE/H0acnzo4aPMXQ6Zm7sLqWdhol0YwQzk0lSYeT8He
 jQiZ8XLBIYQMJwpOLHURdIHSD6PAK3KsoMpV+QFeKpZTiKKIL/AOgJjyJJf8pOqFjzW1
 TZtuwchdGtOJNqg+KULMeeF/Jo1lXlR2xXQyEGvb5x8CPyW+3pu7QxlHfQcEv/ieUhRj
 rrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qleO8M+WXJdEU0AezE0Gsb+HzikHnU9EzBeKI5HtrQo=;
 b=bqmbWo04fqtwu4dY1aroRTqcDFiNOj7cSzzUTD1meVo8jfpP3whDzWGuNwf0Fw2cXK
 HtVAyDDZ2wMqslMmsXmDjmYZHzdiDmvWVcciMsabKpfLZ61Gpcv7I5HlBr9uA85XmN6W
 K9uiDJol9n3qugvvjvEIyTvt6bN0KJrW7rl1NffmHstn3puNkRRyQkaFc9Djz/ZU2pqk
 iGlnWv2gU0o+gueK7UtAE9koX8AsQqTuI1uFPO4MFPzROX9Ih31NF3sU5A9YQaj0ohM4
 cnyLl3Xnkvuqm5wrPmBSq84+Xe3YuaNruDPKTJMLKjPudHkvV3pIe0ruWciKUbLysPla
 C2PA==
X-Gm-Message-State: AOAM532z/ohLpAeCqRNTCeC1OJhR3nwasZVKX3dUBZ46RaaU7qU7nOSn
 0pmhtlvsdkd/aUc0l4DMk+w=
X-Google-Smtp-Source: ABdhPJzA9c9IXytQ711eHoOZy46CavA0lU24kmCCr2tqHM1m/Pm2BQS2YXyT4Zm31/eVT1Ti3CyeeQ==
X-Received: by 2002:a05:622a:d:: with SMTP id
 x13mr9784189qtw.374.1607094045144; 
 Fri, 04 Dec 2020 07:00:45 -0800 (PST)
Received: from localhost.localdomain ([177.194.72.74])
 by smtp.gmail.com with ESMTPSA id h26sm4806456qkh.127.2020.12.04.07.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 07:00:44 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [PATCH 2/2] mtd: rawnand: mxc: Use a single line for of_device_id
Date: Fri,  4 Dec 2020 11:58:18 -0300
Message-Id: <20201204145818.32739-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201204145818.32739-1-festevam@gmail.com>
References: <20201204145818.32739-1-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_100047_577400_DF7D9C3B 
X-CRM114-Status: GOOD (  13.37  )
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
Cc: Fabio Estevam <festevam@gmail.com>, linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The .compatible and .data pairs can be stored in a single line, which
makes the code more concise.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index d5c445eb93ad..fd705dd1768d 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1610,22 +1610,11 @@ static inline int is_imx53_nfc(struct mxc_nand_host *host)
 }
 
 static const struct of_device_id mxcnd_dt_ids[] = {
-	{
-		.compatible = "fsl,imx21-nand",
-		.data = &imx21_nand_devtype_data,
-	}, {
-		.compatible = "fsl,imx27-nand",
-		.data = &imx27_nand_devtype_data,
-	}, {
-		.compatible = "fsl,imx25-nand",
-		.data = &imx25_nand_devtype_data,
-	}, {
-		.compatible = "fsl,imx51-nand",
-		.data = &imx51_nand_devtype_data,
-	}, {
-		.compatible = "fsl,imx53-nand",
-		.data = &imx53_nand_devtype_data,
-	},
+	{ .compatible = "fsl,imx21-nand", .data = &imx21_nand_devtype_data, },
+	{ .compatible = "fsl,imx27-nand", .data = &imx27_nand_devtype_data, },
+	{ .compatible = "fsl,imx25-nand", .data = &imx25_nand_devtype_data, },
+	{ .compatible = "fsl,imx51-nand", .data = &imx51_nand_devtype_data, },
+	{ .compatible = "fsl,imx53-nand", .data = &imx53_nand_devtype_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mxcnd_dt_ids);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

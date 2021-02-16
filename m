Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0999C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 21:27:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A246064E08
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 21:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A246064E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8ndSUEJOokxGBOuwVyQKM05ymxvllZA7nCbpIowK3h8=; b=Rgd6s5A+vegInqukeYpPOaDle
	wpTb2p4GSaOgZ98yokY0mOeUwDUYMfVP5YWqy6izTYWlEff8SHgdw3azGIb7VhfK5g43y4R8Avw71
	/EKsjugFaw+1lJOKdfIbtUHC0QJqQmuEXXKGNxNOTKOndlHvtdhYS5f0ihW3LPFX0Alk/x95ih6/4
	VbPWf5sAQyVJ65SXtfMid5/7sJQDfiBbgIXj7B3EaWHHUgz1q0virT1+is8yQjfBL1EEL6pUph0HE
	bdC+gGpPVKq61g41a0CPtXm3NlOU/ebQ5xvr6ITr3vk3g2YZ6sORH+zfLg1/DEfwfjaZI5kJRSrnW
	DOtzin6zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC7sF-0004Zj-Je; Tue, 16 Feb 2021 21:27:11 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC7sC-0004Yq-Or
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 21:27:10 +0000
Received: by mail-wr1-x42a.google.com with SMTP id b3so15056559wrj.5
 for <linux-mtd@lists.infradead.org>; Tue, 16 Feb 2021 13:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GDofa5l7P6G0aPshCRUpeDnHopahisIJ3Z8CdpNi7O8=;
 b=EaxJ5CEL06ZrL7LAe9TlR5b7kiHOmU47EzQvPcKa8nlwaykJh4kgBLOjTIto8Tew0W
 pagLkvyl6VZhgjag9+87+Y8R6iT4r8gRzCuBW3o6Vzpft9KaiXAucNkkuZGy+JDZbLSu
 kUn99XJUjerF7D+DzNPnHRjbIizQXwettsJ+CAySvhup+TiQEQhj8AlXHL+ikuDN8ZAC
 JGLKxMpc0UlK1j8yVLDBnaa5CmPqHtDJBgnbQoqM54N2LyMtS5B8dW/4niQWyO6BDKW3
 1i/r6ShckSkNS+FC9WMI6ab3O0jK2tpVfpDfj6tG+L1eIrOovjWjo1LqBhzJmdgl3J0Y
 KSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GDofa5l7P6G0aPshCRUpeDnHopahisIJ3Z8CdpNi7O8=;
 b=pWZE/ZA+CvVS/OTNstb152x5FO4X9GiU1DPz2qpZFGrmRl0daVyxoX2mLZpzkvdkbq
 Js5Q5TKyyZn0pm+rOk+gRYdbN0vQ2Vbv/UlEsF/YLv1OtQNs+lPmNLCtxS5Cnn/NMXvI
 VlL7DhSf+P67b2gWeceg53yFK8hslycNxHvtmexhrGJi9AXVFBV4Pv7h7nP8GpSE1Sbf
 /lkIjoeRAwLUHADJ5K9A6goZ2arHHQkE+W786YPw3ufo3Lqf/oDxfD2tuWwvp/ovR/bA
 2diPQbK2SZZTY+/pU9Jm8/F8xRTcpp7YlGBWet/k+j4WnJYMv3Icc25Ov4k7Y5Fa2aD/
 91ww==
X-Gm-Message-State: AOAM531aLF8EXNO1nYoe4AmmH4pJwp2OrrahUEVrFDgRrO7Ox35zg2DQ
 4yigmadFRih5Wya+JOhmTj4=
X-Google-Smtp-Source: ABdhPJxGN5rFGltSfdK4JsTkjNuZGmY97moou1E5YYGCHexloAkgXNVPxE6lGC8yljZHXMBTwjXI8g==
X-Received: by 2002:adf:bbca:: with SMTP id z10mr25753146wrg.168.1613510827298; 
 Tue, 16 Feb 2021 13:27:07 -0800 (PST)
Received: from Ansuel-xps.localdomain
 (host-87-6-252-11.retail.telecomitalia.it. [87.6.252.11])
 by smtp.googlemail.com with ESMTPSA id s14sm7132182wmj.23.2021.02.16.13.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 13:27:07 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 2/3] mtd: core: add nvmem-partitions compatible to parse
 mtd as nvmem cells
Date: Tue, 16 Feb 2021 22:26:27 +0100
Message-Id: <20210216212638.28382-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216212638.28382-1-ansuelsmth@gmail.com>
References: <20210216212638.28382-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_162709_254318_3E2EFD0E 
X-CRM114-Status: GOOD (  14.50  )
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ansuel Smith <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Partitions that contains the nvmem-partitions compatible will register
their direct subonodes as nvmem cells and the node will be treated as a
nvmem provider.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/mtdcore.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 2d6423d89a17..29d257678a86 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -531,6 +531,7 @@ static int mtd_nvmem_reg_read(void *priv, unsigned int offset,
 
 static int mtd_nvmem_add(struct mtd_info *mtd)
 {
+	struct device_node *node = mtd_get_of_node(mtd);
 	struct nvmem_config config = {};
 
 	config.id = -1;
@@ -543,7 +544,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	config.stride = 1;
 	config.read_only = true;
 	config.root_only = true;
-	config.no_of_node = true;
+	config.no_of_node = !of_device_is_compatible(node, "nvmem-partitions");
 	config.priv = mtd;
 
 	mtd->nvmem = nvmem_register(&config);
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

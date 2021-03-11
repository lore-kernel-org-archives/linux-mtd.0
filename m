Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CFDC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 12:20:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFDD764FEC
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 12:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFDD764FEC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VR4LpCg7LR4Bt0d+Jc8kOFoMmf4d07glJya4Aqkc1N8=; b=fmqDi6xtY2KKfh+LY/6vZWJgIj
	167MgnC2bEmRUXDNU9sOGMhB7woxI3l/lvaZvYxgN64tHjJM45VXOK10bnFjinQcVOcH863sghVzi
	d1jQrfgGWmu3uRhOxwQTI5i8TR+u0hbP1ym6T7etpgJXSjof38n6WdtkaGsK1rwUexv6qTU0BU+IH
	OYgnOxLeDxi0smCJTIv5aMUNLgWmbLwk1e39tydTAlNNjdBYFinGFlPtHUL3g4JJuHD32auD7bkGS
	67WknL9gis2OhYGnXJ3CYyqNSKRDx2M3G7p0yzU9m4oWjIo7BcZ7TfmRUtziIkztHEFoPjm5punoC
	CnKlMIQQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKKIB-0094Nl-C4; Thu, 11 Mar 2021 12:19:51 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKKI7-0094Ml-9Q
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 12:19:49 +0000
Received: by mail-ed1-x52e.google.com with SMTP id bf3so2437538edb.6
 for <linux-mtd@lists.infradead.org>; Thu, 11 Mar 2021 04:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AIJvF8THgvNIIJY7o0rd8q2CMHcgDSy7Mtu5dW42sFA=;
 b=A19s8+jcTYLYpRsTm88vI1YTqVcVLHEihep/7ZY6UKdqCHWbLvtkAlSJH+ioQtAGT3
 kMC0ktX5vY5B9g/NbCbtFtostd/bOd9CNm2niBhWsLdZVVchgJsCRjjQVIz/Ns7t9lOA
 1EwZCUL6g9JBywi5pfxET3aZRozHxgndsfPi5RPH1oENyXJNo8F3RNooDluSJdYbq/L/
 XnsIiFPDIBmP/Vd3CaZgpaBALxGBNcbU/xlvhG13bJaLC895HqtDVGgm3LkJoEKNZ1GP
 BMrMERCqSiEvoR0+gtEVhhPkT7KwU2Eg3Dr7YIS8NoLmZfu+u45bKCgKpOgXOHJo0BLz
 E19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AIJvF8THgvNIIJY7o0rd8q2CMHcgDSy7Mtu5dW42sFA=;
 b=uMQNXlVyuYRoYDxBGavL1+G3nWL1LcEgFLDuQQa53uuHisYZrvJ9B/lmXx6gMSYKr9
 +qwXnGFRzfHXObVYGKJHhYj//lS174yIuGALRreFRZOlh4Z3aODE+NyYClWfZFgw29Zc
 jigqjSpUqDP3pT48P4jYxIUATjWXkbtctrPqsJRYGYuW0zVJ0YhAlVn8EvyTJoUo9Oq6
 uimSFwz3Uw7P8tBR4PXWZ9HPnH0DDfOfcBvu5SNFre3UV0YVz8SY3HnEWWLpD2S0bknI
 FM3irZXm+r72mP9Jir/Yznhzj0VAtClDIS0rOSHJOl1n4niJzyL+ZsUvY6fHfUYZt35H
 Vy9g==
X-Gm-Message-State: AOAM532ZUCouPPuMDmSozgQXvQ70iY4OQ79wj9wnJjb3svHJHwCCus4A
 EUy7uKjfKrIna58aubF6YQE=
X-Google-Smtp-Source: ABdhPJwhxUYujpvYF+ZFXc/c5AA8Ze9yPl1neq05v/Fn2/yyq/4oZ00TbhKSx6vBEzMJaZG9V9Jg0g==
X-Received: by 2002:aa7:c9c8:: with SMTP id i8mr8096195edt.193.1615465185761; 
 Thu, 11 Mar 2021 04:19:45 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it.
 [93.35.189.2])
 by smtp.googlemail.com with ESMTPSA id c7sm1273748edk.50.2021.03.11.04.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 04:19:45 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Ansuel Smith <ansuelsmth@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] mtd: core: add nvmem-cells compatible to parse mtd as
 nvmem cells
Date: Thu, 11 Mar 2021 06:12:47 +0100
Message-Id: <20210311051309.16789-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_121947_370478_EE231EE4 
X-CRM114-Status: GOOD (  12.40  )
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

Partitions that contains the nvmem-cells compatible will register
their direct subonodes as nvmem cells and the node will be treated as a
nvmem provider.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/mtdcore.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 2d6423d89a17..ac1b4f176a17 100644
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
+	config.no_of_node = !of_device_is_compatible(node, "nvmem-cells");
 	config.priv = mtd;
 
 	mtd->nvmem = nvmem_register(&config);
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

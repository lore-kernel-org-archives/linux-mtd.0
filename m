Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11997C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:43:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE6E164FA8
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE6E164FA8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bJmaB1o95KOTG7OJ7E5BIinCV/8C1K0M5+0uZ2TmHT4=; b=CbD4zIU1trbKi7gxGCtCHOEvw
	sQ8RYn0blJKugSJ7BIhDnIGxpH03ZGwPR6Zcsx2Z7Fwwodnz4a2uKVV1D4y3x8Kuly3I22tT3sOdc
	Bqb3Qs5HFHJSwWqp42rn6PICsB+tvmwlpaKd9Cg6V+WS6ds95gu3jrItO5nlh6Sq8+Tx77gtrOt3O
	CEu8MKSbc3/FeaGd46ZcUefC35/sHXsdhMw/m2TItIGgepo62OlS6QdFG1VXQXb2/7oMVSgZVauhz
	yWKRusyuNam1o0soBbZ+6V1Oph1ZGcgWGui9mewTlpCfqfYS16gBtRYMCRFzBgYxOxo2n4FwK8nAV
	5hIUpn9YQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKeK4-00B3VL-LJ; Fri, 12 Mar 2021 09:43:08 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKeK0-00B3US-3m
 for linux-mtd@lists.infradead.org; Fri, 12 Mar 2021 09:43:06 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so10806976pjb.0
 for <linux-mtd@lists.infradead.org>; Fri, 12 Mar 2021 01:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sZbyHzGQSp++PWv8fWCyIqIjM4KTmN6wmqXa4pxfXvA=;
 b=bqkdjIwtQyyFwct3wYTkHBhscjKGXNKcskDMu7Q01o3sSxIKjmtzDJMjnMJwQpLHIV
 rxsN2wUdV4FFJyAjznSlLMxbWab6GbaNKpX0k4fO2ckRQHHDigUU4bdsMIlfRoxtF19Z
 aUj/l1gv9Vn+nmgxRP7cRTBncn2llJIfVoBBJhNE86EdNWGB0cyrpREye1PkDBr2c7Nf
 Q2aiBzxCQClsTND0GYW8L43cn1yT42eIBqZcim6YWIAuETkZ1I08fxsqyY2yGO8ZuKrq
 8aiEiIDzxAZiJX0nPB9o6i9/Pc8jweCVvK7Dc5Wjj+zTYWq9gDjMH5KTG+C4ZE9xCLy4
 mPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sZbyHzGQSp++PWv8fWCyIqIjM4KTmN6wmqXa4pxfXvA=;
 b=XMcyVgHZFEyHinxqNjbhtUlAaXRjjUzizY09syIXKFz3qJQFHoY9/XrP3AesCmk75a
 AzluzbJ6mrtjJWYbaVujgUiIErqKgyMbMpRlTBm1XxLmixfd49XvRJLdIKMGeQitsuC2
 eciiLqPZCtB1lcP3WSBTn2d5ASzbwAmojNB578ENbp20r2j+meo0zoJlONHuwc1Z4BbS
 GSRyWDv7X9mCvqXENtsD6YpHT4wTEWDDZohPvnGptK63oCYwzUfTWwu0ULEXP8GIC2is
 E+SskYAQ2dHAMjN6Pk5xg8KvWkpLbRThQ9jMSQ77ipAIZoduOPT2x8LpOKvSXzQv9DS9
 flPg==
X-Gm-Message-State: AOAM530TNCqI3L4DiyonN62cqqGOKogJA49W9HeGgckQfdkoOaMr7DeJ
 2qDKIzVOYlDoKqsHrtKQPQwsJ7iIG0nD/g==
X-Google-Smtp-Source: ABdhPJx/CtV/usr3GLtIxM89mneJKqyjf31kVx43NInGBSatGESz6p9LqASNkb/nU0IQrb6ozduEIg==
X-Received: by 2002:a17:90a:8a0f:: with SMTP id
 w15mr13113555pjn.200.1615542182646; 
 Fri, 12 Mar 2021 01:43:02 -0800 (PST)
Received: from ISCNPF1JZGWX.tyo.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id u2sm1748992pjy.14.2021.03.12.01.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 01:43:02 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, Yaliang.Wang@windriver.com,
 tkuw584924@gmail.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 2/6] mtd: spi-nor: core: Expose spi_nor_clear_sr() to
 manufacturer drivers
Date: Fri, 12 Mar 2021 18:42:47 +0900
Message-Id: <aab1376d1da139c8e347bb40e6561ec3b7359dbc.1615523176.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
References: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_094304_276200_34A10153 
X-CRM114-Status: GOOD (  11.25  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

spi_nor_clear_sr() needs to be called from manufacturer drivers that
implement the ->ready() hook.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Changes in v3:
  - New in v3
  
 drivers/mtd/spi-nor/core.c | 2 +-
 drivers/mtd/spi-nor/core.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index c8a7f246ab7d..3ca199bb83e3 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -653,7 +653,7 @@ static int spi_nor_xsr_ready(struct spi_nor *nor)
  * spi_nor_clear_sr() - Clear the Status Register.
  * @nor:	pointer to 'struct spi_nor'.
  */
-static void spi_nor_clear_sr(struct spi_nor *nor)
+void spi_nor_clear_sr(struct spi_nor *nor)
 {
 	int ret;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 4d06c27630fe..596480aef924 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -447,6 +447,7 @@ int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);
 int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
 int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
 
+void spi_nor_clear_sr(struct spi_nor *nor);
 int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr);
 ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
 			  u8 *buf);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

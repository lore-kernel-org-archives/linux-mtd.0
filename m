Return-Path: <SRS0=nVbp=KU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16937C47086
	for <linux-mtd@archiver.kernel.org>; Tue, 25 May 2021 23:10:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD656613E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 May 2021 23:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD656613E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/rQnGqAyB+hlth/fj9k05jYvuZ6bBMYmlLHO6RNGl7U=; b=A8QK9C/r6pA4iB
	nFSs7Tyr1y1qLAA2you/UM1U9yAPSjtiwCW1yf3cI9wovM6tAoL5ZHGqAyQTaE2XlFwZz1E1CQe/k
	2dYwWNjnbjOzDDQNUWaVxiIaPHg77O71pYSG33a3WOIg7atQ+YlCTjkwVAXaGe89lpUO7a1tKouiz
	4yhg7ZqATyVD1ZrwuoUS0dEYxjhverVY+O/szpkXqVxR5omjabw2wpfJpJKKBsyUzPkhCCiAa0s+B
	W1/23gRSjUPRzBMj2q5y23PtnNbvd3KAwi1iROYl3k69Q63InRMhn2XozxOg7xnSsX5M6qKmRuVh/
	3oedHX1kPb3GahGaQNAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llgBG-0095Lx-1m; Tue, 25 May 2021 23:09:46 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llgBD-0095Jk-3k
 for linux-mtd@lists.infradead.org; Tue, 25 May 2021 23:09:44 +0000
Received: by mail-ed1-x52b.google.com with SMTP id y7so20682039eda.2
 for <linux-mtd@lists.infradead.org>; Tue, 25 May 2021 16:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X1MvS/6mSvBdfpSbPfN/7JJWpwiBa9tcmoBU0a7X3Cs=;
 b=JbhzrHYWbaZWQbBevPTwVRlDDqmSjaoc6umPdR/hxegRe9Wus8j9yoSRWUje/zaqLq
 3umESW2EMLgRPhGH7uyEKu2uAog1EajMO+ic8Zg1ZsQ1eTm7ufI+810GUOC4FiDMzwDf
 /dtNNsK8zDDjTHEqOJQrtVH0lq/PSXzRu7cTi16xjya4EGHj1zXxjooZzwYE/nYGSI97
 KDXn+XksNlQMSB9ppfUuCHnNQPjpX/TI/hrvwh0BalEqePmhY69Y4nMqktargP1hzacm
 rwrlv74ASPp1xk1f9gIz3V9/+keZs1a7QuRpmrMG/1uwuFdwH8TGo4RyrMkHPkNHU5wa
 Eq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X1MvS/6mSvBdfpSbPfN/7JJWpwiBa9tcmoBU0a7X3Cs=;
 b=Zcjpv4JD+fMiVlNRx0PJCHHQJFria7CxaUBoC7TY7XjdAVHu0Uc1DdcdZSBRnntYlv
 KjWPaCazJVujKpFPGuJ7K+J14X2Scw3NIIBYOPovTbNVVx6Th78MMMg/92TLGrcZaomo
 GYXQcWqH60xo8rcMX0/r6cBO2nHTt2dE3uHCA5kfMYl55RAA+qupeDJN2v8sETs4EVkm
 sji2e6HcUQstCti2XHYUvvZKXLZn+YREzJIMHCwvqSjW9OPE1T6syYwPwXzXq32D43JH
 mvPAH/034quQ+oWGA73MXxx8W2x8z8uhyCoETmpuS6GZw/cIHNeADjxEV9xf1Z4CkvG9
 O8Kg==
X-Gm-Message-State: AOAM530qe5pGdwkYjAdTnmXSu29+AxzNOzSqBx74pyyF7cRbO//9kulA
 ThK45auST0tluuJTSJtgtX8=
X-Google-Smtp-Source: ABdhPJwnbSMs/DuokhZnqXONkMqw5YfOqzsLuKAGmGEdRxIfWoTRgG7a7HUlXByMrbcZgyAQkbWcCg==
X-Received: by 2002:a05:6402:2706:: with SMTP id
 y6mr6247878edd.355.1621984179869; 
 Tue, 25 May 2021 16:09:39 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it.
 [93.35.189.2])
 by smtp.googlemail.com with ESMTPSA id zg18sm9503105ejb.41.2021.05.25.16.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 16:09:39 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH v2] mtd: parsers: qcom: Fix leaking of partition name
Date: Wed, 26 May 2021 01:09:31 +0200
Message-Id: <20210525230931.30013-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_160943_197081_1AF830C9 
X-CRM114-Status: GOOD (  14.51  )
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

Add cleanup function as the name variable for the partition name was
allocaed but never freed after the use as the add mtd function
duplicate the name and free the pparts struct as the partition name is
assumed to be static.
The leak was found using kmemleak.

Fixes: 803eb124e1a6 ("mtd: parsers: Add Qcom SMEM parser")
Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/parsers/qcomsmempart.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index d9083308f6ba..06a818cd2433 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -159,6 +159,15 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 	return ret;
 }
 
+static void parse_qcomsmem_cleanup(const struct mtd_partition *pparts,
+				   int nr_parts)
+{
+	int i;
+
+	for (i = 0; i < nr_parts; i++)
+		kfree(pparts[i].name);
+}
+
 static const struct of_device_id qcomsmem_of_match_table[] = {
 	{ .compatible = "qcom,smem-part" },
 	{},
@@ -167,6 +176,7 @@ MODULE_DEVICE_TABLE(of, qcomsmem_of_match_table);
 
 static struct mtd_part_parser mtd_parser_qcomsmem = {
 	.parse_fn = parse_qcomsmem_part,
+	.cleanup = parse_qcomsmem_cleanup,
 	.name = "qcomsmem",
 	.of_match_table = qcomsmem_of_match_table,
 };
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <SRS0=SnlB=FI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C7BC4361A
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Dec 2020 15:01:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 317D222B2D
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Dec 2020 15:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 317D222B2D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3r8sfuCyEJOZUck3E+uKSweUj54b4M5E92M7Shn2RSo=; b=ov+e1KD37M1Pw7WnlXOIZz87JY
	Eb5oPjeuD7hSYUugPTDOPXydyQ1uBg7BkwidJMGKKb5dR1wEhtsJxUntpvHGThXlJE96w9LzgjFck
	mamSUgKbD20pmf3sxlvnw4PxuPEracwURsznB4XehPUwEaSW4j1Kf18i76g5NGk4y7/Ctg0Y3ytpL
	KpB7uWy+wyCjf9X2K+bxir6R2adxsAMH0UW/1r/HqMimsSAJxos3FWI15wq0sAGBzv5jcYDgrQJb7
	GGHSlL1vaBYmJwx4SImII4aVbR1LfEbOYDXDtUIvG/bZ9AhzI/lkijjMejrQx/pboRoFhbNJKpZfN
	ZB7c3muw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klCZm-0000mY-PD; Fri, 04 Dec 2020 15:00:50 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klCZi-0000kL-74
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2020 15:00:47 +0000
Received: by mail-qv1-xf41.google.com with SMTP id 4so2881485qvh.1
 for <linux-mtd@lists.infradead.org>; Fri, 04 Dec 2020 07:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=x91ziFr9IjaRA+UG3mGYQ/hsz2KhJaVjfrIEoefHpGQ=;
 b=ipDRBNFKzTILYAtZ01etYZj2u+m/s5w43HeujGtQgKcv/la9zdCGclFaMi95HXvsuy
 mJXl+IdRaxyG4FUvGdrJQDq7r/97DGAFBtn1uJcG+lCMjRWTBx+22ktcKDs7cfZdR7mF
 r9HCDbaLRQVQfuVhg5mic3Nn6jil1PO9NG9xqAHCLbEDzvRRlideVlXdj+HrqrKpwPHu
 9dPpQcVRYNoglgynUl7eP0/3+h4iacPa82BQhssh9A+2e1oQrP+uWvUa+fI4Lgc7wR8P
 +PoVsCorKDWs4VWBGMTy7I1gFqm5oODOiNmmA9NVxhj8BY4xWrga7z/tP1m0aRcoSBXN
 waPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=x91ziFr9IjaRA+UG3mGYQ/hsz2KhJaVjfrIEoefHpGQ=;
 b=Z/T5i3yZV8hMFg8guCQVDIQJRcPr7mgQSe2BEwMbVml2Tl2Ai+gfgpkOE0HVvxNwZG
 7i3fN9arPHTT4GJsHubM0aTbbW8IuWe4AooIy+6xaI7ddZBSw8qDk30D/rjj5oSCoSA4
 jLUftlmBW+ifgKH55a1pzGpuNlW9gAKKx6qkLsz/1PsucNNlPSeW0c4xzagmWxes94fA
 zDnNAQhvM3JGA9B3uXcGsVDlOfbnGURKRQ2FpgukSDnKaioXgXiQz8XIitBt28gCVhx4
 Zz6loRTQGGZP5mSLUXa0uVMlurT5Lfvg8i5J+rSA/ie+QgAx2cTnlOpY8GpEhngpaWRh
 BWoQ==
X-Gm-Message-State: AOAM533p8vh7P+99Fb5RpTQ2dHFuF/nhLM5AOIySWLU6M5fQX7GpQfN7
 GdGRNZ6P34V40hToz9xb3fM=
X-Google-Smtp-Source: ABdhPJzHPddBWJfvNcrCYx4OVsrYY8/oSYSpYVOR0wn5k/t3BoUH1XEumRlgRN2oButUeqoytgvPig==
X-Received: by 2002:a05:6214:973:: with SMTP id
 do19mr1556886qvb.26.1607094042724; 
 Fri, 04 Dec 2020 07:00:42 -0800 (PST)
Received: from localhost.localdomain ([177.194.72.74])
 by smtp.gmail.com with ESMTPSA id h26sm4806456qkh.127.2020.12.04.07.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 07:00:41 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [PATCH 1/2] mtd: rawnand: mxc: Use device_get_match_data()
Date: Fri,  4 Dec 2020 11:58:17 -0300
Message-Id: <20201204145818.32739-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_100046_325209_2FAEA9BF 
X-CRM114-Status: GOOD (  12.19  )
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

The retrieval of driver data can be a bit simplified by using
device_get_match_data(), so switch to it.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index f896364968d8..d5c445eb93ad 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1714,7 +1714,6 @@ static const struct nand_controller_ops mxcnd_controller_ops = {
 
 static int mxcnd_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *of_id;
 	struct nand_chip *this;
 	struct mtd_info *mtd;
 	struct mxc_nand_host *host;
@@ -1756,8 +1755,7 @@ static int mxcnd_probe(struct platform_device *pdev)
 	if (IS_ERR(host->clk))
 		return PTR_ERR(host->clk);
 
-	of_id = of_match_device(mxcnd_dt_ids, host->dev);
-	host->devtype_data = of_id->data;
+	host->devtype_data = device_get_match_data(&pdev->dev);
 
 	if (!host->devtype_data->setup_interface)
 		this->options |= NAND_KEEP_TIMINGS;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

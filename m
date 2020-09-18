Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7F2C43463
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 02:19:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A85323888
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 02:19:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hwGtrzWm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="F02K7Ehk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A85323888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=So9TL7bYzA3EUtxL1k3/aUX8lewnIxeXhgoAgRkiWJc=; b=hwGtrzWmyMDQbtXJ2dbLYsZU7
	om9OCoQ+JkLnJNStHfkRzIr1OQuuRGKvcZWRuse4WSGbMWv3ZE+S5OLhhNpcfTa2Kzf/dqf8gDvmb
	BisjM2shP15Nm5geKF8xWorPprqgj6x0ujwH35vFF+rdH/vOUNB992/B8dhzRHCpcEt5+NkuKa134
	xmDiXFLnciESzCpoexAhptBdmuYyxqYU5y6kYesjIOpBVAOZzsB/vpYADr/CnqXMSEo03sLMVqwHf
	3i0YrhH0ccV2YTJqy4D6XY/uSt9v4PZN9pP1sl3ajY+rKf6/dftatXvQDq6BzqpSNETduyaqPeQtS
	N6QU2S3AQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ5yv-00027Z-UE; Fri, 18 Sep 2020 02:18:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ5o7-0004or-34
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 02:07:28 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C11C239A1;
 Fri, 18 Sep 2020 02:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394846;
 bh=XxxrY+0LVUDKUPM63mF0qJ4HNb8rZ1kPsW2WuUNjq5k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F02K7EhkLx1vWvVGfAzlsmHxoZ5/TRnm/90+BaHtWqWVEe4DU3DbuM9F4JLJxuW9h
 ifgofcbrY30JNv8jAPBFRiw0BOTBXfRSP9j34JosqdIzDjE1cJ+tKi2Akmk+RLMrLZ
 JLKEZ9nKmbuMLIKSvCcAqn2dur0y1VLDMK5KbtNg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 303/330] mtd: rawnand: omap_elm: Fix runtime PM
 imbalance on error
Date: Thu, 17 Sep 2020 22:00:43 -0400
Message-Id: <20200918020110.2063155-303-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_220727_245562_D3376222 
X-CRM114-Status: GOOD (  13.62  )
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
Cc: Sasha Levin <sashal@kernel.org>, linux-mtd@lists.infradead.org,
 Dinghao Liu <dinghao.liu@zju.edu.cn>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Dinghao Liu <dinghao.liu@zju.edu.cn>

[ Upstream commit 37f7212148cf1d796135cdf8d0c7fee13067674b ]

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus a pairing decrement is needed on
the error handling path to keep the counter balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/linux-mtd/20200522104008.28340-1-dinghao.liu@zju.edu.cn
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mtd/nand/raw/omap_elm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/omap_elm.c b/drivers/mtd/nand/raw/omap_elm.c
index 5502ffbdd1e6d..6e0e31eab7cce 100644
--- a/drivers/mtd/nand/raw/omap_elm.c
+++ b/drivers/mtd/nand/raw/omap_elm.c
@@ -411,6 +411,7 @@ static int elm_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 	if (pm_runtime_get_sync(&pdev->dev) < 0) {
 		ret = -EINVAL;
+		pm_runtime_put_sync(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
 		dev_err(&pdev->dev, "can't enable clock\n");
 		return ret;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

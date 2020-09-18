Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4D2C43463
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 02:40:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3675C23444
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 02:40:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HXplzDpo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVQtxvPc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3675C23444
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TmoObh3YmDQ4R5KwDp4kmhtPRZVbHhguBvXJbjD0fN8=; b=HXplzDpoFixNlux22LI7p1m8C
	lSyTB0134z/VctsoUfpKhA1Wpe6EAzBhxEK3D0F3LJ9A678qbqGu3N0Xr5qRXSx1kbynBUUmUHvlH
	xdk/rtzu9P+EXyp/9qDwtgAFm/omotB7HcrlsF/2NJSwD5w3adC7CN+qBCzlgD3G12VZZxC0mN4cr
	LlUHnRHYIiJ78O8efwJ33wbsRPbvTJgK8aQ2aAi5leoSkrQrIHPkjIbssqAwgYj+W3rVuClUg5ayz
	dlG/DUswZ7pSw7wHZpBp68etnyws1sQcUZjqaylZoeALvsxIQ1SYuPZsEnLOiQvqNWpG1CA7G8GBR
	oQ0tkpyhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ6J7-0004ef-5A; Fri, 18 Sep 2020 02:39:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ5yG-0001of-N2
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 02:18:17 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B47A823888;
 Fri, 18 Sep 2020 02:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600395475;
 bh=AZyhVGJgpbhYzg3+kumaGZxjkK74KsqzH1d2Iwyom+I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hVQtxvPcYiyrh5Jy8mzRI+zoqDRSJyG75lvxBnYCTir/GcyZyx/RtXb0ugGQ2UB2B
 KqReM2dHRlc9XAbRDOJjjfybqpsX9peGNBpzQtM5Eu3xK+hxXg1J2g48JExa1SUg8g
 OTw7tqW06CZK2vKGJYyFrCpIkLQVpm/VgW3/XM10=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 59/64] mtd: rawnand: omap_elm: Fix runtime PM
 imbalance on error
Date: Thu, 17 Sep 2020 22:16:38 -0400
Message-Id: <20200918021643.2067895-59-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918021643.2067895-1-sashal@kernel.org>
References: <20200918021643.2067895-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_221756_963257_A1BEF3BD 
X-CRM114-Status: GOOD (  13.52  )
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
 drivers/mtd/nand/omap_elm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/omap_elm.c b/drivers/mtd/nand/omap_elm.c
index 235ec7992b4cf..e46b11847082a 100644
--- a/drivers/mtd/nand/omap_elm.c
+++ b/drivers/mtd/nand/omap_elm.c
@@ -421,6 +421,7 @@ static int elm_probe(struct platform_device *pdev)
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

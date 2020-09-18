Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42892C43464
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 02:19:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED31123600
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 02:19:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ER87n4fx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvoS2XUU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED31123600
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hkQLRPWwKFtQy4vFE14+9v4uF8RsOIPLE42Q4sOxQAY=; b=ER87n4fxfOodvt63Od44rc6Q4
	EpNpmJpxbi4+OV/hr8R2ZPPhJJelbYXS09XC5dugfgNk4eyCFgkP/x1DpvNGRFGh82KhplAUERYJL
	A3B8A8mXSktNR/ij/zBqwqaw8RJkN5k7Mk6BB1/ed8aN/dYeSK0eutZ1P9k6S4A2USXXbuzZJ7lOd
	OPV7OIkShWMba2jUfmYwLqyvpbtk8Ei6VsC7QXqxfY6oU7aZMoWJ8Nz9X+THl9qF1Jn+qVET4E7y5
	NyHr668wZ3wp0xyfT9x7DKUaJ2ILBC086FWvVqH3WGS64W+a6NFsMnSzgkvS4AnqkW+bIM86TEeeL
	Ke7D1Gjow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ5yY-0001vN-BF; Fri, 18 Sep 2020 02:18:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ5o6-0004oQ-9X
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 02:07:28 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7F5A823770;
 Fri, 18 Sep 2020 02:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394845;
 bh=OZBRK2VLGNUKvLPFgd5TqEh2BcN//uJryGvXEeZgT54=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UvoS2XUU2VF77jIoONcIb4idPQTSAqUomTAOb6BJeyP1+Z61gNeRJsdhc0S3y1NAV
 1XxoIuDHt7/ynUfLa1ZSZh63JAA7C5LKlWpH4EHlhAYSww0MmfsDSAthpn7HeJ9RH7
 GOUIboTjwBrWyL0nQp1QYTzEvcjsdxEh7A/ise4A=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 302/330] mtd: rawnand: gpmi: Fix runtime PM
 imbalance on error
Date: Thu, 17 Sep 2020 22:00:42 -0400
Message-Id: <20200918020110.2063155-302-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_220726_442736_4A70B324 
X-CRM114-Status: GOOD (  14.62  )
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

[ Upstream commit 550e68ea36a6671a96576c0531685ce6e6c0d19d ]

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus a pairing decrement is needed on
the error handling path to keep the counter balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/linux-mtd/20200522095139.19653-1-dinghao.liu@zju.edu.cn
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index b9d5d55a5edb9..ef89947ee3191 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -540,8 +540,10 @@ static int bch_set_geometry(struct gpmi_nand_data *this)
 		return ret;
 
 	ret = pm_runtime_get_sync(this->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_autosuspend(this->dev);
 		return ret;
+	}
 
 	/*
 	* Due to erratum #2847 of the MX23, the BCH cannot be soft reset on this
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

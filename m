Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1A1C35242
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:44:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8031620848
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:44:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WN44k9y7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHcDvUlK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8031620848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1kKYxU6JUe2zg8eYAHl4j/zT6PlYiIOeeTbJL6It/w=; b=WN44k9y7/vUUj9
	u2L7pX9IYNqGjbKLKNm8wyLeCr4gR4TTz+81hEOKfetySavfh9HXtLy/qS4ogqLcXM8wRB/wfXjie
	Cb/mWKhGtejgbGqczy1EEEOyFPnTYni2NxUgFG1c9iHcc7/HIO06cOHNx7kfZVqTKzsFxkjjCY1TN
	xRBxnd429aLRM7vmgn+eeyMmpXCKidKDoTILsZ6IDrS0WOrZqLGY4c85C8lCjobVrBlLoYvGXBowo
	DU3Y5TmGgqUKcwrvpXbQ6ej2wEejaK8tElY2uq605Wj5aDf33zGmCKoyoW7fQcZQMI7Xk+cUmKOMG
	tCIhp+xEAuNOPxRtlqjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1g8D-0003AL-UW; Wed, 12 Feb 2020 00:43:57 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1g4i-0008EC-8f; Wed, 12 Feb 2020 00:40:21 +0000
Received: by mail-lj1-x244.google.com with SMTP id e18so234127ljn.12;
 Tue, 11 Feb 2020 16:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ttJW9peokq5rUpFOQPvSx+wLa406veCgVEoVyR6YAV8=;
 b=SHcDvUlKTDjrSUyYrLPEjMYJTvRDrw/kwd1X2ZFXrBSCah3TbdHcdOnpB/sdh+Cjbf
 Z3+loashg/BSX7zm1xHB0W+YgWvQ3iA8VQTogN73YaMluPA97Gg7d6wYVOck+f+5YRxH
 01YZjhYwC49vPTcoHoTD8EYcXq/wj63Cb5C+5Xt+tlu/gSN+Y85OCic5r1bRg51TsnW3
 05BudZ7Mt9kohFXmGNF74A3ZGE+mh3Mj3lT3rGJVhIbUdLGjVlDON2Hfgnls//ISsp8B
 3TAh/IExYhEiGEwLHODItVelxBWh230DfJp9RNLFRZsWMqdnoFX+L3KJ3Ag8VTHxzlpM
 4x+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ttJW9peokq5rUpFOQPvSx+wLa406veCgVEoVyR6YAV8=;
 b=uoL/60DcFN/X8vFeYshXUYyOHpgPjdNjl+TwBjY47WvQy9ERRquJ2PDtzq+/qU+G2n
 jUleiSkri6enQaXHu5XSJ6z+POzdmXtXR3IdjYvsOmxotnVd8YgW/7TPgDPs1golnO8C
 bxdZ/qvBjc+6m/KMLPLD6XhyOl5w/qKwyME8S0YI7z0khzStYz9hwt2OdbkWKi7yDlBG
 i9Sf8QbD0p3GWNOpUqnxwK29ttrh55unwXgn4GKVwbLHiMHm9GzcliT4nAWSV09IQyKM
 4LL3oWKu4UKjkLPIjDi/ksfmQ/rHFHR7IdIZzetCKaCgKqothFOS6ic90kWYJlE5bi0o
 NXJQ==
X-Gm-Message-State: APjAAAWDQAw5gwCa/zUFdPPDC72Fwyv1u0xxNIHV3B26dd8DrN1eWUS5
 Deo2BeCFNi3LF0ipC2YT2Mg=
X-Google-Smtp-Source: APXvYqwnNi3Y4kZzLlTAlPxy+jEgL87XZNvOHJv/JSD1vBuRqr4PxxEZvgCLUMMsg5LNGxXQvOlRpg==
X-Received: by 2002:a2e:b4ef:: with SMTP id s15mr6242730ljm.20.1581468018867; 
 Tue, 11 Feb 2020 16:40:18 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl
 (109241122244.gdansk.vectranet.pl. [109.241.122.244])
 by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 16:40:18 -0800 (PST)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Subject: [RFC PATCH 05/14] mtd: rawnand: ams-delta: Enable OF partition info
 support
Date: Wed, 12 Feb 2020 01:39:20 +0100
Message-Id: <20200212003929.6682-6-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_164020_334858_FA1C6629 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Provide MTD layer with device OF node info required by OF partition
parser.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 25f121adea6f..fb96f6a3b0b3 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -222,6 +222,7 @@ static int ams_delta_init(struct platform_device *pdev)
 	mtd->dev.parent = &pdev->dev;
 
 	nand_set_controller_data(this, priv);
+	nand_set_flash_node(this, pdev->dev.of_node);
 
 	priv->gpiod_rdy = devm_gpiod_get_optional(&pdev->dev, "rdy", GPIOD_IN);
 	if (IS_ERR(priv->gpiod_rdy)) {
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

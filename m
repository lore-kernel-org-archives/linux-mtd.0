Return-Path: <SRS0=b8TW=K6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEF3C07E94
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 15:13:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F9E9613EA
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 15:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F9E9613EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/npfWzoRBMXhkbeWpGv4HQjnlSiMq/D55tXTiNNbv8U=; b=kA9LW7blI7v5yZ
	3Nj87Lc0e8v8VZJEvf2uIxmndv1CONmjLQoZsYt/T4r2UVt/sEGmGQI3o1exOulV/4TaD7lkviwVZ
	p7T3PvENYQOWHQruqhFMBg4VAFuw/pWLgtHaGiG6d/rluo3QbELWKL3TX3tj3WCTkdQgQGzE72Oc1
	7ymWkBDWkFgHXgheXshE0mD6rW+aeAKboMQ/yiWemMfIwU730o9zafjASh+7W7XkrWWS+7BnqQ4es
	0jymavNS5HowG2N0mIdZ9m38PqsDhJIqn7N9jKLZmlAjNR4AjN5Df2jQC7FI/VNLkXh9LLxz9fxUx
	5872cGLaS23jaARaovjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpBV2-00E6Gi-3x; Fri, 04 Jun 2021 15:12:40 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpBTg-00E5D9-Fb; Fri, 04 Jun 2021 15:11:21 +0000
Received: by mail-oi1-x231.google.com with SMTP id f30so8761541oij.7;
 Fri, 04 Jun 2021 08:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=za/Y7MXEJhVfJxix2rC6+OPvATSxOzABFwX8N4L6d/Y=;
 b=SMWznNsizO2hohyPrP6PEcwM9Uu7usTTW+xf1XScQfcKLdMvf35oThs0NlOU84o3mF
 ZZYFXi8q01mRkHJEzD+FOLmuweLTR4QLkSySA6zbzCbQaBYI40pe+9236Berfgy7CnEY
 TrtXJzuumu1fGhim8wvvL62U8DHg7G6Lkar6G87VPaJUdRepov8KqWj0f22AFjtHP9CP
 DA46CnY0H//ekab+b3Oa3Ajp4S5WE9PsGFvsqsTYND1wrowFTBrD1QEz7xmeLDctSIK0
 obC9uoSlAZ4MV31KN8BPd5F8cjg2ViccGV3VZQKwR15oUSVunHB2YroRRLBT6cPYrwiJ
 3Eyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=za/Y7MXEJhVfJxix2rC6+OPvATSxOzABFwX8N4L6d/Y=;
 b=CdU7ic4M5rWW0o/eyv9GEtrcb/hLYLkK21H96Bq/rIjBDtZ0Axqf3HciDQMpKgttXr
 unbukOdxu5RKWXizEsjO2yMFXDUWDxL9JLn/2RL8tt/yLLCU5gZxhPOsPY7n7DUZfnsc
 yNXqF0crUgq78NdtzrNpRSeNfdoHlal09F9EP54FdDZqoki5WCXvHJB1f4HxQzRVeJ+6
 bQVRGGiwHr2EnzIe/nYd1AMfD8ciPQfrLqXHSa+hIOzMYA89lPQ2umx9Ue1piz9Y831d
 DEGGN/ItgJiLe/DEjebOlkzfbLGcZlHkfG+Gea2fegzn0fLPVLgpfDYcNfZlaOBlU33p
 LPsw==
X-Gm-Message-State: AOAM5329VOmIZbObaUMkIwmJRbWrPMx06JJYfA7Fc3PLZj6LcVGDMH5n
 NhQ3sph2iaSYDwWdzYsdU9jv1a3/6Ek=
X-Google-Smtp-Source: ABdhPJzJSbGDUnw7PXR67GZz6QBZdYUZsnqLXf0hDVgXaEPAro6BxeKWV7O5Na477GgRdfoj1nGStA==
X-Received: by 2002:a54:400a:: with SMTP id x10mr11674852oie.158.1622819473377; 
 Fri, 04 Jun 2021 08:11:13 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id k16sm523440otp.19.2021.06.04.08.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:11:12 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-spi@vger.kernel.org
Cc: jon.lin@rock-chips.com, broonie@kernel.org, robh+dt@kernel.org,
 heiko@sntech.de, jbx6244@gmail.com, hjc@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [RFC v4 4/8] clk: rockchip: Add support for hclk_sfc on rk3036
Date: Fri,  4 Jun 2021 10:10:51 -0500
Message-Id: <20210604151055.28636-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604151055.28636-1-macroalpha82@gmail.com>
References: <20210604151055.28636-1-macroalpha82@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_081116_561411_90315300 
X-CRM114-Status: GOOD (  12.82  )
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

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the bus clock for the serial flash controller on the
rk3036. Taken from the Rockchip BSP kernel but not tested on real
hardware (as I lack a 3036 based SoC to test).

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/clk/rockchip/clk-rk3036.c      | 2 +-
 include/dt-bindings/clock/rk3036-cru.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index 91d56ad45817..ebb628733f6d 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -403,7 +403,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 	GATE(HCLK_OTG0, "hclk_otg0", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(5), 13, GFLAGS),
 	GATE(HCLK_OTG1, "hclk_otg1", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(7), 3, GFLAGS),
 	GATE(HCLK_I2S, "hclk_i2s", "hclk_peri", 0, RK2928_CLKGATE_CON(7), 2, GFLAGS),
-	GATE(0, "hclk_sfc", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(3), 14, GFLAGS),
+	GATE(HCLK_SFC, "hclk_sfc", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(3), 14, GFLAGS),
 	GATE(HCLK_MAC, "hclk_mac", "hclk_peri", 0, RK2928_CLKGATE_CON(3), 5, GFLAGS),
 
 	/* pclk_peri gates */
diff --git a/include/dt-bindings/clock/rk3036-cru.h b/include/dt-bindings/clock/rk3036-cru.h
index 35a5a01f9697..a96a9870ad59 100644
--- a/include/dt-bindings/clock/rk3036-cru.h
+++ b/include/dt-bindings/clock/rk3036-cru.h
@@ -81,6 +81,7 @@
 #define HCLK_OTG0		449
 #define HCLK_OTG1		450
 #define HCLK_NANDC		453
+#define HCLK_SFC		454
 #define HCLK_SDMMC		456
 #define HCLK_SDIO		457
 #define HCLK_EMMC		459
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

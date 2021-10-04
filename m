Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49860C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 12:40:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 144E96137D
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 12:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 144E96137D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U2yU4zPP+jmj//nWzRr+rHf3zZ6d3qNYeaWaCxxoEq0=; b=GWpXtLzQkZH/YR
	qF5j3uuIUiBVWbyesKjm4QzwpQvDHx9XjEIRNlIADh9R2t2UmVg93YdD6Wwu2ghZdagyq/3uViSun
	mBLuf+VL574/3YfppYmarcXBuSnHNCwRQwG8YOEFCL9aJ/pP/FZceqEmodX57Ej2VzOv8ni1tLmqg
	/Cu48IVODmDLyw8sGxKv0f+kdRjCVlIy2U8iqVxa/JwYHpDIutIsZXxhdosNKFaT/fyR9B/06TCok
	bSkfl74yWVzpsZMUnJUvsHFYtAEYiEct4GvyfIXGDXYb76mYvOj2tCJ0m/DJEOIdGA6HG7o3H834Q
	I/EZmq3gUfjPhRdPGVDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXNFp-006SpW-LO; Mon, 04 Oct 2021 12:39:37 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXNFl-006Sof-Om
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 12:39:35 +0000
Received: by mail-pl1-x62c.google.com with SMTP id y1so10981216plk.10
 for <linux-mtd@lists.infradead.org>; Mon, 04 Oct 2021 05:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O5PG0hNVQuZSE12+d9FlPhmW1OMlHH2PE3/HV0fc7js=;
 b=zCa4dJaDImMk57hpwlY9GYF+yCSBgkEg0Nfxc2802Dc7xtNm9hz7ulY7yZThQqqME1
 Bnt3L0bltsch7KTWHr6gTC/KLnF3cu/km6Z+KrK5k4LUoI394XgsRCGDY0dJ5N436Xkv
 8Lhc2OzBnQpn0ongyLpmY0L+L+c+eqQ+XCWBL0j+dZzjTrvcIbizkm4iqjgFolrTd2nY
 xpSuDFkEhZGGLjImKUxaMIhxaJO2TvR2pawcxX7xSV18ysxJOfv8jcrG2rJ9K6XZdjKs
 o8R8e/OD3bJu+65CFky6liCc48GBwVIklaM3DEgm29tPPxWNBPpoHRNwL2vOphVbCBLn
 Qv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O5PG0hNVQuZSE12+d9FlPhmW1OMlHH2PE3/HV0fc7js=;
 b=hWvwcoUTml7HMQJ+UIgR7BTdORIbG1iMp6asxHSCIeK83qjibj6GRw4+dsERJ73g6o
 ng46U2n+dLbbgzOG6AjxLL5MadN3olK/EsB6nEkO1ttZerszr0Ihp76I2IC7ckCFC8V7
 g8Zyv4TtQAKturdPWwj6ehQFvjMXGWCIHaqiISZvNo2iOLL6+tTSHJ1g1DV30TnBeV+5
 MGrHSQt+enJvhYCovuf+aIU0goe9zy0aURNQBrGV0lr8mCo201zqUYQlZRsvjHFx5/jv
 g2mNvQM+gJxUR/nIT5ioPA7BRsTtJ5n9vfdop48E5eFnEJku8A5vFpEcv7BpFQaTOLap
 a5Vw==
X-Gm-Message-State: AOAM5309m/+rs5JprLYmOsMkyWaRHVOmZf8kHjoeGrHSKfysJyFxndL7
 iy+00j6LzXQpYks9X498dUUuPHKLxShP
X-Google-Smtp-Source: ABdhPJyR0xmWPPEnJxvOpWnT5V1wOjU5KDQKOy3+IjK6Qes2PM2DjbcIn94b5dR4UkHCgqvwfXJaMw==
X-Received: by 2002:a17:902:6545:b0:13e:51ef:3ba with SMTP id
 d5-20020a170902654500b0013e51ef03bamr23252391pln.61.1633351172153; 
 Mon, 04 Oct 2021 05:39:32 -0700 (PDT)
Received: from localhost.localdomain ([120.138.13.170])
 by smtp.gmail.com with ESMTPSA id b15sm14103036pgs.13.2021.10.04.05.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 05:39:31 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] MAINTAINERS: Add entry for Qualcomm NAND controller driver
Date: Mon,  4 Oct 2021 18:09:26 +0530
Message-Id: <20211004123926.53462-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_053933_833327_6FCBBB76 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

Since I maintain the dt-binding for this controller, I'm stepping
forward to maintain the driver also.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2c9165e4e816..8cfd8ae9e69e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15580,6 +15580,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
 F:	drivers/regulator/vqmmc-ipq4019-regulator.c
 
+QUALCOMM NAND CONTROLLER DRIVER
+M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+L:	linux-mtd@lists.infradead.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+F:	drivers/mtd/nand/raw/qcom_nandc.c
+
 QUALCOMM RMNET DRIVER
 M:	Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
 M:	Sean Tranchetti <stranche@codeaurora.org>
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

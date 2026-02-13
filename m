Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A3AEEA870
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Feb 2026 17:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODIuZQK0wI53UrIu37rb+Dy0cziCAJaWNDdwh6xo9Yg=; b=b9x+MzO5dCxCz5
	EgrdQD3L0/8cu1DFhh6hL5pmiW20ebKgDDP8e5JIOqXqgBNrOqFWagaUUiGnKdACoDzakF+ncJoj3
	Kd8cYiZ1JjkzHgWVqO2umOWOhOW3f2Dz9dMoJadC2un3asiP2eL4AxiWultVh6ojaSpI7ppTGxe+I
	SFwnadDfryJsLH58DLNnZB6bOMtnyYO1wT1Qd7lS3nURXj+2YGeEGIrTlLCfK8pVa2acHxlp4N9+t
	KRMOKanj+RT1tQ/O8b6XXgIoZ8sCJAg9K/ddSE0JX25rXcinkqHsujNvJ7zyOAtYbIVOTMLYzNss2
	4LjJ3++l6MVWUUk8WCYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwZF-00000003hzj-1sfe;
	Fri, 13 Feb 2026 17:02:57 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwZ4-00000003hxA-05IM
	for linux-mtd@lists.infradead.org;
	Fri, 13 Feb 2026 17:02:55 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-48370174e18so7946335e9.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Feb 2026 09:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771002164; x=1771606964; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zIEpIYwQ3nx719dtdd1dDMWE7jjjHd/uLAi6inVV1TA=;
        b=ZrovWWzz+FTcI9W9dpSbPWBXQt2zbGv381JGsaCbC2sqgjje3eOEEIdq1J0wJBKQsJ
         qqGYm10Lz29fyqL30cF6H8OLXoyM1nsA4EtpgK9Oj+sHfTb5vCOE/5fha6KSJwpcThhw
         dh60haMsHrz4T0Hr4caRXqEzXgDMTNdc3zf0m5hoKUZhMAtDIFn01zmg8SdHTgtyi4BT
         mV/YG1P0bfCFrvOVlOzOPKvuCziYYP+fMabXt2H7T7KhvE+tu5LAWccdMWIwHLAxWIyN
         /meX9Fz5QJYXAphNv3/C1PIRgLCeDwLJPeYOgmfamk6NMkKUfA/eYIw2LPVhet307ZA+
         an9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771002164; x=1771606964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zIEpIYwQ3nx719dtdd1dDMWE7jjjHd/uLAi6inVV1TA=;
        b=wIUwxDoD/i9cDybBmMPVs6O+TNVuzeoGsY8hdRYYX9F8VknH/6h/oGbklX1kFZDgCU
         WdoreUArEcV67uCPA5ZUBobvXr8LQcKTc64FDrHIvBt3B/xcaBj+qe5m1anGPK7210B7
         iCwhEulntGJiLcNu6DYrrJeIzgbflZznXKa9Dz6T1Lk6LmMQdeJluKFNV3pIhsHIzoPv
         FQOOb2DSH8iydZmBAwhvSbeWInX3PgqVp9UFwalVdNRh39Jga9phLba1cSPt1znN8hp0
         j5Y7BVc5YVbBbK4VDyEQQUztwtqCYAybOPaqciYi+8u2MtpxaOzbUyBbUnWFbN46eEQT
         2qAw==
X-Forwarded-Encrypted: i=1; AJvYcCUtr4qG4CdPMxqjUe+/Jcd0cH7M2S+XFhWLXYd8wSM2VWaVwIvNIIdF9ndnIkGt2UolJt6MtUWmlwM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmtkpPJUddSzFhgBcs0HzRwsCDV9B1MXZquj8xsqXXL+huKuGX
	g/+/01KAy1HzCVZtRvSY8l/ARGUY7ndXzLF4TVl+3AlJmX+dz+arDNd0+m4sbQFZWxQ=
X-Gm-Gg: AZuq6aJ0ieVuwlAgzpHpGxAD6L/OY2JtX0P+y6D+GWnP+7XF8quSOFpUZzNzudyrZ5s
	mrimO1QJxeb7ZNVqch4aKBkBQ8V5q898QIWW+/at/VsON9cXMiPqchlL9kEzfuVSjCgLak3A7jE
	ITyaqcPeSVIFO3WX1YtiOsjy4Zz4Au6tPKlNOmbJAtzBhO1Qddx17J3ACad0NZe/gJyd/CxsXq/
	3szUqCX3vRHDZ/irdeQRu9V/OzXj3MJC6EAOj5kfsM9ymc4n/vKyM7lZODo3kcC+WtSlHIoUeIE
	pTdzmBFDt20+bXYtv7BPhk6DQO7eBFY8XqOXUdFd0uYqaEOvytfnP/EQzoC/psD0KVxcmIfSw6e
	xURxV+4K3ohVA1qdOjrJFuSRmyKeUmZephNILbIBC81oGHkJGRifSVkC2SEGHSExYeBjPTeK1tP
	31w9E9+HD6vnlLmmlhhcNR6/GnZktQZlcsj+BSsf59XX+wINa9891ZGMY82VsYgL7xv+kl3U34A
	gYAFYw=
X-Received: by 2002:a05:600c:45cc:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-48373a6c1f8mr39651745e9.35.1771002163978;
        Fri, 13 Feb 2026 09:02:43 -0800 (PST)
Received: from ta2.c.googlers.com (140.204.78.34.bc.googleusercontent.com. [34.78.204.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a41fd5sm20333245e9.27.2026.02.13.09.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:02:43 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 13 Feb 2026 17:02:34 +0000
Subject: [PATCH 2/2] MAINTAINERS: add Takahiro Kuwano as SPI NOR reviewer
MIME-Version: 1.0
Message-Id: <20260213-remove-tambarus-from-spi-nor-v1-2-6caefb1a63ae@linaro.org>
References: <20260213-remove-tambarus-from-spi-nor-v1-0-6caefb1a63ae@linaro.org>
In-Reply-To: <20260213-remove-tambarus-from-spi-nor-v1-0-6caefb1a63ae@linaro.org>
To: pratyush@kernel.org, mwalle@kernel.org
Cc: takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, 
 vigneshr@ti.com, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771002160; l=873;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=bRFhVPoF2mVM7NeujkCL+Ziy3Hf7CxauEaDHbTk72T0=;
 b=JrJeRbHQCCwIxLZiTp/bS7cW4fEPzTPyiyc/7Q6AvZKyGeKmMKEJzYpdm6qUypx7IBo7MO+aC
 aeiAgFX1v7vCV6OZrlUcn92991/RqwjTlMMZJTZbzDlu987XueeUTxF
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_090246_078762_B736FDE8 
X-CRM114-Status: UNSURE (   8.01  )
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

Takahiro has been an active contributor to the SPI NOR subsystem,
providing valuable patches and reviews. Add him as a designated
reviewer to help facilitate patch processing and maintenance.

Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c6ee223f6c2db2ed5595e19f5fabc098ff767b3a..872fb6e7e9e4fb5af1e02a0003e5c43535eac6d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24199,6 +24199,7 @@ F:	drivers/pinctrl/spear/
 SPI NOR SUBSYSTEM
 M:	Pratyush Yadav <pratyush@kernel.org>
 M:	Michael Walle <mwalle@kernel.org>
+R:	Takahiro Kuwano <takahiro.kuwano@infineon.com>
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
 W:	http://www.linux-mtd.infradead.org/

-- 
2.53.0.335.g19a08e0c02-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

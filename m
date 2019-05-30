Return-Path: <SRS0=l9qW=T6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C168EC28CC0
	for <linux-mtd@archiver.kernel.org>; Thu, 30 May 2019 21:21:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9488E261B8
	for <linux-mtd@archiver.kernel.org>; Thu, 30 May 2019 21:21:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P/9bPcFn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6vjmWjy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9488E261B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tsWjDliLVVuJKk929MRaJ4E69CQez7gUp5GiPbi++WI=; b=P/9bPcFnR+Vc95SI6lgSDeRH6V
	dwp3q1laMvNbDeeKSNnRBUkDYEmRMUY4ItW/NrJ3+onrpFtXYkOOiXs6BXTex9SogBQ6qqXBk/ihg
	3ZvdCDBKgjPm/yI3UxVBL+XGvTE9COPMd/ZQhgo5unOLC7EkhITSUXrarH8tNSS3Ys021D6RhbF+c
	FykHvXRtF4Z9twc/B2BvZrUQBFVQaikviHGwJ07x+LDOlXIzNO3YBDNKJMLQug0CR+CvXW1OZq+1b
	e3ElSbu+JmAjKFU8a/3OT3FmyxCBAVCPQFQ8gLm0wVW+XcY+A4ulpnCGmogy2HMkInxRc9P01gI3Z
	FnNOYSJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWSUQ-0003hb-7w; Thu, 30 May 2019 21:21:34 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWSUI-0003Wz-R4
 for linux-mtd@lists.infradead.org; Thu, 30 May 2019 21:21:32 +0000
Received: by mail-ed1-x543.google.com with SMTP id y15so5161264edo.8
 for <linux-mtd@lists.infradead.org>; Thu, 30 May 2019 14:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Qzbfu0dliCkkEmJ1UFnYukQdP9RWNNavonlb+Fp2x7g=;
 b=N6vjmWjy73gJGAwNl3ai5Uybv0PFyuyvJaAPxAibzRxqUVjyvhUg2NhHoega74+C8c
 B1nVuyy3hJ9/oHxD9EMRLQ9Rp3o0aMiKODRU3frOrC616DVBH9SAaW6w8NX37vRyhW/O
 L2G7hByWBQr2BCsqkm+KpOmOLAZmcS7FobnGSvlGeKWLpUriE8ZAZZ3zQeMFdS7WUH5b
 vWS+n+5SATB6kCzCtSLQrCdtIdVYsHxiBmWZugnMX0mNrpziiDRxpy4VVfo4mUzNLCN1
 T9DKSmHlkGChdIlLj1LoCb3UqZXMPTjyLxBtlNKx1ue7I6z8bdFeI8LyEZnTrKLt6D5i
 lrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Qzbfu0dliCkkEmJ1UFnYukQdP9RWNNavonlb+Fp2x7g=;
 b=TDI+y/R0R8hpN6XYvYNiP4/kloQVkjqOPo27B9gItXF6YlOEhGZI1+chsTfi0Alwvw
 XlMkheu7yg+R6/xooOkAsx9vAuL9vg6UUZsyAlfyd/cwuwUdodSTldjifxwGIlREic37
 mBYhPRzQtYsBSFXGYacXR5ZrKDu2NB4s/mrb6eoIGAqJYSCULgdvnqb+l+vBUvOBRkt5
 SpTXqAsRDCGmA2EzuftgoZ4XVHCe//M1FAxv/2BIH0nWN7k5TxnKPJnZx01JPvscwW4d
 dkpjc59kf+UCSxHBVZkQSmrBEaSnqPjCTMnV4HKJiHukogw3/hyBqZQqvQx9q57ZLEuB
 3WkQ==
X-Gm-Message-State: APjAAAWVV+My/P/puDPDHhy7NpX1qalW0wClxtQPGfssToZYqUcXjO+7
 OoKP5ZsaKkFITyKkrnpwdxYiFPWd
X-Google-Smtp-Source: APXvYqzRR8gKNI+QpfK/2N0R8st5YfVLx33/T/e2b+X2T7vDp5V2dfBvEgtcUFXa4rQ2gOUlOrnsNw==
X-Received: by 2002:a17:906:3b8f:: with SMTP id
 u15mr5624827ejf.6.1559251284636; 
 Thu, 30 May 2019 14:21:24 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id h25sm597082ejz.10.2019.05.30.14.21.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 14:21:24 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] dt: bindings: mtd: brcmand: Add brcmnand,
 brcmnand-v7.3 support
Date: Thu, 30 May 2019 17:20:37 -0400
Message-Id: <1559251257-12383-3-git-send-email-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 1.9.0.138.g2de3478
In-Reply-To: <1559251257-12383-1-git-send-email-kdasu.kdev@gmail.com>
References: <1559251257-12383-1-git-send-email-kdasu.kdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190530_142127_495020_1286E806 
X-CRM114-Status: GOOD (  12.04  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Added brcm,brcmnand-v7.3 as possible compatible string to support
brcmnand controller v7.3.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
index 0b7c373..ad4cd30 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
@@ -28,6 +28,7 @@ Required properties:
                          brcm,brcmnand-v7.0
                          brcm,brcmnand-v7.1
                          brcm,brcmnand-v7.2
+                         brcm,brcmnand-v7.3
                          brcm,brcmnand
 - reg              : the register start and length for NAND register region.
                      (optional) Flash DMA register range (if present)
-- 
1.9.0.138.g2de3478


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

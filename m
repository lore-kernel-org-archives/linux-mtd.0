Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974C8CCA464
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 10:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hdfPIalpqkbbvxmTV0+RsbL5e6ubLh9aXTIFmmtkEsU=; b=MJ5CVTLZvce9IT
	/AByAaS2VEgwQKLs5nFyxk/J7Q8lBIeRv9DPr/LFoAIGZ6z2lt4m1XJYyBoRl5QNlNlY5ounihgaS
	5j/AR4qXyxzZbpZQf4jHeeVR/XuO9KHyAtDe+pVIkNoQsMZHMNUzRB4DOLbTdBdNT3ZQfYx8QlWS6
	jgPSUFwSmHhZdLeLzfTqhrY2vQljF64/Z5TPRPpunW+fgc8DEY+FjsKYbu2nD+VnsmzCESzN/n0Is
	4BVECy9IawXaWMiSmTj5xnca51foJWW4ZT1hDHwMXKOr2z6mucIQLEw7HUbemoInuMvd+Sb5Ub0gE
	nZfpuSQT41FAgxSwtaCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfCc-00000002cSt-0jnP;
	Fri, 16 Oct 2026 10:30:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfCa-00000002cPo-16QA
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 10:30:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 37F361A1249;
	Fri, 16 Oct 2026 10:30:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C0446075D;
	Fri, 16 Oct 2026 10:30:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92594103287B0;
	Fri, 16 Oct 2026 12:30:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792146613; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=f7epGr6oXn9dxoPvGFbGkoqT9TRKCPd2Tc+a83xsefM=;
	b=L56aDfUdkrAO4pMh8FcMdQhmGuwXf+R5exG5nFIKl0MF76R+oaR41vWQz8SQFDb7EL6WTb
	l/8iX+s1qPbFTDf+EWN+XVaCNlsGTFaSwUYfwVRdS6rVMyTcQxZ4emoSKaaNqTPJ5Fxyje
	picGVLGRLts+1MhvKoh0gLS8t0xyMxmAgAHy2PIFIutbqnz0OyRUkydDeC3b9khqRV2ALn
	7S1d5ABrecXtvR6rVjY4ukwoWsOSK19vuXqGvbVKDy3m8Q9UX9F46TQ2iUPOPfvO7wtXtj
	5P3WAkRSG2Xvuz+/px4r6I9v6zjgBKXk8/QAhfH3SJLrUTr/xBs0BCRXnr3tjQ==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v4 7/7] spi: dt-bindings: cadence: Make XSPI's IRQ line optional
Date: Fri, 16 Oct 2026 12:29:17 +0200
Message-ID: <20261016102917.171095-8-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016102917.171095-1-paul.cercueil@bootlin.com>
References: <20261016102917.171095-1-paul.cercueil@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_033016_439895_740890ED 
X-CRM114-Status: UNSURE (   6.61  )
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

From: Tanmay Jagdale <tanmay@marvell.com>

The spi-cadence-xspi driver will happily work without an IRQ line
registered, which means that this IRQ line is optional.

Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
Co-developed-by: Paul Cercueil <paul.cercueil@bootlin.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---

Notes:
    v2: New patch
    
    v3-v4: No change

 Documentation/devicetree/bindings/spi/cdns,xspi.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/cdns,xspi.yaml b/Documentation/devicetree/bindings/spi/cdns,xspi.yaml
index 38a5795589de..dd8d03c07e68 100644
--- a/Documentation/devicetree/bindings/spi/cdns,xspi.yaml
+++ b/Documentation/devicetree/bindings/spi/cdns,xspi.yaml
@@ -43,7 +43,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
 
 allOf:
   - $ref: spi-controller.yaml#
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC8CC27C79
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2024 17:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KRe4ZVqH2sYGv30dMM/MqRBPFLhnAo2I6sJYpxR4gjw=; b=fSHcVmFLIS0AQS
	IIs4z78yFpyRvJQ5kPdxGDgFVJxB9r80HBJdo3/i9K1Ell0KsDqiuqNikq1qAo+vqqNs5XzInGwLN
	OhoG4JpfM/8LHN2VwzZoxEQc4cnf52fBFdZEJ/KvVfmK6TTm5CZiroV6ctWQbAZv5O1p6JSdklcBa
	oXDI/JDj+CwGGnWEStyFrwLuppo8nbc3t0zNGYNtWjiIGqyAI3EFK3+VXp4smlfvd1WmsUkStJXZD
	zOsTBshF2w32oUg0g341MNvMMtMFoPpM0FDyZjjFUk48u3NFLUWhM4AaUTpoY01vMdqfoZqqavX10
	jqsjqR56V5+ndmZCkLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKM3f-00000006B8t-3wr1;
	Thu, 20 Jun 2024 17:58:53 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKM2s-00000006AfV-2sva
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jun 2024 17:58:09 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-57d15b85a34so1391887a12.3
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2024 10:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906280; x=1719511080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLJSsUsQJimHeyehvy4obxzFbfnPiiocs4Of944Xm3I=;
        b=Cu5ihesHsdUnNvJq2wy1kMacKzTXxz4yFPucxQK29ruxtxokfwfQJIKFifAO9NGWUe
         f+62h3waTksjM2Ye52+lk+EH6YVtLEHSeUDc/0NIjhw/3G8bcgK0pJpmDhwzQ5icnieN
         TVI2pDecv0on/69pqk6zJkTvB14xsRhWW5GSAdBBt0gFkFrkrNI5flIXxDUVfQQg1mVu
         P2SbpfE3iCQJ76v0PtnM+wXgFoOTblBkn1RGzex9c1S+pXBhekFLFVvrK/4+BEbVpTpb
         sANgJiEIlryps5hJpdkl0OkKEZtGlz23iL5/R7ClICMa8C3F9cGY8iKPmLHO8IRFk3pC
         fb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906280; x=1719511080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LLJSsUsQJimHeyehvy4obxzFbfnPiiocs4Of944Xm3I=;
        b=n0zTh27ksNsJVMLV28leXavdKDa4R1Oe/YMslzJ3dPMrSHHypXMkHr9g/8EMNsulmV
         KtqxI8+lwT8gGB0TARqN0Ef4m1Njr1AI5XtbQj4Y6e9WhP6a2iqk53aEz5X3ID41ZrtP
         0BhcJM75oU4hKjo8qEAjhNaAePabYDzo6cfK4Gq2CLTiodozynV7RF+Y+/LtWrX5xESR
         F/w3WyOMsMGk6bAUq+qLlm4MnO3a+r1QY9vMIZLABPeUpEApB+pplEWGkH6vnSGAkZaW
         77ghu2HONfQiIrpPCEW5uLizUxVE/v1jmEf5MgDMovJIbP4NQV/FPT4MEHuG/5wrnUcI
         gXhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeZS8T/I+esh82JmNGrmU64rMJt2nnb+stJImpsuWsAvKO+nCiW932wDI5XFwcStX/btYxJykCbj4elRYiIvzmRedmbK8LdEvYxgUNCg==
X-Gm-Message-State: AOJu0YwAiLVm+2sNapO9KUNktzX8rHCb8q7/cmII8TbCpaZZ+NJnNcoD
	v22lxMjYv8aJsvS2xyfbarHGdHT2jfrOqH23aFqC66EFUcKVjNg5jK9Kn1/p7sE=
X-Google-Smtp-Source: AGHT+IGXtwYdokrlfBxhK8FxTp2sWYE+r/rA8OXrz8ajsAvjdcVPMUue0BkFzpXPCbEPXWGLdile5Q==
X-Received: by 2002:a17:907:8025:b0:a6f:147f:7d06 with SMTP id a640c23a62f3a-a6fab7de093mr273780966b.77.1718906280266;
        Thu, 20 Jun 2024 10:58:00 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.10.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:57:59 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Markus Elfring <Markus.Elfring@web.de>
Subject: [Patch v4 01/10] dt-bindings: dma: pl08x: Add dma-cells description
Date: Thu, 20 Jun 2024 19:56:32 +0200
Message-Id: <20240620175657.358273-2-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_105803_039714_BEC9CEDA 
X-CRM114-Status: GOOD (  12.15  )
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

Recover dma-cells description from the legacy DT binding.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v4:
- This patch is new in v4

 Documentation/devicetree/bindings/dma/arm-pl08x.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/arm-pl08x.yaml b/Documentation/devicetree/bindings/dma/arm-pl08x.yaml
index ab25ae63d2c3..191215d36c85 100644
--- a/Documentation/devicetree/bindings/dma/arm-pl08x.yaml
+++ b/Documentation/devicetree/bindings/dma/arm-pl08x.yaml
@@ -52,6 +52,13 @@ properties:
   clock-names:
     maxItems: 1
 
+  "#dma-cells":
+    const: 2
+    description: |
+      First cell should contain the DMA request,
+      second cell should contain either 1 or 2 depending on
+      which AHB master that is used.
+
   lli-bus-interface-ahb1:
     type: boolean
     description: if AHB master 1 is eligible for fetching LLIs
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

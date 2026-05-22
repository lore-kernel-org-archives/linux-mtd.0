Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B67BCD5BB0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 08:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/eYSW4xrV51ETPJLCBJOd9aY50jsWx5s7Bv30sztcos=; b=Lm1WxmomrGWf4v
	7GbDIycJ2Hcdb+i9ZsdmqNXXP7MMDf/k+oeIyMoKrX8wCVH3vt6eh44tYU5KAG94HYjpSdV6/Ew7U
	RLWi9jR7tPfLXJBExoRnIJ6NJyExkxulyichwu0SSP1pkrtGrQ4LFuk1P7URimICwIXwKEYETgUx2
	9svNfyeEaOMG5waSUiQOclaQnPxHIryjcTnd5nQCCTYPil3ygAqhOOTvNdPdzy6JbHC2tU0f5HOUr
	jLvDgyWCtSwj1hAKDFupztnm1Tho/zhttLoDJa337Jo81bZ2iDCvQsvY9nSQDX/wCjQ6spnJ/TS1k
	bfVHMSuNM370qHY4YjUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLYb-0000000AEWo-2Hvv;
	Fri, 22 May 2026 08:48:37 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLYY-0000000AEW6-2vy7
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 08:48:35 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ba856db1c0so51711315ad.3
        for <linux-mtd@lists.infradead.org>; Fri, 22 May 2026 01:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779439714; x=1780044514; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TYuG05b/SHofy+mQoPrRgm97VekQIyP1bVezASxS9ak=;
        b=pn3PgF7DlovaB6rqgwtdN0DCD6JIfvEh5mgaGL2Wy7uKpSnqvRNtvxzIybotErhLkv
         /mivXZ3yif0T6rplaaCKU0HJhrzPVXwjv8Vc805oIBD7YNRYEaMecMXnKDzzdB3cB+w5
         3oY4f+kPuoRx/Cv57R0O54//liJD4+HrC8gFDV4WUaVHCR0PtvTD9DQskDMTADjdLu4r
         inVxqx0Sh/6Z1s0ns74ipUYOlzoElfs0z8cqSm5WithygkzfngsNisXHRR6ecFdYynou
         Zc7t3SHUzD7zTOkVQYmh41fL3hwEKh6eRTNMUlWvkOmPAjVrgl6qRTszQ07Hrjp3qkHf
         bo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779439714; x=1780044514;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYuG05b/SHofy+mQoPrRgm97VekQIyP1bVezASxS9ak=;
        b=RIVd/o3/4X2j11Am+nxx17F1HvOk0xeS84ILVfT5pSMVW8j9bFGKmxhHLOyY8xt4d3
         kgrkh0e2c2wOcN6RivQ/KtWSmN74pjGDlRGPW3qdy2qKIHR04iufv0rGMipsNgA+/HwY
         OdBFsK7ztO96votCQVcrrS61NfdqlGLjClR4XO8ZK9h4UYir9VRVETov6mcuouz+0S2K
         qHETkr69R+BbIGZbpL0FmUh5xngvuGN1gPrqI6X0Y/4DiQBwg2PmFeU2Pe7m2CqNVbHl
         jIXpp0Qv9sKfoxaph79wTL2fuq0SvMf9OgLGUy1BB+GGKrY38mGrKmPKLkY6T0gRUzrJ
         M8MA==
X-Gm-Message-State: AOJu0Ywf81eJThsSGoPV/gyppqCZUXpcGGXLLuFTVW+dfvmRJn0oFOIS
	deCCn/Nweh5rmfIIRd8qcR1rSf94ypONuCN6P47o1vorku2+QAuLytNQ
X-Gm-Gg: Acq92OEEd7LVObkfZQEnU/LtpfRVle+Lf/e9DDVH78A0JQdyHNFXWU1ZPj+HYuXWjdw
	EwfZNe+1yy/Z/1FCotC2p9Pcctefj7RsYm27nWBEWarMJADI8O7o/iLU2u28/en9hHGBAT0Wds7
	9L0t7dbozbJ8v1f06nhAsycGAbY3YeLl6adL9+iKEVlXlfVsH8zXMd8cTUTh0syKHt4VsI0n+nC
	h9Fsqe6tv/Kf/BnTvPWg56ioK7Uts4SYIwsaPOuWhUCXNwfE9BZIAAoDn/3ncZ8vfLzNVhz85er
	wwMlXku8eOVaRcQhRbV3xppHBRMd7yXButwhwRIkB8mxM+TOQB1xRjC1RdaOtrE5UAKwdAmz7+8
	DCPRIFUrH6+Uec4g6t+NWyvkKlzKBXfIEMcEyd+WpDW9Yx9TcNZvA7tYYMM7gcdAm9Sxu9Lwwrz
	myqFt2M7vv4RMJT5aWz9FmLlwfkXQWVN/UbSezuFWodVpPreL7hWGeRQTKB5WKWdmwTXXum+UW5
	rsM2y4xNBYKlpZz31Y=
X-Received: by 2002:a17:902:e790:b0:2b2:9d60:5eaf with SMTP id d9443c01a7336-2beb06325f2mr28578415ad.6.1779439713735;
        Fri, 22 May 2026 01:48:33 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58e4fcfsm9937795ad.71.2026.05.22.01.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 01:48:33 -0700 (PDT)
From: Takahiro Kuwano <tkuw584924@gmail.com>
X-Google-Original-From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Subject: [PATCH RESEND 0/2] mtd: spi-nor: spansion: fix die erase support
Date: Fri, 22 May 2026 17:48:09 +0900
Message-Id: <20260522-die-erase-fix-v1-0-733ac8967df1@infineon.com>
MIME-Version: 1.0
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, stable@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779439709; l=552;
 i=takahiro.kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=KrDK0pyC7EIWn8HfHcY4Z06emqrBGis5mTgrgKfbASc=;
 b=1B433tjlIRV2gVKU+LterW0CTQV5XcyOjB79SsTIzFYJLEeJ5OtIswpiniPQqaxkVKjcLh3wb
 Hu0RWnBN3AHAwG/+64o4KWPsFX/yjhYaqqmqL2QwfWbAQcAENSX+rjE
X-Developer-Key: i=takahiro.kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_014834_743102_7BE13BFB 
X-CRM114-Status: UNSURE (   6.27  )
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

Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
---
Takahiro Kuwano (2):
      mtd: spi-nor: spansion: use die erase for multi-die devices only
      mtd: spi-nor: spansion: add die erase support in s28hx-t

 drivers/mtd/spi-nor/spansion.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
---
base-commit: a33dad83043ebcf18d0556ccc105b1620010f93d
change-id: 20260417-die-erase-fix-49a237ba9df4

Best regards,
--
Takahiro Kuwano <takahiro.kuwano@infineon.com>
-- 
Takahiro Kuwano <takahiro.kuwano@infineon.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

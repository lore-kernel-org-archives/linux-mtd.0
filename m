Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB2AC369B2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Apr 2025 07:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9J7skUjVZHWU0LI9zZqM2zjXjjn3C/zTndg2n4NTdx0=; b=B2pVyLRbqWW/7u
	DnqZrHCKjlhGbMLBCaNdo0VL158IwKIRMx/SWnF36O7DMboUv9JfOmSvJy6cJpt8kozt2yjXMOTz8
	4mXiTRPjJkjg8PVfuGNtNRvgKP9snGGf6m+1YCg3vmLbFSmeZS5QFZPeVhn81KPt8w+14Wl5qKdHA
	IjRz7MfOr1PvAqASphIma+pOrcCQkYK9e49othyY2E49lgNDx7wdLvXpmYIJMKXozWA3+meFL5zFJ
	dPdtluK/cDh92UqUTJShfbpUZhPGuI8Y/EJjt6KcZgGFTM5RsZD46Dj0dn0WK5LiDah1GdFA5q+4y
	qeboWZAucbes1juy84pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5K19-0000000CAiT-0sIG;
	Thu, 17 Apr 2025 07:50:39 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JxZ-0000000C9sD-3LPP
	for linux-mtd@lists.infradead.org;
	Thu, 17 Apr 2025 07:46:59 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39ee6260fc7so86336f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2025 00:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876016; x=1745480816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ldtjm18t2KR0i37dRzkUBtGT6ZljIzsaE7OH3uDOb4U=;
        b=rOV6pk8Xjn3dRsHpJ6mIL6Io2A97NFBLYDzzbQnmPEPmHZdRKdincO5x8VbbuuaBe3
         +pBskxY6Nntnpn3VkUU3e0yglF90R8b3aS5czom6mNS/fIJ+KQDu/TS+pahjhr+obFWA
         /P9cte4A5v1vKg6MbDN6gnozgfIUpILLru3Fu+J5VyO73EdFcIPMsZt7cNyWcsbIiEWp
         EL3yk+G39U2mgQ2R9K3Sc0vCW2Thm+Hiia1UgExEt0/J4eYnCdM47dHtwY+LTe8gtSG9
         1w8PFjFUWewbsrz1bOr8kKmS7sNGj0kTsrd/ZT33HjF7ikFIGFDld2cqu6w7ZRgCAyDR
         Oh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876016; x=1745480816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ldtjm18t2KR0i37dRzkUBtGT6ZljIzsaE7OH3uDOb4U=;
        b=cmipspHT2R7s0ZgdAAZsWkJUVEYGf3Yyh8lJFkqbCMfv+kGe39JeoORfnYovNoRYVA
         kVUPnx+1A3f0Pz+onEV8E87qgsbnEoC9K6orWVoD5Qm/YyzmVd1ne7o6by2VMBqQZhXs
         1mNZvYeNVr0nYis6Jl1QDsEuEkEjw5Bpu/tbtkFsLNyRnAaH2QvkCpGJQ4GnOqmfIYJD
         gspZ9T2KMI8TzneluiAoEB6tFKXg3HEVdhNmMd3soK8z1deX9poaXUvSDkotaAx9smHY
         IoyN1yVjZuDbfSnLkAChvqqX4BlZoxecxBgTGTpoGXvAXAa7yf2C9hVIvxTACvtFZJ48
         gejw==
X-Forwarded-Encrypted: i=1; AJvYcCVGdr06ZyCr2YiqibwaCKJ+LtwweTT+hGUJ971KjFB+PMFHdpoQrqYp/507lRiSh4nb4gWWhDtOxc4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMF/eOm6AZV/4MJhMQ8tBHoA+C1INvQHX5DGB1aJ1KjR77N3AP
	Ixu7KgGz0HippLZOvunwq9BjHTmcVsWyqO4SON1vff2jDSvxCvNKD6AGWD5oKfU=
X-Gm-Gg: ASbGncvahswhQ52j6AARkIG32i81tby0I5KerXh3KDBv/JjVCUbkglW6SRtEqifWtsd
	m3MfxgXAdzfqf9SkC3JpYpPwqOLE16lql479n+rPktSEpCzx/Ugc6lQg9etn/qs8IiQ7LLa7s+d
	L1I/tDiVyE6grzcpdvRO0xnza0PFF37sVpM7pya8I7EZ0Sle5utAJAJW+a07nslyZaJTjP8BYLb
	7nUgE6C5GPvgTw7rHMLd0R3LV3zW6Qx4Vx4G4v4FD4ZggI9z/rcY2tSnot2uADXm2HCWwZkouq7
	vxhQ3+ZMeIFk+Rq401v39EElxZpTYs79Xo5cWI0Ahfj3gFaPvdwCk0eM3moIJ1Drtj870s1qYJx
	sbHksTQ==
X-Google-Smtp-Source: AGHT+IHuV0Ir2ulqdSy8+QnxiDUvWr3BWSdW2/52LujDrmAOVewyJjR5ucyVhKSbc9kdBrxbWkJOjg==
X-Received: by 2002:a5d:598e:0:b0:39e:cbe0:415f with SMTP id ffacd0b85a97d-39ee5baf496mr1500376f8f.14.1744876016114;
        Thu, 17 Apr 2025 00:46:56 -0700 (PDT)
Received: from kuoka.. (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9780a0sm19424565f8f.50.2025.04.17.00.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:46:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] mtd: Do not enable by default during compile testing
Date: Thu, 17 Apr 2025 09:46:52 +0200
Message-ID: <20250417074653.81593-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_004657_832125_98F36080 
X-CRM114-Status: GOOD (  11.24  )
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

Enabling the compile test should not cause automatic enabling of all
drivers, but only allow to choose to compile them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

For longer rationale:
https://lore.kernel.org/all/191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com/
---
 drivers/mtd/devices/Kconfig  | 2 +-
 drivers/mtd/nand/raw/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index ff2f9e55ef28..aed653ce8fa2 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -98,7 +98,7 @@ config MTD_MCHP48L640
 config MTD_SPEAR_SMI
 	tristate "SPEAR MTD NOR Support through SMI controller"
 	depends on PLAT_SPEAR || COMPILE_TEST
-	default y
+	default PLAT_SPEAR
 	help
 	  This enable SNOR support on SPEAR platforms using SMI controller
 
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index b8035df8f732..421b6feec090 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -34,7 +34,7 @@ config MTD_NAND_DENALI_DT
 config MTD_NAND_AMS_DELTA
 	tristate "Amstrad E3 NAND controller"
 	depends on MACH_AMS_DELTA || COMPILE_TEST
-	default y
+	default MACH_AMS_DELTA
 	help
 	  Support for NAND flash on Amstrad E3 (Delta).
 
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

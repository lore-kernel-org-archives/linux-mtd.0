Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2451BC282DE
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 07:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NIj5eME/L2U8jt8bIn/jEm08y8G987GARPCNVFCQUl4=; b=uDGbfHG4cEZzYx
	amrqJTWpI0zBEARsqrYu3f73wOfUlBupZPbS9hZBOvL+b8q3VuqGOVwvd1IpyY2psUvIO88KWg+72
	1sGh2RtV6IPLcD6glihOYzYThvbqCkZLp+y8Qk2HI41YvRAjiH7BecplX2v/856bpZmSDQ87jE8tZ
	Os2XPJRSLaWz1I0LJxyqbMfwJfrXmrjQ0iBya/6av2ufCtkR5XZc7ft9LmDsgYqbvi48EH6VuQCAt
	gP2YBzyjW20SmPYysq00e1tPDT+jkMy/1S+vuT9mJqBYL8Nzba+kosksqBc8Td6q9yvnUZgUOVrpA
	EF5Oc/jImvA84/mH6ZBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRpu-0000000DOyb-2RhJ;
	Fri, 07 Mar 2025 07:09:34 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRps-0000000DOxW-3SdO
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 07:09:33 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-390fdaf2897so1420035f8f.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 23:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741331371; x=1741936171; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MoHAISknFV0nfp1OEo18Uj1nilezf1cqFzlBYUcX3F8=;
        b=GHZ4tZh4Wf1qKJhm6A6KzpOnMqj7FzEAbuHYiMR/y7qaXyyzGPdICm06s/xgK6+r6j
         GEYjhZ+GhxiKv0+9BWBuPMJPT7lLhsvQHJkV9nYY+FH+Rc6i0ygXgV6EtKN4hKG7Fsaw
         ca9+/ViqJr+LSWaI1Ep/UlqzkakqwGxjp5lMcAV68QYy15f59MjbN+/vMghzxnuge5q5
         JDVWsEANXHE67C5KlQ0zLI30pvOKoYWWtMwlWpCQq4NyjMpHC0nKfATNZsx2Cq+BI4gl
         7v/K34VMAREcf7HtgsZkTobxd8HixepyL+0MI/oViNsjpZiVkK5LPNYJWzU9IXOUWE13
         I4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741331371; x=1741936171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MoHAISknFV0nfp1OEo18Uj1nilezf1cqFzlBYUcX3F8=;
        b=OvsS54NsrZH0z+2TDiL/IrCyt8hk1duutAvzPRwbheYHR6UKRrExf+UbtVURuMrukS
         MAt1M9x5aVbP/CPKvWbGNGLAoKhN4+v69umIRMEc//jOO2Zmv/YINaT/M3HBiPNSqpmg
         v6GpjFppwip7HT/aV+h5YvSYk7ov5mmaA/r+OtbBL88VKDFoQztORsyoA/burxrS/wS3
         nG7Xpj7vecYrrTJflQguTbUihijv6yGoxg4YnnUAD6LlwNd6XnfLFT6PCcLis4DRfp+H
         CijQ2ocdbvRPV3/FUmMCppFAG/v0dF+rH/49xKKrFNVR2SKboJXtrjUMHsbEdaqfgp4Z
         N2oA==
X-Gm-Message-State: AOJu0YwqTIR698wnUcGYu7yo9OuafZ2fXYrAwqFyPlEJf1dtaxt5PDKX
	UjYNa4RUzCvg35fKWk0JxkNnCoyoNZysk4amRNGEKc2KhAIdu6CShohXfrKHTjM=
X-Gm-Gg: ASbGncvQ041UPBh5ETI5zFq3toyLmEMWujGB00iZyMa6Z8rmjCu/Z7vOI3clq23q8Gi
	F5PfPZ2FQdgS4787KdMNV/numH22D78ntBb9L47NImxiq6b0jfudMSPziXzQ3tCsDv5ZAyGl7ON
	zSQgNWNb4CFZfpGc7yNnUk8cpX/A6EuZzQyPNRcRr/KrSJBUSZYvBVjAEZQ0jmUAqvJoeaKqofK
	0/TAxyD0dzol6VHEtQdYdZbNKKc2debQv8ObdeZ+gC1NQD2htD0XNwPj1d+xUEfBOoKeKDKeCZm
	xydomd4V+RgqckJf/x0V2RBDv+A1urfs1fgDTH0aPHldEpg=
X-Google-Smtp-Source: AGHT+IF/M+SrLJzFQCBlgX3ewlX1/Jbu181O17xaopK9LG7eLVDZOJxGUfHeMhBYb12XGxIvhRhdXg==
X-Received: by 2002:a5d:5987:0:b0:391:2a9a:4796 with SMTP id ffacd0b85a97d-39132d244c8mr1532370f8f.18.1741331371047;
        Thu, 06 Mar 2025 23:09:31 -0800 (PST)
Received: from [0.0.0.1] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239735b58sm223243366b.117.2025.03.06.23.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 23:09:29 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 07 Mar 2025 09:09:06 +0200
Subject: [PATCH 2/3] mtd: spi-nor: explicitly include
 <linux/mod_devicetable.h>
MIME-Version: 1.0
Message-Id: <20250307-spi-nor-headers-cleanup-v1-2-c186a9511c1e@linaro.org>
References: <20250307-spi-nor-headers-cleanup-v1-0-c186a9511c1e@linaro.org>
In-Reply-To: <20250307-spi-nor-headers-cleanup-v1-0-c186a9511c1e@linaro.org>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=tudor.ambarus@linaro.org; h=from:subject:message-id;
 bh=/LpeOqsM8NBgOqW35TPTqO8VCHLgeHC6lYd49z/YGJU=;
 b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBnypujSncdDY3lu+Kfn/F8gf2vcWtuNYxXuyWJt
 bsbbSmL3nSJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZ8qbowAKCRBLVU9HpY0U
 6a2HB/9jjqb62VUS2jdrCibdtJXByXkv4kqazmyiCgZAmL2vijZh/v4GxBLzYJM5OYJ1WPCtAEv
 mtxi5DNLgZc0q43tCRY8oeL2rJJQWtaKgANED6neq0+oIwvbdWsWfXGzpGVl8PRpd5gfTIHvcB/
 p56MfgzhEFoSqW4UA7FJVb0rw+cddYw5WOUGb2vxC/BfFt9UxFnAsFJ881dtkHxPtMGV4Xy6Dqv
 z4APYw/aaR5N37BSqR6W8bRaDJzcMQdLsS3Auk91usanoQgEmqmT5JwCRoc9BdKhAaRTHu4brdu
 WCtpYC1gPuOY1lB879kKWoeDw1Udn6TsxLtZqlJBiUJvufMf
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp;
 fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_230932_867832_FAB66B33 
X-CRM114-Status: UNSURE (   8.62  )
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

The core driver is using 'struct of_device_id' and relies on implicit
inclusion of <linux/mod_devicetable.h>, which comes from
<linux/of_platform.h>.

It is good practice to directly include all headers used, it avoids
implicit dependencies and spurious breakage if someone rearranges
headers and causes the implicit include to vanish.

Include the missing header.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1091c83294fa33393f27f914efb254da7a7524a2..ec298a285f820383b2c1d9ef4462a000d1b3b861 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -13,6 +13,7 @@
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/math64.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/spi-nor.h>

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

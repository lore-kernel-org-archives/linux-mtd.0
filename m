Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1EBC021B2
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 06:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1EhS8urHIcehK4Sonilh2oIQ/nfFIjVPYauSjVzCeYc=; b=pWAefPd6hEqoOt
	xy9dayIHlp4yuDsvrX0cbnYoVeBdPIGGoX+CwA1g9MtWC9vfOTmbR4udygaqZaEs+Tv35Q1aVLWgh
	mpa/TTI+9ltFHFLHEBJpSkpNaj1GA1Eukc5uv/+5cZDLhL/GpBKA19WiDpDO1LXU+NDhRmZtf9cwV
	tiNdE/auF8NAfxgDSM6CCebHB6C07RwIPG9NaTmkKSSVQwJRVUE/Qf2mQzXCJRRADl0IB4Wy5RrYa
	O356W/1Xhe5jviR3+KyQz0+SQGkpWeISEGaU01nihkdM5YhZDulsdD1U3MiolBYNowtlTMHDir+vi
	yM/3PR2IrRucqAZO4Y0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm5pf-0000000AXXh-0jxA;
	Sun, 23 Feb 2025 06:51:19 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tm5pa-0000000AXWx-1Ep8
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 06:51:15 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-439ac3216dcso17546235e9.1
        for <linux-mtd@lists.infradead.org>; Sat, 22 Feb 2025 22:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740293472; x=1740898272; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wf9IOjBQ3147jp76ze9JeJiEVzCwi5QU/DzJ1ulfNfM=;
        b=vjBME98akpDiyZq5XRhSKTRrwoD7tRIpe7F+42RSiT5i+45pNiVirlXPhERBxph9vV
         wFlDLj1O4xZ7CbPAMq5zB5R+eR4LQ10t+VfXSnxCl7gsffgp8DNXcd+kfiRoy4Cd+XXe
         6b8+RqbzlTmaY6UZ/jytx5YsP+qjaYkshKRQpxQuXgMSA+5HAMrVokcuOfzWMUWftvUs
         P/6Ig9o/iLNMEvxVRtxBHETDKiN14x5cHLJ69UeA9XzXS2ehZUjTCboktFLLsk5MN9we
         tHyGbqpKlG7GvQncJ/OExA6sn1DyCgalHLqTLp6iTzhMh9G4LO21lRrwNrsC3TDbuOAq
         7Qww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740293472; x=1740898272;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wf9IOjBQ3147jp76ze9JeJiEVzCwi5QU/DzJ1ulfNfM=;
        b=uMfWTLiMkEF4BbxoxFqXSvx8KRwrTpdns9bidg74i77kKoOUxBkzrD7e9MQEUSLcsX
         N2XTMO4+UtK2L0XwFF4iQDRJ8lWXo5KjInhmKmLy9hBvzTcyBWW/UGiWP68I9IjqajzX
         qACvObUrlOcFFX+cD+YPqTSTi4NDrOUuCvM7+DfCNy0ReGOEoeYO6O77diGo8gUZ31oJ
         QcAK9eINXk2Ejju+Aiu+cxaxQxOJFLiuQ9rhJmmldq74hDX37qvkEzehFJ3ZzKoRZhab
         W4xd0x+ehS42fbGjWHQYUemjreXdtQn0/1HSRRApXbVqnJDvWG4EHjwA8jTarjESz4/f
         vTJg==
X-Gm-Message-State: AOJu0YwvHIl4vwKRexeXGdhPxreWU4S/mvOpqqc235vyuCB+ltuq3qX5
	XRuHDxBsGjGIF0kggvWbnY4EAbC4BmRMcO5wHRhS5cN1d9Cmone43J8HSbk4v3E=
X-Gm-Gg: ASbGncs3l4lV6jqTgeghBs0rFA/59wqEIQ4/fxC18LX9im18+3tRKdRPubPx55I4XFB
	Fdp2v1AA7NLUUIe258mFmq3sUPKOy7lfUnTyY3k5t+0m8yETzn0SIVLlS3ymIMiRoVw94KZmEuU
	OwCoLeMeoArLnlKJWsTMs+b+iEzSHiBkNZgmYZ0d/7D/MZYAgYuH3PDcng29OxDpcAttU5e+HjY
	9f91mvixoBDtJHwwhYkiil/L7uc2w8WOppEXE87lZ/WiEPlrgUzHv52Xy2XBRpNMsHSvT8EcLxi
	+bDpQZb35WiYlrUST4f9vdSy5+ebkNlVO3H8b+RZTvXBKP2KzIfsoXQFR4cMiTsmbdnSu63oXGA
	ADDAxQg==
X-Google-Smtp-Source: AGHT+IE0OLuFGVI5dKmS0jsudLxiGBBLypYvwDHB/8sXl1IwFDl/fYKFthNKHHKb91Nism9Vcl2cbA==
X-Received: by 2002:a05:6000:1541:b0:38d:d767:364 with SMTP id ffacd0b85a97d-38f70789915mr6307201f8f.13.1740293472502;
        Sat, 22 Feb 2025 22:51:12 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b4491sm27673755f8f.7.2025.02.22.22.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 22:51:12 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Sun, 23 Feb 2025 06:51:10 +0000
Subject: [PATCH v2] mtd: spi-nor: explicitly include <linux/math64.h>
MIME-Version: 1.0
Message-Id: <20250223-snor-math64-v2-1-6f0313eea331@linaro.org>
X-B4-Tracking: v=1; b=H4sIAF7FumcC/23MQQ6CMBCF4auQWVvDTKEQV97DsKi0wiTakilpN
 IS7W1m7/F/yvg2SF/YJLtUG4jMnjqEEnSoYZxsmr9iVBqqprYm0SiGKetl1No3qXe+Mu1NnG4L
 yWMQ/+H1ot6H0zGmN8jnwjL/1v5NRoerHzrQaEXVrrk8OVuI5ygTDvu9fjVi/6acAAAA=
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740293471; l=1527;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=TiTiQy9fLGmd0hKyx7X3r4Y22u/yWIg9kNt45XGhIDE=;
 b=GxCTwY5144l5jdjB8PIutHJngVtP8t9EQD7nJx+bWJHmycy0DqOZGDxZz+oDmfaV9Sj16C3RN
 XIfg3gXJFhOAXSUF7RmsdyyTKrdyVT9ySxayHZGhCMbD0pxxSkuZrsd
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_225114_354187_832DA1E2 
X-CRM114-Status: UNSURE (   9.59  )
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

swp and otp drivers use div_u64 and div64_u64 and rely on implicit
inclusion of <linux/math64.h>.

It is good practice to directly include all headers used, it avoids
implicit dependencies and spurious breakage if someone rearranges
headers and causes the implicit include to vanish.

Include the missing header.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v2:
- fix typo in commit message s/if/of/.
- Link to v1: https://lore.kernel.org/r/20250223-snor-math64-v1-1-8c7653111356@linaro.org
---
 drivers/mtd/spi-nor/otp.c | 1 +
 drivers/mtd/spi-nor/swp.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 9a729aa3452d..7d0b145d78d8 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/log2.h>
+#include <linux/math64.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/spi-nor.h>
 
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index e48c3cff247a..9c9328478d8a 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2005, Intec Automation Inc.
  * Copyright (C) 2014, Freescale Semiconductor, Inc.
  */
+#include <linux/math64.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/spi-nor.h>
 

---
base-commit: 03e7bb864d9a9efca02743d4a9fab8f3d0b00407
change-id: 20250223-snor-math64-8d8d6db27a42

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

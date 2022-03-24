Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808E0C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Mar 2022 07:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Cc:To:From:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=+nsKDvccSYDBxDZ1aK42qNsECP+tm1dtlI7PnlOZGYs=; b=sdn
	14PZgF+K1gX1VSUx3GJeDpCQTHYkoUZStIKvuxswSNBuMRYz8datkG53/Qdqp5Otxe//REyFqJIwn
	I+O888jCCsu16YRLq/kviFZif4r8zjbz7I5asZymUBHdsUg8dZJt7y0Ltuuy8LphGi5Nt6gdQh9FO
	zCPP6LUBlImY2QRAhTqRaA0J8ZK/7EXnJ4TMasKdBxftKjnVoqu11SEFmyIj2Oi+N+YNTNnBPGc1w
	TNh2dNEIqTXqzL7K/t9ZIIyA4z+BGTAO5+PgZqy9K3c5t1vyhv0F04MJJ4P0Yx2b9ZsKuaih/hawH
	YafZR1F0+KkUH4vhEXB2/7E4GN/nS2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXHSI-00FuBz-Mg; Thu, 24 Mar 2022 07:00:25 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXHSE-00FuAJ-AQ
 for linux-mtd@lists.infradead.org; Thu, 24 Mar 2022 07:00:20 +0000
Received: by mail-pj1-x1030.google.com with SMTP id b8so3920253pjb.4
 for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2022 00:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nathanrossi.com; s=google;
 h=date:message-id:from:to:cc:subject:content-transfer-encoding
 :mime-version; bh=9KqvrxLo1G07hfDRYkFXfXDwuhue1HJtF4AZIGRJRfs=;
 b=kLesff5qCI0HzQizbChuJhKB9KB6Ky0V6lmu/+gXYSvvOjWNH6fW+tCao9aVwQVGPp
 WNWNy43eY7wjfprkeSVyP2P+AZv1XbGCFbl/BhGhbdeCp9mb0p90vKpRqHX2aZKO235U
 glPY1lbb/tB1DA5W3pTZa9t/PA+6mB2BYBhYn5GZq96Vwt6KBZEwHz496pYJmfFSo6mR
 iZG1KlatiLX1HDV2FL6I7eYbZ5FBKic32DV/GPgTaHli0w0i7o7FOaSFVUmiNdOic4Rs
 PM8bUMh4FVxHstu1z9ZIgLQJkfGQoJsXzN5o3ov0nE9vjhIOxprCKkKezEtfkH0eN3Hj
 vMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:from:to:cc:subject
 :content-transfer-encoding:mime-version;
 bh=9KqvrxLo1G07hfDRYkFXfXDwuhue1HJtF4AZIGRJRfs=;
 b=0KQH0zw79i+zV3+/lJHmbzUeDXedg5Y5QcV9uVH0JB7Y2Mk9nm/qlYbgP7Eo3On6fq
 u+G0Vyo1IFt0u7vFc5ZqN/FS2qPV4b0tLjm/+GvqQ+BYN2AiaMmX9JCS/7GSZY+LjR2K
 gIqCN03ZMq1+DSVvx0xOCGX63N47vK+H1V3UXQNX8Zah4MgXgjRoo7eUbsH+4uo/1Brn
 JzfQCaRJsktXzPweCxGUb96VAxtoZq85xyuwWcNmIp3IGcPSQk6WPLj0G/6LdG0oiU6y
 uY6QmLXAUj2a6fOey/HI5zJupEdhmHI2iAKYvnkQhexiV636M4ftQ5Mo5E8aD3G3+mUR
 dMJg==
X-Gm-Message-State: AOAM533fHD5OYjyx3n7zMzjhEik1Nmugyh8TnxCmjXMaloiHoepUTXTK
 rsaVxeL2vHbs1k8Ebepu3IZ7DQ==
X-Google-Smtp-Source: ABdhPJxvpPy6O6jHCvjqweYTUKvXaA/YkxiVZaAc9Z2fv7eYKK7HxH2YvrO8WjRr34htasGBvtgllQ==
X-Received: by 2002:a17:90a:289:b0:1c6:584c:acc6 with SMTP id
 w9-20020a17090a028900b001c6584cacc6mr4397492pja.124.1648105215194; 
 Thu, 24 Mar 2022 00:00:15 -0700 (PDT)
Received: from [127.0.1.1] (117-20-68-98.751444.bne.nbn.aussiebb.net.
 [117.20.68.98]) by smtp.gmail.com with UTF8SMTPSA id
 q2-20020a056a00084200b004f761a7287dsm2136914pfk.131.2022.03.24.00.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 00:00:14 -0700 (PDT)
Date: Thu, 24 Mar 2022 07:00:04 +0000
Message-Id: <20220324070004.225738-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Nathan Rossi <nathan@nathanrossi.com>,
 Nathan Rossi <nathan.rossi@digi.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: spi-nor: core: Fix 16bit write sr_and_check status check
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_000018_432606_EB4D2B5A 
X-CRM114-Status: GOOD (  13.50  )
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

From: Nathan Rossi <nathan.rossi@digi.com>

The spi_nor_write_16bit_sr_and_check function description describes that
the function compares the value of the status and config registers after
the write. However the function does not implement the status register
compare only the config register check.

This causes the function to differ in behaviour to the equivalent
spi_nor_write_sr1_and_check for non-16bit writes to the status register.
This is important as other functions rely on the return code of
spi_nor_write_sr_and_check. For example spi_nor_sr_unlock returns the
result directly, which is returned to userspace such that failing to
unlock the spi-nor device was resulting in a return code of 0 instead of
the expected non-zero indicating the failure.

Signed-off-by: Nathan Rossi <nathan.rossi@digi.com>
---
 drivers/mtd/spi-nor/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 04ea180118..d75d4f8a45 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1007,6 +1007,15 @@ static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
 	if (ret)
 		return ret;
 
+	ret = spi_nor_read_sr(nor, sr_cr);
+	if (ret)
+		return ret;
+
+	if (sr1 != sr_cr[0]) {
+		dev_dbg(nor->dev, "SR: read back test failed\n");
+		return -EIO;
+	}
+
 	if (nor->flags & SNOR_F_NO_READ_CR)
 		return 0;
 
---
2.35.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

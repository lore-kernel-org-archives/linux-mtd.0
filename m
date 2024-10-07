Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58D3CFB441
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2024 12:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mxnWR1gZVsaYaxgVQTsQPMj7Q1FOWaRr21SPh46H/fA=; b=PbXVPISf4BMwuB
	mk4/SAZn6Yv+9gJNnrrdwDIzglMbFU+N82qEqGW/P9JfxyYu3AqFda5/rOZLlDcnbMj8/k4AgPCLM
	FS9mb01zNDxDCSeggviwsYM4UAK6/B+wrGfWkAgld5UWKTWUu9Q7yWkQLC549/mNdVlXFYxsi2/91
	N4gYisjW8qTeNyQ+2MmBNCgNG4GaDwvshd0Dz3XMT+42j9T5T1gOyPxRaMAcB4tk7aVshOX3VnM7E
	GwYEdNrU/bhj/FigT22Usvez0gfSV48iNYV85Tb/tRB5EdHt1rHkM6Xg6Eh5CUNVi/gDoiaA7chJg
	UlnVwfesxthJvaYXy4MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxn6W-00000002O0W-0Rxf;
	Mon, 07 Oct 2024 12:44:48 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxmmS-00000002Jj2-13aN
	for linux-mtd@lists.infradead.org;
	Mon, 07 Oct 2024 12:24:05 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-37ce8458ae3so4103319f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 07 Oct 2024 05:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728303842; x=1728908642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mtsdn2sdnIw2THBvQxYTL0WcNMFNnP+qLKduuE3CQsw=;
        b=m5aAXCCdNaop6G1fWvfWlnA1bgBHTvylLc/XRDQp/O+f/Ey2ZiIoTLLv+QkNi5lo1O
         PtE5iY2B/iUDYNS5DUln2wcfX4C7a7wo7eZ/IBQ8I3A2cnrvfiBevdDjJc4sYxFnX60S
         yO/eHpMpQL19wmA8IdalR1AK1bdCkRDubSGAtREnY4xDZCd4vg8tclQsi98n17KYKF4c
         CEFz0J5hD9KVlsV6U2iIuCyAvPcdJGqqs3DgqgQeTLRISWUL0JPvud6IcgFsHrlcj+tJ
         9ql1+tyHdwX39gHC8ZMrqrN1cYJjdVYovG/X59wUcrumwgXcp9PlPqtVJAvOCV2v7/VC
         GN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728303842; x=1728908642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mtsdn2sdnIw2THBvQxYTL0WcNMFNnP+qLKduuE3CQsw=;
        b=Px3fu1bA2ROxN6dU9vc2obQQ37dIMprPjImwRREajRI4bliaMmgV45tK2Tlk0I1FvX
         5APat4Sq2eP1/HU8j1s6pIekrmF9p/9SwslZVZUVSCZCro393IR2R+QMvXuqntO0pwd7
         rGfuoasb5Qd4z7z+FWHcGyGw2Ql2XzlByVG9OEAI3KN/He91IaFQl8KQOtkOGLwI6vIo
         t076r7vzmmwXCDd12/rq9rB4prkCMCnrj5cIoC4yMDhfv5Hl+qWow0ICtpBYf4D2iLxF
         oius5b31n2j9WdWFfI1+j2/H6P1d2NwiK+RkHAOUJvL4W4YzmwvIFra5o9J40cXhXcMm
         +JPg==
X-Gm-Message-State: AOJu0Yy3lFOqo90Yk4XgFDj64qFxdIWuIH4EoxpBOLjY/OSXJntGPxHT
	eo30YSC87aNp3lS19deseHhIXcBWzoHkX4CNvk6nl1LhzAU6x8gy9M3P5RwDlPtOoitMfb04dBT
	j
X-Google-Smtp-Source: AGHT+IE5a2HJKDGTi1yqW5JxEQV/1ZD7BrBNtA8ZdNme3sZO53ssLaPmPv8UF1maBvki6cDzJkuG9Q==
X-Received: by 2002:a5d:6a4e:0:b0:378:81aa:2653 with SMTP id ffacd0b85a97d-37d0e6eaee2mr9694904f8f.9.1728303842271;
        Mon, 07 Oct 2024 05:24:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6100:637:cbe9:f3bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1695eee7sm5626914f8f.82.2024.10.07.05.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 05:24:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/3] mtd: rawnand: davinci: break the line correctly
Date: Mon,  7 Oct 2024 14:23:49 +0200
Message-ID: <20241007122350.75285-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007122350.75285-1-brgl@bgdev.pl>
References: <20241007122350.75285-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_052404_319364_C514B052 
X-CRM114-Status: GOOD (  11.42  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The line in nand_davinci_get_pdata() prototype is broken in a weird and
unreadable way. Make it consistent with the rest of the code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/mtd/nand/raw/davinci_nand.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 5510b39c0b98..6c884b59bc98 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -487,8 +487,8 @@ static const struct of_device_id davinci_nand_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, davinci_nand_of_match);
 
-static struct davinci_nand_pdata
-	*nand_davinci_get_pdata(struct platform_device *pdev)
+static struct davinci_nand_pdata *
+nand_davinci_get_pdata(struct platform_device *pdev)
 {
 	if (!dev_get_platdata(&pdev->dev) && pdev->dev.of_node) {
 		struct davinci_nand_pdata *pdata;
@@ -557,8 +557,8 @@ static struct davinci_nand_pdata
 	return dev_get_platdata(&pdev->dev);
 }
 #else
-static struct davinci_nand_pdata
-	*nand_davinci_get_pdata(struct platform_device *pdev)
+static struct davinci_nand_pdata *
+nand_davinci_get_pdata(struct platform_device *pdev)
 {
 	return dev_get_platdata(&pdev->dev);
 }
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

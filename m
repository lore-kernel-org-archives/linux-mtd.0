Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DFBCCA47F
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 11:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bqQq+YBRrZzOKVtkejs3QnERxmjUyVkEHxNMIDCAg2w=; b=XPNLZrAaTy4Va+
	rM50qbiwugKk2aHkY/O24E7woaA43F/FLROagVbZ6bdPwOZb4D8iU8L4GnzThHka6Il/SeAdyDjAr
	kMHDb5U1z2EewHZdMbTGy+Ug2Hxa3zxMAwporYwy1IBW+m12VPaq/aVbLUHVT5RRnKH+qCslA95Vt
	S51zI4YoEii8iB40H/DWG1wXjbYZEOMnpaf4smeArZ2G2Ay5apZbXKRVWDERKz50xw81NcwqvaRu4
	Hn69fbwiRAUiSkUc4tPnPUxWqtrBCK9PhO8bb8lwODRdlzKl6/xMRiRer+hwm2ptIAltWZfwda/zj
	Yv1y5W24DKng9V/YU9iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69OQ-005vFb-8A; Tue, 28 Jun 2022 11:28:30 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69OF-005v5S-CR
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2022 11:28:20 +0000
Received: by mail-ej1-x62b.google.com with SMTP id u15so25075420ejc.10
        for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2022 04:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5wzm8aXQ7jfEpVVa+hUFH1hW1Ct7FIztd1NOXIDzjfE=;
        b=XH74Pz5YOnB4omNJDTWscDju8Y67UOhoqHfCkZwCx5LLSKKYOOXLjuFrhSnLXqhXB3
         abm4wLC2wi/67TJtYAa/4rvjJpmbmWWbhJcLWdWed24A+CE9iREckGSewd0sZjKYPvQ1
         e/O2CTyyhBBO+MkRTN4w1gteEFLZI4Dfa8zZGpVa4eYAKrMbkhl8MvxT0Hy9OPUehRhh
         HZI9X4q0Db5Ykuh0H8l9PpS5SNzz3CtijZO6JId8OMZvKYF9I91K5V/kuYyqvO6JiLbx
         LqrDKHy7KfRuBMfCTnh1rYHX65tbNn3DWi9TBAqbrkRmMUxrt4QU6HUyQhjgKNE+tKaZ
         UNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5wzm8aXQ7jfEpVVa+hUFH1hW1Ct7FIztd1NOXIDzjfE=;
        b=lCEZGfZbNh6yGzqxbP1VRf1LCFNLpJIGDiG9mRtbXkuwMDtPHgeXGoDXe97u0l+M88
         HYxWIdT8XXtpWGVSO9h31O+6O3zs2U12TVu207/rSKdGVWJ+2+thvDIHdKMG5yOfEm7n
         FWRRg9yjTvCV+xUQavZiYFfblqY1bGeEh++ujBTK7vl2s2gVz68hGarF7NJq6NaA5ffk
         PnYHv5p7DzSx9CUOi18/eVmOkMW9OvOQaStKyyz9MvY7A8j86PZjdoHltwT6iZrd0VWx
         nQVkyBS/vsHrJFF/h+vbn/0lSrvGIkbheGVQa4NMfn0UNhNN2BRQHHjhQIwiYFUJNkFv
         rYkA==
X-Gm-Message-State: AJIora9FjQi0iTfHSiGQwx7pWkd7zOHGHZvtraYxKR9fYOWT4vH0OfGm
	au3FX7q+A09wKA5w6Ok9woOTwcWNtcY=
X-Google-Smtp-Source: AGRyM1sDsDKOUmH0i6QVDvM2Jlx6H9R/wRxIYS1gH4CBNfulyXXOOVydVqD0/buMOXrZ4rCojhNJPQ==
X-Received: by 2002:a17:906:4fd4:b0:722:f223:8d86 with SMTP id i20-20020a1709064fd400b00722f2238d86mr17271003ejw.558.1656415695311;
        Tue, 28 Jun 2022 04:28:15 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-061-215.95.114.pool.telefonica.de. [95.114.61.215])
        by smtp.googlemail.com with ESMTPSA id h6-20020aa7cdc6000000b00435720b7a1csm9456318edw.20.2022.06.28.04.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 04:28:14 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	tlanger@maxlinear.com,
	rtanwar@maxlinear.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v1 5/8] mtd: rawnand: intel: Don't re-define NAND_DATA_IFACE_CHECK_ONLY
Date: Tue, 28 Jun 2022 13:27:28 +0200
Message-Id: <20220628112731.2041976-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com>
References: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_042819_456562_550861E0 
X-CRM114-Status: GOOD (  10.55  )
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

NAND_DATA_IFACE_CHECK_ONLY is already defined in
include/linux/mtd/rawnand.h which is also included by the driver. Drop
the re-definition from the intel-nand-controller driver.

Fixes: 0b1039f016e8a3 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 056835fd4562..3df16d5ecae8 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -100,8 +100,6 @@
 
 #define HSNAND_ECC_OFFSET	0x008
 
-#define NAND_DATA_IFACE_CHECK_ONLY	-1
-
 #define MAX_CS	2
 
 #define USEC_PER_SEC	1000000L
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4745BCA1013
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Sep 2025 16:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mR3GG6Ju8x5+IMlA26CcswzfFRQDrbBU7aznKWivrQc=; b=vqro6jFHepG9I4
	UsJmErvhxC6DyoPwCiuQHgB7itvok0GAdX+9fMKI6xF4Na/QuOzQOrZuOYOAtGCZALC8ha6HIg38/
	EVwTjYP8EqwvlBakicVdQp2/1woNQ+onLnx14ZXHDTeEfLHddsmFlyY2R8D0zpQRssBnCzY2bFNNf
	DRca1nitRqRGdYLurU9A8ukiskb+0RpaSkdKNIg9LA9BnjPYLiNouqTfNv+OgiMav2hkPyZLyOKY8
	MrUrom9oDTylXf5TbaqrBrNCVLf7LY5ABFA0i9MHqOSf45flsxNqFS2zWHAi4h6h4576KKLmyB2iG
	w8Lu7aRAyL+wDgEOvxEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCnV-0000000Ctty-0Zlx;
	Thu, 04 Sep 2025 16:26:53 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9me-0000000Bns1-20Mv
	for linux-mtd@lists.infradead.org;
	Thu, 04 Sep 2025 13:13:49 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 584DDZn83474169;
	Thu, 4 Sep 2025 08:13:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756991615;
	bh=T7yYk1ncConBQMSTgtkkCJVLyAVKphf2yMRWEtKMbI8=;
	h=From:To:CC:Subject:Date;
	b=ZgJfqEotqMhOCUGZnh245FWCzBhaMPiCFfLx6G4S1ZIkMg/nZgghAv4My3rkWA4sU
	 MyroBeVPJTsH5IBGSuTd4J5uBqTkEzANlWxURVAvSnWDWW/Z1Xx8nIhXUzYkG/pmK2
	 HnLqYiV/AXLNb4kqecQUng4/hgCbvfBlTmmBgZvE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 584DDZ8G139254
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 4 Sep 2025 08:13:35 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 08:13:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 08:13:34 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 584DDUXn3304007;
	Thu, 4 Sep 2025 08:13:31 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <s-k6@ti.com>, <praneeth@ti.com>, <p-mantena@ti.com>, <a-dutta@ti.com>,
        <u-kumar1@ti.com>
Subject: [PATCH] mtd: spi-nor: spansion: Modify addr_mode_nbytes for DTR mode
Date: Thu, 4 Sep 2025 18:43:09 +0530
Message-ID: <20250904131309.3095165-1-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_061348_564574_61A79074 
X-CRM114-Status: UNSURE (   9.66  )
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

The nor->params->addr_mode_nbytes parameter defines the address byte
count for the current addressing mode. When transitioning between SDR
and DDR modes, this parameter must be properly updated to maintain the
correct addressing behavior. So, implement the necessary updates to
nor->params->addr_mode_nbytes during both DDR mode enablement and
disablement operations to ensure address byte counts remain consistent
with the active transfer mode.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---

Tested on TI's AM62x SK
Logs: https://gist.github.com/santhosh21/8d69756bd54605d79086b00850e1083a

---
 drivers/mtd/spi-nor/spansion.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index a0296c871634..678f7f4052c9 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -230,6 +230,8 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 			return ret;
 	}
 
+	nor->params->addr_mode_nbytes = 4;
+
 	/* Read flash ID to make sure the switch was successful. */
 	ret = spi_nor_read_id(nor, nor->addr_nbytes, 3, buf,
 			      SNOR_PROTO_8_8_8_DTR);
@@ -275,6 +277,8 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 			return ret;
 	}
 
+	nor->params->addr_mode_nbytes = 3;
+
 	/* Read flash ID to make sure the switch was successful. */
 	ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
 	if (ret) {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

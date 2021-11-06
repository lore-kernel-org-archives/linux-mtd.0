Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17223C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 07:57:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC99660EC0
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 07:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC99660EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vCmHh/ijj9ijLM4AlmQxEtKRlGdZN5qZIaiKfFTavw0=; b=ZB5CMvX6k7vWmx
	cxSRZo4sv9hC2/4HmUb5WBZ/h1EwFakCh4KWA29Qva6CZi2oC3wd9TeRRngVp6fv0UcrXFmSXNOm5
	BAza+RKtbNxPdzb1/63vDLDVDnC67A5lXSfR4QYIUK4U0Ith5uJJRyhVZJMT7OnYF3f0ZyM129SCY
	FXa7eIXX+hznW0IF0LZGF8PL0lA6m9csMLfyNzuhU4dsRa4hC3t8PZo1zyFdBMk1LZTux1sIhM+fa
	yx3r+Vm1f0rFC3pKvio46RHkjGlVgtZqcrrPZ96SiI6hmjScmtUP36fXROxzAx7xpge+A2wH/1fRj
	tLHAVAi/YzBI9vFgW2cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjGZ7-00Cm81-OH; Sat, 06 Nov 2021 07:56:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjGYr-00Cm4V-7m
 for linux-mtd@lists.infradead.org; Sat, 06 Nov 2021 07:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636185385; x=1667721385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1hiT/iIgFr9BAOgFai4frwzmFe3aJdvpP7oNILgTiQ4=;
 b=OsjqqzTTZjUWab/41fVH+AUd9HEG4vlT/NpY9egXNXyPUQlrseUcofpB
 HCgm6OP5oawKYarnP8o1CZIBL1y/sj5hxrQZ53hkIJoCXbuJ0OZenBWKo
 9i4BwlVMpVEvfVtzqrIy3JmImCGNq3yQSVdxdNGrGWHlkR03I/tLF2muL
 HjH7cz9kveZbTjOqa8kGHANPolpb5ttKvRwftWE3z0UVFOGWcORwjb9Zs
 4LgIG309IOEn7FX0bU2sKSK6+WTx544MYwJCdYOEiZDU5OV052Iusp4XU
 z/9muscYL+okMQy7yPSNck53fObY/DMU4obOxwQbBjJ4qAdnXtjRiQ3zx Q==;
IronPort-SDR: ZFzpXZudR4g9mjF3bnulaoIZz8Cnn9dXlfmIToUOkhQSf7ak2lhTFK+ssgrkUqY/E0YQhNhUaa
 AxpeOlpWvpjVMMcNkjaenI8AdYWofNLKhdD3VY9sMvplv9omGWWTsGzKCiiBbl3tvznvm0+ExR
 DDfrqRCkeJbdMXlq+bw8PTrlqYVEHsT/VGuFjnX3hPdW3wlDe3uymHv8T1rPINNjhzS7F31oc1
 BtJ8Z3c9gFE/6Gr3SOqwI6no9CQexsyR6xTmka5Oo3rM5J/aWYamKNawdcWQDTsUiStdj2kE3q
 /ZeySTxOMPYpdsN9YjVaInsn
X-IronPort-AV: E=Sophos;i="5.87,213,1631602800"; d="scan'208";a="142410383"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Nov 2021 00:56:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sat, 6 Nov 2021 00:56:22 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sat, 6 Nov 2021 00:56:20 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <Alexander.Stein@tq-group.com>, <michael@walle.cc>, <p.yadav@ti.com>,
 <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH 1/2] mtd: spi-nor: Fix shift-out-of-bounds
Date: Sat, 6 Nov 2021 09:56:15 +0200
Message-ID: <20211106075616.95401-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211106075616.95401-1-tudor.ambarus@microchip.com>
References: <20211106075616.95401-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_005625_312830_1CA794AC 
X-CRM114-Status: UNSURE (   9.40  )
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

When paring SFDP we may choose to mask out an erase type, passing
an erase size of zero to spi_nor_set_erase_type().
Fix shift-out-of-bounds and just clear the erase params when
passing zero for erase size.
While here avoid a superfluous dereference and use 'size' directly.

UBSAN: shift-out-of-bounds in drivers/mtd/spi-nor/core.c:2237:24
shift exponent 4294967295 is too large for 32-bit type 'int'

Fixes: 5390a8df769e ("mtd: spi-nor: add support to non-uniform SFDP SPI NOR flash memories")
Reported-by: Alexander Stein <Alexander.Stein@tq-group.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 3d97c189c332..a1b5d5432f41 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2230,8 +2230,13 @@ void spi_nor_set_erase_type(struct spi_nor_erase_type *erase, u32 size,
 	erase->size = size;
 	erase->opcode = opcode;
 	/* JEDEC JESD216B Standard imposes erase sizes to be power of 2. */
-	erase->size_shift = ffs(erase->size) - 1;
-	erase->size_mask = (1 << erase->size_shift) - 1;
+	if (size) {
+		erase->size_shift = ffs(size) - 1;
+		erase->size_mask = (1 << erase->size_shift) - 1;
+	} else {
+		erase->size_shift = 0;
+		erase->size_mask = 0;
+	}
 }
 
 /**
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

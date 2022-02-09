Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8E8C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 13:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQMUlKNWzwwprzBA+8QMF8SGiehqzMGwiNUKK8K9yL0=; b=YN63AlTM2jkRKp
	Yo9+BUU8vwIE4So/iR3BPtOx5wECJAS9udGoAs+qHy6l+fawA4a0ncCTzIbs22dMLCXFeItCcPlPJ
	5W1oQ12iahBO5VoH+gQHRsXZdB4ejVNC5gKGOBp06HR5i8ccBxl9xNXmEqAe2XgxOoIUn+BD15bkI
	pt0x4H2MeW+h6VlIuBnG/pcPgu3vfr9YFqDZ3HI9vUcIvWMMhcP8CbH133zBXEN+KhLAtBEkp7m69
	NRkj4Sq9bOygjPuwf5hK3D4i1WCFMOx549XKooR5ax+ztOTCbe6N9Awx/riRsokqrHQPDFJ6TVrzX
	nDc4z1iCqiJY6fzbgeMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHnBN-000BTt-Ar; Wed, 09 Feb 2022 13:38:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHnA5-000B2W-Hz
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 13:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644413854; x=1675949854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MUu9/L6lnGiFuyCy5p1p/lvAWmdGRwL/eJMCRCgO/TI=;
 b=UuvZcoZqCK1S6qvVNu4RLwkqdh3C1K0O2XJfRUZI5GzLdnjaqyLguH/h
 +NghVbUYLkGlKgLg52a2FsoZ6HKpJjm3xf0OEQWAvgp0YkgpISM2FThMe
 n0hcvmD1l5Y0rvdZ1AsT4UpKe5eCRUrbV8CS7jwi+UPNy1VZCQwP2Ubk9
 YH5e9KV2G4Qhj7mymqSlId3vqnd/L7gDTWs9/KjW3JhvCllM59OHovm9J
 tB6m/gRWbIR0rPrwS9uHsZxjPFjUdS/vkOu8RNy2IV8MV58pGVGtQBPk5
 eoR3aS9/qJzA/8o37rXty18yz9jNeFZjXe0BmUG6fzWCTc8Oz50+bI/n8 Q==;
IronPort-SDR: 7X/Ti2rbjDArxQVZLEIu3Ey5VmLWEUce0/lcbDtZlOnIs508TSYJl8vR5JKlKaAKFtgTH6URrs
 gllc3TWzvhi/9Ap6b4qmJgG7qJOw7egEHXUrS+lr2lrg6J7kOrPAaODydhLriKBoKppoSps9Is
 2QIE0IMbrtz0ZOfIUOjExlztPeCkEvy3uasxsp4vrh+BviDWibKqKaasBP9cCmtWFab+6iNr71
 PPRVJ+zVWiPSHbhALaAnxi+DGy7/ajJTBP2mq5XJGdHbiRDOXc6LconnyDNyK+j/S3H8BLOEhV
 SqcuIDGrJlN3X9fX+mTE9o6X
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="152460182"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 06:37:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 06:37:32 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 9 Feb 2022 06:37:28 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v6 6/7] mtd: spi-nor: core: Introduce SPI_NOR_SOFT_RESET
 flash_info fixup_flag
Date: Wed, 9 Feb 2022 15:36:55 +0200
Message-ID: <20220209133656.374903-7-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209133656.374903-1-tudor.ambarus@microchip.com>
References: <20220209133656.374903-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_053733_626235_7FF2625A 
X-CRM114-Status: GOOD (  12.09  )
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

The Soft Reset and Rescue Sequence Support is defined in BFPT_DWORD(16)
starting with JESD216A. The first version of SFDP, JESD216 (April 2011),
defines just the first 9 BFPT DWORDS, thus it does not contain information
about the Software Reset and Rescue Support. Since this support can not
be discovered by parsing the first SFDP version, introduce a flash_info
fixup_flag that will be used either by flashes that define
JESD216 (April 2011) or by flashes that do not define SFDP at all.
In case a flash defines BFPT_DWORD(16) but with wrong values, one should
instead use a post_bfpt() hook and set SNOR_F_SOFT_RESET.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c | 3 +++
 drivers/mtd/spi-nor/core.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 35280994a179..7d5e3acb0ae7 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2719,6 +2719,9 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
 
 	if (fixup_flags & SPI_NOR_IO_MODE_EN_VOLATILE)
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
+
+	if (fixup_flags & SPI_NOR_SOFT_RESET)
+		nor->flags |= SNOR_F_SOFT_RESET;
 }
 
 /**
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 04d4cc13d13b..cbfb4fa7647f 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -382,6 +382,8 @@ struct spi_nor_fixups {
  *                            memory size above 128Mib.
  *   SPI_NOR_IO_MODE_EN_VOLATILE: flash enables the best available I/O mode
  *                            via a volatile bit.
+ *   SPI_NOR_SOFT_RESET:      flash supports software reset enable, reset
+ *                            sequence.
  * @mfr_flags:      manufacturer private flags. Used in the manufacturer fixup
  *                  hooks to differentiate support between flashes of the same
  *                  manufacturer.
@@ -425,6 +427,7 @@ struct flash_info {
 	u8 fixup_flags;
 #define SPI_NOR_4B_OPCODES		BIT(0)
 #define SPI_NOR_IO_MODE_EN_VOLATILE	BIT(1)
+#define SPI_NOR_SOFT_RESET		BIT(2)
 
 	u8 mfr_flags;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

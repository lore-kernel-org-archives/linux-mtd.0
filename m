Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86EAC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Mar 2022 08:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WAp49VLUd/78p5KTZmKjX7WzvUO+84TIB3AuKhxTHJI=; b=w6lE9n29SG+w38
	vPTxCnVeURMtlk8JZudtUalWhy9+rOBm+aAD59CnKZuOlRZlNEEJ/zMMNRZqo0TPnw7KKb9AEk4vY
	0yu+U/JTx0vQlPqYmkeokSQ/OCxF3KApfg6kBeO2g62Jo/4RW5Ovl43aJR9wtx1tvifM/z32dOBQx
	ru65ozlP9pQztc9yGYlpgT7VfvxMq16bqWplVShz0+N+etXSLTOHTp1oZatsAedhfQ1N3FV1A6ruc
	0qAn+CsjoXw59mdrpRJ982Bp2Y9BWlZ6Y5GWKcjeyu9MmCVteccgxpUaTXD59neCOs/b/OaMiFhs1
	r4cT+vo5vpbktzJE0o9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSaEn-00FRkI-LY; Fri, 11 Mar 2022 08:03:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSaDo-00FRNo-DM
 for linux-mtd@lists.infradead.org; Fri, 11 Mar 2022 08:02:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646985721; x=1678521721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3sOq6yDNcZ9Qx9sU/cp+hGbBR/ZmOqDydd2NJVD+Elo=;
 b=GTZveDOi9SO1kVkrCePJl1rxHqZEN5Bs6wX8IbD9SaX6mIfE2nF+t5Ix
 bXutN88vkZFIzOwD1bKUOq0fsGJwyETd/O9KyGOMe4JijpkHzcPqzqm0E
 15YDBO9/LjR/nnmFo0lEnoHGt2LGBYW20ka02XEDCPGi1WlEAT8Zm8Pzz
 eT8OaqWkCyglndgMkoCZ6bGfRFAhfTSjG6l0ZhJJweVgu9elGjETgqeza
 3wLnWGTVXoU9NTd3GHDhy0+JZF7nzYRv/p93UMG4UBmisb6p8cGSb4bmN
 nBVskNAYTb+rNC2BU8Q33x6qWeyq7W5G4ODjiSgzrPD+QeNMBrkaEG+yE A==;
X-IronPort-AV: E=Sophos;i="5.90,173,1643698800"; d="scan'208";a="148864925"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Mar 2022 01:02:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 11 Mar 2022 01:01:59 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 11 Mar 2022 01:01:56 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <broonie@kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <nicolas.ferre@microchip.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH v2 2/6] mtd: spi-nor: core: Allow specifying the byte order in
 DTR mode
Date: Fri, 11 Mar 2022 10:01:43 +0200
Message-ID: <20220311080147.453483-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311080147.453483-1-tudor.ambarus@microchip.com>
References: <20220311080147.453483-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_000200_549731_C036793B 
X-CRM114-Status: GOOD (  11.06  )
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

Macronix swaps bytes on a 16-bit boundary when configured in Octal DTR.
The byte order of 16-bit words is swapped when read or written in 8D-8D-8D
mode compared to STR modes. Allow operations to specify the byte order in
DTR mode, so that controllers can swap the bytes back at run-time to
address the flash's endianness requirements, if they are capable. If the
controllers are not capable of swapping the bytes, the protocol is
downgraded via spi_nor_spimem_adjust_hwcaps(). When available, the swapping
of the bytes is always done regardless if it's a data or register access,
so that we comply with the JESD216 requirements: "Byte order of 16-bit
words is swapped when read in 8D-8D-8D mode compared to 1-1-1".

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 8 ++++++++
 drivers/mtd/spi-nor/core.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5de46a786cc5..a69c2813f6fc 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -70,6 +70,13 @@ static u8 spi_nor_get_cmd_ext(const struct spi_nor *nor,
 	}
 }
 
+static inline bool spi_nor_is_octal_dtr_swab16(const struct spi_nor *nor,
+					       enum spi_nor_protocol proto)
+{
+	return (proto == SNOR_PROTO_8_8_8_DTR) &&
+		(nor->flags & SNOR_F_DTR_SWAB16);
+}
+
 /**
  * spi_nor_spimem_setup_op() - Set up common properties of a spi-mem op.
  * @nor:		pointer to a 'struct spi_nor'
@@ -105,6 +112,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 		op->addr.dtr = true;
 		op->dummy.dtr = true;
 		op->data.dtr = true;
+		op->data.dtr_swab16 = spi_nor_is_octal_dtr_swab16(nor, proto);
 
 		/* 2 bytes per clock cycle in DTR mode. */
 		op->dummy.nbytes *= 2;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index c83d5e75c563..0dcbc7a81e64 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -135,6 +135,7 @@ enum spi_nor_option_flags {
 	SNOR_F_IO_MODE_EN_VOLATILE = BIT(11),
 	SNOR_F_SOFT_RESET	= BIT(12),
 	SNOR_F_SWP_IS_VOLATILE	= BIT(13),
+	SNOR_F_DTR_SWAB16	= BIT(14),
 };
 
 struct spi_nor_read_command {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

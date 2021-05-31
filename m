Return-Path: <SRS0=sw+G=K2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DC2C47083
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 18:19:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73F48600EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 18:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73F48600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AA5CqiN0YRlwe3+sVwxam6BvP3TKl3CUM92gNnPTVM0=; b=ZnQFW5TC+pVJNO
	hzn+X2LSLTVAlONhYsoiVuu2wC0H6Jykv2P2NU2fVlwnev9ukLaUtQlxjqKTwwsYrm9Lx+a6Gcub+
	TpLZwvCjecfyxROGsjDOEZ3pnLA7I7h0di66jTTpLPjWYiAgRwhycIzN+XZx+cnXq6tjAgVy0si7F
	FzKB+7iGdD2gV+9lbSiV+dcUR+Asv4/KK5MuVhT/l+xzpLbyHJe8ZMSm1IYizvqht4IO1i2jg3KjC
	u+GAoLIbIpgjG87Zc0QkMTfPGoHgg+VFwuxNfc2JMM0vEKNDdJE+qghfcjNoqjZJ4NcJUtC1puz/3
	bjLWGOW9voL/rjKjfsvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnmUO-00D5Wj-Sk; Mon, 31 May 2021 18:18:12 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnmUK-00D5Pg-TH
 for linux-mtd@lists.infradead.org; Mon, 31 May 2021 18:18:10 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14VII5v8078806;
 Mon, 31 May 2021 13:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622485085;
 bh=NTOU/toCq2bT4bwJWBm9sz5V4G6tb09L1YtZxu4df1w=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=M8BVz4Spe73DM6lVA8Yrj1Dvkot9+tnTBCG/vPisgOeXFryeKk668rThcJZUOXCFJ
 VCK0oW0iw+vMemW7NiNS4hjmaretM69tk06nuMrZ8N9UrG2mpCmdT3xzl0+oFS2FuA
 LVefCeJjlj/pt74KbE+B79dUkhp09bIeOZgswI+8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14VII56g104242
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 31 May 2021 13:18:05 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 31
 May 2021 13:18:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 31 May 2021 13:18:05 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14VIHwdG118543;
 Mon, 31 May 2021 13:18:02 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH v2 1/6] mtd: spi-nor: core: use 2 data bytes for template ops
Date: Mon, 31 May 2021 23:47:52 +0530
Message-ID: <20210531181757.19458-2-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210531181757.19458-1-p.yadav@ti.com>
References: <20210531181757.19458-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_111809_048566_99501FD7 
X-CRM114-Status: GOOD (  16.26  )
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

The template ops used in spi_nor_spimem_check_pp() and
spi_nor_spimem_check_readop() currently set the data phase to 1 byte
long. This is problematic for 8D-8D-8D protocol where odd length data
phase is invalid since one cycle transfers 2 bytes and odd number of
bytes would mean half a cycle is left over. This could result in a
controller rejecting the op as "not supported" even though it actually
supports the protocol.

Change the data length to 2 bytes in these templates. One might argue
that this should only be done for 8D-8D-8D operations but when talking
about these templates, there is no functional difference between one and
two bytes, even in STR modes.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---

(no changes since v1)

 drivers/mtd/spi-nor/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f6a6ef2d8bd8..d521ca577884 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2143,7 +2143,7 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
 	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(read->opcode, 0),
 					  SPI_MEM_OP_ADDR(3, 0, 0),
 					  SPI_MEM_OP_DUMMY(1, 0),
-					  SPI_MEM_OP_DATA_IN(1, NULL, 0));
+					  SPI_MEM_OP_DATA_IN(2, NULL, 0));
 
 	spi_nor_spimem_setup_op(nor, &op, read->proto);
 
@@ -2169,7 +2169,7 @@ static int spi_nor_spimem_check_pp(struct spi_nor *nor,
 	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(pp->opcode, 0),
 					  SPI_MEM_OP_ADDR(3, 0, 0),
 					  SPI_MEM_OP_NO_DUMMY,
-					  SPI_MEM_OP_DATA_OUT(1, NULL, 0));
+					  SPI_MEM_OP_DATA_OUT(2, NULL, 0));
 
 	spi_nor_spimem_setup_op(nor, &op, pp->proto);
 
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

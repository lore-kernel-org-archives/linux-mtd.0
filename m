Return-Path: <SRS0=HIhO=MF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1B1C07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:08:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4730C61073
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4730C61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2gV8hNisATtnB8RPnImvRJ3KAcd/rkxWO33++olYGq4=; b=nqZ4XJEG/UGomJ
	S6d+7HcvBwS3x5b5wiGTq5dC8/gwlvv6MF7x48asl40VAjTtCoIr3zk6RAiriS8p6HPOOOas1g9Cu
	7iPoqPmqRQuB8fNwuFHkxn08l3pgT3NFbpm475WsgCFV4U/05bhJVBcDqWqspRndXmO0beEg1Jg70
	5C71STs0JPAvXIyqKsjqRGzdkIXVzK1edtjIOx7lhTrP31WVI9ipFTjNDa4G5glsj5SpvCpVge8C0
	b7q1DDOi5hhdH+63INknAnyCZJfdZ39Tl2VbVmXRxrugaUuxDgDunFHrk2n5Rhm1L5BGEpDdGBhHQ
	SUq0c3WrPpFdvsUDDZTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3I8V-00ASnJ-IK; Tue, 13 Jul 2021 13:07:43 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3I76-00ASJU-1n
 for linux-mtd@lists.infradead.org; Tue, 13 Jul 2021 13:06:18 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16DD692Y010440;
 Tue, 13 Jul 2021 08:06:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1626181569;
 bh=8RzEa7awEZEDwwWTSJhzA++iT0OALTq3Az0pHKaR+oQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=zFoa0+nq67e3TIX/C15TP3zL+MQ8BoFcTrsYQK+PRI3UGonWq6yJWgZHgnBOV+ceW
 +E639dxn8aqXzJ8c9N9dmrWOF1UZThaI1p4/ixNpGFaVM7imX7CCkexRXME7OXuiBv
 93B505jPBijDmQC4khE6GLe2RVyO9G64DshBmk1E=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16DD69SY004591
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Jul 2021 08:06:09 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Jul 2021 08:06:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 13 Jul 2021 08:06:09 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16DD5daF109825;
 Tue, 13 Jul 2021 08:06:04 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, Boris
 Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: Apurva Nandan <a-nandan@ti.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 05/13] mtd: spinand: Add adjust_op() in manufacturer_ops to
 modify the ops for manufacturer specific changes
Date: Tue, 13 Jul 2021 13:05:30 +0000
Message-ID: <20210713130538.646-6-a-nandan@ti.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20210713130538.646-1-a-nandan@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_060616_231757_B4BC95AD 
X-CRM114-Status: GOOD (  11.91  )
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

Manufacturers might use a variation of standard SPI NAND flash
instructions, e.g. Winbond W35N01JW changes the dummy cycle length for
read register commands when in Octal DTR mode.

Add new function in manufacturer_ops: adjust_op(), which can be called
to correct the spi_mem op for any alteration in the instruction made by
the manufacturers. And hence, this function can also be used for
incorporating variations of SPI instructions in Octal DTR mode.

Datasheet: https://www.winbond.com/export/sites/winbond/datasheet/W35N01JW_Datasheet_Brief.pdf

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/core.c | 3 +++
 include/linux/mtd/spinand.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index a5334ad34f96..1e619b6d777f 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -63,6 +63,9 @@ static void spinand_setup_op(const struct spinand_device *spinand,
 		op->data.buswidth = op_buswidth;
 		op->data.dtr = op_is_dtr;
 	}
+
+	if (spinand->manufacturer->ops->adjust_op)
+		spinand->manufacturer->ops->adjust_op(op, spinand->reg_proto);
 }
 
 static void spinand_setup_reg_op(const struct spinand_device *spinand,
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index f6093cd98d7b..ebb19b2cec84 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -257,6 +257,8 @@ struct spinand_devid {
 /**
  * struct manufacurer_ops - SPI NAND manufacturer specific operations
  * @init: initialize a SPI NAND device
+ * @adjust_op: modify the ops for any variation in their cmd, address, dummy or
+ *	       data phase by the manufacturer
  * @cleanup: cleanup a SPI NAND device
  *
  * Each SPI NAND manufacturer driver should implement this interface so that
@@ -264,6 +266,8 @@ struct spinand_devid {
  */
 struct spinand_manufacturer_ops {
 	int (*init)(struct spinand_device *spinand);
+	void (*adjust_op)(struct spi_mem_op *op,
+			  const enum spinand_proto reg_proto);
 	void (*cleanup)(struct spinand_device *spinand);
 };
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

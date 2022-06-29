Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD4EC43334
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 13:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qlJPE+4EIqGQyhmERVgU/DtzmQc3J3RI+cuFHpe6pLE=; b=hTRvXH2OJuAo63
	Kd2HQ1nXJjxom+UXYk0pnUy0zKIYuCYEGFGYCw6pzgva5Ym4bZfyCkT5lWcV8nSD29AAwdNO2GM4u
	QTfydB2NxB07ns5hDoVWihSNCZZ1aD+rVgaLxi9vM1jWVA0N/OMCWczLaw77RnwJI04lI/Q0DRZ26
	E265EmfvZEfZU12vTaaDsssKHcu6sBb/xnxUMFmroQtM7kIRuAiI1ME2mwI8g2FSarttCV4lJJk6A
	QMEakPaB5i+QKP5ykn8w3xc/5M8vhBDoT8r3Qvlhy4QaJGw0w3cAGcSYYcTCBftIjAryD1GWoNlF1
	io9VFkwAL8GwSB7qKGmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XmG-00CE5r-7d; Wed, 29 Jun 2022 13:30:44 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XmC-00CDwL-LM
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 13:30:42 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25TB4U1l022248;
	Wed, 29 Jun 2022 15:30:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=n59iCRyc6//5uNgNXa7K0HkN9RNNpTRt37xRiqWYqug=;
 b=TY5VBsRpNjcmS93ek4VpackfvdhK0nro/rX3k/it4Ywuo3dqGxaP1ryMlOUmmjqe57ox
 ned9ibsggeXr7EtqkLwSrTgANPK1MQ8roJAC0/bEZ69UoDP8hxAcSUoxsUFwGAO0vwSt
 qYm30Cvkvl5FpvzmJ8nPJEX9R5FeZjK7fFQ4Rbe1rMPTb9Bqob8ziSmR70DP96ssHL/P
 SNTYHJeLZ/SXYl7muk1QOIcmsyZHhoRNDXKZLzNza2e8D6qpQVt0JhKCcsl2eAPnGr7e
 uxASVjuCcS0mh7Y86D/hHkk3E6++EUmC337fyDxs254MS2ZOduzUpUDDjNy5XK9Zgf5e OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gwsq1f78g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jun 2022 15:30:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7B03910002A;
	Wed, 29 Jun 2022 15:30:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6FA6C21FE96;
	Wed, 29 Jun 2022 15:30:30 +0200 (CEST)
Received: from localhost (10.75.127.46) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 29 Jun
 2022 15:30:30 +0200
From: <patrice.chotard@foss.st.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
        Pratyush Yadav
	<p.yadav@ti.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard
 Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
        <inux-kernel@vger.kernel.org>
CC: <patrice.chotard@foss.st.com>, <christophe.kerello@foss.st.com>
Subject: mtd: spi-nor: fix spi_nor_spimem_setup_op() call in spi_nor_erase_{sector,chip}()
Date: Wed, 29 Jun 2022 15:30:13 +0200
Message-ID: <20220629133013.3382393-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-29_17,2022-06-28_01,2022-06-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_063041_312955_CA0B7765 
X-CRM114-Status: GOOD (  16.70  )
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

For erase operations, reg_proto must be used as indicated in
struct spi_nor description in spi-nor.h.

This issue was found when DT property spi-tx-bus-width is set to 4.
In this case the spi_mem_op->addr.buswidth is set to 4 for erase command
which is not correct.

Tested on stm32mp157c-ev1 board with mx66l51235f spi-nor.

Fixes: 0e30f47232ab ("mtd: spi-nor: add support for DTR protocol")
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/mtd/spi-nor/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 502967c76c5f..61027330848f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -972,7 +972,7 @@ static int spi_nor_erase_chip(struct spi_nor *nor)
 	if (nor->spimem) {
 		struct spi_mem_op op = SPI_NOR_CHIP_ERASE_OP;
 
-		spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
@@ -1115,7 +1115,7 @@ int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 			SPI_NOR_SECTOR_ERASE_OP(nor->erase_opcode,
 						nor->addr_width, addr);
 
-		spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
 		return spi_mem_exec_op(nor->spimem, &op);
 	} else if (nor->controller_ops->erase) {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

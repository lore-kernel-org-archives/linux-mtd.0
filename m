Return-Path: <SRS0=a+Ch=4O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819A3C4BA0B
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2020 09:38:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56D2A20732
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2020 09:38:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fR50/CiK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HhaDEMx6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56D2A20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZygjtuqCtucQlbxQVcB/tUco2pp4LG9uUfOXvpu2DYk=; b=fR50/CiKpVjGqJ
	AbJIuHg5+CB+Z9i7gcFVyltc+qzx3bEpxi2cMzGoy/dr8oykRgakqmqQ28Ec+f9AgDBWUGUoh/GX2
	bV69EeVRjrvuqOkeHZ2ot/M/IpBUToL+/iFHPH3X1rs4PODT98HXb3C0qd3VfhPk2A03yujS08I74
	MDwDJ9hKgm3OJ+eNcxSFylCjKqQpjpxUh9okF7UxUUMT31De8WzD57XHdsi1CMJLfmiRkQX9OX7qt
	YnQkprbHE9F4tcE4t10kvhDWzsldCnB0YybeHdsVML/yKDmGxQ1bLKdODzvydUXnyLqC4EcZioou8
	CjhGZw1N4sqEbmDZJ83A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6t8s-0001mX-Me; Wed, 26 Feb 2020 09:38:10 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6t8G-00019L-Tj
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2020 09:37:34 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01Q9bMXC048392;
 Wed, 26 Feb 2020 03:37:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582709842;
 bh=2l+gbPh3UsxLnnwcIelUMPvT/YEvl2c/dQvOKdwacuQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=HhaDEMx64ozp/WxJ5VYGDzXmcJVkmcGFqgdH/RVfu6gRmEj4N2MmLODZ2ka6AWONC
 g4hfh09oT7jzPWmzSHKEN7fF4hM0eGNHGJkihHXIo7kFR8v7krMjmnBE6IFoXKi5G+
 MrM3sZR4ePD9TaRCJKkygIl1Plk26u+PKlooGVdU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01Q9bMFn086529;
 Wed, 26 Feb 2020 03:37:22 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 03:37:21 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 03:37:21 -0600
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01Q9b4A8110613;
 Wed, 26 Feb 2020 03:37:17 -0600
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 03/11] spi: spi-mem: allow specifying whether an op is DTR
 or not
Date: Wed, 26 Feb 2020 15:06:55 +0530
Message-ID: <20200226093703.19765-4-p.yadav@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226093703.19765-1-p.yadav@ti.com>
References: <20200226093703.19765-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_013733_055639_5418F703 
X-CRM114-Status: GOOD (  14.13  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Each phase is given a separate 'is_dtr' field so mixed protocols like
4S-4D-4D can be supported.

Also add the mode bits SPI_RX_DTR and SPI_TX_DTR so controllers can
specify whether they support DTR modes or not.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/spi/spi-mem.c       | 23 +++++++++++++++++++++++
 include/linux/spi/spi-mem.h |  8 ++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index e5a46f0eb93b..cb13e0878b95 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -99,6 +99,16 @@ void spi_controller_dma_unmap_mem_op_data(struct spi_controller *ctlr,
 }
 EXPORT_SYMBOL_GPL(spi_controller_dma_unmap_mem_op_data);
 
+static int spi_check_dtr_req(struct spi_mem *mem, bool tx)
+{
+	u32 mode = mem->spi->mode;
+
+	if ((tx && (mode & SPI_TX_DTR)) || (!tx && (mode & SPI_RX_DTR)))
+		return 0;
+
+	return -ENOTSUPP;
+}
+
 static int spi_check_buswidth_req(struct spi_mem *mem, u8 buswidth, bool tx)
 {
 	u32 mode = mem->spi->mode;
@@ -154,6 +164,19 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 				   op->data.dir == SPI_MEM_DATA_OUT))
 		return false;
 
+	if (op->cmd.is_dtr && spi_check_dtr_req(mem, true))
+		return false;
+
+	if (op->addr.is_dtr && spi_check_dtr_req(mem, true))
+		return false;
+
+	if (op->dummy.is_dtr && spi_check_dtr_req(mem, true))
+		return false;
+
+	if (op->data.dir != SPI_MEM_NO_DATA && op->data.is_dtr &&
+	    spi_check_dtr_req(mem, op->data.dir == SPI_MEM_DATA_OUT))
+		return false;
+
 	return true;
 }
 EXPORT_SYMBOL_GPL(spi_mem_default_supports_op);
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index af9ff2f0f1b2..4669082b4e3b 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -71,6 +71,7 @@ enum spi_mem_data_dir {
  * struct spi_mem_op - describes a SPI memory operation
  * @cmd.buswidth: number of IO lines used to transmit the command
  * @cmd.opcode: operation opcode
+ * @cmd.is_dtr: whether the command opcode should be sent in DTR mode or not
  * @addr.nbytes: number of address bytes to send. Can be zero if the operation
  *		 does not need to send an address
  * @addr.buswidth: number of IO lines used to transmit the address cycles
@@ -78,10 +79,13 @@ enum spi_mem_data_dir {
  *	      Note that only @addr.nbytes are taken into account in this
  *	      address value, so users should make sure the value fits in the
  *	      assigned number of bytes.
+ * @addr.is_dtr: whether the address should be sent in DTR mode or not
  * @dummy.nbytes: number of dummy bytes to send after an opcode or address. Can
  *		  be zero if the operation does not require dummy bytes
  * @dummy.buswidth: number of IO lanes used to transmit the dummy bytes
+ * @dummy.is_dtr: whether the dummy bytes should be sent in DTR mode or not
  * @data.buswidth: number of IO lanes used to send/receive the data
+ * @data.is_dtr: whether the data should be sent in DTR mode or not
  * @data.dir: direction of the transfer
  * @data.nbytes: number of data bytes to send/receive. Can be zero if the
  *		 operation does not involve transferring data
@@ -92,21 +96,25 @@ struct spi_mem_op {
 	struct {
 		u8 buswidth;
 		u8 opcode;
+		bool is_dtr;
 	} cmd;
 
 	struct {
 		u8 nbytes;
 		u8 buswidth;
 		u64 val;
+		bool is_dtr;
 	} addr;
 
 	struct {
 		u8 nbytes;
 		u8 buswidth;
+		bool is_dtr;
 	} dummy;
 
 	struct {
 		u8 buswidth;
+		bool is_dtr;
 		enum spi_mem_data_dir dir;
 		unsigned int nbytes;
 		union {
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <SRS0=DvMR=BC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B685C433E8
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2020 13:13:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D6BB20737
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2020 13:13:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0vrxO2o7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D6BB20737
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H05UFf+4u6hFQQhgMaFtjTb5p7/Ko7B/BggsmWOvInc=; b=0vrxO2o7Fw0a5yY7plW+3/9Nj
	rHWO5PSx0J/fOrYq5x82u56CfkOggaL/7O2xABBFl55OpnaFs9G0CdA9m++X146c7BfoSn0ezrovM
	3tZTlUvkeBM0LZK48G8Zx3sRukhiKkUKKn4iNt6/SEeTnscSULP3XXDlpog2rSNI0Up9Gw+r1Qvkx
	jyBoEnv6yJcUazO1qPaSaOQ1SR91IlD8iCqumeYfsjY6wi4mVYXLuoanTgu1Kv6XTV0Id1yR87kVf
	rncVveoizBqyvd5BSc2AtLuVop2uQw5YRrhKdjQHqCdfJj951wpOM/SGfHFjZ05M+bCV1PkpwxDd9
	tqgD0dcJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyb1v-0003cH-4M; Thu, 23 Jul 2020 13:12:59 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyb1r-0003aO-Bo
 for linux-mtd@lists.infradead.org; Thu, 23 Jul 2020 13:12:56 +0000
X-Originating-IP: 42.109.196.68
Received: from localhost.localdomain (unknown [42.109.196.68])
 (Authenticated sender: me@yadavpratyush.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id EABE71C0009;
 Thu, 23 Jul 2020 13:12:50 +0000 (UTC)
From: Pratyush Yadav <me@yadavpratyush.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v11 07/14] mtd: spi-nor: core: do 2 byte reads for SR and FSR
 in DTR mode
Date: Thu, 23 Jul 2020 18:41:56 +0530
Message-Id: <20200723131203.40916-8-me@yadavpratyush.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200723131203.40916-1-me@yadavpratyush.com>
References: <20200723131203.40916-1-me@yadavpratyush.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_091256_040324_FADB2B51 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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
Cc: Pratyush Yadav <me@yadavpratyush.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Sekhar Nori <nsekhar@ti.com>,
 Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Pratyush Yadav <p.yadav@ti.com>

Some controllers, like the cadence qspi controller, have trouble reading
only 1 byte in DTR mode. So, do 2 byte reads for SR and FSR commands in
DTR mode, and then discard the second byte.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 185ca1fa2b50..6efc86e2aba0 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -364,7 +364,7 @@ int spi_nor_write_disable(struct spi_nor *nor)
  * spi_nor_read_sr() - Read the Status Register.
  * @nor:	pointer to 'struct spi_nor'.
  * @sr:		pointer to a DMA-able buffer where the value of the
- *              Status Register will be written.
+ *              Status Register will be written. Should be at least 2 bytes.
  *
  * Return: 0 on success, -errno otherwise.
  */
@@ -382,6 +382,11 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
 		if (spi_nor_protocol_is_dtr(nor->reg_proto)) {
 			op.addr.nbytes = nor->params->rdsr_addr_nbytes;
 			op.dummy.nbytes = nor->params->rdsr_dummy;
+			/*
+			 * We don't want to read only one byte in DTR mode. So,
+			 * read 2 and then discard the second byte.
+			 */
+			op.data.nbytes = 2;
 		}
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
@@ -400,7 +405,8 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
  * spi_nor_read_fsr() - Read the Flag Status Register.
  * @nor:	pointer to 'struct spi_nor'
  * @fsr:	pointer to a DMA-able buffer where the value of the
- *              Flag Status Register will be written.
+ *              Flag Status Register will be written. Should be at least 2
+ *              bytes.
  *
  * Return: 0 on success, -errno otherwise.
  */
@@ -418,6 +424,11 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
 		if (spi_nor_protocol_is_dtr(nor->reg_proto)) {
 			op.addr.nbytes = nor->params->rdsr_addr_nbytes;
 			op.dummy.nbytes = nor->params->rdsr_dummy;
+			/*
+			 * We don't want to read only one byte in DTR mode. So,
+			 * read 2 and then discard the second byte.
+			 */
+			op.data.nbytes = 2;
 		}
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

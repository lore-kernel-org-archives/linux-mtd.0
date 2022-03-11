Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB4CC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Mar 2022 08:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SE6piM4GwQfYcscE6rChYhmgTfBrcl2QriL1ro4VBK4=; b=foecLwWskAGasF
	2okMIs58XCiMxc6z91On91KfnloBhn1OHqeJ7TBcZDhSO8MOKx2s096QtTm3yio66W8GrKQjp/31J
	lw9nZu2w9aM1UgDDuswWI64weDalnlrCuUPnZ+Jj/q0L4+1aaExUb7kaLOOYSNU4a5+fSFw9MdkIA
	g7M5E36hruJCXx5poyiwH9EoRtTaKUqF5Dj9mleXSTjOtmR+lIlgpT5opOP862W+k8f4k4rgX3AtP
	FCRCkZ2z7y/HNYn3JirCRw1BYOX/SACsKIEJrdQzOP++XiOLRG7q1szGVLSde+gWG9AgJx/Ez/oEQ
	6FQS9o97GLssyTS5Dxyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSaER-00FReI-9a; Fri, 11 Mar 2022 08:02:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSaDl-00FRMQ-N2
 for linux-mtd@lists.infradead.org; Fri, 11 Mar 2022 08:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646985718; x=1678521718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0tEtyDy2Ibn+Yb9/V/d4TdD6beKGnXWWbYrC9P89cv4=;
 b=mm4qE3zBR3v9d0VJoztFToE1nMjaEriWWrKTWNqYSSeefE7Og7EzElpR
 OajmJl8gfSUCGOgqnVV72NImKHY/yf7cJo5zvl7YhymTGcA16CCb2x2jA
 wVqWXL3T3p8NL0r3PuszcbCKUpW9Sz8n7L7QoVJL4rJC7MZSL8vXU8jku
 8D64szr1nZn3vC571PfQxQAhaQUefHgJCknOi9nC3PEtB0mgNN5dWmMLm
 uQKDP5ICZ4PmOJsiH/JeVRJChpAYKbGF6f/DOUNQXOtFQLOfT5rMPj+7L
 G+FJyLgrvGquKHvUfw5YaU2ygcvWuoeMfyWuN2UfICl5AJV/GcghIgbOu g==;
X-IronPort-AV: E=Sophos;i="5.90,173,1643698800"; d="scan'208";a="148864914"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Mar 2022 01:01:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 11 Mar 2022 01:01:56 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 11 Mar 2022 01:01:53 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <broonie@kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <nicolas.ferre@microchip.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH v2 1/6] spi: spi-mem: Allow specifying the byte order in DTR
 mode
Date: Fri, 11 Mar 2022 10:01:42 +0200
Message-ID: <20220311080147.453483-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311080147.453483-1-tudor.ambarus@microchip.com>
References: <20220311080147.453483-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_000157_859864_73247AA2 
X-CRM114-Status: GOOD (  13.81  )
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

There are NOR flashes (Macronix) that swap the bytes on a 16-bit boundary
when configured in Octal DTR mode. The byte order of 16-bit words is
swapped when read or written in Octal Double Transfer Rate (DTR) mode
compared to Single Transfer Rate (STR) modes. If one writes D0 D1 D2 D3
bytes using 1-1-1 mode, and uses 8D-8D-8D SPI mode for reading, it will
read back D1 D0 D3 D2. Swapping the bytes is a bad design decision because
it may introduce some endianness problems. It can affect the boot sequence
if the entire boot sequence is not handled in either 8D-8D-8D mode or 1-1-1
mode. So we must swap the bytes back to have the same byte order as in STR
modes. Fortunately there are controllers that can swap the bytes back at
runtime, addressing the flash's endiannesses requirements. Provide a way
for the upper layers to specify the byte order in Octal DTR mode.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/spi/spi-mem.c       | 4 ++++
 include/linux/spi/spi-mem.h | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index f38ac31961c9..3b2e586bb6a6 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -171,6 +171,10 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 		if (!spi_mem_controller_is_capable(ctlr, dtr))
 			return false;
 
+		if (op->data.dtr_swab16 &&
+		    !(spi_mem_controller_is_capable(ctlr, dtr_swab16)))
+			return false;
+
 		if (op->cmd.nbytes != 2)
 			return false;
 	} else {
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 2ba044d0d5e5..a1bf51eda31f 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -89,6 +89,8 @@ enum spi_mem_data_dir {
  * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or not
  * @data.buswidth: number of IO lanes used to send/receive the data
  * @data.dtr: whether the data should be sent in DTR mode or not
+ * @data.dtr_swab16: whether the byte order of 16-bit words is swapped when read
+ *		     or written in Octal DTR mode compared to STR mode.
  * @data.ecc: whether error correction is required or not
  * @data.dir: direction of the transfer
  * @data.nbytes: number of data bytes to send/receive. Can be zero if the
@@ -120,6 +122,7 @@ struct spi_mem_op {
 	struct {
 		u8 buswidth;
 		u8 dtr : 1;
+		u8 dtr_swab16 : 1;
 		u8 ecc : 1;
 		enum spi_mem_data_dir dir;
 		unsigned int nbytes;
@@ -290,10 +293,13 @@ struct spi_controller_mem_ops {
 /**
  * struct spi_controller_mem_caps - SPI memory controller capabilities
  * @dtr: Supports DTR operations
+ * @dtr_swab16: Supports swapping bytes on a 16 bit boundary when configured in
+ *		Octal DTR
  * @ecc: Supports operations with error correction
  */
 struct spi_controller_mem_caps {
 	bool dtr;
+	bool dtr_swab16;
 	bool ecc;
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

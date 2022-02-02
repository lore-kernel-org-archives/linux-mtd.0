Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA6EC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 15:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1j3KzbplLsY8UXdkQnmFl7Edat3JzMWJOLFpnfWZKj8=; b=locfTqE5zWcOzV
	pZGNC9ezOiAnmUGzn/SUNWVqezl0w+eijTxHSOXIh6XEwgU+a+6ms9Hw3Xuf/wevM5h2vojj3jOJL
	QyVY64+jSiidWa8jMfO+66hz3vmSYlGqj+/v7YyTqhaROeNeVnb7biG8kNlRJ1oVjXZxFUnoqAjTp
	QChzI0/+1pGwCd0tGKQozDG1IDOUeBft+psYOIUmo8KDTKQdiIDuIJyohe5kSUuCdwF5Xi00QgHrS
	9jG9ZupM7J/UkG2D5a7TlRIujMjunTZadD9GNLD1MUxVcYlx5WhPxvWg/7x6Ls+Wr4DJ3xQp+H2SX
	/wBxCt9b6/gqVihPP6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFHAE-00Ft81-Fg; Wed, 02 Feb 2022 15:03:18 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFH68-00FrTc-HJ
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 14:59:07 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E661C223EA;
 Wed,  2 Feb 2022 15:59:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1643813941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EUIHOXBwQHm3/QA8WoOrA7Z1KLYfmRbk62KHpOzNBV4=;
 b=ZWhTT6sJTrJpdFgN6/yNptFuqf5m3U72tOlXp95AXYnibvAC7SoXVnDo1wZZiSobeWvTUC
 FopPvK1P+9nnmdULxKGQFnwHHbooXY28fL/M4r5IOTd2gJlj4g+9leWktQLaeJnVUodBOe
 uaBhgUn3c7CpdKWbIJ5y/R68sEVItTM=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH v1 01/14] mtd: spi-nor: export more function to be used in
 vendor modules
Date: Wed,  2 Feb 2022 15:58:40 +0100
Message-Id: <20220202145853.4187726-2-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202145853.4187726-1-michael@walle.cc>
References: <20220202145853.4187726-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_065904_785057_95B5DF3F 
X-CRM114-Status: GOOD (  12.04  )
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

We will move vendor specific code into the vendor modules and thus we
will have to export these functions so they can be called.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.c | 10 +++++-----
 drivers/mtd/spi-nor/core.h |  6 ++++++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 04ea180118e3..f05ece6018dc 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -157,8 +157,8 @@ static int spi_nor_spimem_exec_op(struct spi_nor *nor, struct spi_mem_op *op)
 	return spi_mem_exec_op(nor->spimem, op);
 }
 
-static int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
-					   u8 *buf, size_t len)
+int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
+				    u8 *buf, size_t len)
 {
 	if (spi_nor_protocol_is_dtr(nor->reg_proto))
 		return -EOPNOTSUPP;
@@ -166,8 +166,8 @@ static int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
 	return nor->controller_ops->read_reg(nor, opcode, buf, len);
 }
 
-static int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
-					    const u8 *buf, size_t len)
+int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
+				     const u8 *buf, size_t len)
 {
 	if (spi_nor_protocol_is_dtr(nor->reg_proto))
 		return -EOPNOTSUPP;
@@ -683,7 +683,7 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
  *
  * Return: 1 if ready, 0 if not ready, -errno on errors.
  */
-static int spi_nor_sr_ready(struct spi_nor *nor)
+int spi_nor_sr_ready(struct spi_nor *nor)
 {
 	int ret = spi_nor_read_sr(nor, nor->bouncebuf);
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 2afb610853a9..c6578d3f598b 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -554,6 +554,7 @@ int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
 int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
 int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
 int spi_nor_read_sr(struct spi_nor *nor, u8 *sr);
+int spi_nor_sr_ready(struct spi_nor *nor);
 int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);
 int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
 int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
@@ -599,6 +600,11 @@ void spi_nor_try_unlock_all(struct spi_nor *nor);
 void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
 void spi_nor_set_mtd_otp_ops(struct spi_nor *nor);
 
+int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
+				    u8 *buf, size_t len);
+int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
+				     const u8 *buf, size_t len);
+
 static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
 {
 	return container_of(mtd, struct spi_nor, mtd);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

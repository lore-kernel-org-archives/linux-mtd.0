Return-Path: <SRS0=4Ctu=KQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1248BC4707D
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 19:43:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82AF8613D9
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 19:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82AF8613D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Amwe5geK0ZiTOu+MrjvNqyrO+/3dAEujdpjdl7/G828=; b=bbDSXJV1pqq13bsZHjOGt0umaR
	asl7MKQ1uSb38E9+pmRAg4qBiZ3TeVLMz6l9S1sWOvLJ8mTtv6y+ioSI4RF0c/Z33sUYpixNEdF6j
	XepqCEVWNcXo5tG1TGZ8J42ctPzAQLb3WrPImpINZQ4JCbFbY7S91dlc3IxjfPFazOSJieKmPsMbM
	iQUoleG7r7E4m98V3nyXBtGlpvP0pnaTMId7R9HW/tH+CRG2iKB3M8AwWhsc+v+BtZHPan+Jh+8NZ
	kYda7DnN2eYsnfHCJXGC0vFzyxhrc3cnRTxF04WvzlKTEh4RMgFbQNXbK80qbQVtgpf+PClATOrGb
	dS2zSd2w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkB2V-000uSe-UV; Fri, 21 May 2021 19:42:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkB0r-000tww-84
 for linux-mtd@desiato.infradead.org; Fri, 21 May 2021 19:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=eO16a1zzn2/O2suBMFJ4nWGdZVKUfA+0OJJC9P2ye60=; b=x4//hce6r6FUIN19Fy1SCLw6kn
 iH54t9KyFR4Adl4bNTw5cpddmywZieU4XeoXJx1ev3I+q3Wx43ZMRtQNcBN11V731wUSIdUqbjeM/
 OKprJaP6kvuN4sPO4pIaAI7j46DhJB5vjSqfnjTL8DuYcqIb3TuL156hRjXtwVVwHDD0h6LQ9GuVh
 80qvcRcgNj8+Nia3ikVrd69DvCKR1fbYRt94sYE5S5bV2on5SQQCoPWURS1Q6JdiSaC3YBM7vCSgl
 1HG1WwvA/IlJ9BoJfdwDD1Fecg2gkEZbsg0U9aFknt6W6OeJaRfF+8AXEz9CDZiZFMEnvWDsa76vQ
 Ojgy1LJA==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkB0n-00HNxS-Mi
 for linux-mtd@lists.infradead.org; Fri, 21 May 2021 19:40:48 +0000
Received: from mwalle01.fritz.box (ip4d17858c.dynamic.kabel-deutschland.de
 [77.23.133.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6A9D42224E;
 Fri, 21 May 2021 21:40:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1621626041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eO16a1zzn2/O2suBMFJ4nWGdZVKUfA+0OJJC9P2ye60=;
 b=Oq6gmHJl6ut83uaFFsWVJbE7oGmuHgH2Bk0mCHlAF6hth/6iMw/rZEaxbykr9+GHXHDISw
 rzbI47TjDuAYsXw2jQlc9rVHEY+XYoBCF46+u4rNiuaDHHWa3Mz/3KLpHjPqgZdgrjT+Kk
 xCyImI+Wg/A0iSPJlgkVD/coGp7WCls=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v4 4/4] mtd: spi-nor: otp: implement erase for Winbond and
 similar flashes
Date: Fri, 21 May 2021 21:40:34 +0200
Message-Id: <20210521194034.15249-5-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210521194034.15249-1-michael@walle.cc>
References: <20210521194034.15249-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_124046_078538_F6DBA4D7 
X-CRM114-Status: GOOD (  22.19  )
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

Winbond flashes with OTP support provide a command to erase the OTP
data. This might come in handy during development.

This was tested with a Winbond W25Q32JW on a LS1028A SoC with the
NXP FSPI controller.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.c    |  2 +-
 drivers/mtd/spi-nor/core.h    |  4 ++
 drivers/mtd/spi-nor/otp.c     | 83 +++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/winbond.c |  1 +
 4 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index bd2c7717eb10..9551effb6a44 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1318,7 +1318,7 @@ static u32 spi_nor_convert_addr(struct spi_nor *nor, loff_t addr)
 /*
  * Initiate the erasure of a single sector
  */
-static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
+int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 {
 	int i;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 28a2e0be97a3..9398a8738857 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -207,6 +207,7 @@ struct spi_nor_otp_organization {
  * @read:	read from the SPI NOR OTP area.
  * @write:	write to the SPI NOR OTP area.
  * @lock:	lock an OTP region.
+ * @erase:	erase an OTP region.
  * @is_locked:	check if an OTP region of the SPI NOR is locked.
  */
 struct spi_nor_otp_ops {
@@ -214,6 +215,7 @@ struct spi_nor_otp_ops {
 	int (*write)(struct spi_nor *nor, loff_t addr, size_t len,
 		     const u8 *buf);
 	int (*lock)(struct spi_nor *nor, unsigned int region);
+	int (*erase)(struct spi_nor *nor, loff_t addr);
 	int (*is_locked)(struct spi_nor *nor, unsigned int region);
 };
 
@@ -503,10 +505,12 @@ ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
 			  u8 *buf);
 ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
 			   const u8 *buf);
+int spi_nor_erase_sector(struct spi_nor *nor, u32 addr);
 
 int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf);
 int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len,
 			   const u8 *buf);
+int spi_nor_otp_erase_secr(struct spi_nor *nor, loff_t addr);
 int spi_nor_otp_lock_sr2(struct spi_nor *nor, unsigned int region);
 int spi_nor_otp_is_locked_sr2(struct spi_nor *nor, unsigned int region);
 
diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index b87f96593c13..afa348a3af70 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -120,6 +120,38 @@ int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len,
 	return ret ?: written;
 }
 
+/**
+ * spi_nor_otp_erase_secr() - erase a security register
+ * @nor:        pointer to 'struct spi_nor'
+ * @addr:       offset of the security register to be erased
+ *
+ * Erase a security register by using the SPINOR_OP_ESECR command.
+ *
+ * For more information on the term "security register", see the documentation
+ * of spi_nor_otp_read_secr().
+ *
+ * This method is used on GigaDevice and Winbond flashes.
+ *
+ * Return: 0 on success, -errno otherwise
+ */
+int spi_nor_otp_erase_secr(struct spi_nor *nor, loff_t addr)
+{
+	u8 erase_opcode = nor->erase_opcode;
+	int ret;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	nor->erase_opcode = SPINOR_OP_ESECR;
+	ret = spi_nor_erase_sector(nor, addr);
+	nor->erase_opcode = erase_opcode;
+	if (ret)
+		return ret;
+
+	return spi_nor_wait_till_ready(nor);
+}
+
 static int spi_nor_otp_lock_bit_cr(unsigned int region)
 {
 	static const int lock_bits[] = { SR2_LB1, SR2_LB2, SR2_LB3 };
@@ -360,6 +392,56 @@ static int spi_nor_mtd_otp_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return spi_nor_mtd_otp_read_write(mtd, to, len, retlen, buf, true);
 }
 
+static int spi_nor_mtd_otp_erase(struct mtd_info *mtd, loff_t from, size_t len)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	const struct spi_nor_otp_ops *ops = nor->params->otp.ops;
+	const size_t rlen = spi_nor_otp_region_len(nor);
+	unsigned int region;
+	loff_t rstart;
+	int ret;
+
+	/* OTP erase is optional */
+	if (!ops->erase)
+		return -EOPNOTSUPP;
+
+	if (from < 0 || (from + len) > spi_nor_otp_size(nor))
+		return -EINVAL;
+
+	/* the user has to explicitly ask for whole regions */
+	if (!IS_ALIGNED(len, rlen) || !IS_ALIGNED(from, rlen))
+		return -EINVAL;
+
+	ret = spi_nor_lock_and_prep(nor);
+	if (ret)
+		return ret;
+
+	ret = spi_nor_mtd_otp_range_is_locked(nor, from, len);
+	if (ret < 0) {
+		goto out;
+	} else if (ret) {
+		ret = -EROFS;
+		goto out;
+	}
+
+	while (len) {
+		region = spi_nor_otp_offset_to_region(nor, from);
+		rstart = spi_nor_otp_region_start(nor, region);
+
+		ret = ops->erase(nor, rstart);
+		if (ret)
+			goto out;
+
+		len -= rlen;
+		from += rlen;
+	}
+
+out:
+	spi_nor_unlock_and_unprep(nor);
+
+	return ret;
+}
+
 static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
@@ -418,4 +500,5 @@ void spi_nor_otp_init(struct spi_nor *nor)
 	mtd->_read_user_prot_reg = spi_nor_mtd_otp_read;
 	mtd->_write_user_prot_reg = spi_nor_mtd_otp_write;
 	mtd->_lock_user_prot_reg = spi_nor_mtd_otp_lock;
+	mtd->_erase_user_prot_reg = spi_nor_mtd_otp_erase;
 }
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 9a81c67a60c6..96573f61caf5 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -139,6 +139,7 @@ static int winbond_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 static const struct spi_nor_otp_ops winbond_otp_ops = {
 	.read = spi_nor_otp_read_secr,
 	.write = spi_nor_otp_write_secr,
+	.erase = spi_nor_otp_erase_secr,
 	.lock = spi_nor_otp_lock_sr2,
 	.is_locked = spi_nor_otp_is_locked_sr2,
 };
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

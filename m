Return-Path: <SRS0=l9qW=T6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA74C28CC0
	for <linux-mtd@archiver.kernel.org>; Thu, 30 May 2019 21:21:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2D7F261B8
	for <linux-mtd@archiver.kernel.org>; Thu, 30 May 2019 21:21:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pwJCnP16";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJ2xQQj3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2D7F261B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=4nveDtlQ/cd9cS8QL8eAObvutvblkz4LpncAHyu2xHA=; b=pwJ
	CnP16uP5DNCeeA7AcMzUNwYzdGVBXez9qaZ1RrWVikI8PA30fx/1UkgkWOuu7gBbZMPhq14CsrITT
	cJfYdUPlEkENzX1Fz6v4wRYkWlNlrLn9aYn17Mi0ccvgA5I6lckZCXTieaSAxYp9eiHY6NYKiovYn
	DhuAPUHAYoFwQ3+STV+E2h35kEFcapa825jMevB8+lPbSaiYQcxncQqAnYSSuep0O76qG5xjoV0xK
	rJ+LBE3FQHZ/6YEjzbWuzWJBzL0KqG0Bp33t52JbATATrwckLQMQi8iIY9Ns1MOevphnrMy0EERUP
	vVdm2F3Kaayq/k9FT2KumaTm6mbSMJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWSU5-0003I8-UR; Thu, 30 May 2019 21:21:13 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWSU1-0003Hg-Gn
 for linux-mtd@lists.infradead.org; Thu, 30 May 2019 21:21:11 +0000
Received: by mail-ed1-x533.google.com with SMTP id w37so11146973edw.4
 for <linux-mtd@lists.infradead.org>; Thu, 30 May 2019 14:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=T3N4h0dd1g4eImz2VJjO/VLzKH6Oo3mPTeCW7MahZFg=;
 b=DJ2xQQj3Wv5aqtiVGdC8ig1iBpw+w1kN+HslWeWF/gIuLsdA6EM5M94ErpdQHwj1LA
 qICkmzSQ7wUcLe8jcPoeKpyTI+LMO85ztQMH5nk+qNqwT5CRiieidfa0ApiKVpOIjZNa
 aZLHuoZjnodUIH4jQtz22KBnJq7Vg32jmamVkRO6Zjp4HdCcoMb5fG9Z03LikKwYFUPu
 l+PXZW55rIYg/2qZt0L3ZHV+KG6CWg7NLKkxNU4vIZ9dXQqLy4pIm9572myIapCcQslf
 d2cPv8NrR5l5buHFjSgkGTLsJchO8VM1FWBX0YPiNJ3QfrbQueRwOmFJgCwmBJtrIcfF
 4nxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=T3N4h0dd1g4eImz2VJjO/VLzKH6Oo3mPTeCW7MahZFg=;
 b=lsr7sv8BN0Y4apSPnO/NDzChNDXdEZz2Re0kNbJm9JWQDi2BF23AcvIIYxIgN0mDHU
 Sq97NCUOzWkUGrpHNXw+olhopJGiDrmG7NhkZJMOBaTYLFAV4IPa3b242ZIBCuZoe6ka
 XHpWbNHxxvI4XL1f+412JYHShlaMVNzxJuUJ5BnMjZKSF68/0djLv7u+arezJgbMBzDh
 CZfokmsMxM1pKSYGgtlsb6n/cdiXKvcuupj8RH0g8BPHkwrPXIsjiVNeCq0N3gxhAXGs
 BpEsxcIpQHNk3u2qfNZphv+usF3G3mDNHlzAFLN4bIjZchpG1p5gZxSXygOmQlHoEUJ1
 s1wA==
X-Gm-Message-State: APjAAAVUdysIv8Vqb1ErXWk4xWx0jpTW4F/Gf0xemKloC+j3FzcDSvcZ
 tOnvVC3CLCaC3LhBo7i0UtiHMn5b
X-Google-Smtp-Source: APXvYqwfZJx9hTXkSyPVnZ+/roZkwAw7TkmaGc+jaOWI4YuiMzVvTC34N+6+KH8b3WIKxQQQvJVY/A==
X-Received: by 2002:a50:fb01:: with SMTP id d1mr7167712edq.267.1559251265570; 
 Thu, 30 May 2019 14:21:05 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id h25sm597082ejz.10.2019.05.30.14.21.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 14:21:04 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] mtd: nand: raw: brcmnand: Refactored code and introduced
 inline functions
Date: Thu, 30 May 2019 17:20:35 -0400
Message-Id: <1559251257-12383-1-git-send-email-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 1.9.0.138.g2de3478
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190530_142109_583017_42D3DD0D 
X-CRM114-Status: GOOD (  13.37  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Refactored NAND ECC and CMD address configuration code to use inline
functions.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 100 +++++++++++++++++++------------
 1 file changed, 62 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index ce0b8ff..77b7850 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -588,6 +588,54 @@ static inline void brcmnand_write_fc(struct brcmnand_controller *ctrl,
 	__raw_writel(val, ctrl->nand_fc + word * 4);
 }
 
+static inline void brcmnand_clear_ecc_addr(struct brcmnand_controller *ctrl)
+{
+
+	/* Clear error addresses */
+	brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_ADDR, 0);
+	brcmnand_write_reg(ctrl, BRCMNAND_CORR_ADDR, 0);
+	brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_EXT_ADDR, 0);
+	brcmnand_write_reg(ctrl, BRCMNAND_CORR_EXT_ADDR, 0);
+}
+
+static inline u64 brcmnand_get_uncorrecc_addr(struct brcmnand_controller *ctrl)
+{
+	u64 err_addr;
+
+	err_addr = brcmnand_read_reg(ctrl, BRCMNAND_UNCORR_ADDR);
+	err_addr |= ((u64)(brcmnand_read_reg(ctrl,
+					     BRCMNAND_UNCORR_EXT_ADDR)
+					     & 0xffff) << 32);
+
+	return err_addr;
+}
+
+static inline u64 brcmnand_get_correcc_addr(struct brcmnand_controller *ctrl)
+{
+	u64 err_addr;
+
+	err_addr = brcmnand_read_reg(ctrl, BRCMNAND_CORR_ADDR);
+	err_addr |= ((u64)(brcmnand_read_reg(ctrl,
+					     BRCMNAND_CORR_EXT_ADDR)
+					     & 0xffff) << 32);
+
+	return err_addr;
+}
+
+static inline void brcmnand_set_cmd_addr(struct mtd_info *mtd, u64 addr)
+{
+	struct nand_chip *chip =  mtd_to_nand(mtd);
+	struct brcmnand_host *host = nand_get_controller_data(chip);
+	struct brcmnand_controller *ctrl = host->ctrl;
+
+	brcmnand_write_reg(ctrl, BRCMNAND_CMD_EXT_ADDRESS,
+			   (host->cs << 16) | ((addr >> 32) & 0xffff));
+	(void)brcmnand_read_reg(ctrl, BRCMNAND_CMD_EXT_ADDRESS);
+	brcmnand_write_reg(ctrl, BRCMNAND_CMD_ADDRESS,
+			   lower_32_bits(addr));
+	(void)brcmnand_read_reg(ctrl, BRCMNAND_CMD_ADDRESS);
+}
+
 static inline u16 brcmnand_cs_offset(struct brcmnand_controller *ctrl, int cs,
 				     enum brcmnand_cs_reg reg)
 {
@@ -1213,9 +1261,12 @@ static void brcmnand_send_cmd(struct brcmnand_host *host, int cmd)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
 	int ret;
+	u64 cmd_addr;
+
+	cmd_addr = brcmnand_read_reg(ctrl, BRCMNAND_CMD_ADDRESS);
+
+	dev_dbg(ctrl->dev, "send native cmd %d addr 0x%llx\n", cmd, cmd_addr);
 
-	dev_dbg(ctrl->dev, "send native cmd %d addr_lo 0x%x\n", cmd,
-		brcmnand_read_reg(ctrl, BRCMNAND_CMD_ADDRESS));
 	BUG_ON(ctrl->cmd_pending != 0);
 	ctrl->cmd_pending = cmd;
 
@@ -1374,12 +1425,7 @@ static void brcmnand_cmdfunc(struct nand_chip *chip, unsigned command,
 	if (!native_cmd)
 		return;
 
-	brcmnand_write_reg(ctrl, BRCMNAND_CMD_EXT_ADDRESS,
-		(host->cs << 16) | ((addr >> 32) & 0xffff));
-	(void)brcmnand_read_reg(ctrl, BRCMNAND_CMD_EXT_ADDRESS);
-	brcmnand_write_reg(ctrl, BRCMNAND_CMD_ADDRESS, lower_32_bits(addr));
-	(void)brcmnand_read_reg(ctrl, BRCMNAND_CMD_ADDRESS);
-
+	brcmnand_set_cmd_addr(mtd, addr);
 	brcmnand_send_cmd(host, native_cmd);
 	brcmnand_waitfunc(chip);
 
@@ -1597,20 +1643,10 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 	struct brcmnand_controller *ctrl = host->ctrl;
 	int i, j, ret = 0;
 
-	/* Clear error addresses */
-	brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_ADDR, 0);
-	brcmnand_write_reg(ctrl, BRCMNAND_CORR_ADDR, 0);
-	brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_EXT_ADDR, 0);
-	brcmnand_write_reg(ctrl, BRCMNAND_CORR_EXT_ADDR, 0);
-
-	brcmnand_write_reg(ctrl, BRCMNAND_CMD_EXT_ADDRESS,
-			(host->cs << 16) | ((addr >> 32) & 0xffff));
-	(void)brcmnand_read_reg(ctrl, BRCMNAND_CMD_EXT_ADDRESS);
+	brcmnand_clear_ecc_addr(ctrl);
 
 	for (i = 0; i < trans; i++, addr += FC_BYTES) {
-		brcmnand_write_reg(ctrl, BRCMNAND_CMD_ADDRESS,
-				   lower_32_bits(addr));
-		(void)brcmnand_read_reg(ctrl, BRCMNAND_CMD_ADDRESS);
+		brcmnand_set_cmd_addr(mtd, addr);
 		/* SPARE_AREA_READ does not use ECC, so just use PAGE_READ */
 		brcmnand_send_cmd(host, CMD_PAGE_READ);
 		brcmnand_waitfunc(chip);
@@ -1630,21 +1666,15 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 					host->hwcfg.sector_size_1k);
 
 		if (!ret) {
-			*err_addr = brcmnand_read_reg(ctrl,
-					BRCMNAND_UNCORR_ADDR) |
-				((u64)(brcmnand_read_reg(ctrl,
-						BRCMNAND_UNCORR_EXT_ADDR)
-					& 0xffff) << 32);
+			*err_addr = brcmnand_get_uncorrecc_addr(ctrl);
+
 			if (*err_addr)
 				ret = -EBADMSG;
 		}
 
 		if (!ret) {
-			*err_addr = brcmnand_read_reg(ctrl,
-					BRCMNAND_CORR_ADDR) |
-				((u64)(brcmnand_read_reg(ctrl,
-						BRCMNAND_CORR_EXT_ADDR)
-					& 0xffff) << 32);
+			*err_addr = brcmnand_get_correcc_addr(ctrl);
+
 			if (*err_addr)
 				ret = -EUCLEAN;
 		}
@@ -1711,7 +1741,7 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 	dev_dbg(ctrl->dev, "read %llx -> %p\n", (unsigned long long)addr, buf);
 
 try_dmaread:
-	brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_COUNT, 0);
+	brcmnand_clear_ecc_addr(ctrl);
 
 	if (has_flash_dma(ctrl) && !oob && flash_dma_buf_ok(buf)) {
 		err = brcmnand_dma_trans(host, addr, buf, trans * FC_BYTES,
@@ -1858,15 +1888,9 @@ static int brcmnand_write(struct mtd_info *mtd, struct nand_chip *chip,
 		goto out;
 	}
 
-	brcmnand_write_reg(ctrl, BRCMNAND_CMD_EXT_ADDRESS,
-			(host->cs << 16) | ((addr >> 32) & 0xffff));
-	(void)brcmnand_read_reg(ctrl, BRCMNAND_CMD_EXT_ADDRESS);
-
 	for (i = 0; i < trans; i++, addr += FC_BYTES) {
 		/* full address MUST be set before populating FC */
-		brcmnand_write_reg(ctrl, BRCMNAND_CMD_ADDRESS,
-				   lower_32_bits(addr));
-		(void)brcmnand_read_reg(ctrl, BRCMNAND_CMD_ADDRESS);
+		brcmnand_set_cmd_addr(mtd, addr);
 
 		if (buf) {
 			brcmnand_soc_data_bus_prepare(ctrl->soc, false);
-- 
1.9.0.138.g2de3478


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

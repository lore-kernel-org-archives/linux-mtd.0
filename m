Return-Path: <SRS0=+Ogn=6P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86647C47253
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 09:08:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D3CC20731
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 09:08:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vr4QQp7k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D3CC20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ycEE2CkJbl3covXC67baGYRBP12KErQB1CX3QuHMIL0=; b=Vr4QQp7kAPf9KK
	yyFj//hiiqOmPBOZzlOsV2mMmMnjp1QSFNYK5jNpYqKNMPLjGQCSZW58F+bBqXcJutRdJV/91rUlO
	bdZucqsNAys/ELfjXPdkkyVm7Na/yS0HdDQASEsQIeKv9USExwbJLhQQFBaqvTHKSqUA3XsM0d/LY
	PN/8ot94Y6/rQ9rfqKL8RJMN1vIxeYt4j9YyG1yrSWLPuhwhHIaH5l/c0PS2WDiK9AEkAdGv05CMa
	2n2JqdfdBuZevcVE3GZvD4DjBTlxkO68Cgptaf0eXnRIH0wO57n2G3dZ/eOKz5umSWF+UBbc2koT2
	ZBkQSy66O0AH5brffcAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUReK-0001sy-UO; Fri, 01 May 2020 09:08:00 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jURdO-00019A-EV; Fri, 01 May 2020 09:07:05 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2A3952A2D4F;
 Fri,  1 May 2020 10:07:01 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] mtd: rawnand: cs553x: Stop using chip->legacy.IO_ADDR_{R,
 W}
Date: Fri,  1 May 2020 11:06:48 +0200
Message-Id: <20200501090650.1138200-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200501090650.1138200-1-boris.brezillon@collabora.com>
References: <20200501090650.1138200-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_020702_780174_4B83B3D4 
X-CRM114-Status: GOOD (  14.47  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-geode@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Andres Salomon <dilinger@queued.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Now that we have our own controller struct we can keep the MMIO pointer
in there and use instead of using the chip->legacy.IO_ADDR_{R,W} fields.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/cs553x_nand.c | 57 ++++++++++++++++++------------
 1 file changed, 34 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index 970de727679f..84cf87f02bd3 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -92,51 +92,66 @@
 struct cs553x_nand_controller {
 	struct nand_controller base;
 	struct nand_chip chip;
+	void __iomem *mmio;
 };
 
+static struct cs553x_nand_controller *
+to_cs553x(struct nand_controller *controller)
+{
+	return container_of(controller, struct cs553x_nand_controller, base);
+}
+
 static void cs553x_read_buf(struct nand_chip *this, u_char *buf, int len)
 {
+	struct cs553x_nand_controller *cs553x = to_cs553x(this->controller);
+
 	while (unlikely(len > 0x800)) {
-		memcpy_fromio(buf, this->legacy.IO_ADDR_R, 0x800);
+		memcpy_fromio(buf, cs553x->mmio, 0x800);
 		buf += 0x800;
 		len -= 0x800;
 	}
-	memcpy_fromio(buf, this->legacy.IO_ADDR_R, len);
+	memcpy_fromio(buf, cs553x->mmio, len);
 }
 
 static void cs553x_write_buf(struct nand_chip *this, const u_char *buf, int len)
 {
+	struct cs553x_nand_controller *cs553x = to_cs553x(this->controller);
+
 	while (unlikely(len > 0x800)) {
-		memcpy_toio(this->legacy.IO_ADDR_R, buf, 0x800);
+		memcpy_toio(cs553x->mmio, buf, 0x800);
 		buf += 0x800;
 		len -= 0x800;
 	}
-	memcpy_toio(this->legacy.IO_ADDR_R, buf, len);
+	memcpy_toio(cs553x->mmio, buf, len);
 }
 
 static unsigned char cs553x_read_byte(struct nand_chip *this)
 {
-	return readb(this->legacy.IO_ADDR_R);
+	struct cs553x_nand_controller *cs553x = to_cs553x(this->controller);
+
+	return readb(cs553x->mmio);
 }
 
 static void cs553x_write_byte(struct nand_chip *this, u_char byte)
 {
+	struct cs553x_nand_controller *cs553x = to_cs553x(this->controller);
 	int i = 100000;
 
-	while (i && readb(this->legacy.IO_ADDR_R + MM_NAND_STS) & CS_NAND_CTLR_BUSY) {
+	while (i && readb(cs553x->mmio + MM_NAND_STS) & CS_NAND_CTLR_BUSY) {
 		udelay(1);
 		i--;
 	}
-	writeb(byte, this->legacy.IO_ADDR_W + 0x801);
+	writeb(byte, cs553x->mmio + 0x801);
 }
 
 static void cs553x_hwcontrol(struct nand_chip *this, int cmd,
 			     unsigned int ctrl)
 {
-	void __iomem *mmio_base = this->legacy.IO_ADDR_R;
+	struct cs553x_nand_controller *cs553x = to_cs553x(this->controller);
+
 	if (ctrl & NAND_CTRL_CHANGE) {
 		unsigned char ctl = (ctrl & ~NAND_CTRL_CHANGE ) ^ 0x01;
-		writeb(ctl, mmio_base + MM_NAND_CTL);
+		writeb(ctl, cs553x->mmio + MM_NAND_CTL);
 	}
 	if (cmd != NAND_CMD_NONE)
 		cs553x_write_byte(this, cmd);
@@ -144,26 +159,26 @@ static void cs553x_hwcontrol(struct nand_chip *this, int cmd,
 
 static int cs553x_device_ready(struct nand_chip *this)
 {
-	void __iomem *mmio_base = this->legacy.IO_ADDR_R;
-	unsigned char foo = readb(mmio_base + MM_NAND_STS);
+	struct cs553x_nand_controller *cs553x = to_cs553x(this->controller);
+	unsigned char foo = readb(cs553x->mmio + MM_NAND_STS);
 
 	return (foo & CS_NAND_STS_FLASH_RDY) && !(foo & CS_NAND_CTLR_BUSY);
 }
 
 static void cs_enable_hwecc(struct nand_chip *this, int mode)
 {
-	void __iomem *mmio_base = this->legacy.IO_ADDR_R;
+	struct cs553x_nand_controller *cs553x = to_cs553x(this->controller);
 
-	writeb(0x07, mmio_base + MM_NAND_ECC_CTL);
+	writeb(0x07, cs553x->mmio + MM_NAND_ECC_CTL);
 }
 
 static int cs_calculate_ecc(struct nand_chip *this, const u_char *dat,
 			    u_char *ecc_code)
 {
+	struct cs553x_nand_controller *cs553x = to_cs553x(this->controller);
 	uint32_t ecc;
-	void __iomem *mmio_base = this->legacy.IO_ADDR_R;
 
-	ecc = readl(mmio_base + MM_NAND_STS);
+	ecc = readl(cs553x->mmio + MM_NAND_STS);
 
 	ecc_code[1] = ecc >> 8;
 	ecc_code[0] = ecc >> 16;
@@ -204,8 +219,8 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 	new_mtd->owner = THIS_MODULE;
 
 	/* map physical address */
-	this->legacy.IO_ADDR_R = this->legacy.IO_ADDR_W = ioremap(adr, 4096);
-	if (!this->legacy.IO_ADDR_R) {
+	controller->mmio = ioremap(adr, 4096);
+	if (!controller->mmio) {
 		pr_warn("ioremap cs553x NAND @0x%08lx failed\n", adr);
 		err = -EIO;
 		goto out_mtd;
@@ -247,7 +262,7 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 out_free:
 	kfree(new_mtd->name);
 out_ior:
-	iounmap(this->legacy.IO_ADDR_R);
+	iounmap(controller->mmio);
 out_mtd:
 	kfree(controller);
 out:
@@ -322,7 +337,6 @@ static void __exit cs553x_cleanup(void)
 	int i;
 
 	for (i = 0; i < NR_CS553X_CONTROLLERS; i++) {
-		void __iomem *mmio_base;
 		struct cs553x_nand_controller *controller = controllers[i];
 		struct nand_chip *this = &controller->chip;
 		struct mtd_info *mtd = nand_to_mtd(this);
@@ -330,16 +344,13 @@ static void __exit cs553x_cleanup(void)
 		if (!mtd)
 			continue;
 
-		this = mtd_to_nand(mtd);
-		mmio_base = this->legacy.IO_ADDR_R;
-
 		/* Release resources, unregister device */
 		nand_release(this);
 		kfree(mtd->name);
 		controllers[i] = NULL;
 
 		/* unmap physical address */
-		iounmap(mmio_base);
+		iounmap(controller->mmio);
 
 		/* Free the MTD device structure */
 		kfree(controller);
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

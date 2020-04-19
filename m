Return-Path: <SRS0=gdbt=6D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E51AC38A30
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Apr 2020 19:31:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C67522075E
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Apr 2020 19:31:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rbbAh56I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C67522075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=auOpfau19dTNcSoMhFYIbc0XWnS4+lYVQixuSVmzZuQ=; b=rbbAh56I+Ro681
	1MeMxD9Prh+bp6VGFIxkjFXbXRtC3CJ+9LqNdEVm3mixhhhV/PJ2QHT67c3exbX7jPpfBBj/O5Nxt
	srhwrN7HLZh74w4ijCZH3UsD0bN6bhST0azI+IIxuK/X0+UVcmDcuVkvaOCUYkbrzQhepdhKy/Cb8
	+xR5ENCiNnzZitQ052WcM/Fy41GERpP0HYTs2mb4YnKQ0YLi3jfXx5FEvZmYxrO9V+6vZt6ysXADL
	1L9xYDRijSEYUhReIwRSriGcP+K9TCjBlRGhfDsOxGNLvsukOxXIIMEtaKBIciY7cI8T6VppeOryw
	5xCx/q0Lskh0QOFrc9HA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQFeb-0004PG-05; Sun, 19 Apr 2020 19:30:57 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQFeN-0004Cb-Ld
 for linux-mtd@lists.infradead.org; Sun, 19 Apr 2020 19:30:45 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1237A2A0455;
 Sun, 19 Apr 2020 20:30:42 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] mtd: rawnand: au1550nd: Stop using IO_ADDR_{R,
 W} in au_{read, write}_buf[16]()
Date: Sun, 19 Apr 2020 21:30:34 +0200
Message-Id: <20200419193037.1544035-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200419193037.1544035-1-boris.brezillon@collabora.com>
References: <20200419193037.1544035-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200419_123043_833270_9C945A0E 
X-CRM114-Status: GOOD (  13.10  )
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

We are about to re-use those for the exec_op() implementation which
will not rely on au1550_hwcontrol(). Let's patch those helpers to
simply use the iomem address stored in the context.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index 75eb3e97fae3..2f8004f20349 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -23,6 +23,11 @@ struct au1550nd_ctx {
 	void (*write_byte)(struct nand_chip *, u_char);
 };
 
+static struct au1550nd_ctx *chip_to_au_ctx(struct nand_chip *this)
+{
+	return container_of(this, struct au1550nd_ctx, chip);
+}
+
 /**
  * au_read_byte -  read one byte from the chip
  * @this:	NAND chip object
@@ -85,10 +90,11 @@ static void au_write_byte16(struct nand_chip *this, u_char byte)
  */
 static void au_write_buf(struct nand_chip *this, const u_char *buf, int len)
 {
+	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
 	int i;
 
 	for (i = 0; i < len; i++) {
-		writeb(buf[i], this->legacy.IO_ADDR_W);
+		writeb(buf[i], ctx->base + MEM_STNAND_DATA);
 		wmb(); /* drain writebuffer */
 	}
 }
@@ -103,10 +109,11 @@ static void au_write_buf(struct nand_chip *this, const u_char *buf, int len)
  */
 static void au_read_buf(struct nand_chip *this, u_char *buf, int len)
 {
+	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
 	int i;
 
 	for (i = 0; i < len; i++) {
-		buf[i] = readb(this->legacy.IO_ADDR_R);
+		buf[i] = readb(ctx->base + MEM_STNAND_DATA);
 		wmb(); /* drain writebuffer */
 	}
 }
@@ -121,12 +128,13 @@ static void au_read_buf(struct nand_chip *this, u_char *buf, int len)
  */
 static void au_write_buf16(struct nand_chip *this, const u_char *buf, int len)
 {
+	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
 	int i;
 	u16 *p = (u16 *) buf;
 	len >>= 1;
 
 	for (i = 0; i < len; i++) {
-		writew(p[i], this->legacy.IO_ADDR_W);
+		writew(p[i], ctx->base + MEM_STNAND_DATA);
 		wmb(); /* drain writebuffer */
 	}
 
@@ -142,12 +150,13 @@ static void au_write_buf16(struct nand_chip *this, const u_char *buf, int len)
  */
 static void au_read_buf16(struct nand_chip *this, u_char *buf, int len)
 {
+	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
 	int i;
 	u16 *p = (u16 *) buf;
 	len >>= 1;
 
 	for (i = 0; i < len; i++) {
-		p[i] = readw(this->legacy.IO_ADDR_R);
+		p[i] = readw(ctx->base + MEM_STNAND_DATA);
 		wmb(); /* drain writebuffer */
 	}
 }
-- 
2.25.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

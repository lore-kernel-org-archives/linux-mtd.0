Return-Path: <SRS0=gdbt=6D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F0EC38A30
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Apr 2020 19:31:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2C032075E
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Apr 2020 19:31:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vBAthYrA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2C032075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5beuNTZDg0B8uG7yliCs7mOmC8e6ksz5tGgeEFnM5P8=; b=vBAthYrA8lB/TC
	qziGaHHmxDtf7iT0tpiP8RcAadvZY8w2L1ER0VqdaO2ZbEDxlYA3KeaKoIx+TA8iQkqxZukYpeYYV
	+1JxgFoVU727JrNaHSyLqlNG7hY53wYp4qSktxtoRa/Kg6vUDmuHIkVAY2l3bsHPIlo/fM9Qnm8Ny
	4xcqJD1k/pMmKWdB427UKih1YKNJYRI/1sy2oBoP4NxIxvvGt4NKZkPOBEhvhK83nJdsfJYyFp/sY
	1Qi6DpIDIq4Zhz737DmENOa4g0RHyQY2sffLILRdzgR4eoNfHv5gxgQN+L1PyD2F9ap+hE8b0gtgg
	ic7KjpUey8aQXRSQJotg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQFep-0004fA-Ib; Sun, 19 Apr 2020 19:31:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQFeO-0004Cx-F7
 for linux-mtd@lists.infradead.org; Sun, 19 Apr 2020 19:30:46 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1D0352A05AA;
 Sun, 19 Apr 2020 20:30:43 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 4/4] mtd: rawnand: au1550nd: Patch the read/write buf helper
 prototypes
Date: Sun, 19 Apr 2020 21:30:37 +0200
Message-Id: <20200419193037.1544035-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200419193037.1544035-1-boris.brezillon@collabora.com>
References: <20200419193037.1544035-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200419_123044_628704_EDF57069 
X-CRM114-Status: GOOD (  12.02  )
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

To match the types passed by au1550nd_exec_instr() function.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index dbcbc1c8b6ff..7158298119cf 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -37,13 +37,15 @@ static struct au1550nd_ctx *chip_to_au_ctx(struct nand_chip *this)
  *
  * write function for 8bit buswidth
  */
-static void au_write_buf(struct nand_chip *this, const u_char *buf, int len)
+static void au_write_buf(struct nand_chip *this, const void *buf,
+			 unsigned int len)
 {
 	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
+	const u8 *p = buf;
 	int i;
 
 	for (i = 0; i < len; i++) {
-		writeb(buf[i], ctx->base + MEM_STNAND_DATA);
+		writeb(p[i], ctx->base + MEM_STNAND_DATA);
 		wmb(); /* drain writebuffer */
 	}
 }
@@ -56,13 +58,15 @@ static void au_write_buf(struct nand_chip *this, const u_char *buf, int len)
  *
  * read function for 8bit buswidth
  */
-static void au_read_buf(struct nand_chip *this, u_char *buf, int len)
+static void au_read_buf(struct nand_chip *this, void *buf,
+			unsigned int len)
 {
 	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
+	u8 *p = buf;
 	int i;
 
 	for (i = 0; i < len; i++) {
-		buf[i] = readb(ctx->base + MEM_STNAND_DATA);
+		p[i] = readb(ctx->base + MEM_STNAND_DATA);
 		wmb(); /* drain writebuffer */
 	}
 }
@@ -75,18 +79,18 @@ static void au_read_buf(struct nand_chip *this, u_char *buf, int len)
  *
  * write function for 16bit buswidth
  */
-static void au_write_buf16(struct nand_chip *this, const u_char *buf, int len)
+static void au_write_buf16(struct nand_chip *this, const void *buf,
+			   unsigned int len)
 {
 	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
-	int i;
-	u16 *p = (u16 *) buf;
-	len >>= 1;
+	const u16 *p = buf;
+	unsigned int i;
 
+	len >>= 1;
 	for (i = 0; i < len; i++) {
 		writew(p[i], ctx->base + MEM_STNAND_DATA);
 		wmb(); /* drain writebuffer */
 	}
-
 }
 
 /**
@@ -97,13 +101,13 @@ static void au_write_buf16(struct nand_chip *this, const u_char *buf, int len)
  *
  * read function for 16bit buswidth
  */
-static void au_read_buf16(struct nand_chip *this, u_char *buf, int len)
+static void au_read_buf16(struct nand_chip *this, void *buf, unsigned int len)
 {
 	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
-	int i;
-	u16 *p = (u16 *) buf;
-	len >>= 1;
+	unsigned int i;
+	u16 *p = buf;
 
+	len >>= 1;
 	for (i = 0; i < len; i++) {
 		p[i] = readw(ctx->base + MEM_STNAND_DATA);
 		wmb(); /* drain writebuffer */
-- 
2.25.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

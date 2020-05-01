Return-Path: <SRS0=+Ogn=6P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F20C4724C
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 14:42:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FAC920708
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 14:42:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ESCcekA+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FAC920708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Lf+loEZNpsI7cu0vjNK1e074BUKH6jkdyrDkwfiqzs=; b=ESCcekA+ad66fR
	HINvlbzauJoITMsy2u+TkuNW/CExY/puZj/070aSdMA6iADEgZ8meXJR+4suKfkQlhnmKHduefBIN
	v82gN7RjXtifjwJ2pt09hfMgKgpznQEmN0f43VYXd265seRJecs+yyO7+m2Kej4Yhm28UZHPEtvFo
	e72ntYODGH9vUM92hhNcqHPGe2uQFObLTIRzifqBKDrsJiAGiBskpNYKH7O2z/RY0Vuwj6Tvhc19d
	VytZVeUxN5OVre8sXeSQRpaxJMamp19lD+QH/UBfYaygpjhqDW1hRWv2BEC4Jon4e3dBG0o3kXxjS
	6sft1kjm5gr8+7fHWr9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUWrV-0005Zc-Hy; Fri, 01 May 2020 14:41:57 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUWp4-0000pl-WA
 for linux-mtd@lists.infradead.org; Fri, 01 May 2020 14:39:30 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 41C172A30CD;
 Fri,  1 May 2020 15:39:24 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 2/5] mtd: rawnand: diskonchip: Get rid of
 doc2000_readbuf_dword()
Date: Fri,  1 May 2020 16:39:14 +0200
Message-Id: <20200501143917.1388957-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200501143917.1388957-1-boris.brezillon@collabora.com>
References: <20200501143917.1388957-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_073927_178664_5F47503B 
X-CRM114-Status: GOOD (  14.72  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The logic can easily be merged in doc2000_readbuf().

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/diskonchip.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 724493624822..7d9542de37a7 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -69,6 +69,7 @@ struct doc_priv {
 	int mh1_page;
 	struct rs_control *rs_decoder;
 	struct mtd_info *nextdoc;
+	bool supports_32b_reads;
 
 	/* Handle the last stage of initialization (BBT scan, partitioning) */
 	int (*late_init)(struct mtd_info *mtd);
@@ -337,32 +338,19 @@ static void doc2000_readbuf(struct nand_chip *this, u_char *buf, int len)
 {
 	struct doc_priv *doc = nand_get_controller_data(this);
 	void __iomem *docptr = doc->virtadr;
+	u32 *buf32 = (u32 *)buf;
 	int i;
 
 	if (debug)
 		printk("readbuf of %d bytes: ", len);
 
-	for (i = 0; i < len; i++)
-		buf[i] = ReadDOC(docptr, 2k_CDSN_IO + i);
-}
-
-static void doc2000_readbuf_dword(struct nand_chip *this, u_char *buf, int len)
-{
-	struct doc_priv *doc = nand_get_controller_data(this);
-	void __iomem *docptr = doc->virtadr;
-	int i;
-
-	if (debug)
-		printk("readbuf_dword of %d bytes: ", len);
-
-	if (unlikely((((unsigned long)buf) | len) & 3)) {
-		for (i = 0; i < len; i++) {
-			*(uint8_t *) (&buf[i]) = ReadDOC(docptr, 2k_CDSN_IO + i);
-		}
+	if (!doc->supports_32b_reads ||
+	    ((((unsigned long)buf) | len) & 3)) {
+		for (i = 0; i < len; i++)
+			buf[i] = ReadDOC(docptr, 2k_CDSN_IO + i);
 	} else {
-		for (i = 0; i < len; i += 4) {
-			*(uint32_t *) (&buf[i]) = readl(docptr + DoC_2k_CDSN_IO + i);
-		}
+		for (i = 0; i < len / 4; i++)
+			buf32[i] = readl(docptr + DoC_2k_CDSN_IO + i);
 	}
 }
 
@@ -405,7 +393,7 @@ static uint16_t __init doc200x_ident_chip(struct mtd_info *mtd, int nr)
 		ident.dword = readl(docptr + DoC_2k_CDSN_IO);
 		if (((ident.byte[0] << 8) | ident.byte[1]) == ret) {
 			pr_info("DiskOnChip 2000 responds to DWORD access\n");
-			this->legacy.read_buf = &doc2000_readbuf_dword;
+			doc->supports_32b_reads = true;
 		}
 	}
 
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

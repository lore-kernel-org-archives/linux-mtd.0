Return-Path: <SRS0=+Ogn=6P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C5FC4724C
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 09:07:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CE362076D
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 09:07:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DNm3hJ/S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CE362076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZnyE5jq6/wQRLmJD5i63a1MoPAv1srgeP7LWI0XT+c=; b=DNm3hJ/SxG8G3k
	LCzjBs462VuBBsIg74EPFK/f4zIkOnA/3bwQglEXTwQ7A+IC7egOVhbkLgx3jMrFr6H3JRKhueGib
	0IqEMP2mus++JPlr72+PKw8yMsloKDnEbooL++k4bNgsLfAeoORkt2W4P+reJjXqrscbvMPhlEfEi
	COPr9VcDn9KPyfMA+alz3BTm/I0SXxlh8yJItuwX7X5TbyyuEZ061DK6BuLHz6//knzI1M+9V9HzO
	80LmCflAPYKzyLzIg6JZwzGq74eN0eIhV/bAqWVI2u/UlgDN19zhS0xkUjIjzMlKDNrnF1A9YeY8D
	ldmPK+6qB+mdbnQIFiNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jURdv-0001bF-QF; Fri, 01 May 2020 09:07:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jURdP-00019Q-6R; Fri, 01 May 2020 09:07:05 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BE4432A2D51;
 Fri,  1 May 2020 10:07:01 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 4/4] mtd: rawnand: cs553x: Get rid of the legacy interface
 implementation
Date: Fri,  1 May 2020 11:06:50 +0200
Message-Id: <20200501090650.1138200-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200501090650.1138200-1-boris.brezillon@collabora.com>
References: <20200501090650.1138200-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_020703_362720_163B9C0B 
X-CRM114-Status: GOOD (  11.38  )
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

Now that exec_op() is implemented we no longer need to implement the
legacy hooks.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/cs553x_nand.c | 72 ------------------------------
 1 file changed, 72 deletions(-)

diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index 3596edc6b777..df5e24a2bbd7 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -101,70 +101,6 @@ to_cs553x(struct nand_controller *controller)
 	return container_of(controller, struct cs553x_nand_controller, base);
 }
 
-static void cs553x_read_buf(struct nand_chip *this, u_char *buf, int len)
-{
-	struct cs553x_nand_controller *cs553x = to_cs553x(this->controller);
-
-	while (unlikely(len > 0x800)) {
-		memcpy_fromio(buf, cs553x->mmio, 0x800);
-		buf += 0x800;
-		len -= 0x800;
-	}
-	memcpy_fromio(buf, cs553x->mmio, len);
-}
-
-static void cs553x_write_buf(struct nand_chip *this, const u_char *buf, int len)
-{
-	struct cs553x_nand_controller *cs553x = to_cs553x(this->controller);
-
-	while (unlikely(len > 0x800)) {
-		memcpy_toio(cs553x->mmio, buf, 0x800);
-		buf += 0x800;
-		len -= 0x800;
-	}
-	memcpy_toio(cs553x->mmio, buf, len);
-}
-
-static unsigned char cs553x_read_byte(struct nand_chip *this)
-{
-	struct cs553x_nand_controller *cs553x = to_cs553x(this->controller);
-
-	return readb(cs553x->mmio);
-}
-
-static void cs553x_write_byte(struct nand_chip *this, u_char byte)
-{
-	struct cs553x_nand_controller *cs553x = to_cs553x(this->controller);
-	int i = 100000;
-
-	while (i && readb(cs553x->mmio + MM_NAND_STS) & CS_NAND_CTLR_BUSY) {
-		udelay(1);
-		i--;
-	}
-	writeb(byte, cs553x->mmio + 0x801);
-}
-
-static void cs553x_hwcontrol(struct nand_chip *this, int cmd,
-			     unsigned int ctrl)
-{
-	struct cs553x_nand_controller *cs553x = to_cs553x(this->controller);
-
-	if (ctrl & NAND_CTRL_CHANGE) {
-		unsigned char ctl = (ctrl & ~NAND_CTRL_CHANGE ) ^ 0x01;
-		writeb(ctl, cs553x->mmio + MM_NAND_CTL);
-	}
-	if (cmd != NAND_CMD_NONE)
-		cs553x_write_byte(this, cmd);
-}
-
-static int cs553x_device_ready(struct nand_chip *this)
-{
-	struct cs553x_nand_controller *cs553x = to_cs553x(this->controller);
-	unsigned char foo = readb(cs553x->mmio + MM_NAND_STS);
-
-	return (foo & CS_NAND_STS_FLASH_RDY) && !(foo & CS_NAND_CTLR_BUSY);
-}
-
 static int cs553x_write_ctrl_byte(struct cs553x_nand_controller *cs553x,
 				  u32 ctl, u8 data)
 {
@@ -350,14 +286,6 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 		goto out_mtd;
 	}
 
-	this->legacy.cmd_ctrl = cs553x_hwcontrol;
-	this->legacy.dev_ready = cs553x_device_ready;
-	this->legacy.read_byte = cs553x_read_byte;
-	this->legacy.read_buf = cs553x_read_buf;
-	this->legacy.write_buf = cs553x_write_buf;
-
-	this->legacy.chip_delay = 0;
-
 	this->ecc.mode = NAND_ECC_HW;
 	this->ecc.size = 256;
 	this->ecc.bytes = 3;
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

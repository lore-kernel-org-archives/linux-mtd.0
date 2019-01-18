Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369C5C43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 14:39:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 078AD2054F
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 14:39:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pRnzZdTu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 078AD2054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hAc6S6HnYbhYhd6ryBFiZlqEPCNsmUJmCckfkQErRUc=; b=pRnzZdTuipFOK4DJgwUDLq6lyb
	M2PSzbD/e3yx2djaaZJbmnqvehf7Hf7lh8E2faRQ0omnRRIoiG69z98ekScIQvqacGyVwGsvz2P5N
	ZmUE/HqU13OegZ90h6F3ecbcUEr/F5Z9Noit5oJvY2v8vh12GPfgV/ZlFtnapsv/b9JeUOlExgaqH
	FzQZwFaiGjE1mddkq7mPjjO58z0br4yP5ArqyrBMhWn27DJ85NyVB04cekoKS0OKRz+1cL/4l/D0o
	O8nXHk+ETwSPNO/3uQdipf15St7y0GVXPyMzTPk7yoJithNz2omk5Y1qoFvtR0XUYUbo+VRhmBYly
	VUjbpuJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkVIY-0004Tw-CT; Fri, 18 Jan 2019 14:39:06 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkVIM-0004J1-6m
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 14:38:56 +0000
Received: from ramsan ([84.194.111.163])
 by baptiste.telenet-ops.be with bizsmtp
 id Rqen1z00Z3XaVaC01qenMl; Fri, 18 Jan 2019 15:38:48 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1gkVIF-0007kw-5o; Fri, 18 Jan 2019 15:38:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1gkUlz-0007bb-Un; Fri, 18 Jan 2019 15:05:27 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 1/2] eeprom: at25: Merge "off" and "offset" in
 at25_ee_write()
Date: Fri, 18 Jan 2019 15:05:24 +0100
Message-Id: <20190118140525.29189-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190118140525.29189-1-geert+renesas@glider.be>
References: <20190118140525.29189-1-geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_063854_401992_2383D4E4 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, Nguyen An Hoan <na-hoan@jinso.co.jp>,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-spi@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Since commit 01973a01f9ec34b7 ("eeprom: at25: remove nvmem regmap
dependency") changed the type of "off" from "loff_t" to "unsigned int",
"off" and "offset" are now the same type, and can be merged into a
single variable.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Merge "off" and "offset" into a single variable instead of just
    killing the cast, as suggested by Arnd.
---
 drivers/misc/eeprom/at25.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
index 99de6939cd5ac2e3..2d8e5388e574710d 100644
--- a/drivers/misc/eeprom/at25.c
+++ b/drivers/misc/eeprom/at25.c
@@ -130,7 +130,8 @@ static int at25_ee_read(void *priv, unsigned int offset,
 	return status;
 }
 
-static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
+static int at25_ee_write(void *priv, unsigned int offset, void *val,
+			 size_t count)
 {
 	struct at25_data *at25 = priv;
 	const char *buf = val;
@@ -138,10 +139,10 @@ static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
 	unsigned		buf_size;
 	u8			*bounce;
 
-	if (unlikely(off >= at25->chip.byte_len))
+	if (unlikely(offset >= at25->chip.byte_len))
 		return -EFBIG;
-	if ((off + count) > at25->chip.byte_len)
-		count = at25->chip.byte_len - off;
+	if ((offset + count) > at25->chip.byte_len)
+		count = at25->chip.byte_len - offset;
 	if (unlikely(!count))
 		return -EINVAL;
 
@@ -160,7 +161,6 @@ static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
 	do {
 		unsigned long	timeout, retries;
 		unsigned	segment;
-		unsigned	offset = (unsigned) off;
 		u8		*cp = bounce;
 		int		sr;
 		u8		instr;
@@ -234,7 +234,7 @@ static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
 			break;
 		}
 
-		off += segment;
+		offset += segment;
 		buf += segment;
 		count -= segment;
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

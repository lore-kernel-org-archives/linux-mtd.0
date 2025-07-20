Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B25C83F22
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jul 2025 20:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2ZuvlMvEbWO7OWVdSbG9pl6GSu2TrtdddM7MxtXQkX0=; b=CQp1F6ff2XtAEs
	hADyvX7HTdzFTBncL5129LNpDkAf35/ViYzGqN+mgucu1oP3yQBsGSNeqb/J0jeBygovuCCmihpJ1
	REAusMgxHFc8lXptVEALRqbzuovUQQzOrrf//M7/T+IjlPPtrNKMNI9eyosKcnwVGv9kTqL7TxRUC
	hYD4mpto8PV7gB9wt7FXcLSz54OuO5ODEawo5B0/maVquSB2Tv1dNflE2pzxX7HDQDV2Q7Iy9Fsfg
	rVvxjUgtocq3qSuzGJb9YcsXC3AMxIrxcUHu5f6gp2rq2Myh6PKdmDUPyla1AyrmbSoPKE/fkYHqn
	xLK7KkLastc+Q/+ZUVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udaDG-0000000Fgr9-1jYp;
	Sun, 20 Jul 2025 20:00:46 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uda9Q-0000000FgSa-0Lh5
	for linux-mtd@lists.infradead.org;
	Sun, 20 Jul 2025 19:56:49 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4blZ6h4g9Cz9tK6;
	Sun, 20 Jul 2025 21:56:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753041404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uGyE9d/XNI2XDNofnNseSp7f9u/AgFNDjaO+1oT6Aps=;
	b=Y/WJKk4IELJeIUbeBZ2ccObyM9qNZFDWzHxgHNAUxmXjh2SBQD8HZEsQp5wcBW4XDqCbYO
	DsqjGYAS37pJ7MViClgMzG/SWyZelGfZazmkVqKrD8M06vjC/C2NPfjnHxydIoCTh0prme
	fhdbDBMQa4Dt5oWNEP03udW29iBVISYmKiFp5sw54JWeG1kQ82cCVBrjC18jjtoBXJWS0D
	xLvucGRhVo93BiKIYiEDilCf6sovBTcCTP15G0zh7T1tjH0JwCLLIC4gdZNeyJztIW1U5+
	UaXxVOqPYbKTTNlCH043Vk6R1ys+lwQqODnV9rrlNxple0WSv8t8l5JF7KuHJQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=J0VCTLTo;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753041402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uGyE9d/XNI2XDNofnNseSp7f9u/AgFNDjaO+1oT6Aps=;
	b=J0VCTLToANOQ/5IWnFbV9PaJPySPMy5ANbH0GDIJtL993IPv9FxZkoMsOmXRlg32D0YrL5
	OHjaHLWRA05Xc4Yfwf2AyzM5MRlhC9+U8VTA8Biro0ZXh4E30+dQA7IEx4tickTzjRP5Rc
	kTMdAduwG2Z/gcEx1wzxTvD2P6ODGK0392uAN35WX3d6STkAkdDbjAFsPzxBjmm/UkQ3xN
	lvty5FFRMOH4MBpkFzQ0bAQFaRGi3sM2PXrVHwejuzhABh0DjbDh8Jzf/Axfkv+kZEwLIm
	JT7sGar8NzJJ4cwRRaujeIhSbdy2bGC0bLy6t6Fp625JqGzxOmHESLH8JNR7EQ==
To: linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: winbond: Add support for W77Q51NW
Date: Sun, 20 Jul 2025 21:55:52 +0200
Message-ID: <20250720195625.413715-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: ue7ubufmhhkpb9wob9yomuc6gty1oxhf
X-MBO-RS-ID: 8f9629195e8d8e87a2c
X-Rspamd-Queue-Id: 4blZ6h4g9Cz9tK6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_125648_270154_CC536DFF 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

Add IDs for Winbond W77Q51NW, 512M-bit Secure Serial Flash Memory
with Post-Quantum Cryptography, Dual/Quad SPI, QPI and DTR . The
flash part is similar to W25Q512NWM .

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Michael Walle <mwalle@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/spi-nor/winbond.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 63a93c9eb917..dcb6c9ec862a 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -343,6 +343,10 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x20),
 		.name = "w25q512nwm",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
+	}, {
+		.id = SNOR_ID(0xef, 0x8a, 0x1a),
+		.name = "w77q51nw",
+		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	},
 };
 
-- 
2.47.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

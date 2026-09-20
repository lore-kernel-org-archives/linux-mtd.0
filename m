Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF52C982DA
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 14:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mmyh466H+ZwPczm0XpX+VzdRrlhNY9IscZLb+j/3ur8=; b=hFh2rkyeg9695A
	/LoK5npeIzkAAA2HRDSXASAO/464IFJHR2ezrkY7TviU2R2FrVcbK/cNrv8GQkGkvbFWFHCMuJcji
	3P00pCJlJfNZWxWxLumBL+F5S7ThudPSAljAZWL66MQ/QmQyT3sGTjK+QqnOdRerPJdDMZ+JdXzIT
	0eVyRzxuP9AaYwlWY8tHozD7RfnKLlnLJroiVqecKkPfmvACFKtZvyuahhIQz1k6TLxveCmAmgi6e
	W1BQNrE95VokCOn7NlNwYIjZwztYgFmWkM59y2hBQTUwm9bD01MpeZwxGxKCNZ7wf3HyQPj0QejHv
	vyq5qiGJpNbe6mB93MkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I5n-0000000HXAx-1yTj;
	Sun, 20 Sep 2026 14:00:31 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I5l-0000000HXA0-1YNe
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 14:00:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 65615C5CD44;
	Sun, 20 Sep 2026 14:01:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF29B6033F;
	Sun, 20 Sep 2026 14:00:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6EFC1032906F;
	Sun, 20 Sep 2026 16:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789912826; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=doyiamMhxH6XuJwCWnexHapFGv5TIbpIYj6Vqv3mNhA=;
	b=BWb6cwpBibrK+x9ayOHS5OCwJj7vMdSfLckZuSfWP9OoNCPF3cK1esqBRwAVc1kGf5Q1RX
	r3GpCATsTdlXWqEPhAs3SOhM6dgj9xYHPdFwTWDm8NzCafnR4SEHdbeqAgpUbgtLkoqTNn
	4FBs2CE/ZqI6tEL+qviFvF+q+ENu+N6Rgbe7voW3wH0f4A5AbFlxWuoWagP2PV7swiLSoT
	fP4FBbZHVi+I9CBARrjYjz16zaIeSE0bl7V43ID4wwbGMVrW1aiMLD0crMZm4nIKgx3G8l
	amX2SM+yQ0mdESNIzuSTUkyCH6amfam2G6tMzW84lCd7SF7MPJM5dBjkYjlgtw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 20 Sep 2026 16:00:11 +0200
Subject: [PATCH v2 02/25] mtd: spi-nor: winbond: W25Q64xW-Q/N: Enhance
 identification of the chips
MIME-Version: 1.0
Message-Id: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-2-ab9c9688d071@bootlin.com>
References: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
In-Reply-To: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_070029_580035_76D2A8A8 
X-CRM114-Status: UNSURE (   8.26  )
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

The EF 60 17 ID has been reused for:
- DW-P/G (no SFDP support, but CMP and quad capable)
- FW-G/Q (SFDP, CMP and quad capable)
- JW-Q/N (SFDP, CMP and quad capable)
Add a comment to flag these chips.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 55c55e41ec92..5ce29987a13c 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -330,6 +330,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
+		/* W25Q64DW-P/G, W25Q64FW-G/Q, W25Q64JW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x17),
 		.name = "w25q64dw",
 		.size = SZ_8M,

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

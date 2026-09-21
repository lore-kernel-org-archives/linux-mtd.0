Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC05C982E1
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 06:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRETPwwFh4JJyb3/T/riRJmGyfxvtZjP5KhTHuq5zMQ=; b=AJ7OtpoanrLpQu
	Q6w00hhMpr+XNINkJgMJDVQ9vCYVZ8w8yooLkdKMZkbXSGgAB0GzHZL/c+4IpMO54vCy/xdKaLtpF
	iQ4/UdlpyQOodxr8p84KES6JrF2wpddhQeZX4Ao4D4tF7phyc1CLSkro57ZtvDvG5oW1gokDHyKy6
	kAH3mEGe03n2Hu8rgxsG0ZUhuhyRvjSlZLp+/DJeCds2egYzt5aqM2ZM5fRiSCe6beynxjP2fuQ7A
	iT8Bnd8Q6Zv6XqrUofJeQr6uD2uqI76cWMeJtGUo7jfIoAJ1+j8gKwt54UJbkAPkEGnm/O16KZi5R
	0/S1LmR2byc5KDcTMq9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xkl-000000014rJ-3CHT;
	Mon, 21 Sep 2026 06:43:51 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xke-000000014nx-3nD1
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 06:43:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 71D914E40C5B;
	Mon, 21 Sep 2026 06:43:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4699460339;
	Mon, 21 Sep 2026 06:43:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6740103290D6;
	Mon, 21 Sep 2026 08:43:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973022; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mjZ2oI9B5HuAg88bgTdzdDSyjtF4SvsFSGrtzd8HZrc=;
	b=Uf4Y4PwQRq3R0MiZr2UiteaFxaKG48ejBcJOyOFoJjN7xUAWQjLmfO9IAZI3GJVWj9PW69
	cvw+yTHUOp8VWOuQIgxrAfY3uDP91TKNq4s1sSt9jf5GKOQYLLMXu0WFW9wbgoIhB5cyj1
	H1hS/tH+GBkTJbMvW7n2Op7Aa/PaidEpr85azjW0w+4FFylEOAnv30ftSlov4ae5J5m5Nl
	wEMxRp5jGiNL0iSpeKh4OVbasmuLFVxkL2wYuMLMztbsoLdumGOZTVVHLwgwFMwIizfI5f
	qr0meWgRt8maX5ZL6Ann4sd0DUo4AGyMAb3eKFDMywNQBhodsbvh9Z19SV7B5w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 21 Sep 2026 08:43:33 +0200
Subject: [PATCH v3 02/25] mtd: spi-nor: winbond: W25Q64xW-Q/N: Enhance
 identification of the chips
MIME-Version: 1.0
Message-Id: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-2-38eef3b6a7db@bootlin.com>
References: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
In-Reply-To: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_234345_085581_189B79E4 
X-CRM114-Status: UNSURE (   8.55  )
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
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE17606A31C
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 02:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LtRL8oDs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=cwRVYLSa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Gqyh59q0D6pUbWebUl2Wl8b0avt8Dan6u/eEk7HqTi8=; b=LtRL8oDszI6m/Epy3/MKTrXZTM
	TAceG9aG7WESmRSksCHTmW0zHD5saWpoTWB2BnRAUyGGF4gu1Ym6jX8MFs3tLoCD1XREL8Q+4Ct05
	vHUSfVYe7TP4UiQiysNGSdXsWY8F/h1KMiqjI7oB6s7hGoKbyqeL7ISZO66pjTvVTfakLbtCobHsu
	vTnGaGIsbaYh007w9naEeNBCfu39mgZthGJbNQ0K2SV2X+niVFKLcoEJykx7cVT7CP8weUvZaqrX8
	g+RhKmLmaBrUd28EDHKtS47Cq0yyVeb2iNu3Af9d2JRbRJIhcy228UmCdOp/W7pzHrIYoPIkjlc0G
	Wgeulilg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPsW4-0000000FbVd-0sqx;
	Sun, 08 Nov 2026 02:20:20 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPsW2-0000000FbVI-0N4t
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 02:20:19 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-1b2513decc3so98400c88.1
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 18:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1794104417; x=1794709217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qOV57dKgZ6M1Pug8TSXqnl7cmjzsOLs4V2weSI1QSbo=;
        b=cwRVYLSaPQ/FUzgjrdgUFpJaI661rga25M1nF2WWOMPrcQSO+GmqNGrwDY1gCq8TFg
         wWdSdmHsnJeCZ6/TYizOM4TUxyIWAY2SaLCe2hMB+OjhZNQDv9zKv6t9KK6QXlBCbJgj
         8r1WkbT4kbWJ1lS7mqwHUn6EnwRIJme8L4sxlZ2qzqpJgjhhHPwvWtjELYDHQDGjynhj
         POsCYy2qFw6pjnl2qb18WsfQC4VbJ2APtrVIQ3/lkOHTFUA/H8q9xCD19NmDD0XJCMtD
         IM5iU9it8/odvhmdSw86J2ej+SKyp7tLzAp7bt7zBV0UQgqPaMV/OA6JnVaJV9iz+CG/
         NhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794104417; x=1794709217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOV57dKgZ6M1Pug8TSXqnl7cmjzsOLs4V2weSI1QSbo=;
        b=NItwmsHQTbhj6fAzPjdoznfb9XK20O4zL+8SoDikqQm2iYTQzwv4y642upyYM2gqbX
         7jZy5x5MJSybIgBvqvc5Mx2HSwU93eSXcgQzdKjg9k7dK51egc8+oZ3B176EpeP3AeDP
         bGJKKVqB9xDOy4mBWn5kxN2T0XffwnX+Z+/8TVlr+Q8IJwWeveVzl2bPf/0qTEbapJYR
         7RFspk23+yqQb814uvmC96pyLqFzZYVt6hRRYF7OpFeFlPmpKXBP/Wt38C9t18092W8X
         H0GX3Xw+5jLVAKu/g/w7ViiHxPhB5nqUtbiHius6/NtXfOApmEn+Q7pUfu3OyJT0yacs
         KAIQ==
X-Gm-Message-State: APuU4Z8FiYk/v0gsLHFYGIc4KIaRCnl/1Cxr5G12eRCFVCi6Gjp1l6qx
	OQbqRVJ4bdKyykz7FDZbxw2077YbPOMurCtGkNw4e26MfynFPkvpJ29WfnQq/3Q/KA==
X-Gm-Gg: AYBFou2h2mqTi5my4wko46GczP6Dy6sNjSez81MWPytI0eLTr00vymHHN1Ql5fgZBce
	gN5qHF7et8cRq5SsynnplfwfBG0FK4PUIEZRnVUlFLtsyMSRYGZEqj7fgoy4aXoG/mXo+GFyZ/6
	1v7h8CeDlTkSvPKbKqzZXBIL/0YEjTFlO41O+lVOWyUWraWd1IKT4PvKJjekbI7YDK8Dp4t8xA0
	8l3tYfBIGRx0dqfAbNG4v6FqX38NAZuTAZSya0mtYIN0HkgSYsXJ+SCU64iDdhu+tS3EyVCaMWw
	vSoHHLwwa/mr+doz8TogmTc4s+2iOhI2nymRL36+oHHJBQuKZFeHzIGNv/RheHR4Y9jBAniEdix
	KTqtfwsV+66F0pcseKoa1C8vtAshJz2bJTgb1CUR7qcYhFD47evmUXRZstNjKpveME/cLyzA3+H
	H64e2JedNFakmrB9pApZJ461O8AMOOFeibDyihlPLm14+IWjfkVEPWZUFyzO4v9nmKylFDN58/b
	FYd0WaAraJpHewt+Zv7EFZCV2r7YDtawO37gHUEFG2Wm9IscX59vH/57VEyZxNSLBeLgQdodyCi
	R0jI5Odk+tqs/X+0OSI4QKGWiKgc6sCCLtAZOU7jiQtRayuT9eigUG2jLUT7v7HV
X-Received: by 2002:a05:7022:2606:b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1b39fe301edmr686258c88.2.1794104416954;
        Sat, 07 Nov 2026 18:20:16 -0800 (PST)
Received: from mparker-home-xcrbr.sjc.aristanetworks.com ([74.123.28.17])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm2585693c88.6.2026.11.07.18.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 18:20:16 -0800 (PST)
From: Matthew Parker <mparker@arista.com>
To: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Matthew Parker <mparker@arista.com>,
	Adam Calabrigo <adamc@arista.com>
Subject: [PATCH] mtd: spi-nor: gigadevice: Add support for GigaDevice GD25B512
Date: Sun,  8 Nov 2026 02:20:11 +0000
Message-ID: <20261108022011.898185-1-mparker@arista.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_182018_145465_9BF25B4D 
X-CRM114-Status: GOOD (  10.28  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for the GigaDevice GD25B512 512Mbit (64 MiB) SPI NOR flash.

The chip exposes valid JESD216B SFDP tables including 4-byte address
instruction tables, from which geometry and opcodes are discovered.
Stateless 4-byte opcodes and status register locking are enabled. Read,
write, and erase functionality across the full memory array have been
tested on hardware.

Cc: stable@vger.kernel.org # v6.1+
Co-developed-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Matthew Parker <mparker@arista.com>
---
 drivers/mtd/spi-nor/gigadevice.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 6a2e6ebda148..de96cefde516 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -64,6 +64,10 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.id = SNOR_ID(0xc8, 0x40, 0x19),
 		.name = "gd25q256",
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
+	}, {
+		.id = SNOR_ID(0xc8, 0x47, 0x1a),
+		.flags = SPI_NOR_HAS_LOCK,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
 		.id = SNOR_ID(0xc8, 0x60, 0x16),
 		.name = "gd25lq32",
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

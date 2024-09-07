Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19BECD4846
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Sep 2024 06:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yVOOksArm9Dg40PgFH6aHNB947UMysIsJtxv5Cb4RsM=; b=Bg8HFhQx3rWtly
	Ngq5LAmyuqBCWOvVB89Y5egeW943ksIwUJFzkJ3aGZQReMw69Pep/evSFo/BADYOy11mt2Q/x0w9P
	+ymU6YrQhsH4LWZ65LYmdfTWhjNavAeaBFFINHl7c6OljTmsoUJ9Scxg4pwOWhfq56EsZMsFqEfCo
	jIOSmFfUNixftn7cUvnQz/LKa9Bho/VW1HYDv73h9dC2fC6690HLEUeV1pMOMgF15nV2mGohuU4m7
	Hcs86OxLLBf3NBgHB5Kw4Y4R88CTMNoduo8kmcbXIDErNQkfuwwXtGO3TZ6T9WXjKHMmwL+h+fyvM
	96k//9jlYnOzQmibinRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smp0D-0000000EULB-0JLh;
	Sat, 07 Sep 2024 06:32:57 +0000
Received: from out203-205-221-231.mail.qq.com ([203.205.221.231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smp09-0000000EUKB-3MQB
	for linux-mtd@lists.infradead.org;
	Sat, 07 Sep 2024 06:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1725690768;
	bh=2+NoZb8HY05rj6hzt63kWk/NKYFBBygQXfpEjmIYg0w=;
	h=From:To:Cc:Subject:Date;
	b=ARRTLGeMh8u5Lt7oIwvXMvsAWjmho0FbUFGhjjBgTOia3nAxPxeb2M0fdj+PNopV+
	 2IheBGCWJZseui8HYBsDRu8YmekZD9TNH8JR2tycjEvgaxHw0DoRMw62tK2TtEC73B
	 SaJnSUv3kj/y5DI5pThpk3b+T+geu5KYuKBvjJVQ=
Received: from localhost.localdomain ([171.223.88.74])
	by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
	id 8199523B; Sat, 07 Sep 2024 14:32:25 +0800
X-QQ-mid: xmsmtpt1725690745tmnhxwdgq
Message-ID: <tencent_983A0FB4662661C03E98E1AC214E32179F0A@qq.com>
X-QQ-XMAILINFO: NIg715EJm9p9pWMynSbLFDeumTZtNfn1AbnDHe650i/GQdybJA9qRMxnB7C8xG
	 Hj0IEwS1aQUYxTzu47jVPkM4v0cGJeIZRqRse/SAAdJAGTbjU0eb8xn8su/QOYK8JNtbCKABvHZA
	 NduilOU9j1aRNouLZIjW5wL3F5h7yMLK6q03oYwBiqQVIcfTivlQLxyu9EVQ+COWyfTEYQYiKVMO
	 aSlBN0gbVyBaDfhxw342dU+kvRSmQhxXthrip2NobVYFoiq8tRw6HndX3REWcL+QNJd8bdEAAZVh
	 hskdBiv1EaXhHPpbidu4XGO+aW1FyAKrK/ekR1Kffi+C9HTKZzbqakKfXoPzLULI7UurUldFWWz3
	 tPu7I+5MBf1ZHCusuUglCF8c5vYYBJf2cqRIkDh993rKrbTnfn/w6HPbggh2ORQk/SbHVW0ahW1v
	 NnYBkK9l/AF0oJTAz/6aTxRojYoIjo4D/wyeJkQdgm6lBQY/4SqIT9YNSKUIDDmlImsAc8z/zfyT
	 K1zQd1GAt4XnFxZhZoDrsz81+WWKfpAvtYMZEINDNNwP+dpwysSl3h5TgP4kMUR0pEo08BdYwC1p
	 VsyUzMZClwXvAyeCWVTuF0Wf08IBSCa9DFscB3++UkvRsGS4PeQcGgsUd981XzToG9j8dxEr9yXa
	 mpQyxfWvwKZWZckPhHDXIzsTyR20yzQ/c74vgQZ/VneB8OIoNAkbYxgV0C1qh79B+GHBkXslEvz7
	 jeMVVaoQb8p/8Fp50vV4iAR6FBt20lFNefwQlU4y7jwgbFOtHUJH3Pk/4mM3kQYfcStGzJagYKG7
	 seugme97Wtyp/ebBjdKEIKYL5/3NafQYP5Co9c9s1eqN6M6BdAL20K6OeWkSGkSY2El0RzyUXBKB
	 l7jSfDFnWQVGawr3jGIGVie1MlKSVFpG6lSLg8wm+TC0539YejKnEZ5qnIaNuJqNRZ+9Ys2CXh+n
	 iKsdMJxMbDukygwDKU9cJEAl8HI4uXuHHhw1X29s068j7DKYNLhNqYJ0gniPCT/y6lV4BuZuf4Zo
	 9JZgppeehi3728PGX4M+n2fp9ebgkPsivIVKcFZiCvQEO4HE4RzgkmxQmG79Q=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Renjun Wang <renjunw0@foxmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Renjun Wang <renjunw0@foxmail.com>
Subject: [PATCH] mtd: spi-nor: Add support for gd25 and gd55 series chips.
Date: Sat,  7 Sep 2024 14:32:13 +0800
X-OQ-MSGID: <20240907063213.387211-1-renjunw0@foxmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_233254_163224_710DB479 
X-CRM114-Status: UNSURE (   8.46  )
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

Add support for gd25lq255, gd25lb256, gd25lb512m, gd25b512m, gd55b01ge
and gd55lb01ge. All these chips are tested on Rockchip boards[1].

[1]https://github.com/rockchip-linux/kernel/blob/develop-5.10/drivers/mtd/spi-nor/gigadevice.c

Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
---
 drivers/mtd/spi-nor/gigadevice.c | 43 ++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index ef1edd0add70..f0069a4adbbf 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -61,6 +61,7 @@ static const struct flash_info gigadevice_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0xc8, 0x40, 0x19),
 		.name = "gd25q256",
+		.size = SZ_32M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
 		.fixups = &gd25q256_fixups,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
@@ -82,6 +83,48 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x19),
+		.name = "gd25lq255",
+		.size = SZ_32M,
+		.flags = SPI_NOR_HAS_LOCK,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0xc8, 0x67, 0x19),
+		.name = "gd25lb256",
+		.size = SZ_32M,
+		.flags = SPI_NOR_HAS_LOCK,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0xc8, 0x67, 0x1a),
+		.name = "gd25lb512m",
+		.size = SZ_64M,
+		.flags = SPI_NOR_HAS_LOCK,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0xc8, 0x47, 0x1a),
+		.name = "gd25b512m",
+		.size = SZ_64M,
+		.flags = SPI_NOR_HAS_LOCK,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0xc8, 0x47, 0x1b),
+		.name = "gd55b01ge",
+		.size = SZ_128M,
+		.flags = SPI_NOR_HAS_LOCK,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0xc8, 0x67, 0x1b),
+		.name = "gd55lb01ge",
+		.size = SZ_128M,
+		.flags = SPI_NOR_HAS_LOCK,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
 	},
 };
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

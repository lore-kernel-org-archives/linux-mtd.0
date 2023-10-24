Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC447C00A8F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 13:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mQgMwiCVg9hYFwfT39rxexbpTXhRPhcp/tuflWiuG/Y=; b=0I70l9LM4tEWj9
	0+0ReEIepTjse2IF4MWgXYmSb0LphaWzmIpwXHq0fZgx/Zj6LEzQd+2TEoNg9ueoHqfJLP08mt1VP
	zm/blPvQJo5iwczif/hx7zs272oSYNtyqHc9qdniW0O0+FmWkbxNc0N9K7m8erdyG6ZJJnhGGGyhK
	NnfuSBKOVy+drzOCwnOfY2UtndvPxyLESOYaF5Un6zA2tNSf95archSKehGHno0tBIidzxh7gR6U8
	Z0ko9/XxrvTSMmnRlhbA6/z9aRjMmHn8NyR6cS1IQAESrs6TCEpZ5tj3z+wjQ+jRc6j9HHkhgWRt1
	dJB5SgPYq7zyTvi7K2YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHvi-00A3Ws-19;
	Tue, 24 Oct 2023 13:58:46 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHve-00A3VN-2t
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 13:58:45 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6bcdfcde944so1074903b3a.1
        for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2023 06:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698155921; x=1698760721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K5dsx7BQZN18RlvTf4X3QrSDwPEBhSHCc1U95Z0Gous=;
        b=dM8JfccqkrePOuRHMn14NPNPByzqaTfIRMA9zGzAuHvjoWG6iSrXC/QWO98IgsNhzx
         ng74OrFQ9B3gqhBz79lrFyyJWLoI34FsZuAa7WaYywSeQtBneW8+zxJXHyaIIvZlLziv
         /Op8Luh2Xfw+LuKit5TVTt6b+MGENhMQ7Krw6omwAD/AsGLRTPobqc52ANbNXK99bIEZ
         VdvXQdoi9u5Kdxcj5SarpW+1oHG1dxI9U0Qez7bLDJfEiHRw2Vu0cUOJpQZ9wAmWVkT5
         8b6gdNbrYY4kV6B5JIYpq0HiOQ1899+ogo1yUwAI1O6MRvzsc1NM5mFNqKdrVQDAaS7/
         Z1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698155921; x=1698760721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5dsx7BQZN18RlvTf4X3QrSDwPEBhSHCc1U95Z0Gous=;
        b=Wq3N6b6TgEwl+uv8ZMRhevdbcTQE42gE1hDIL5sMk1BfCHQHofT+jzdrRIfKBqW0DL
         2tf4wZgygOEObl3iwLqJAL3+TV1FIWLP91se5eFyxgLI4y8lkG1/deFlmypCqW0tHG8B
         kR8lS5pIkKi0A9VHTq58af1adGnAJspxBIbLTMKhpJDeoz6OGfUJEdcsaYhN7D7TiJhZ
         eguRS+q05SmVQcErgnghUDHHppn5L2ob3jdiAqvCUo+x/R2onPfrRMn68H/vNEx5DYbw
         InbToumzzjNSuWmQRo3EX8TSzqF1rbi6/Fdv7MvxpOnC2NBTsPKbAFCKot2ik2pbEjWK
         zQvQ==
X-Gm-Message-State: AOJu0YyKf36P5eGBQhiszQ7E9fDoCArSK/ea3bNerYWG1E9I6BvA6qM9
	R0dKibHhHjxVxBPiFUwRVhI=
X-Google-Smtp-Source: AGHT+IHL4SAtbZdxCl4HtbIiGqczk0FpJuem/kXlcpf6SsOLjQ+HM/ISjFH80ObWjuCAuytygMkajw==
X-Received: by 2002:a05:6a21:33a4:b0:163:c167:964a with SMTP id yy36-20020a056a2133a400b00163c167964amr15777806pzb.1.1698155921401;
        Tue, 24 Oct 2023 06:58:41 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:ff6c:45f7:d802:5f5c])
        by smtp.gmail.com with ESMTPSA id fa36-20020a056a002d2400b00690d1269691sm7673686pfb.22.2023.10.24.06.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 06:58:40 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: michael@walle.cc
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	tkuw584924@gmail.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] mtd: spi-nor: micron-st: Add support for mt25qu01g
Date: Tue, 24 Oct 2023 10:58:26 -0300
Message-Id: <20231024135826.2729088-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_065842_934457_0D8BE453 
X-CRM114-Status: GOOD (  10.55  )
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

From: Fabio Estevam <festevam@denx.de>

Add support for the MT25QU01G 128MB Micron Serial NOR Flash Memory
model.

Datasheet:
https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_01g_bbb_0.pdf

Tested on a i.MX8MP based board:

 # dmesg | grep spi-nor
spi-nor spi0.0: mt25qu01g (131072 Kbytes)

 # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 08000000 00001000 "30bb0000.spi"

~# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/jedec_id
20bb21104400

~# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/manufacturer
st

~# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/partname
mt25qu01g

~# xxd -p  /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
53464450060101ff00060110300000ff84000102800000ffffffffffffff
ffffffffffffffffffffffffffffffffffffe520fbffffffff3f29eb276b
273b27bbffffffffffff27bbffff29eb0c2010d80f520000244a99008b8e
03e1ac0127387a757a75fbbdd55c4a0f82ff81bd3d36ffffffffffffffff
ffffffffffffffffffe7ffff21dcffff

~# md5sum  /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
9d28d1b11de8b15ba9152644219d9a78 /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Removed .size field. (Michael)
- Removed .no_sfdp_flags field (Michael)
- Shared sfdp dump. (Michael)
- Still kept NO_CHIP_ERASE, otherwise flash_erase returns immediately
and don't erase the flash.

 drivers/mtd/spi-nor/micron-st.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 8920547c12bf..8d4d3f6f9390 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -429,6 +429,11 @@ static const struct flash_info st_nor_parts[] = {
 			 SPI_NOR_BP3_SR_BIT6,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x21, 0x10, 0x44, 0x00),
+		.name = "mt25qu01g",
+		.flags = NO_CHIP_ERASE,
+		.mfr_flags = USE_FSR,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x21),
 		.name = "n25q00a",
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

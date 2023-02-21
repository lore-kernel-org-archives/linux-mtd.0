Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A142C6379F
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Feb 2023 11:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GGrZzXhxvOhF5jvnm+UvlMvxyN48vS/odhBZiaAvyzw=; b=i+1/gumwaFIc4+
	b7g+is0A1UzagdjWpNg+avyqIQc9vEPt2f64xbWWqiCPwyjfjb+LHxXeilSWYxy2wdv89b1TQS/S+
	i+KqAxsVEu+8WMGGZoA4rYPllUhQoUjRp+gXw6kNnPY/mEVYLKRzfWDLrnWdU2nARobVHfPHiH+5G
	BPOGr4vvyAjyKpA9i7eoQqplI/3pF/8NLb+FeLEglQGqK0K+hZTiSM1JjfNHj4opPu2jdvVL71wDp
	GlmWqSBaWVKHOSrphZUQkPcy+6pL6sjemAw7NIv+Bgd05KM4HXqo3I8qOvAeixYA7boYh5wJpOnoh
	VBh46bkwzsRw7j88rwKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQay-007XA8-KV; Tue, 21 Feb 2023 11:14:04 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQau-007X8j-DV
	for linux-mtd@lists.infradead.org; Tue, 21 Feb 2023 11:14:02 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 012BB3F583
	for <linux-mtd@lists.infradead.org>; Tue, 21 Feb 2023 11:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676978034;
	bh=ro4x+56p6k4eFwybCxILtCF2vhcwpYTnKWiQ2Fw4Iq4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=QnwpGe9xRsZhbTFijauqOnXr8lefQT/X6BdUd9ANKN84M7HyMOF2bX8lx7W5HA/p6
	 jENkP4kEHsDHzbVhHvdP27U+DuC3+H19rPRT/ir8gzfNMwVaHV5nTlJRMDTou9JNF9
	 1Dm0/1IFIFI2V2kmVMTPvYJzLrl46Et71t0B4DCgkvyDB2IO7vD27rVdxmoLkwyZyx
	 mI4fBCFeTFc15rzY9wVQWMC+yjoPblDuiVFpavEHIwY8pujWHEIOvmDOHSzNb4xdKK
	 X8Sw7jrGOzAcYUFvBhEP+rPZnqTxV+V5hCXqVPpkJLZ3X1HYPb8EHcUDuz6JLq19Zo
	 Xoj7yOTE5PsSA==
Received: by mail-ed1-f70.google.com with SMTP id er17-20020a056402449100b004ad793116d5so3889789edb.23
        for <linux-mtd@lists.infradead.org>; Tue, 21 Feb 2023 03:13:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ro4x+56p6k4eFwybCxILtCF2vhcwpYTnKWiQ2Fw4Iq4=;
        b=exhWuTgMmVtcxBRQ/a8hw4IkVQQz2szAdkH1Vi4OaG8O2EfhaIuBZtyUTe4yGkN7Qg
         +nTb6rQeDPBS+LKbXYDpBymOQABrOrekjMosxxj+4TPROd9bV1VXUSEt6vUvF7aeZj2Z
         UR5i1EUTk6W+nsTa+6doa6Qw40b3X48YDHmMaW9oAlVaiFu/nbWvV6n+/TPtaph4bd4p
         /ca4egPbbCqxgkmmqlHbC1FvwH2HJf5Q9RJz9o3WQeqi7/qNyOzVBHOnutYHhBHVs15N
         pVFv6UnldQ+jWXMv4s/OF5ef7utVVoXLTUXY0E6eyUbJR3z8v96mVWcuTenNLUBH84OV
         qo/A==
X-Gm-Message-State: AO0yUKWxoPu6SiqjI6OY97IkxgxA/1nUc1C3nMn0fZZ28CRNraaCUn7z
	Xgiu7w2BSIwQSdstGml8iK6g21n1RVGk4ICyWmxurgKKwYgljfsMvCpNNHnGndq5hw+6AK1zW9N
	726DB4A+MjXPtMYydQ1qYGLn7bBdkPOHNqzvcR971qZs=
X-Received: by 2002:a17:907:c297:b0:8aa:6edf:2a9 with SMTP id tk23-20020a170907c29700b008aa6edf02a9mr13089945ejc.69.1676978033507;
        Tue, 21 Feb 2023 03:13:53 -0800 (PST)
X-Google-Smtp-Source: AK7set9qGtS26yt0C3R8UVON9AwCXrJoOkhG6nyRf+nsk0tAcFExR5s6BvJMjzCmiEfCTQYQ1KHnCg==
X-Received: by 2002:a17:907:c297:b0:8aa:6edf:2a9 with SMTP id tk23-20020a170907c29700b008aa6edf02a9mr13089925ejc.69.1676978033219;
        Tue, 21 Feb 2023 03:13:53 -0800 (PST)
Received: from localhost.localdomain (host-79-44-179-55.retail.telecomitalia.it. [79.44.179.55])
        by smtp.gmail.com with ESMTPSA id t14-20020a1709066bce00b008cff300cf47sm2804832ejs.72.2023.02.21.03.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 03:13:52 -0800 (PST)
From: Andrea Righi <andrea.righi@canonical.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Cristian Birsan <cristian.birsan@microchip.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: fix shift-out-of-bounds in spi_nor_set_erase_type()
Date: Tue, 21 Feb 2023 12:13:46 +0100
Message-Id: <20230221111346.34268-1-andrea.righi@canonical.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_031400_897102_5DCA1666 
X-CRM114-Status: GOOD (  14.32  )
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

It seems that according to JEDEC JESD216B Standard erase size needs to
be a power of 2, but sometimes we set the size to 0 (e.g., in
spi_nor_parse_4bait()) causing UBSAN warnings like the following:

  UBSAN: shift-out-of-bounds in drivers/mtd/spi-nor/core.c:2026:24
  shift exponent 4294967295 is too large for 32-bit type 'int'
  Hardware name: Dell Inc. XPS 13 9300/077Y9N, BIOS 1.11.0 03/22/2022
  Call Trace:
   <TASK>
   show_stack+0x4e/0x61
   dump_stack_lvl+0x4a/0x6f
   dump_stack+0x10/0x18
   ubsan_epilogue+0x9/0x3a
   __ubsan_handle_shift_out_of_bounds.cold+0x61/0xef
   spi_nor_set_erase_type.cold+0x16/0x1e [spi_nor]
   spi_nor_parse_4bait+0x270/0x380 [spi_nor]
   spi_nor_parse_sfdp+0x47f/0x610 [spi_nor]

Fix by checking if size is a power when setting struct
spi_nor_erase_type, otherwise consider size, mask and shift as invalid.

Fixes: 5390a8df769e ("mtd: spi-nor: add support to non-uniform SFDP SPI NOR flash memories")
Reported-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
---
 drivers/mtd/spi-nor/core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d67c926bca8b..3c5b5bf9cbd1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2019,11 +2019,17 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
 void spi_nor_set_erase_type(struct spi_nor_erase_type *erase, u32 size,
 			    u8 opcode)
 {
-	erase->size = size;
 	erase->opcode = opcode;
 	/* JEDEC JESD216B Standard imposes erase sizes to be power of 2. */
-	erase->size_shift = ffs(erase->size) - 1;
-	erase->size_mask = (1 << erase->size_shift) - 1;
+	if (likely(is_power_of_2(size))) {
+		erase->size = size;
+		erase->size_shift = ffs(erase->size) - 1;
+		erase->size_mask = (1 << erase->size_shift) - 1;
+	} else {
+		erase->size = 0u;
+		erase->size_shift = ~0u;
+		erase->size_mask = ~0u;
+	}
 }
 
 /**
-- 
2.38.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8FCC25B08
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Aug 2022 20:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJIRbcX8vGoZGRVHgLiAxU4RksbLRqsPac0GhuendXM=; b=N6+fqDZ2snZj+b
	CLnYnqNQhRpnJFpMjm06snSnyn7sTXT0x5RC3ROohIfTH7fsJ1wm0xSyuUz7/TCeV/AXoRUip1j3K
	g3L598IGeT9ejDGfLX16W84lmc3tQWwZFqd/ur277HFtMwcGvyUQognxwqx61V3/XnIDkilGFN/LK
	43eqRFEADj45dIBmwTNrT+8IyxnOeHbx/Edt76gXsYnrzuelmon/bSP/d+BL5T8jLSBUFYWKHfAqW
	6rREkwrBvfbh51uC+BUAPjP1vaaZ65KTTeSKa14pwM/GHz5b3XNGNod4iAmtMTaInFkJwedsfTqRy
	hIi/0/gmZlBuQD57Dt+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLVd0-006B82-Nl; Tue, 09 Aug 2022 20:15:02 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLVcy-006B5N-14
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2022 20:15:01 +0000
Received: by mail-wr1-x432.google.com with SMTP id z17so15504841wrq.4
        for <linux-mtd@lists.infradead.org>; Tue, 09 Aug 2022 13:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=aYM+SEPG/7AeXfBir1sz3Jj6H6PWY6S17v6O/XAxZQU=;
        b=Yu+I6VTDeglbHhXcc4OhPmlmHty3sSwuan4B8e+IiRLJOz6S55SuTJU9xiqRVUuExg
         78rQt3Ujcw6VBgMb4oDdXIXsbpeWvC42WuAMehz4M+b7oXARsw0q039dfqylRYkzS0rP
         Kg+ejclj8nUkoEcinIiuasxtGVtx4bQV9egkEg5do/+QCQDdGJ3S4GbSYuPflhjHo/xQ
         qp0zBxUHMmfLHncXKLRBAjREiu5aiFK/W0Bpw1I7YL8HCscDu7SSnAUToZQHY8J/d+YZ
         yBbFjoJY9UpcyjzX54xjWAytGZPe8JZkQOwaLzfnxQ4OhDq2dach2rOPqjfh1IJGFvuH
         f/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=aYM+SEPG/7AeXfBir1sz3Jj6H6PWY6S17v6O/XAxZQU=;
        b=DEiJT1weNcI5KYe3HESHFH0zgwmEzcMSH45qTD5kj9aYtfDZFp1MoLvCLjDFyZYgyD
         GkIevND1JlISvy9wg05JpCCkAIBtnLv+xvkVW1sfkUlZ0TtjoDdzXRnzFylkK19pjHYZ
         278oZljoSBHeN7NqahzacZc7YMqbtiG0QNIYfd8oha30ujCHBT19nRztqSogDOjvyjE4
         7KaT8B2lu2llTXsVifJm6OmhaAlVmMFhh7nD2Ptlxj18F4WQZ9OeBfjYUrrAbhWV4oXw
         J3szibxgDep+B2uY3H08+KOIuB19gHapSm6tDSiVqC/LuSJX+TIZQ+up+ysFCX6BBsOb
         2aaw==
X-Gm-Message-State: ACgBeo24cwTnQxW+uLdmwO0XdywmTHn5AncK8W5sVdIUFcEQwPiJrZcX
	cksL/MYRHLp6T+71Es6jkeHC1A==
X-Google-Smtp-Source: AA6agR70SagFhodtAdqWPBrXvzFjM78jJIg4F1hRUfV2yVHrJUrMmqUzPizh7p16F7PoiEiUUcWfMA==
X-Received: by 2002:a5d:5964:0:b0:222:ed7f:4418 with SMTP id e36-20020a5d5964000000b00222ed7f4418mr5640931wri.133.1660076097720;
        Tue, 09 Aug 2022 13:14:57 -0700 (PDT)
Received: from debian.office.codethink.co.uk ([2405:201:8005:8149:e5c9:c0ac:4d82:e94b])
        by smtp.gmail.com with ESMTPSA id q15-20020a7bce8f000000b003a53e6c5425sm24041wmj.8.2022.08.09.13.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 13:14:57 -0700 (PDT)
From: Sudip Mukherjee <sudip.mukherjee@sifive.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: greentime.hu@sifive.com,
	jude.onyenegecha@sifive.com,
	william.salmon@sifive.com,
	adnan.chowdhury@sifive.com,
	ben.dooks@sifive.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudip Mukherjee <sudip.mukherjee@sifive.com>
Subject: [PATCH v2 2/3] mtd: spi-nor: add SFDP fixups for Quad Page Program
Date: Tue,  9 Aug 2022 21:14:27 +0100
Message-Id: <20220809201428.118523-3-sudip.mukherjee@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220809201428.118523-1-sudip.mukherjee@sifive.com>
References: <20220809201428.118523-1-sudip.mukherjee@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_131500_131041_EF28473E 
X-CRM114-Status: GOOD (  12.41  )
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

SFDP table of some flash chips do not advertise support of Quad Input
Page Program even though it has support. Use fixup flags and add hardware
cap for these chips.

Signed-off-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
---
 drivers/mtd/spi-nor/core.c | 9 +++++++++
 drivers/mtd/spi-nor/core.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f2c64006f8d7..7542404332a5 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1962,6 +1962,12 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
 	if (nor->flags & SNOR_F_BROKEN_RESET)
 		*hwcaps &= ~(SNOR_HWCAPS_X_X_X | SNOR_HWCAPS_X_X_X_DTR);
 
+	if (nor->flags & SNOR_F_HAS_QUAD_PP) {
+		*hwcaps |= SNOR_HWCAPS_PP_1_1_4;
+		spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
+					SPINOR_OP_PP_1_1_4, SNOR_PROTO_1_1_4);
+	}
+
 	for (cap = 0; cap < sizeof(*hwcaps) * BITS_PER_BYTE; cap++) {
 		int rdidx, ppidx;
 
@@ -2446,6 +2452,9 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
 
 	if (fixup_flags & SPI_NOR_IO_MODE_EN_VOLATILE)
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
+
+	if (fixup_flags & SPI_NOR_QUAD_PP)
+		nor->flags |= SNOR_F_HAS_QUAD_PP;
 }
 
 /**
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 85b0cf254e97..7dbdf16a67b4 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -130,6 +130,7 @@ enum spi_nor_option_flags {
 	SNOR_F_IO_MODE_EN_VOLATILE = BIT(11),
 	SNOR_F_SOFT_RESET	= BIT(12),
 	SNOR_F_SWP_IS_VOLATILE	= BIT(13),
+	SNOR_F_HAS_QUAD_PP	= BIT(14),
 };
 
 struct spi_nor_read_command {
@@ -520,6 +521,7 @@ struct flash_info {
 	u8 fixup_flags;
 #define SPI_NOR_4B_OPCODES		BIT(0)
 #define SPI_NOR_IO_MODE_EN_VOLATILE	BIT(1)
+#define SPI_NOR_QUAD_PP			BIT(2)
 
 	u8 mfr_flags;
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

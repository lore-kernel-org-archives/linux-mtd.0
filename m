Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D5CEE49AB
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XhWJKqzKjoG7pD1YldKRccOkmaPJDT/wzo3iW6YiyzE=; b=OaRfjuslUt6KHd
	tLbaVwYvOU42PezPJhdZX6n5kOxCdaTW2N+XnwaHU92y8B+lxRvINy8ysgMZeFmXRe/dJSkYrB8e6
	3U1rJbYPX/1cDaeoQD86ipRJ8Fer1D3mV4lEcGfQY5aIwrzkeMNNGEVCaJWIQRC4kdhY9d6vNQY6g
	LbWEURVaYNwDMrNv89Y2tAT1vbP3uQJj6kw//luM1AFZDMgp7+QIe21sRLUG8D3STeh1b1qcNxDh0
	GHDgIYvJinFwUkp70XI2qPP64kUsN2s6CH/zPrs3ya9OxCaG4uxxV3Uv3zs5r0JBSJf9z07Fmvp2r
	HDGeKbp2h/FB7A32uSEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWl-00FI7I-39;
	Tue, 22 Aug 2023 07:10:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWi-00FI3u-0x
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:10:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B3CA364D18;
	Tue, 22 Aug 2023 07:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F37C433CA;
	Tue, 22 Aug 2023 07:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688206;
	bh=1BqJXay47IJkDiLieyHrXUXTDhVgV0Z2mEF/bEZLRbo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MfbuYVyqfTz+LJxpA3Vvlht5s9QxfQq07qdNfo7uh1io30zLA/F8vF2IUFWl+JTBX
	 E6BitISMs6u8vHDOVb2PNMTkiQoSXakdRGY1kjqPdgtmr1PZmy2Lx0UAh/XHPnTmR6
	 GHobdbYGm9u2v8d2d7L/Mpxv0+1oS+n6zNLpylLjHEGrW6vP/ZBjhAa//WbE+Chptj
	 5h9WLfPU7yiLz1dAzGJ9oHJR79OLM6aZ4z1ZsrG85Pb0S75WEX6jEpFuhMIx/f2pX5
	 Bu8Ll+FJBfaB7Y6l2fYSmxzkv9D2ZZaIB9Rl6Wf/UbAxTJZW9ZX693zPBOyX0g2AaM
	 kDAek4EHWz10g==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:31 +0200
Subject: [PATCH v2 15/41] mtd: spi-nor: add SNOR_ID() and SNOR_OTP()
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-15-291a0f39f8d8@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_001008_383450_6A149FA8 
X-CRM114-Status: UNSURE (   9.80  )
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

After all the preparation, it is now time to introduce the new macros to
specify flashes in our database: SNOR_ID() and SNOR_OTP(). An flash_info
entry might now look like:
    {
        .id = SNOR_ID(0xef, 0x60, 0x16),
        .otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
        .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
    }

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index c22f5cf65a58..420e5ca2cfe1 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -559,6 +559,20 @@ struct flash_info {
 	const struct spi_nor_fixups *fixups;
 };
 
+#define SNOR_ID(...)							\
+	(&(const struct spi_nor_id){					\
+		.bytes = (const u8[]){ __VA_ARGS__ },			\
+		.len = sizeof((u8[]){ __VA_ARGS__ }),			\
+	})
+
+#define SNOR_OTP(_len, _n_regions, _base, _offset)			\
+	(&(const struct spi_nor_otp_organization){			\
+		.len = (_len),						\
+		.base = (_base),					\
+		.offset = (_offset),					\
+		.n_regions = (_n_regions),				\
+	})
+
 #define SPI_NOR_ID_2ITEMS(_id) ((_id) >> 8) & 0xff, (_id) & 0xff
 #define SPI_NOR_ID_3ITEMS(_id) ((_id) >> 16) & 0xff, SPI_NOR_ID_2ITEMS(_id)
 

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5C2EE57F0
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=coBQNX2lenl0LwhktuowgimgkvaTpzCKBS/ZyZ07uxI=; b=zGy88pnkEUnoMA
	B1aqwXOKtwFN58n1Ked3r4fLGte0gzR6MfOslOdTJQ16aZTRIjnN4ljVWdu79EHhcTP0Dk8boQzp1
	9ROk/SXm/iFivlnQweVa0+U6TpE/jBvlxWkTa8VKSJtem2gqgWKznTbe0P+/c7tyWaNsulX+uuc8a
	Mmf5rTV71X69i1hRHACzqtdYsvUfPVH7JW16JOfVluOHUBXI+HMe9IBEb4Y6HlBZS4VxKf2SFbXZf
	PYJzDA2HMOOuxaW3U6niB+XuUmUu/FHMw4/GTfxanPW99Qf0xBocc/aiLf0K+UsZSQFwTBOQPjp/L
	11UOaV5Y3ypjsgDBFMnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYY0-00DTBP-0O;
	Fri, 08 Sep 2023 10:17:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXx-00DT7V-1X
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:17:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 04BF0B82037;
	Fri,  8 Sep 2023 10:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E15C433C9;
	Fri,  8 Sep 2023 10:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168220;
	bh=QWKOHqqURgmtO3ZvDYmsY240tss0yR6QDXZ96fNjlXU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=skfPeefwmRhzrds/Mozc7/ifU/aaLyLbOonFKcLqsZf1LtN3Sp5qCY8NKNfWnWTnV
	 2QKhKXPtyRtLpPv/K209EMHIPWNRE0GJeze3RSVgtgKFfUQQLMfEOHSvyqb4oBClPs
	 Cb3Gb+igO7NP4IKAaZ46wW2QfspiFhr2xymoScXwE/AE1HgGW7SX5umsZRs4gMQGV6
	 LkMChMOKWf6h+BV/7+Puj6sSQgitFoCYNIJ4bGvg2CG+VerdyUdX0Oa77/kI8t+xcU
	 bjIaZu5xykVuDWL+bVUbHfGXx/AB+th+ne6Y6q2Vieg2ostCUPOnXgA53TrKZGEfX+
	 QgNsQmtot4/AA==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:33 +0200
Subject: [PATCH v3 15/41] mtd: spi-nor: add SNOR_ID() and SNOR_OTP()
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-15-e60548861b10@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_031705_665166_E4875E22 
X-CRM114-Status: UNSURE (   9.64  )
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
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 6d1870d5484d..14c1aa63bc51 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -561,6 +561,20 @@ struct flash_info {
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

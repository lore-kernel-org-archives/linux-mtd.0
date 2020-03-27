Return-Path: <SRS0=DmJj=5M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44E6C2D0E7
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 09:45:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A081206F2
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 09:45:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h7vyRecs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/B+gJ6a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A081206F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=oPNG4svgUb6W9GOROjUIb+vtz1UaS5okO/4QJyMuN+U=; b=h7v
	yRecsQCYOQPEbpZeJXqh7aDyETfPRWUT+t0x0qEsHNiP8IQ0aXbe7EiCKNo6uchKShufZ2Kym8wzv
	dcB9s7eYm3IDas2own9IjuiZDH7Rn27rVFd+unIDdWOFvcP09VdHUhm8B9jag4xKBHfoJ0qlhpJZc
	hVyQLA3/Bw7byphls6TjtRwgxfG6WhcOqT0Yx3rMjZbidz1HoGHcGZE8ZHJacrEGlxmx7dOlu0MOo
	4td3wFuQw/uuyJQGkvdyTYpqdPHfQNDkvCfOidLs8tH9DcatR/ij6S5vLTSRkUdT1Sq/f7+dvkC1l
	jpd+ZqyY7pICGrnloy4kyst4oTR1zpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHlYY-0002dP-N3; Fri, 27 Mar 2020 09:45:38 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHlYW-0002cW-Nn
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2020 09:45:37 +0000
Received: by mail-pf1-x442.google.com with SMTP id 23so4275845pfj.1
 for <linux-mtd@lists.infradead.org>; Fri, 27 Mar 2020 02:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=uDoX0GtLFEuKQsT9EDAn+TrtjgeL9NlilnUbhhNs0zs=;
 b=b/B+gJ6aXnMgw1y/xCkw8bjlhpck4ZUhC4mW466qkoA4oGNuleTC0MsJGP1rNZCDVc
 g4uK49oJhQ4czYHJioFF4JqixKoUebB8wPO3oP0EnGkGVS7NeEwCBLbIrQcSrk/wl4bV
 4A9n+7BCj63hLca9sDUKEH4wxIuYXKo9+ygG/Wt/fzj46bWhmuLU2n8KMXTnUWz2WvlZ
 z18iM7idandFpbwl3dKvP1y4LbkIuVYd5uolVfY5NbynH5x11h41GyiSnlluRDhZ+J4R
 EbJVfiYraaQoyin2ILlO9VrLLL7U867XTjI3q84UjAYuPUY9V0S3SSom9IcMDmiWJGWo
 E65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uDoX0GtLFEuKQsT9EDAn+TrtjgeL9NlilnUbhhNs0zs=;
 b=R07Gqqw0fjFapP1khIEDaUUZFTFTp7IJl1pd2Hht4b7Rp05pIXFzUfveLYDP9s58oZ
 nG2DRROgFAT2CVpkVihi/A9BZB2kBL9SnUnCebBKXiFCjY9HDBi0NJeHk4z5Z8bLDcz8
 ScTfU0oh6WybEYUwnTLaJZ1Wrdj2P6rF39/EYaZEFdtA0XCTxHh7wPv72ZbcGhmZCItN
 5i7x6vjoKvm8usd/xeiRwJ/jAD73JqSgA0BPEBV3hqsojgMpgHnetPPifG1uGJRPONL6
 /QXUAhUtY7RIpefEwwqTP9MOSUCY80HpURMhVPLiK+sx030/A55rP/wOXjy+q3FYnvBf
 KlRg==
X-Gm-Message-State: ANhLgQ13aWVarCoUSqHacvK0pEwSgunb65ED6ytYc9wwRkwoFLwDc8vy
 5MEARf/9t6M4ozmKj9trFwBXHov5Axs=
X-Google-Smtp-Source: ADFU+vvdpF2iN26xq4yeOiy7H8Eai0ACCHt3mnaZFZm7f51IpcRoAusbHG1DySvf8JvIZdXcAX5U9w==
X-Received: by 2002:aa7:9a08:: with SMTP id w8mr12921431pfj.317.1585302332717; 
 Fri, 27 Mar 2020 02:45:32 -0700 (PDT)
Received: from JP00894.cysemi.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id i3sm3568494pgj.13.2020.03.27.02.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 02:45:31 -0700 (PDT)
From: kuwano.takahiro@gmail.com
X-Google-Original-From: Takahiro.Kuwano@cypress.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: Enable dual and quad read for s25fl256s0
Date: Fri, 27 Mar 2020 18:44:34 +0900
Message-Id: <20200327094434.25924-1-Takahiro.Kuwano@cypress.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_024536_800626_EAFA88EC 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 Takahiro Kuwano <Takahiro.Kuwano@cypress.com>, miquel.raynal@bootlin.com,
 kuwano.takahiro@gmail.com, Bacem.Daassi@cypress.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Takahiro Kuwano <Takahiro.Kuwano@cypress.com>

The s25fl256s0 supports dual and quad read like s25fl256s1.
Enable it by adding SPI_NOR_DUAL_READ and SPI_NOR_QUAD_READ
flags to the flash_info entry. Tested with the device and
confirmed that is working.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@cypress.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index b0cd443dd758..203be66f8335 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2496,7 +2496,8 @@ static const struct flash_info spi_nor_ids[] = {
 			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256,
 			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
+	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128,
+			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
 			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

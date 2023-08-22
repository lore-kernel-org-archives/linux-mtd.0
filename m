Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A701CEE49AE
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/FnkRQ+h/WrRMEhF/hEZFVsdlL8ATU09BYTglKeoRbk=; b=xi0U1DwCUa1rkS
	aqB4csM3h2tqm7zSRjriq6jIYuRgSVWrVTBOvMIfIiLupZ3dKh80XWCaZOrQD8Yqr3PARgXZHUlnP
	IwgCzXMwLDzNQPfqvO6JwL8KD0QNftDc9cvn4Hw32rMkdsc+3ztJHyXeqJ+aVxeH5EESSL9VfOFwl
	x0cYEz+QD3yginUl2SwSUkyyoWccJqn43m7OXR+gC7TQU2emVFz8jKP5j7GRIUIQSyE+MOrY55Esw
	H2aQe+CTxCK4ZoOIUTqusCRw9nkE2xts09ixwOlmy5DrSci25KCbFHuL1HWhShEBiMxN+MVnEbVS9
	4RGifemJkAg1D09byu+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWQ-00FHqe-1r;
	Tue, 22 Aug 2023 07:09:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWL-00FHol-22
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:09:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2808A63DA4;
	Tue, 22 Aug 2023 07:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7EABC433CA;
	Tue, 22 Aug 2023 07:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688184;
	bh=i6brw9U/L+6pC4Q/XEJT9zKna/1DXXdaKKQQ6GTutFM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Epky7sjU03u8qG5ooC0OUo1BiWpd6WDMOMD3OAAfBbEqgWZKtCt6tg/d5WxUXt4ap
	 fG8BVwxNEq7WEjzH2Rm407aJQAwZIBJKbtulyt+uRBkNwBrdMSdQ71ne6mIPI4nNQQ
	 wyZySaA38GCR3a1ViegVv3InZhpAzPpjKLxnF+XiGZrl+AjMZNoE74wG18K9LA1gQ5
	 atqzzy4s/GXJIWPibwBJI00bZAXO1zbYaUQtCP0MCUPNWp6tnW44Xxw/eHUavuJ0y4
	 dxaxSf3POYrhNoCvFTPblALI+97VhESjU4Wlf/fO4s6uB4TYh5gx+1xxOGqwltu9Jl
	 OZQjDcPjFzEcQ==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:20 +0200
Subject: [PATCH v2 04/41] mtd: spi-nor: xilinx: remove addr_nbytes from
 S3AN_INFO()
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-4-291a0f39f8d8@kernel.org>
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
X-CRM114-CacheID: sfid-20230822_000945_722641_73599DDB 
X-CRM114-Status: UNSURE (   9.63  )
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

The default value of addr_nbytes is already 3. Drop it.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/xilinx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index de5189c38432..34267591282c 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -27,7 +27,6 @@
 		.n_sectors = (_n_sectors),				\
 		.page_size = (_page_size),				\
 		.n_banks = 1,						\
-		.addr_nbytes = 3,					\
 		.flags = SPI_NOR_NO_FR
 
 /* Xilinx S3AN share MFR with Atmel SPI NOR */

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

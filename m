Return-Path: <SRS0=kTjQ=7J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBB1C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 13:42:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA2BB207D8
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 13:42:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oqtaCmaB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA2BB207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iz2SmUIMXBT1JgIoTAu6VsTTkSzuxloOSl1EPlQiHN0=; b=oqtaCmaB5AtBrv
	vrG2yOA5snPEhtbwWUhcdoqAtXPU9e9EPtiaXbRGu1jh1VWapafgA4d46GTNyHBww4/WzMEcvZEfq
	gBHnF+81fIVSsFEnVFZhd5ck7QFLEcdaegwTw8xxf7KKuzPEQORFmqoy2uW2XgnC6lPhuLIebtw4c
	DOBdITe8joJ6JBd0Weabw/vsrbaJqkOLMSHC/OkJNK421DBUTHGzlnSjqP/5PkvjExc1oJiHLVxD2
	BHMije5GRYjmtJFv6kFP3f9Ql/OTPjTJ6jW0VfwtfNpTK/iY8f0Uc0B5nWBXdaYZXJ6TJcwflWUK9
	g2UcAHbLz518KAr0kJlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdwKF-0006ce-8v; Wed, 27 May 2020 13:42:31 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdwKB-0006bf-Ey
 for linux-mtd@lists.infradead.org; Wed, 27 May 2020 13:42:28 +0000
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MaIrN-1jYcro1YGL-00WCjo; Wed, 27 May 2020 15:42:13 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH] mtd: rawnand: arasan: select CONFIG_BCH
Date: Wed, 27 May 2020 15:42:03 +0200
Message-Id: <20200527134210.847411-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:0ERleDGDoYzZSO351/qcuQ53P9BOoY8n9kiIrDVxRwankQHZJKf
 q0LF7oeTmAubbA5uNTQKrD28V3IGepb0X6rPuNYuwHPTlRA4Vcx2h+MxTaSMfUTQRgHdqUE
 iL7XTOg4B0iJBExr22T1i764EAj9WNVWVts5wJOYYfZlLVF13fcdJ37PH+7lbbWC/YL5Pz4
 joHLK8o3erWRfgZ6koFrg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TcWRwqlhomw=:27oxfRCh9GEKpKasOksz0+
 tqu0k7N/C+sN91belOMslygH/VVIX6C0L8VWWIeL1TCNn535PCE8Bk1xMlakycYSXv5uQIYjo
 ekmDmeuY4xe3jdt9oq3w1Mk2ybck1vmiUvMviRJ9W6FpvSaIIAeGJFWFlnRp591KUpTczegI2
 evePeEBRX/sn3AzSFBXFRL6c2fGEskiwkZoFrXjs30tXAEVzdbZGHe1ZsiDxQ8hR7d532jKak
 16k2No9kaC/VLMxjnf35RIelieaPnAB4wgoKW9PW+k767RGx72PQjybOYSc39nGYOX/kgtcYs
 nJiNfg3Qhc5wMDh7R0kxBTZLBVyVAQqoJZshWED7ee/euxetggP/iWKCO5MSBwyeDOu51e5nY
 46Ot3QpUXVMDNxpNR711+yLb1d0CLMiU6JpH80QsWSBjm0uiwQ0PYzjijx/DvvWRPEYo0BrUr
 6IDkwthIdyTZTJqe1/kJ7zZH1S6TiB189Nmn8BP/EmS9sEzTH4sVuzCRAPDO8xIkfxB7Vua2Y
 3K2tAhHaqJ6DPSNgKyOEqVyD2YCL/CefkZ7obf5kwwcsW1Zoz9GxVepDBPKomLUM96VOaXwXK
 UzwMO8JIUdJZ2sAUmo2BqRM2FHvvZTkeEtdB9F+nIBT2bnW2qUV2T1EP1VEqLBm2L1/2DqIu5
 VwY+v5rtp5aAlhp1evVZZZerXyxSMVEzS3uDQWMHEiGzC2A9X1t984fI0pixF19MeX5FrML0M
 JyJdrz3ods9BApsl3DCCO457qikGmcDKC+gCT6FNT5EBJVax4oWo0yh9a/P8h3DN6hMaqQwi8
 nC38W5X1AxIk4DQcemNb1njF3vlFbs1VLZ8EiUADPLc6mw3PYM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_064227_789676_0F45F3FD 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendanhiggins@google.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Mason Yang <masonccyang@mxic.com.tw>, Piotr Sroka <piotrs@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Like several other nand flash drivers, this one requires the BCH
library to be selected from Kconfig.

arm-linux-gnueabi-ld: drivers/mtd/nand/raw/arasan-nand-controller.o: in function `anfc_attach_chip':
arasan-nand-controller.c:(.text+0x894): undefined reference to `bch_init'
arm-linux-gnueabi-ld: drivers/mtd/nand/raw/arasan-nand-controller.o: in function `anfc_detach_chip':
arasan-nand-controller.c:(.text+0x98c): undefined reference to `bch_free'
arm-linux-gnueabi-ld: drivers/mtd/nand/raw/arasan-nand-controller.o: in function `anfc_read_page_hw_ecc':
arasan-nand-controller.c:(.text+0x1080): undefined reference to `bch_decode'

Fixes: 197b88fecc50 ("mtd: rawnand: arasan: Add new Arasan NAND controller")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/nand/raw/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index e2bc87779bf9..113f61052269 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -456,6 +456,7 @@ config MTD_NAND_CADENCE
 config MTD_NAND_ARASAN
 	tristate "Support for Arasan NAND flash controller"
 	depends on HAS_IOMEM && HAS_DMA
+	select BCH
 	help
 	  Enables the driver for the Arasan NAND flash controller on
 	  Zynq Ultrascale+ MPSoC.
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

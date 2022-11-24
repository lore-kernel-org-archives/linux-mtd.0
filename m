Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894A5C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Nov 2022 11:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4scFmhrp3VIRfHrWSwhBYTJO8TT4wA6q66sEjoUYR44=; b=hIQjEcNWA84WqL
	Q8RcSyl59LWycFhM+iXFHzStksIJzUr5fS+CqmgnmTTpsvqNdtHfq0oH30cJS1O5MmDVzHawEBJAG
	RPiJ6dsVnPz/52tyy8GnhYEzd439J22OXlGGLjC+C3iOdIdasDN0ZZ5+YFv8r9sJi6+Vp9TFX54sF
	AAVD87jiWkCYeonAjTIdJbUQZDZR5xEJGUXD8Z8oCa3vM34kCa+BYYGhRiI60214x3Nr0aIVuibkb
	zBR+ND+75hXgB3A75Chmlrxa4kw2QsWUurzAffkW8EXRopftzhZdxBKcNDsz32Z2p7fpa5X/nY99R
	Rp1NoxaaHiTM/EkABiSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9xV-007r5G-5J; Thu, 24 Nov 2022 10:59:57 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9xO-007r0i-Tj
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2022 10:59:52 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AD2781F38D;
	Thu, 24 Nov 2022 10:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1669287587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gzt8jTwR+NxgS/gIm8RH0/+q5NKPvkljd3y17tGlyoE=;
	b=R+7hpGQSN7xUv298CcH34JqHZDvEupABZykW3XFGobD5J9IZltFKz5f5xcdEegA/oStsYw
	2it0RpnRmQneDb0N7BW0PWKBpzcG0hNxwSeqimE/oE8H3U/HNRlqxA7xTx0OEizUopjX6/
	Gn0P01XvEaEQ3jSisw9Gmfg+w4jMPdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1669287587;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gzt8jTwR+NxgS/gIm8RH0/+q5NKPvkljd3y17tGlyoE=;
	b=EPBS1H7c9Zp9eZJxBb02FuHKQB9hwssIERiC/nNYOk7erunsduRHIXYzwNLm29kAqsnTp7
	Kjv0dm3GlOmO45AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6DD9113B4F;
	Thu, 24 Nov 2022 10:59:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GVwVGaNOf2NlUwAAMHmgww
	(envelope-from <jdelvare@suse.de>); Thu, 24 Nov 2022 10:59:47 +0000
Date: Thu, 24 Nov 2022 11:59:46 +0100
From: Jean Delvare <jdelvare@suse.de>
To: linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Naga Sureshkumar
 Relli <nagasure@xilinx.com>
Subject: [PATCH] mtd: rawnand: Drop obsolete dependencies on COMPILE_TEST
Message-ID: <20221124115946.5edb771c@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_025951_164338_EC38D929 
X-CRM114-Status: GOOD (  13.68  )
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

Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
is possible to test-build any driver which depends on OF on any
architecture by explicitly selecting OF. Therefore depending on
COMPILE_TEST as an alternative is no longer needed.

It is actually better to always build such drivers with OF enabled,
so that the test builds are closer to how each driver will actually be
built on its intended target. Building them without OF may not test
much as the compiler will optimize out potentially large parts of the
code. In the worst case, this could even pop false positive warnings.
Dropping COMPILE_TEST here improves the quality of our testing and
avoids wasting time on non-existent issues.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>
---
 drivers/mtd/nand/raw/Kconfig |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-6.0.orig/drivers/mtd/nand/raw/Kconfig
+++ linux-6.0/drivers/mtd/nand/raw/Kconfig
@@ -435,7 +435,7 @@ config MTD_NAND_PLATFORM
 
 config MTD_NAND_CADENCE
 	tristate "Support Cadence NAND (HPNFC) controller"
-	depends on (OF || COMPILE_TEST) && HAS_IOMEM
+	depends on OF && HAS_IOMEM
 	help
 	  Enable the driver for NAND flash on platforms using a Cadence NAND
 	  controller.
@@ -450,7 +450,7 @@ config MTD_NAND_ARASAN
 
 config MTD_NAND_INTEL_LGM
 	tristate "Support for NAND controller on Intel LGM SoC"
-	depends on OF || COMPILE_TEST
+	depends on OF
 	depends on HAS_IOMEM
 	help
 	  Enables support for NAND Flash chips on Intel's LGM SoC.
@@ -470,7 +470,7 @@ config MTD_NAND_ROCKCHIP
 
 config MTD_NAND_PL35X
 	tristate "ARM PL35X NAND controller"
-	depends on OF || COMPILE_TEST
+	depends on OF
 	depends on PL353_SMC
 	help
 	  Enables support for PrimeCell SMC PL351 and PL353 NAND


-- 
Jean Delvare
SUSE L3 Support

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

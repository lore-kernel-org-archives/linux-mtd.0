Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C66FD7073
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 10:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dRPP0lpzLSyfT3ArRs1Z9hrIIWv8edjvagq+YDHk+p8=; b=AAqHVK/kLPsIYL
	2QEWWJFuFPOLJTJ2fF8YKBjSEUqp3LGf96Spl9k6ndGXcxcAOL6cZ4Tx7C+r7TjG3N3MyP+nwkckB
	iSYK0J0N6UY8krRC7ilnFKgyvj1SdScO81DImdY9sbo4+CWBDgLTj/WxMAY3c05xEZr1Ck7MuyoTI
	FsoC6kpA8iE12LCRu/typcZ2vxhTt2s6PWs/rUhv29erNKNBjWKavEVO04WdC2qDzbIO8VjVL81uq
	ElIwy1qnk6Wffdaxk5t/EHBZKb+90IFRl90pYmRJamZStvx7l0Br9y/4XZQEKXwFFu4vGtKHX5LIF
	05OyAkoUiWIN+ZslJLxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Rb1-00000005zKM-3taD;
	Tue, 17 Mar 2026 10:24:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ray-00000005zJQ-3zL0
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 10:24:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 798874E42629;
	Tue, 17 Mar 2026 10:24:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E4995FC9A;
	Tue, 17 Mar 2026 10:24:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38142104503AE;
	Tue, 17 Mar 2026 11:24:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773743054; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7UGHB4CnkC5yHvpQ1KlMte4F9RtOgCrxhLW069LNgLo=;
	b=bTUhlRmEA9eD/lL9k3ctzWWtTzNEBpFO4+LerBE3plx/WSl26GYBjk8WtQ1sDmKIzitWxv
	0UNC8aPSjfBfoG7eFmdoLjVOskYR1SfufuS8r8/DGfw+0Sd6JyvDzVe47ZzZtgcmg2J4tU
	82bhV2oxGWcgRPFwY5U2Vyfj3KVNeZxOO1yCjIHWRMxlbde90QhqOvG1WdFAbAPRWRElww
	WNCf2rzUCJk2K776cjVpuq34dWhyrc+HN0qbe3moZKW700cJmMlM2hr0jfqn65BnwPfkZs
	dhmYrVhfDP+6O4G+3+xsAgZEaBXfCigr/oKTJy0U/SjRhpfffkn51LgTpEnzTg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 17 Mar 2026 11:24:04 +0100
Subject: [PATCH v3 01/27] mtd: spi-nor: Drop duplicate Kconfig dependency
MIME-Version: 1.0
Message-Id: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-1-2ca9ea4e7b9b@bootlin.com>
References: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com>
In-Reply-To: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_032417_141155_978742E9 
X-CRM114-Status: UNSURE (   9.42  )
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

I do not think the MTD dependency is needed twice. This is likely a
duplicate coming from a former rebase when the spi-nor core got cleaned
up a while ago. Remove the extra line.

Fixes: b35b9a10362d ("mtd: spi-nor: Move m25p80 code in spi-nor.c")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 24cd25de2b8b..fd05a24d64a9 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig MTD_SPI_NOR
 	tristate "SPI NOR device support"
-	depends on MTD
 	depends on MTD && SPI_MASTER
 	select SPI_MEM
 	help

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

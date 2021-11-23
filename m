Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0516C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Nov 2021 10:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJZS1yDmIF0wRFU99x25Mq2ixyQc2PDDvX4sS5s78Sg=; b=D/TGsxrhayBFPD
	ANLuX2X7cXMiBaT4tLSYhrHU4tkRSDYp5Kiz5iia7epFNIINMVt1xBRkujWad6ySf/1YFwskuKvzX
	jEJHlT2lmZirQ4wopxfvp88Z/WBqhqj57GHc7HQ0skb9HCIXNn+ezCdW9K4YW6hYAUghulAVer8Be
	J8OYhyS83YgkIrk/1sYn5ElBLc6FcUGF0nZORchslNPikOhDPVQAaRxDt+6qKVZ2tR9AtSF7mIQho
	fpED8groNl1aqa6VdgiDAfjv/mpoP4vYaAsCpVXsKIBJdy1Xg/w52dPqfeULNKkxLTkgaPCIJLNRB
	vghx6Mbnt8JohBoNwNVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpTAK-001iqi-5I; Tue, 23 Nov 2021 10:36:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpT9x-001ilL-UX
 for linux-mtd@lists.infradead.org; Tue, 23 Nov 2021 10:36:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 790AE61053;
 Tue, 23 Nov 2021 10:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637663781;
 bh=5QCuzqHM21YzM/FzKde2w/D1g6ZloHN6p+IE4Gqk6DE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ezGHUaMTIf6LJqFTd0JFS+7/V/9Psbj2VLyuCNoXiG0HehGk4xezpgrzAQv2RAqOd
 hGEEjzKWGPv2fCNg6sTwPderGAoRJkKkgnul/nsDmTNqsEmF93pAy4zME7POOdH0cn
 gCVVDPQd1wfPHjXuelCKnMSKiyjQSWL1diLSoq1Gk8sqp11SeqWIG8jBBqi0jI+Ob5
 Zp4qYENqDypA33dXQ/lRE7opMvvtsNQwiIZkMghn17kRVWJo/mNESl5rb5BKFU+gij
 Udm7FYOJqJmQhVvhKhdAuK6WPMzRJXTSDsoaF4pjf+YJ9BDJv2YNp2C3eXE1gJwMY2
 v/k9AGWI7bUNw==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: kishon@ti.com, nm@ti.com, tony@atomide.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Roger Quadros <rogerq@kernel.org>
Subject: [PATCH 2/4] mtd: nand: omap2: Allow build on K3 platforms
Date: Tue, 23 Nov 2021 12:36:07 +0200
Message-Id: <20211123103609.14063-3-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123103609.14063-1-rogerq@kernel.org>
References: <20211123103609.14063-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_023622_037278_F6626D8D 
X-CRM114-Status: UNSURE (   9.40  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

K3 platforms come with GPMC. Enable GPMC build for
K3 platforms.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/mtd/nand/raw/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 67b7cb67c030..d719316467a1 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -40,7 +40,7 @@ config MTD_NAND_AMS_DELTA
 
 config MTD_NAND_OMAP2
 	tristate "OMAP2, OMAP3, OMAP4 and Keystone NAND controller"
-	depends on ARCH_OMAP2PLUS || ARCH_KEYSTONE || COMPILE_TEST
+	depends on ARCH_OMAP2PLUS || ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  Support for NAND flash on Texas Instruments OMAP2, OMAP3, OMAP4
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5F0C169C4
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 12:14:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DD7D20855
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 12:14:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CKVyiKIG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="iMYfNxn2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DD7D20855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=zXlZOuT9HbzIFJkmn+eUgQIi1n/VN4UiBl9S4VrXYQk=; b=CKV
	yiKIGLtTDz4mTt9FDu1fBtmppTx6qE/7ezZtLDGYdejIravT8sRByK09BklsJU0Mi/AcLTI7ddavb
	dinT5Dy3uCRMjebpWmG9j2v2l9Zn816mmWdbnHrBAgFOEnFRdKsz/qLmDINcquF8QUrREGM5YS3ME
	eSAvOVzxkRR+IOPXievJg8zntNLU0Gxa+z2T+IaPVXqe+rs1UvV2DKSbJeO8BZ633TSc4JxaeU0ib
	XGyGe5fbcz07KGWrA7jkg4u/k7yYODHfZpjsFYMd7ottpkODZDIpQQzQfwAYFgAUE2UOQquPOCa1V
	qMbTSh1C7A1V2CmLU+D6+795fVVoj1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goSHr-0008Vz-AZ; Tue, 29 Jan 2019 12:14:43 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goSHk-0008SU-CE
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2019 12:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=axb0vk6XEGuzklGvWB5ppwLz5+cZsUDpjfGLPFJOdac=; b=iMYfNxn2OEdv
 tndkeDpdsFr5GHG2efJBYezyiMG5t4VOUGh65DnQiFAsEjpPCWo6yJBBtSkaF0byq1DTOYSQjvtRb
 h8aa/fHrudE0vKT9+APNSRZJziFd40zPqQ4loCb+MvSNse9H7T3VBi+ef5BOkyX6D05JcvmNvOF4n
 72h6U=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1goSHY-0008Aw-GI; Tue, 29 Jan 2019 12:14:24 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 23FA01127D50; Tue, 29 Jan 2019 12:14:24 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Subject: Applied "spi: spi-mem: spi-nxp-fspi: add module license info" to the
 spi tree
In-Reply-To: <1548755240-27319-1-git-send-email-yogeshnarayan.gaur@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190129121424.23FA01127D50@debutante.sirena.org.uk>
Date: Tue, 29 Jan 2019 12:14:24 +0000 (GMT)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_041436_595592_866715B5 
X-CRM114-Status: GOOD (  11.94  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "frieder.schrempf@kontron.de" <frieder.schrempf@kontron.de>,
 linux-spi@vger.kernel.org, "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The patch

   spi: spi-mem: spi-nxp-fspi: add module license info

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From ce6f0697ebadb90cc37a6ef081384c115bdda196 Mon Sep 17 00:00:00 2001
From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Date: Tue, 29 Jan 2019 09:49:22 +0000
Subject: [PATCH] spi: spi-mem: spi-nxp-fspi: add module license info

Add MODULE_LICENSE info to fix below warning:
WARNING: modpost: missing MODULE_LICENSE() in drivers/spi/spi-nxp-fspi.o

Typo fix in Boris Brezillon last name.

Fixes: a5356aef6a90 ("spi: spi-mem: Add driver for NXP FlexSPI controller")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-nxp-fspi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
index 0327216ef7aa..8894f98cc99c 100644
--- a/drivers/spi/spi-nxp-fspi.c
+++ b/drivers/spi/spi-nxp-fspi.c
@@ -26,7 +26,7 @@
  *
  * Author:
  *     Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
- *     Boris Brezillion <bbrezillon@kernel.org>
+ *     Boris Brezillon <bbrezillon@kernel.org>
  *     Frieder Schrempf <frieder.schrempf@kontron.de>
  */
 
@@ -1101,5 +1101,6 @@ module_platform_driver(nxp_fspi_driver);
 MODULE_DESCRIPTION("NXP FSPI Controller Driver");
 MODULE_AUTHOR("NXP Semiconductor");
 MODULE_AUTHOR("Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>");
-MODULE_AUTHOR("Boris Brezillion <bbrezillon@kernel.org>");
+MODULE_AUTHOR("Boris Brezillon <bbrezillon@kernel.org>");
 MODULE_AUTHOR("Frieder Schrempf <frieder.schrempf@kontron.de>");
+MODULE_LICENSE("GPL v2");
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

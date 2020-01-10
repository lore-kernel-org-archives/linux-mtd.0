Return-Path: <SRS0=enRf=27=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61223C282DD
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 19:59:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B215206ED
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 19:59:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ynd140II"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B215206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=m+Chi/KsZXuj3C2Xn3PYGUA/PrBL2/nUTFBQ9K9DeNY=; b=Ynd
	140IIzY0VwJrU9ITtsmfzC6Pe0NUsTL5UIRERepXmgNWDcGPnpmShiJWkJJ3ZcO0+A/bix/eaLSX1
	7kNSB34IlGWeg5FA9bFgteMKTKwfQ2+Oq4Z6sXunH6+bLFrV/O9y5J+Lzj4rIal2nVV1d5F9k8DAc
	pyvxDvOLFlfyoSKcyddiMTe+aM4AP8mgiwHNseWs+ty3FADqXYO21t9PgZwoTyRIuk1jp5sCC6Wmj
	9x+wcqTOOjldyraYFIWmdILwE5bdkE/V66ITpftnEh7SbMYUi7s1YcTIaL4l1L/+0mHmSeWlm6BmR
	RfrzXic1l5R+u/oVikcjR2XLsjkm1Dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iq0R6-0005Cm-3J; Fri, 10 Jan 2020 19:59:12 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iq0R2-0005Bt-75
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2020 19:59:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D051E328;
 Fri, 10 Jan 2020 11:59:04 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5615D3F534;
 Fri, 10 Jan 2020 11:59:04 -0800 (PST)
Date: Fri, 10 Jan 2020 19:59:02 +0000
From: Mark Brown <broonie@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Applied "MAINTAINERS: Add a maintainer for the HiSilicon v3xx SFC
 driver" to the spi tree
In-Reply-To: <1575900490-74467-4-git-send-email-john.garry@huawei.com>
Message-Id: <applied-1575900490-74467-4-git-send-email-john.garry@huawei.com>
X-Patchwork-Hint: ignore
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_115908_302000_58C6D763 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: fengsheng5@huawei.com, chenxiang66@hisilicon.com,
 linux-kernel@vger.kernel.org, linuxarm@huawei.com, marek.vasut@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 tudor.ambarus@microchip.com, xuejiancheng@hisilicon.com,
 linux-spi@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The patch

   MAINTAINERS: Add a maintainer for the HiSilicon v3xx SFC driver

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.6

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

From 99eb0a1221ac1083b8c87932c438ef016abdaa05 Mon Sep 17 00:00:00 2001
From: John Garry <john.garry@huawei.com>
Date: Mon, 9 Dec 2019 22:08:10 +0800
Subject: [PATCH] MAINTAINERS: Add a maintainer for the HiSilicon v3xx SFC
 driver

Set John Garry @ Huawei as the maintainer.

Signed-off-by: John Garry <john.garry@huawei.com>
Link: https://lore.kernel.org/r/1575900490-74467-4-git-send-email-john.garry@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd5847e802de..8c119bd4f687 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7492,6 +7492,12 @@ S:	Supported
 F:	drivers/scsi/hisi_sas/
 F:	Documentation/devicetree/bindings/scsi/hisilicon-sas.txt
 
+HISILICON V3XX SPI NOR FLASH Controller Driver
+M:	John Garry <john.garry@huawei.com>
+W:	http://www.hisilicon.com
+S:	Maintained
+F:	drivers/spi/spi-hisi-sfc-v3xx.c
+
 HISILICON QM AND ZIP Controller DRIVER
 M:	Zhou Wang <wangzhou1@hisilicon.com>
 L:	linux-crypto@vger.kernel.org
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58070CAC582
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Sep 2025 08:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=1Fu9RtUnB8YfLUOR/CHjxaMqw3WAitEFyJvCEv3k5Lo=; b=g6luMWic/5m4jJ
	EvPFSouM+r0ExKVj5xHG6QL2LXN3LNZI9cNaNg9IwrGXTragCJU4ULhmYLA9DlignKdDT6R36Yraf
	q+ZCEpC/rQmiAYSCSNf2oEh2CkBGHuOjkEQJXYE233fS0vzoLDDZyVPAMqWHInxn67mtI+WpTWARH
	g5K+4+GhRBAq3CfnEeH0aD1YPBAIL1Qqz9yWK9BOFJVmyLVHB35C8jh5SGbmcZcbhT5AKfaBpGE5u
	w2sscy4i5he8VqB0pKjPD3zHhXiXpNcOGbCrFTXBrDCUgNdEefYswlr00ph7KPZg4APdq1kUel0yu
	LLw4vBIup5H0wZI0g8mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxhgi-00000000Sqh-1wV1;
	Sun, 14 Sep 2025 08:02:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxhgf-00000000Sq0-0ro7;
	Sun, 14 Sep 2025 08:02:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6164B4400A;
	Sun, 14 Sep 2025 08:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C35C4CEF1;
	Sun, 14 Sep 2025 08:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757836936;
	bh=Wl3GvEpXEoZA8lGiGYs8MlLTRQrCTWdnUNYFvuC0zYQ=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=EK8ayFXg10hDyaaWbIkcrvWj5z2Xvc6QTiD7DBnvIO7ZxGYzbpWbdMOhRwS1jaJMP
	 wmJdiC+rWFgIk1CzWgZ4xnWgAzU8g9ALxz7SVAbN1XTeGej2vTuiNTc5ZVKFLwbAA9
	 U3VZiUlYZK+C5qMRjFActtX2VyqWk4R8gJEVBrRU=
Subject: Patch "mtd: rawnand: stm32_fmc2: Fix dma_map_sg error check" has been added to the 5.10-stable tree
To: alexandre.torgue@foss.st.com,cai.huoqing@linux.dev,christophe.kerello@foss.st.com,gregkh@linuxfoundation.org,jinpu.wang@ionos.com,linux-arm-kernel@lists.infradead.org,linux-mtd@lists.infradead.org,linux-stm32@st-md-mailman.stormreply.com,mcoquelin.stm32@gmail.com,miquel.raynal@bootlin.com,p.zabel@pengutronix.de,richard@nod.at,sashal@kernel.org,vigneshr@ti.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 14 Sep 2025 10:01:56 +0200
In-Reply-To: <20250913151912.1412912-1-sashal@kernel.org>
Message-ID: <2025091456-rendering-twistable-9506@gregkh>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_010217_311126_7EA35811 
X-CRM114-Status: GOOD (  14.49  )
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


This is a note to let you know that I've just added the patch titled

    mtd: rawnand: stm32_fmc2: Fix dma_map_sg error check

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mtd-rawnand-stm32_fmc2-fix-dma_map_sg-error-check.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-179501-greg=kroah.com@vger.kernel.org Sat Sep 13 17:19:24 2025
From: Sasha Levin <sashal@kernel.org>
Date: Sat, 13 Sep 2025 11:19:11 -0400
Subject: mtd: rawnand: stm32_fmc2: Fix dma_map_sg error check
To: stable@vger.kernel.org
Cc: Jack Wang <jinpu.wang@ionos.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, Christophe Kerello <christophe.kerello@foss.st.com>, Cai Huoqing <cai.huoqing@linux.dev>, linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Message-ID: <20250913151912.1412912-1-sashal@kernel.org>

From: Jack Wang <jinpu.wang@ionos.com>

[ Upstream commit 43b81c2a3e6e07915151045aa13a6e8a9bd64419 ]

dma_map_sg return 0 on error, in case of error return -EIO.

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: Cai Huoqing <cai.huoqing@linux.dev>
Cc: linux-mtd@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
Reviewed-by: Christophe Kerello <christophe.kerello@foss.st.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/linux-mtd/20220819060801.10443-5-jinpu.wang@ionos.com
Stable-dep-of: 513c40e59d5a ("mtd: rawnand: stm32_fmc2: avoid overlapping mappings on ECC buffer")
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -858,8 +858,8 @@ static int stm32_fmc2_nfc_xfer(struct na
 
 	ret = dma_map_sg(nfc->dev, nfc->dma_data_sg.sgl,
 			 eccsteps, dma_data_dir);
-	if (ret < 0)
-		return ret;
+	if (!ret)
+		return -EIO;
 
 	desc_data = dmaengine_prep_slave_sg(dma_ch, nfc->dma_data_sg.sgl,
 					    eccsteps, dma_transfer_dir,
@@ -889,8 +889,10 @@ static int stm32_fmc2_nfc_xfer(struct na
 
 		ret = dma_map_sg(nfc->dev, nfc->dma_ecc_sg.sgl,
 				 eccsteps, dma_data_dir);
-		if (ret < 0)
+		if (!ret) {
+			ret = -EIO;
 			goto err_unmap_data;
+		}
 
 		desc_ecc = dmaengine_prep_slave_sg(nfc->dma_ecc_ch,
 						   nfc->dma_ecc_sg.sgl,


Patches currently in stable-queue which might be from sashal@kernel.org are

queue-5.10/media-i2c-imx214-fix-link-frequency-validation.patch
queue-5.10/flexfiles-pnfs-fix-null-checks-on-result-of-ff_layou.patch
queue-5.10/overflow-allow-mixed-type-arguments.patch
queue-5.10/tcp_bpf-call-sk_msg_free-when-tcp_bpf_send_verdict-f.patch
queue-5.10/media-mtk-vcodec-venc-avoid-wenum-compare-conditional-warning.patch
queue-5.10/tracing-fix-tracing_marker-may-trigger-page-fault-du.patch
queue-5.10/nfsv4-don-t-clear-capabilities-that-won-t-be-reset.patch
queue-5.10/s390-cpum_cf-deny-all-sampling-events-by-counter-pmu.patch
queue-5.10/mtd-add-check-for-devm_kcalloc.patch
queue-5.10/nfsv4-flexfiles-fix-layout-merge-mirror-check.patch
queue-5.10/overflow-correct-check_shl_overflow-comment.patch
queue-5.10/compiler.h-drop-fallback-overflow-checkers.patch
queue-5.10/mtd-nand-raw-atmel-respect-tar-tclr-in-read-setup-timing.patch
queue-5.10/mtd-nand-raw-atmel-fix-comment-in-timings-preparation.patch
queue-5.10/nfsv4-clear-the-nfs_cap_xattr-flag-if-not-supported-.patch
queue-5.10/net-fix-null-ptr-deref-by-sock_lock_init_class_and_name-and-rmmod.patch
queue-5.10/mtd-rawnand-stm32_fmc2-fix-dma_map_sg-error-check.patch
queue-5.10/mtd-rawnand-stm32_fmc2-avoid-overlapping-mappings-on-ecc-buffer.patch

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

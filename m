Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E873BC43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:46:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B63C6206C3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:46:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D3nqbmJX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/KO6rtX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B63C6206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=W7mgE+UdnppM+2O6z4XVSq81eC+VPI0x9f13JqsgXrA=; b=D3nqbmJXxeILTj
	Ipw9/u5q4KJH/xSAnhUTUbhxRU805g0JhwvYOMNZII4CIZTB6Y6GtDlex52oLZuT6lIoYlfT1IeZB
	wqRoz3tLpGQ1P6S0cwW0scfYINiJcrxQ1utKDhVimvhDp36yiogrIN9oguN+K/BAigZUPmgIreIYP
	L30iDeY5amVGMpgyJiN2HyL4VrMuPCS5fge6ut8T2i0mBZehw7rmYek/GErHcKoqJpSCe2GXIYbZ2
	wo5mVinloxXZ1VJYwoR4WrUvJxy4T6o0fRp2XB4BlO2AF0qdYbqNC+vAlKkxBBxlMxlgBJmDMs+Pt
	7biiVxGgswMo687FoGiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU6H1-0002Y2-P9; Mon, 11 Nov 2019 09:46:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU6F5-00083D-64
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 09:44:18 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE6B22084F;
 Mon, 11 Nov 2019 09:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573465454;
 bh=TsET5Ad30Z5LGue4BLdCUG4w7ocxMPwtdcZ3SgYKKAw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=l/KO6rtXfCILC7AJw9LbvMHJIkjC6q5QK9YqdtvYhoffHwaNMpzpYXPthd8lagr1O
 K+7Jq9+PnJt3pDckSggAEmmdQnqlYVu7j62B7K1kyvO41Rbi6P2nuLgHiuaN8plbWn
 lfsu1sRblPsoQ2k8y+Hcmc68jYZ4iEfHfRFOLWP4=
Subject: Patch "misc: pci_endpoint_test: Prevent some integer overflows" has
 been added to the 4.14-stable tree
To: dan.carpenter@oracle.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, linux-mtd@lists.infradead.org,
 mathieu.poirier@linaro.org
From: <gregkh@linuxfoundation.org>
Date: Mon, 11 Nov 2019 10:43:33 +0100
In-Reply-To: <20190905161759.28036-10-mathieu.poirier@linaro.org>
Message-ID: <157346541354220@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_014415_268446_5D348F70 
X-CRM114-Status: UNSURE (   9.05  )
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


This is a note to let you know that I've just added the patch titled

    misc: pci_endpoint_test: Prevent some integer overflows

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     misc-pci_endpoint_test-prevent-some-integer-overflows.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon 11 Nov 2019 10:07:22 AM CET
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu,  5 Sep 2019 10:17:50 -0600
Subject: misc: pci_endpoint_test: Prevent some integer overflows
To: stable@vger.kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, linux-mtd@lists.infradead.org
Message-ID: <20190905161759.28036-10-mathieu.poirier@linaro.org>

From: Dan Carpenter <dan.carpenter@oracle.com>

commit 378f79cab12b669928f3a4037f023837ead2ce0c upstream

"size + max" can have an arithmetic overflow when we're allocating:

	orig_src_addr = dma_alloc_coherent(dev, size + alignment, ...

I've added a few checks to prevent that.

Fixes: 13107c60681f ("misc: pci_endpoint_test: Add support to provide aligned buffer addresses")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/misc/pci_endpoint_test.c |    9 +++++++++
 1 file changed, 9 insertions(+)

--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -226,6 +226,9 @@ static bool pci_endpoint_test_copy(struc
 	u32 src_crc32;
 	u32 dst_crc32;
 
+	if (size > SIZE_MAX - alignment)
+		goto err;
+
 	orig_src_addr = dma_alloc_coherent(dev, size + alignment,
 					   &orig_src_phys_addr, GFP_KERNEL);
 	if (!orig_src_addr) {
@@ -311,6 +314,9 @@ static bool pci_endpoint_test_write(stru
 	size_t alignment = test->alignment;
 	u32 crc32;
 
+	if (size > SIZE_MAX - alignment)
+		goto err;
+
 	orig_addr = dma_alloc_coherent(dev, size + alignment, &orig_phys_addr,
 				       GFP_KERNEL);
 	if (!orig_addr) {
@@ -369,6 +375,9 @@ static bool pci_endpoint_test_read(struc
 	size_t alignment = test->alignment;
 	u32 crc32;
 
+	if (size > SIZE_MAX - alignment)
+		goto err;
+
 	orig_addr = dma_alloc_coherent(dev, size + alignment, &orig_phys_addr,
 				       GFP_KERNEL);
 	if (!orig_addr) {


Patches currently in stable-queue which might be from mathieu.poirier@linaro.org are

queue-4.14/mailbox-reset-txdone_method-txdone_by_poll-if-client-knows_txdone.patch
queue-4.14/mtd-spi-nor-cadence-quadspi-add-a-delay-in-write-sequence.patch
queue-4.14/misc-pci_endpoint_test-fix-bug_on-error-during-pci_disable_msi.patch
queue-4.14/asoc-tlv320dac31xx-mark-expected-switch-fall-through.patch
queue-4.14/pci-dra7xx-add-shutdown-handler-to-cleanly-turn-off-clocks.patch
queue-4.14/asoc-tlv320aic31xx-handle-inverted-bclk-in-non-dsp-modes.patch
queue-4.14/mtd-spi-nor-enable-4b-opcodes-for-mx66l51235l.patch
queue-4.14/cpufreq-ti-cpufreq-add-missing-of_node_put.patch
queue-4.14/asoc-davinci-kill-bug_on-usage.patch
queue-4.14/mfd-palmas-assign-the-right-powerhold-mask-for-tps65917.patch
queue-4.14/asoc-davinci-mcasp-fix-an-error-handling-path-in-davinci_mcasp_probe.patch
queue-4.14/misc-pci_endpoint_test-prevent-some-integer-overflows.patch
queue-4.14/asoc-davinci-mcasp-handle-return-value-of-devm_kasprintf.patch
queue-4.14/i2c-omap-trigger-bus-recovery-in-lockup-case.patch
queue-4.14/usb-dwc3-allow-disabling-of-metastability-workaround.patch

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

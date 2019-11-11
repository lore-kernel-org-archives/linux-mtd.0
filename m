Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6EACC43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:47:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CB1F206C3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:47:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TSkEtIpj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qIOt9L+C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CB1F206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=7hiwonu5Nv4u/zTC00dLwl3G99zDODELYrAcAXPqQdc=; b=TSkEtIpjdlHm6d
	Xgo6uUN1DGQoMYj5jc2lajAAwMzRMWiZZd7Kk/pSXJb4DLSo8SMOfvuhZzwsyjyb4GEVC0J/WDIq0
	LLXZoo6cv6Ro7GB8CRb8nAVqs7pTp+SJl+oMHJuu92y4yOV3BrYsWqeAgaJ+jj8+Mi05GuSvXQHJM
	jz3sk5WMU3CjMKvI6U7wZ7PyVSJQFWWiJFnr3xKiBADSV8LAiodFGhPQCuBj+gGT0kYxmCWTppJa6
	Y26poz6pJudAtaUQyyw3BaW8ux1tTtARGAPGVEY+5gv3ns1P1Dl4fyrZrMihNvyptyCjPMNumT8hM
	RIm31VP849FpoT2EQEGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU6I1-0003bI-I5; Mon, 11 Nov 2019 09:47:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU6FD-00089B-BM
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 09:44:25 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B18920856;
 Mon, 11 Nov 2019 09:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573465463;
 bh=+aADlXTx3Q1dNzrah+Qe7GcB5CNDJ1E+05i2PYHXOrI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=qIOt9L+CjbpRMZDTgFznkNZd+hGQ+dMXwmUmNYUxMXN+ZB8Jrsm6abXvr7gE7gsZ4
 CPMH2tb5m7uY2OTdS8lW3tpLuZOcoLjqmlZlOWW7b9UC1LKBsEOTOt0RSAvZO/KJp3
 UEHfrfB02sqZXk/3/r5mHegtH6NJd8656Tj3j+30=
Subject: Patch "PCI: dra7xx: Add shutdown handler to cleanly turn off clocks"
 has been added to the 4.14-stable tree
To: bhelgaas@google.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, j-keerthy@ti.com, kishon@ti.com,
 linux-mtd@lists.infradead.org, mathieu.poirier@linaro.org
From: <gregkh@linuxfoundation.org>
Date: Mon, 11 Nov 2019 10:43:33 +0100
In-Reply-To: <20190905161759.28036-11-mathieu.poirier@linaro.org>
Message-ID: <157346541323195@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_014423_451932_D6B3785B 
X-CRM114-Status: UNSURE (   9.89  )
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

    PCI: dra7xx: Add shutdown handler to cleanly turn off clocks

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     pci-dra7xx-add-shutdown-handler-to-cleanly-turn-off-clocks.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon 11 Nov 2019 10:07:22 AM CET
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu,  5 Sep 2019 10:17:51 -0600
Subject: PCI: dra7xx: Add shutdown handler to cleanly turn off clocks
To: stable@vger.kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, linux-mtd@lists.infradead.org
Message-ID: <20190905161759.28036-11-mathieu.poirier@linaro.org>

From: Keerthy <j-keerthy@ti.com>

commit 9c049bea083fea21373b8baf51fe49acbe24e105 upstream

Add shutdown handler to cleanly turn off clocks.  This will help in cases of
kexec where in a new kernel can boot abruptly.

Signed-off-by: Keerthy <j-keerthy@ti.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/pci/dwc/pci-dra7xx.c |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

--- a/drivers/pci/dwc/pci-dra7xx.c
+++ b/drivers/pci/dwc/pci-dra7xx.c
@@ -817,6 +817,22 @@ static int dra7xx_pcie_resume_noirq(stru
 }
 #endif
 
+void dra7xx_pcie_shutdown(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct dra7xx_pcie *dra7xx = dev_get_drvdata(dev);
+	int ret;
+
+	dra7xx_pcie_stop_link(dra7xx->pci);
+
+	ret = pm_runtime_put_sync(dev);
+	if (ret < 0)
+		dev_dbg(dev, "pm_runtime_put_sync failed\n");
+
+	pm_runtime_disable(dev);
+	dra7xx_pcie_disable_phy(dra7xx);
+}
+
 static const struct dev_pm_ops dra7xx_pcie_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend, dra7xx_pcie_resume)
 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend_noirq,
@@ -830,5 +846,6 @@ static struct platform_driver dra7xx_pci
 		.suppress_bind_attrs = true,
 		.pm	= &dra7xx_pcie_pm_ops,
 	},
+	.shutdown = dra7xx_pcie_shutdown,
 };
 builtin_platform_driver_probe(dra7xx_pcie_driver, dra7xx_pcie_probe);


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

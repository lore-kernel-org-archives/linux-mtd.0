Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E14C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:46:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 408CF206C3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:46:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mZwOT0mS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLi2DaLw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 408CF206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=M64hmZQaNg9oEKJGQkYOdk875+HUDcZ/O7W0oqyMFKg=; b=mZwOT0mSVieoJH
	TmyDdUdGvZXenG1aM2uoLRkFDzQcQxWxseLsOLDuNw+MTlBRjYQ+uxKkYWLeYcFEUD2x53oCfDgDd
	wFf6Sbyj3ChXxE8CZOZe57S/yhHpzdEkQYNQD94ZNSNxcrcCEkV3p8SCCNTF61kp5lqM6p+hGH9WN
	9p4dJ1AE2V/fySG118vi4lf9c+5e+/jpIdruaYMDLexFaPpPyV4m4m/mhBKd1squ1oHEWsD4BC6KJ
	Mnc43Mjz5Bpl9yKZSX7aA6qa2tWznJjTgjNQTLCiVOOxVQLm9ruhmrvh+x2FbnRNlclLQTtZfrAAR
	wD/y3/mf6ejo5cGpvGJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU6HT-0002zr-9g; Mon, 11 Nov 2019 09:46:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU6F7-00085T-Vb
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 09:44:22 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D64F20869;
 Mon, 11 Nov 2019 09:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573465457;
 bh=e4zjSx9YTNUC+lxQUEPcgx60AMThmWsCf7+B1bbGs4g=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=RLi2DaLwoq8i7/OTEJY9IdYozR7CV32a06Wt7PKsipro2Sn8klSN5l2YtqTcdRJFw
 ptH1MJBUvlYNuVoXWP5tyEu1ID448ziS6XKt4v5VcGGEFBdCsW1i/KRinWF9EYR9UZ
 5qY/sQ75BLjKr5tyAU26Bb13fMFPKl9zH+mgUyro=
Subject: Patch "mtd: spi-nor: cadence-quadspi: add a delay in write sequence"
 has been added to the 4.14-stable tree
To: cyrille.pitchen@wedev4u.fr, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, linux-mtd@lists.infradead.org,
 marek.vasut@gmail.com, mathieu.poirier@linaro.org, vigneshr@ti.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 11 Nov 2019 10:43:33 +0100
In-Reply-To: <20190905161759.28036-9-mathieu.poirier@linaro.org>
Message-ID: <157346541330101@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_014418_113263_3991EE0D 
X-CRM114-Status: GOOD (  12.25  )
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

    mtd: spi-nor: cadence-quadspi: add a delay in write sequence

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mtd-spi-nor-cadence-quadspi-add-a-delay-in-write-sequence.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon 11 Nov 2019 10:07:22 AM CET
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu,  5 Sep 2019 10:17:49 -0600
Subject: mtd: spi-nor: cadence-quadspi: add a delay in write sequence
To: stable@vger.kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, linux-mtd@lists.infradead.org
Message-ID: <20190905161759.28036-9-mathieu.poirier@linaro.org>

From: Vignesh R <vigneshr@ti.com>

commit 61dc8493bae9ba82a1c72edbc6c6065f6a94456a upstream

As per 66AK2G02 TRM[1] SPRUHY8F section 11.15.5.3 Indirect Access
Controller programming sequence, a delay equal to couple of QSPI master
clock(~5ns) is required after setting CQSPI_REG_INDIRECTWR_START bit and
writing data to the flash. Introduce a quirk flag CQSPI_NEEDS_WR_DELAY
to handle this and set this flag for TI 66AK2G SoC.

[1]http://www.ti.com/lit/ug/spruhy8f/spruhy8f.pdf

Signed-off-by: Vignesh R <vigneshr@ti.com>
Acked-by: Marek Vasut <marek.vasut@gmail.com>
Signed-off-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/mtd/spi-nor/cadence-quadspi.c |   27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -38,6 +38,9 @@
 #define CQSPI_NAME			"cadence-qspi"
 #define CQSPI_MAX_CHIPSELECT		16
 
+/* Quirks */
+#define CQSPI_NEEDS_WR_DELAY		BIT(0)
+
 struct cqspi_st;
 
 struct cqspi_flash_pdata {
@@ -76,6 +79,7 @@ struct cqspi_st {
 	u32			fifo_depth;
 	u32			fifo_width;
 	u32			trigger_address;
+	u32			wr_delay;
 	struct cqspi_flash_pdata f_pdata[CQSPI_MAX_CHIPSELECT];
 };
 
@@ -623,6 +627,15 @@ static int cqspi_indirect_write_execute(
 	reinit_completion(&cqspi->transfer_complete);
 	writel(CQSPI_REG_INDIRECTWR_START_MASK,
 	       reg_base + CQSPI_REG_INDIRECTWR);
+	/*
+	 * As per 66AK2G02 TRM SPRUHY8F section 11.15.5.3 Indirect Access
+	 * Controller programming sequence, couple of cycles of
+	 * QSPI_REF_CLK delay is required for the above bit to
+	 * be internally synchronized by the QSPI module. Provide 5
+	 * cycles of delay.
+	 */
+	if (cqspi->wr_delay)
+		ndelay(cqspi->wr_delay);
 
 	while (remaining > 0) {
 		size_t write_words, mod_bytes;
@@ -1184,6 +1197,7 @@ static int cqspi_probe(struct platform_d
 	struct cqspi_st *cqspi;
 	struct resource *res;
 	struct resource *res_ahb;
+	unsigned long data;
 	int ret;
 	int irq;
 
@@ -1241,6 +1255,10 @@ static int cqspi_probe(struct platform_d
 	}
 
 	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
+	data  = (unsigned long)of_device_get_match_data(dev);
+	if (data & CQSPI_NEEDS_WR_DELAY)
+		cqspi->wr_delay = 5 * DIV_ROUND_UP(NSEC_PER_SEC,
+						   cqspi->master_ref_clk_hz);
 
 	ret = devm_request_irq(dev, irq, cqspi_irq_handler, 0,
 			       pdev->name, cqspi);
@@ -1312,7 +1330,14 @@ static const struct dev_pm_ops cqspi__de
 #endif
 
 static const struct of_device_id cqspi_dt_ids[] = {
-	{.compatible = "cdns,qspi-nor",},
+	{
+		.compatible = "cdns,qspi-nor",
+		.data = (void *)0,
+	},
+	{
+		.compatible = "ti,k2g-qspi",
+		.data = (void *)CQSPI_NEEDS_WR_DELAY,
+	},
 	{ /* end of table */ }
 };
 


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

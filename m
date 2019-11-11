Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A31C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:48:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94472206C3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:48:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hIbGhEco";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bv8fxJtg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94472206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=V7Axx0qgKBlyXAeUfznBxB7by3utZ+zo5FoJNedfCb0=; b=hIbGhEco3DqlWZ
	hV4lxYSV2rJA84BCrxyJSKi3Jjcu2nGAJAwFM7WvUY71bTpIjf+tEwb/rT1SNmIOBeZ7Miz6drQas
	6zC4XN3cFTQWIVF0otnZitIZN+SUX4m+ro8EOVYSY/hG5Tfwa1LQXHYXISxoUU7DcvjVbRxpzM9y7
	0hHNjdr4U2AvIqNSxbDSv/jwZ+3NnKaVIYyOhiXVssLRbmkl2o/gKVTx0PX7qCmc5LBQ72duvaSHq
	uMRPN76x2Oa06Hkc7abRdy/F1yjEGcRu+h+9uxxhCptsG/GqIsWFqXzWDwnXrXoVK2yYc4TAGDsms
	Mz9YQqvlBJQx1NQJcuPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU6IX-00044X-8h; Mon, 11 Nov 2019 09:47:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU6FS-0008Pn-Nb
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 09:44:44 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4BEC72084F;
 Mon, 11 Nov 2019 09:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573465477;
 bh=U8Az88xuLr8hNAVn82kdz/CYa+NMz21JGtbytVWiud8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=Bv8fxJtgNh7tpI7HwAjllaPriQuCu5bFWzDkstxRn5Ftn7uJsiyG07JOb6yQZ7kYD
 klMcmDNATpIkWeo+0HFf2csmo0k7K8UUzZHeUcWoFtOe4/L06cREgPq4hUNqeFp9PJ
 thcrOEMrwOK8UXexM7yLirdPKKVgdsT5tf2Z39Vk=
Subject: Patch "usb: dwc3: Allow disabling of metastability workaround" has
 been added to the 4.14-stable tree
To: dri-devel@lists.freedesktop.org, felipe.balbi@linux.intel.com,
 gregkh@linuxfoundation.org, linux-mtd@lists.infradead.org,
 mathieu.poirier@linaro.org, rogerq@ti.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 11 Nov 2019 10:43:34 +0100
In-Reply-To: <20190905161759.28036-5-mathieu.poirier@linaro.org>
Message-ID: <157346541415741@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_014438_830478_384190DF 
X-CRM114-Status: GOOD (  11.96  )
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

    usb: dwc3: Allow disabling of metastability workaround

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     usb-dwc3-allow-disabling-of-metastability-workaround.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon 11 Nov 2019 10:07:22 AM CET
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu,  5 Sep 2019 10:17:45 -0600
Subject: usb: dwc3: Allow disabling of metastability workaround
To: stable@vger.kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, linux-mtd@lists.infradead.org
Message-ID: <20190905161759.28036-5-mathieu.poirier@linaro.org>

From: Roger Quadros <rogerq@ti.com>

commit 42bf02ec6e420e541af9a47437d0bdf961ca2972 upstream

Some platforms (e.g. TI's DRA7 USB2 instance) have more trouble
with the metastability workaround as it supports only
a High-Speed PHY and the PHY can enter into an Erratic state [1]
when the controller is set in SuperSpeed mode as part of
the metastability workaround.

This causes upto 2 seconds delay in enumeration on DRA7's USB2
instance in gadget mode.

If these platforms can be better off without the workaround,
provide a device tree property to suggest that so the workaround
is avoided.

[1] Device mode enumeration trace showing PHY Erratic Error.
     irq/90-dwc3-969   [000] d...    52.323145: dwc3_event: event (00000901): Erratic Error [U0]
     irq/90-dwc3-969   [000] d...    52.560646: dwc3_event: event (00000901): Erratic Error [U0]
     irq/90-dwc3-969   [000] d...    52.798144: dwc3_event: event (00000901): Erratic Error [U0]

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt |    2 ++
 drivers/usb/dwc3/core.c                        |    3 +++
 drivers/usb/dwc3/core.h                        |    3 +++
 drivers/usb/dwc3/gadget.c                      |    6 ++++--
 4 files changed, 12 insertions(+), 2 deletions(-)

--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -47,6 +47,8 @@ Optional properties:
 			from P0 to P1/P2/P3 without delay.
  - snps,dis-tx-ipgap-linecheck-quirk: when set, disable u2mac linestate check
 			during HS transmit.
+ - snps,dis_metastability_quirk: when set, disable metastability workaround.
+			CAUTION: use only if you are absolutely sure of it.
  - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
 			utmi_l1_suspend_n, false when asserts utmi_sleep_n
  - snps,hird-threshold: HIRD threshold
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1115,6 +1115,9 @@ static void dwc3_get_properties(struct d
 	device_property_read_u32(dev, "snps,quirk-frame-length-adjustment",
 				 &dwc->fladj);
 
+	dwc->dis_metastability_quirk = device_property_read_bool(dev,
+				"snps,dis_metastability_quirk");
+
 	dwc->lpm_nyet_threshold = lpm_nyet_threshold;
 	dwc->tx_de_emphasis = tx_de_emphasis;
 
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -869,6 +869,7 @@ struct dwc3_scratchpad_array {
  * 	1	- -3.5dB de-emphasis
  * 	2	- No de-emphasis
  * 	3	- Reserved
+ * @dis_metastability_quirk: set to disable metastability quirk.
  * @imod_interval: set the interrupt moderation interval in 250ns
  *                 increments or 0 to disable.
  */
@@ -1025,6 +1026,8 @@ struct dwc3 {
 	unsigned		tx_de_emphasis_quirk:1;
 	unsigned		tx_de_emphasis:2;
 
+	unsigned		dis_metastability_quirk:1;
+
 	u16			imod_interval;
 };
 
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2034,7 +2034,8 @@ static void dwc3_gadget_set_speed(struct
 	 * STAR#9000525659: Clock Domain Crossing on DCTL in
 	 * USB 2.0 Mode
 	 */
-	if (dwc->revision < DWC3_REVISION_220A) {
+	if (dwc->revision < DWC3_REVISION_220A &&
+	    !dwc->dis_metastability_quirk) {
 		reg |= DWC3_DCFG_SUPERSPEED;
 	} else {
 		switch (speed) {
@@ -3265,7 +3266,8 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 	 * is less than super speed because we don't have means, yet, to tell
 	 * composite.c that we are USB 2.0 + LPM ECN.
 	 */
-	if (dwc->revision < DWC3_REVISION_220A)
+	if (dwc->revision < DWC3_REVISION_220A &&
+	    !dwc->dis_metastability_quirk)
 		dev_info(dwc->dev, "changing max_speed on rev %08x\n",
 				dwc->revision);
 


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

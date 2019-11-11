Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D21DC43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:46:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E1B7206C3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:46:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IqvaKmw3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFrjY7iz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E1B7206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Qo9vRDaFmE5wrcx3Sm9VGOs4psu/y+EpLOvbTmbaT7A=; b=IqvaKmw3f/lqZe
	gwnClwbgAJgAvKGfeiQoYCBSbe9DaXtUZKFVUE3K1Z+RB5DBt/pdcgM9wQ895gWro4RYgd+sBUIcj
	YPMolQiIp+dNg3XNxAx0Vykx5InmMQSJ5rDUFg2Ghu8b6yH8CkfXi6mJQ8JOW4aX6wyamHNPS8VK7
	HS/1oRrfginvJJ8uIgDoiiNvVD/0ALVcIEMoaJDyzHqs1WA4VhZ1E0QP23g7b+ke6qqPO0A5WfKe2
	ax74sLMf1hMgN47pHvfCShQ2Pf5cus6AXbjUOe4nK78RcyQF3/58WgiDHy+zoXhmUOKe3LCU5WNj9
	FxP195BFYktqZfGeAOYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU6GY-00025y-5a; Mon, 11 Nov 2019 09:45:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU6Ey-0007yy-S7
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 09:44:11 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C28C2084F;
 Mon, 11 Nov 2019 09:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573465448;
 bh=zEEyuVXyCC5vPq81XTexkQbk2xI9K1gGybGoAmmyUoE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=PFrjY7iz2Ghre0fcqyr7R/lFWkIKqPDmAZ7gXBs4rpLu1e6cJtzT73OIdyWqUXYgv
 udKAJMD4RqeI6jAT1SoOpcMuPpEKd4wTm7qY9O7vMVCg4V4xG+iHn+AdAHglTiI0JM
 /2ewGs+DaUp3FOSoQQ7eKcw+Gi+rgMU6keOTbGjg=
Subject: Patch "mfd: palmas: Assign the right powerhold mask for tps65917" has
 been added to the 4.14-stable tree
To: dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 j-keerthy@ti.com, lee.jones@linaro.org, linux-mtd@lists.infradead.org,
 mathieu.poirier@linaro.org
From: <gregkh@linuxfoundation.org>
Date: Mon, 11 Nov 2019 10:43:33 +0100
In-Reply-To: <20190905161759.28036-6-mathieu.poirier@linaro.org>
Message-ID: <157346541310622@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_014409_000224_50D61425 
X-CRM114-Status: GOOD (  10.64  )
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

    mfd: palmas: Assign the right powerhold mask for tps65917

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mfd-palmas-assign-the-right-powerhold-mask-for-tps65917.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon 11 Nov 2019 10:07:22 AM CET
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu,  5 Sep 2019 10:17:46 -0600
Subject: mfd: palmas: Assign the right powerhold mask for tps65917
To: stable@vger.kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, linux-mtd@lists.infradead.org
Message-ID: <20190905161759.28036-6-mathieu.poirier@linaro.org>

From: Keerthy <j-keerthy@ti.com>

commit 572ff4d560be3784205b224cd67d6715620092d7 upstream

The powerhold mask for TPS65917 is different when comapred to
the other palmas versions. Hence assign the right mask that enables
power off of tps65917 pmic correctly.

Signed-off-by: Keerthy <j-keerthy@ti.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/mfd/palmas.c       |   10 +++++++++-
 include/linux/mfd/palmas.h |    3 +++
 2 files changed, 12 insertions(+), 1 deletion(-)

--- a/drivers/mfd/palmas.c
+++ b/drivers/mfd/palmas.c
@@ -430,6 +430,7 @@ static void palmas_power_off(void)
 {
 	unsigned int addr;
 	int ret, slave;
+	u8 powerhold_mask;
 	struct device_node *np = palmas_dev->dev->of_node;
 
 	if (of_property_read_bool(np, "ti,palmas-override-powerhold")) {
@@ -437,8 +438,15 @@ static void palmas_power_off(void)
 					  PALMAS_PRIMARY_SECONDARY_PAD2);
 		slave = PALMAS_BASE_TO_SLAVE(PALMAS_PU_PD_OD_BASE);
 
+		if (of_device_is_compatible(np, "ti,tps65917"))
+			powerhold_mask =
+				TPS65917_PRIMARY_SECONDARY_PAD2_GPIO_5_MASK;
+		else
+			powerhold_mask =
+				PALMAS_PRIMARY_SECONDARY_PAD2_GPIO_7_MASK;
+
 		ret = regmap_update_bits(palmas_dev->regmap[slave], addr,
-				PALMAS_PRIMARY_SECONDARY_PAD2_GPIO_7_MASK, 0);
+					 powerhold_mask, 0);
 		if (ret)
 			dev_err(palmas_dev->dev,
 				"Unable to write PRIMARY_SECONDARY_PAD2 %d\n",
--- a/include/linux/mfd/palmas.h
+++ b/include/linux/mfd/palmas.h
@@ -3733,6 +3733,9 @@ enum usb_irq_events {
 #define TPS65917_REGEN3_CTRL_MODE_ACTIVE			0x01
 #define TPS65917_REGEN3_CTRL_MODE_ACTIVE_SHIFT			0x00
 
+/* POWERHOLD Mask field for PRIMARY_SECONDARY_PAD2 register */
+#define TPS65917_PRIMARY_SECONDARY_PAD2_GPIO_5_MASK		0xC
+
 /* Registers for function RESOURCE */
 #define TPS65917_REGEN1_CTRL					0x2
 #define TPS65917_PLLEN_CTRL					0x3


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

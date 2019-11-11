Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A6DC43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:45:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9963215EA
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:45:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="APbV19md";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="A66NLQWg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9963215EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=lFUJyezzq1sN48ytZh/WLGON3tUydwpYox1MK2z3YPM=; b=APbV19mdVuDJCK
	BrtEOoxGm+2RrcBIpVIFGbPexu3y7xFBvme2tniv1fPTXEZIDMMOpzgs67K4nDGLHDJu0FQE0GzHb
	texC5xrMPBu1WBROyZ5uGse6RRYz+zR8jns9nyRtP2gRW+oX4Xc0TWaOkgaBNQqfufKFlkbHDYTOq
	oAS7SgjNYv2qOT2mJEFqyWML29yut3mlWFqiQTZZX7lLoftJmrf4Mlq5P8M29i138kCEi93oieHHZ
	8dwUASKRyul/UgfFIyboRrypgzxWLYHTqDW7nwkmgoSQyLFFVmKmhFs7K7Q+ftIkoh7fDWjIflnS1
	j6rYVT0bGFkH3vLzlJTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU6Fx-0000xs-JQ; Mon, 11 Nov 2019 09:45:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU6Et-0007rd-BY
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 09:44:05 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 382722084F;
 Mon, 11 Nov 2019 09:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573465442;
 bh=00QUe+5b+Pp86oYHx9hoOQd0NTq04xsmMBBQpewtmik=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=A66NLQWgDXxR1pn4ciiEW7CeFAbY204qA4LtK6mbn4lJnK33AriMaXGET3UvpXKHy
 TWrW8b3L+Yq94vykTg8BkFXpmmOTkrmynUs/V00VAj18rqqPe9E10UcPWT9Liqrwkt
 mNUP8dqyKCFjAhhcq7cwyPOm2YbLkEOIwXhnS0Kk=
Subject: Patch "i2c: omap: Trigger bus recovery in lockup case" has been added
 to the 4.14-stable tree
To: claudio.foellmi@ergon.ch, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, grygorii.strashko@ti.com,
 linux-mtd@lists.infradead.org, mathieu.poirier@linaro.org, vigneshr@ti.com,
 wsa@the-dreams.de
From: <gregkh@linuxfoundation.org>
Date: Mon, 11 Nov 2019 10:43:33 +0100
In-Reply-To: <20190905161759.28036-18-mathieu.poirier@linaro.org>
Message-ID: <1573465413229221@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_014403_443503_4C62E3F0 
X-CRM114-Status: GOOD (  12.76  )
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

    i2c: omap: Trigger bus recovery in lockup case

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     i2c-omap-trigger-bus-recovery-in-lockup-case.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon 11 Nov 2019 10:07:22 AM CET
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu,  5 Sep 2019 10:17:58 -0600
Subject: i2c: omap: Trigger bus recovery in lockup case
To: stable@vger.kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, linux-mtd@lists.infradead.org
Message-ID: <20190905161759.28036-18-mathieu.poirier@linaro.org>

From: Claudio Foellmi <claudio.foellmi@ergon.ch>

commit 93367bfca98f36cece57c01dbce6ea1b4ac58245 upstream

A very conservative check for bus activity (to prevent interference
in multimaster setups) prevented the bus recovery methods from being
triggered in the case that SDA or SCL was stuck low.
This defeats the purpose of the recovery mechanism, which was introduced
for exactly this situation (a slave device keeping SDA pulled down).

Also added a check to make sure SDA is low before attempting recovery.
If SDA is not stuck low, recovery will not help, so we can skip it.

Note that bus lockups can persist across reboots. The only other options
are to reset or power cycle the offending slave device, and many i2c
slaves do not even have a reset pin.

If we see that one of the lines is low for the entire timeout duration,
we can actually be sure that there is no other master driving the bus.
It is therefore save for us to attempt a bus recovery.

Signed-off-by: Claudio Foellmi <claudio.foellmi@ergon.ch>
Tested-by: Vignesh R <vigneshr@ti.com>
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
[wsa: fixed one return code to -EBUSY]
Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/i2c/busses/i2c-omap.c |   25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -487,6 +487,22 @@ static int omap_i2c_init(struct omap_i2c
 }
 
 /*
+ * Try bus recovery, but only if SDA is actually low.
+ */
+static int omap_i2c_recover_bus(struct omap_i2c_dev *omap)
+{
+	u16 systest;
+
+	systest = omap_i2c_read_reg(omap, OMAP_I2C_SYSTEST_REG);
+	if ((systest & OMAP_I2C_SYSTEST_SCL_I_FUNC) &&
+	    (systest & OMAP_I2C_SYSTEST_SDA_I_FUNC))
+		return 0; /* bus seems to already be fine */
+	if (!(systest & OMAP_I2C_SYSTEST_SCL_I_FUNC))
+		return -EBUSY; /* recovery would not fix SCL */
+	return i2c_recover_bus(&omap->adapter);
+}
+
+/*
  * Waiting on Bus Busy
  */
 static int omap_i2c_wait_for_bb(struct omap_i2c_dev *omap)
@@ -496,7 +512,7 @@ static int omap_i2c_wait_for_bb(struct o
 	timeout = jiffies + OMAP_I2C_TIMEOUT;
 	while (omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG) & OMAP_I2C_STAT_BB) {
 		if (time_after(jiffies, timeout))
-			return i2c_recover_bus(&omap->adapter);
+			return omap_i2c_recover_bus(omap);
 		msleep(1);
 	}
 
@@ -577,8 +593,13 @@ static int omap_i2c_wait_for_bb_valid(st
 		}
 
 		if (time_after(jiffies, timeout)) {
+			/*
+			 * SDA or SCL were low for the entire timeout without
+			 * any activity detected. Most likely, a slave is
+			 * locking up the bus with no master driving the clock.
+			 */
 			dev_warn(omap->dev, "timeout waiting for bus ready\n");
-			return -ETIMEDOUT;
+			return omap_i2c_recover_bus(omap);
 		}
 
 		msleep(1);


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

Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3F7C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:45:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42B3F206C3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:45:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WEoARzzs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4r+LnXP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42B3F206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=d0y3Fd5k9t/dyGrx5tTNCm44f9vDH85PO9RhA71Mghs=; b=WEoARzzs7skpWp
	msxG/OjDxfkTFk8UAvXUJMBU3vCna0gG1aFuiKM0rj1uTQGOau0ZjAzO1MvGd1zPIacMEwAMhbrXT
	ttT878zCfEzjjpDXrs68KdJyS4BmXinm19IZjflI08Ri8CM/5cnRnB70NHLcz1XxGI9wBtA+SDHLe
	2HojRHuXxbj+TQZmCc98hoLdiGWuc+RORmb2v574xnxZ4FxMeZXGvCPkBZQl/lVxlxfsUE6AYH764
	Y/UDTyAaTgC2J2QzsLR4eEz3y2GJKJqbqnHBV7dyFGwFVNF9zKuacChhPCuUqGfgr9ZhL/h0lvyph
	WDGKdH09eVXrTt10JuFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU6GH-0001rn-6g; Mon, 11 Nov 2019 09:45:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU6Ev-0007vG-R6
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 09:44:09 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DABF5215EA;
 Mon, 11 Nov 2019 09:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573465445;
 bh=lFELN/GRbs5XMGM93ekhiE/Zf8Bxp9bKZw2azAoMnJY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=C4r+LnXPXwh67dXpesbz6oCk33+kWxf2tvjx9usguYuvVqwe59rU8tiuj93pnQ3NV
 7DnXErX8AHJXBJIexj/YCoySkoPLR/1B03Zimwc47/Wao2avdGA18PGuiZq0yfz5lX
 e5utT7l9RRRxgEefWbbTXB35y1FRbzpdsTfsNlrw=
Subject: Patch "mailbox: reset txdone_method TXDONE_BY_POLL if client
 knows_txdone" has been added to the 4.14-stable tree
To: alexey.klimov@arm.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jaswinder.singh@linaro.org,
 linux-mtd@lists.infradead.org, mathieu.poirier@linaro.org,
 sudeep.holla@arm.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 11 Nov 2019 10:43:33 +0100
In-Reply-To: <20190905161759.28036-13-mathieu.poirier@linaro.org>
Message-ID: <1573465413247177@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_014405_944198_9E472C89 
X-CRM114-Status: GOOD (  10.72  )
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

    mailbox: reset txdone_method TXDONE_BY_POLL if client knows_txdone

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mailbox-reset-txdone_method-txdone_by_poll-if-client-knows_txdone.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon 11 Nov 2019 10:07:22 AM CET
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu,  5 Sep 2019 10:17:53 -0600
Subject: mailbox: reset txdone_method TXDONE_BY_POLL if client knows_txdone
To: stable@vger.kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, linux-mtd@lists.infradead.org
Message-ID: <20190905161759.28036-13-mathieu.poirier@linaro.org>

From: Sudeep Holla <sudeep.holla@arm.com>

commit 33cd7123ac0ba5360656ae27db453de5b9aa711f upstream

Currently the mailbox framework sets txdone_method to TXDONE_BY_POLL if
the controller sets txdone_by_poll. However some clients can have a
mechanism to do TXDONE_BY_ACK which they can specify by knows_txdone.
However, we endup setting both TXDONE_BY_POLL and TXDONE_BY_ACK in that
case. In such scenario, we may end up with below warnings as the tx
ticker is run both by mailbox framework and the client.

WARNING: CPU: 1 PID: 0 at kernel/time/hrtimer.c:805 hrtimer_forward+0x88/0xd8
CPU: 1 PID: 0 Comm: swapper/1 Not tainted 4.12.0-rc5 #242
Hardware name: ARM LTD ARM Juno Development Platform
task: ffff8009768ca700 task.stack: ffff8009768f8000
PC is at hrtimer_forward+0x88/0xd8
LR is at txdone_hrtimer+0xd4/0xf8
Call trace:
 hrtimer_forward+0x88/0xd8
 __hrtimer_run_queues+0xe4/0x158
 hrtimer_interrupt+0xa4/0x220
 arch_timer_handler_phys+0x30/0x40
 handle_percpu_devid_irq+0x78/0x130
 generic_handle_irq+0x24/0x38
 __handle_domain_irq+0x5c/0xb8
 gic_handle_irq+0x54/0xa8

This patch fixes the issue by resetting TXDONE_BY_POLL if client has set
knows_txdone.

Cc: Alexey Klimov <alexey.klimov@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/mailbox/mailbox.c |    4 ++--
 drivers/mailbox/pcc.c     |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -351,7 +351,7 @@ struct mbox_chan *mbox_request_channel(s
 	init_completion(&chan->tx_complete);
 
 	if (chan->txdone_method	== TXDONE_BY_POLL && cl->knows_txdone)
-		chan->txdone_method |= TXDONE_BY_ACK;
+		chan->txdone_method = TXDONE_BY_ACK;
 
 	spin_unlock_irqrestore(&chan->lock, flags);
 
@@ -420,7 +420,7 @@ void mbox_free_channel(struct mbox_chan
 	spin_lock_irqsave(&chan->lock, flags);
 	chan->cl = NULL;
 	chan->active_req = NULL;
-	if (chan->txdone_method == (TXDONE_BY_POLL | TXDONE_BY_ACK))
+	if (chan->txdone_method == TXDONE_BY_ACK)
 		chan->txdone_method = TXDONE_BY_POLL;
 
 	module_put(chan->mbox->dev->driver->owner);
--- a/drivers/mailbox/pcc.c
+++ b/drivers/mailbox/pcc.c
@@ -266,7 +266,7 @@ struct mbox_chan *pcc_mbox_request_chann
 	init_completion(&chan->tx_complete);
 
 	if (chan->txdone_method == TXDONE_BY_POLL && cl->knows_txdone)
-		chan->txdone_method |= TXDONE_BY_ACK;
+		chan->txdone_method = TXDONE_BY_ACK;
 
 	spin_unlock_irqrestore(&chan->lock, flags);
 
@@ -312,7 +312,7 @@ void pcc_mbox_free_channel(struct mbox_c
 	spin_lock_irqsave(&chan->lock, flags);
 	chan->cl = NULL;
 	chan->active_req = NULL;
-	if (chan->txdone_method == (TXDONE_BY_POLL | TXDONE_BY_ACK))
+	if (chan->txdone_method == TXDONE_BY_ACK)
 		chan->txdone_method = TXDONE_BY_POLL;
 
 	spin_unlock_irqrestore(&chan->lock, flags);


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

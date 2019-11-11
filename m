Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B795C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:44:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ECEC20869
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:44:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ofbyVZ++";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXKraTgH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3ECEC20869
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=iqEidUDEg1LZccKWu/xL0/aBHILry+Q+D2db0YEPVOk=; b=ofbyVZ++JU3RKs
	LyOl19VzHvrVQqo2e8HOBbHKOPaIhZ0uxl60tNimKeJ4AMueryJzOmp8YP4QNds/9GYhQuQlSDtk0
	hoMgLHynGq9LoSXT7mEgn43l+GDHc0V7Ohs9HTqBX+r+FUkzvAvyYpqtNk03BSAOhHQoD246ta9Cm
	70AzPAJArdmdtwtCBNB/6ZwZMcbZfcdXx8p9qcofXRvfPXjyEQRUORCvCr5Pc/k7xYHVonLp5raO0
	OKpIq3PBMBomCVgxf7cPG21mj0HW2f/xZGPoJM5+p8Yf37aEPIlvzjY151wzvBjKjEyuLRjD508J1
	/jbl8ww/t9qIazKGAlfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU6Ed-0007aN-Mg; Mon, 11 Nov 2019 09:43:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU6EZ-0007Zj-M4
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 09:43:45 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 848F22084F;
 Mon, 11 Nov 2019 09:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573465423;
 bh=mvI8onio8pWhi4gIdZko2eouVzWqOUu/cOZeQDF4ans=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=CXKraTgH87xwro6d0vV0I8LK9MKhNFZaMsGFBwE+VkdeVB6OvdXpQiLQ+ZQZC5+Oh
 A0dzl/6MMbXXmUcxxO3u4EuxbygLaPyTAu6eauTjEGNWR+TTLl8Rlc8/GrqyRJ+Qgx
 IwCkBrjN96behI/BDl1NSs7gUfwk3HlWE27iTw84=
Subject: Patch "ASoC: davinci: Kill BUG_ON() usage" has been added to the
 4.14-stable tree
To: broonie@kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, linux-mtd@lists.infradead.org,
 mathieu.poirier@linaro.org, tiwai@suse.de
From: <gregkh@linuxfoundation.org>
Date: Mon, 11 Nov 2019 10:43:32 +0100
In-Reply-To: <20190905161759.28036-16-mathieu.poirier@linaro.org>
Message-ID: <1573465412164225@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_014343_766742_D357B3B3 
X-CRM114-Status: GOOD (  10.18  )
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

    ASoC: davinci: Kill BUG_ON() usage

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     asoc-davinci-kill-bug_on-usage.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon 11 Nov 2019 10:07:22 AM CET
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu,  5 Sep 2019 10:17:56 -0600
Subject: ASoC: davinci: Kill BUG_ON() usage
To: stable@vger.kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, linux-mtd@lists.infradead.org
Message-ID: <20190905161759.28036-16-mathieu.poirier@linaro.org>

From: Takashi Iwai <tiwai@suse.de>

commit befff4fbc27e19b14b343eb4a65d8f75d38b6230 upstream

Don't use BUG_ON() for a non-critical sanity check on production
systems.  This patch replaces with a softer WARN_ON() and an error
path.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/soc/davinci/davinci-mcasp.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/sound/soc/davinci/davinci-mcasp.c
+++ b/sound/soc/davinci/davinci-mcasp.c
@@ -1748,7 +1748,8 @@ static int davinci_mcasp_get_dma_type(st
 				PTR_ERR(chan));
 		return PTR_ERR(chan);
 	}
-	BUG_ON(!chan->device || !chan->device->dev);
+	if (WARN_ON(!chan->device || !chan->device->dev))
+		return -EINVAL;
 
 	if (chan->device->dev->of_node)
 		ret = of_property_read_string(chan->device->dev->of_node,


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

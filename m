Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA55C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:44:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 351E420856
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:44:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XjdNS82S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yCyVHZZE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 351E420856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=EfEsX95148DDxxKqIsmxwt/UHhjYKOj4FHO2L0ozWfc=; b=XjdNS82SFD0Gii
	5zBcuCUf63MdRHLq/4oqwPMJO5agp0Xrdb66ZcVTiZmomfRMHE3i36p+NxiHQ4wPnTA1E6ByUqQhI
	8s+y5d/U2xK+YEm0I3mU2HP1aHgIgWyH5aWASNU1mFbCxozi+A0+KEQQdJJRURXaFUYL8YPtIq1FK
	DIQyE4i4c+yqwyUAnWQj7eA3HKpmH8pepNJzAVZtTUQk77PmszNzegaPsHOLqpq57Dt6L+rxPhHvW
	kENP0cLnvgiOtss026ycY2Oxzd6t+OanC41QxIQ1ONI6UQr4ysk46lj3jNfLb5mcfT1hG1IYVUtse
	r/hPjZELiGHLC52Bn/4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU6Ep-0007mC-Pu; Mon, 11 Nov 2019 09:43:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU6Ec-0007a8-0k
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 09:43:47 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3AC35214DB;
 Mon, 11 Nov 2019 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573465425;
 bh=LN2GfPngDCc5/+o3t8iI7MVS7jkJd4YEDFa37UBDVn8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=yCyVHZZE2I5LI21ie4XZazxtNBUC7/tE9Q7A3oxaeibiJv+gIjM6+82ey+CpjC4z7
 CzOWzAq2dk+C5IHftEpfxLnvICXOM/nroxXQW9Qg1FL5e3tVs3VrvuPTxZmmhCO8V2
 xPTYacW2WWvqdsyCekdjGF6KRt7f4AtdQFtELdYA=
Subject: Patch "ASoC: davinci-mcasp: Fix an error handling path in
 'davinci_mcasp_probe()'" has been added to the 4.14-stable tree
To: broonie@kernel.org, christophe.jaillet@wanadoo.fr,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 linux-mtd@lists.infradead.org, mathieu.poirier@linaro.org,
 peter.ujfalusi@ti.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 11 Nov 2019 10:43:32 +0100
In-Reply-To: <20190905161759.28036-17-mathieu.poirier@linaro.org>
Message-ID: <1573465412169190@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_014346_096876_D2A45E28 
X-CRM114-Status: GOOD (  13.36  )
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

    ASoC: davinci-mcasp: Fix an error handling path in 'davinci_mcasp_probe()'

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     asoc-davinci-mcasp-fix-an-error-handling-path-in-davinci_mcasp_probe.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon 11 Nov 2019 10:07:22 AM CET
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu,  5 Sep 2019 10:17:57 -0600
Subject: ASoC: davinci-mcasp: Fix an error handling path in 'davinci_mcasp_probe()'
To: stable@vger.kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, linux-mtd@lists.infradead.org
Message-ID: <20190905161759.28036-17-mathieu.poirier@linaro.org>

From: Christophe Jaillet <christophe.jaillet@wanadoo.fr>

commit 1b8b68b05d1868404316d32e20782b00442aba90 upstream

All error handling paths in this function 'goto err' except this one.

If one of the 2 previous memory allocations fails, we should go through
the existing error handling path. Otherwise there is an unbalanced
pm_runtime_enable()/pm_runtime_disable().

Fixes: dd55ff8346a9 ("ASoC: davinci-mcasp: Add set_tdm_slots() support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/soc/davinci/davinci-mcasp.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- a/sound/soc/davinci/davinci-mcasp.c
+++ b/sound/soc/davinci/davinci-mcasp.c
@@ -2022,8 +2022,10 @@ static int davinci_mcasp_probe(struct pl
 			     GFP_KERNEL);
 
 	if (!mcasp->chconstr[SNDRV_PCM_STREAM_PLAYBACK].list ||
-	    !mcasp->chconstr[SNDRV_PCM_STREAM_CAPTURE].list)
-		return -ENOMEM;
+	    !mcasp->chconstr[SNDRV_PCM_STREAM_CAPTURE].list) {
+		ret = -ENOMEM;
+		goto err;
+	}
 
 	ret = davinci_mcasp_set_ch_constraints(mcasp);
 	if (ret)


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

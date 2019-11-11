Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E122C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:44:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 007B7214DB
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:44:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CbfkXPuU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCkSalhR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 007B7214DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=tXWYuMDk27bx3yKn39HbYjzG2iaDHpHd9TNLoIS67ak=; b=CbfkXPuUArmCkH
	SxdVrY07rFZ/BaF8QtQqNpGCGrazMN+Igiokbzo6mztF2GULJ15qWXYtVe3BKQDCNEuK44bMRo5gK
	W/uNuMHer02Ms6ro6ywNv0P/o0P198JE61QVRXMLbwi7WnDz+UvjLRsNQhJyJdGe/pDNdp1LcNzfN
	k1vz5DT9pjNw0J5RJcO+9yQIylxrkK/gNIun6xDH8QFbOhD1cnIjBexehjh0gCDqVP92yighVXprb
	bwGzVuv6hkmNfn3mQmY/8BBT+Zsy9nkRJ2PfgL9juoirtoN/rjaPCpfe/khGxs7Y2cqobMAZq43Ft
	wyuwjA8agjnDZfkD8kyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU6FO-0008Kp-82; Mon, 11 Nov 2019 09:44:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU6Ek-0007gC-MH
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 09:43:56 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 543F8215EA;
 Mon, 11 Nov 2019 09:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573465433;
 bh=OZ00ERlg+Jzy4M5ctvbznQzgKhO/B9Pa/arXxMqEvcA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=eCkSalhRnjGUrUXkgfaiUOs3sM9fhFpDshyaNoK7ORYG+qmBQ0jO9gV5t6VU24tDm
 yefBMrfng+2PT0V4gfaH4HaGUUcSGzg+NSc7O9XeUwbyoxKPn04OV9PtZr64FfGSF4
 eDQMDZWM5dSDQsU7rfUaSySlNh2Dw4//6F6ws8kw=
Subject: Patch "cpufreq: ti-cpufreq: add missing of_node_put()" has been added
 to the 4.14-stable tree
To: dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 linux-mtd@lists.infradead.org, mathieu.poirier@linaro.org,
 rafael.j.wysocki@intel.com, viresh.kumar@linaro.org, zumeng.chen@gmail.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 11 Nov 2019 10:43:33 +0100
In-Reply-To: <20190905161759.28036-19-mathieu.poirier@linaro.org>
Message-ID: <1573465413168159@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_014354_826620_523307F5 
X-CRM114-Status: UNSURE (   8.46  )
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

    cpufreq: ti-cpufreq: add missing of_node_put()

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     cpufreq-ti-cpufreq-add-missing-of_node_put.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon 11 Nov 2019 10:07:22 AM CET
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu,  5 Sep 2019 10:17:59 -0600
Subject: cpufreq: ti-cpufreq: add missing of_node_put()
To: stable@vger.kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, linux-mtd@lists.infradead.org
Message-ID: <20190905161759.28036-19-mathieu.poirier@linaro.org>

From: Zumeng Chen <zumeng.chen@gmail.com>

commit 248aefdcc3a7e0cfbd014946b4dead63e750e71b upstream

call of_node_put to release the refcount of np.

Signed-off-by: Zumeng Chen <zumeng.chen@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/cpufreq/ti-cpufreq.c |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/cpufreq/ti-cpufreq.c
+++ b/drivers/cpufreq/ti-cpufreq.c
@@ -205,6 +205,7 @@ static int ti_cpufreq_init(void)
 
 	np = of_find_node_by_path("/");
 	match = of_match_node(ti_cpufreq_of_match, np);
+	of_node_put(np);
 	if (!match)
 		return -ENODEV;
 


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

Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32D7C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 14:51:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BED612072C
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 14:51:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qytLbYQ0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BED612072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IqY38SlimirVoV0HbzmwPcoyA3bQwF6E3SFco5luhbk=; b=qytLbYQ0gc6wUr
	WMAPAYxXKVY7V+jIlEL0aor5rTp1o+2WwKeaE5fmKk+T8h8m2H4V2AYMqWq6eu/+33MLfhqgkHE92
	CoVDYIpZWij2gXjbtl2PRU3kSwzLOzR3XlLuZBWFhH0ZsRIF9+Pr3DRtG4SYGyLLGjdWRkY3S03VF
	SnKfbC/0OnVR54epDjXUMdTuSrjYpZRyV7hAukd+tKDFKdDv7sTRLwAm8Nex9slAZ7Gd3qcRT/Nve
	0lyxkkVvPiwXJlpI17a2lfabepaPVtC9jMHjevF1k2InFsBYsjUmBEoVq/Qcu2U8Ol27knUog5AdZ
	mHt+yD8AeuD4+rpkyIqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbQ3E-0003g7-IJ; Wed, 20 May 2020 14:50:32 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbQ39-0003fI-Iw
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 14:50:30 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8C0A32A26DD;
 Wed, 20 May 2020 15:50:25 +0100 (BST)
Date: Wed, 20 May 2020 16:50:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rickard X Andersson <Rickard.Andersson@axis.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: Add timings for Kioxia TH58NVG2S3HBAI4
Message-ID: <20200520165022.1e241604@collabora.com>
In-Reply-To: <1589985750394.77181@axis.com>
References: <1589981533129.2663@axis.com> <20200520154343.2ce58cc6@xps13>
 <1589984216684.8771@axis.com> <20200520162936.6eb499fb@xps13>
 <1589985750394.77181@axis.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_075029_056888_4A5B4B9D 
X-CRM114-Status: GOOD (  17.14  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 20 May 2020 14:42:31 +0000
Rickard X Andersson <Rickard.Andersson@axis.com> wrote:

> > > If I understand you correctly you want me to use onfi_find_equivalent_sdr_mode in order to find the corresponding onfi mode. Then you want me to use onfi_fill_data_interface and loop towards mode 0 checking which mode the controller accepts? I just thought it was a "messy" to duplicate this code in all vendor drivers.
> > > Or do you mean that I should just use onfi_find_equivalent_sdr_mode to set ."timings.mode" and let nand_base to do the looping in case error is returned from th58nvg2s3hbai4_choose_data_interface (i.e specialized timings not accepted by the controller).  
> >
> > Sorry for the misunderstanding. What I think you should try is:
> > 1/ call onfi_find_equivalent_sdr_mode() to set the timings.mode field.
> > 2/ call nand_controller_supports_data_interface()
> > 3/ if the controller supports the timings, set
> > chip->default_timing_mode accordingly and return 0.

Why do we have to set the default_timing_mode field? Can't we just set
timings.mode directly?

> > 4/ if the controller does not support the timings, you may want to
> > propose other standard timings to test by setting
> > chip->default_timing_mode anyway but returning an error which means
> > "best interface has not been found yet" so the rest of the
> > choose_data_interface() helper will try the remaining ONFI modes
> > automatically (fallbacks to 0 anyway).

Again, I don't see why setting chip->default_timing_mode is needed here,
and I'm not sure trying remaining ONFI modes is useful, I guess we can
just fall back on mode 0 in that case.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

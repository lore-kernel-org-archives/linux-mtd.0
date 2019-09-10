Return-Path: <SRS0=z5Ut=XF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA51C4740A
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2019 14:35:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF38721479
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2019 14:35:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KXxnLPbg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="E1l0FDeU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NNHX+V7a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF38721479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nHnHZtU0njAN2mwmppqhp37rh5I16HxEwo8bKLMUhrc=; b=KXxnLPbgh51kTl
	ZVgDpL7+GcLmBWCEwomPmVHKjaIij6ivxbtMDpqAXKc7JtJKw2Ib0MU/ALmvempib73WlHuXg34Om
	orv6B8evodjdv3aUfbbuNzaGtdr15z5OzEptFTmcL2+7kUCV4OYG3DAgBTeoz+R6PMbWIZRad1rRS
	AEfwC6nNvj+JnZh6SSQ119cyAuS8gmFK41qrRxvSW3O1lkMRubaAMO/m18yZQagePC8ZYGCuyHETz
	W/7mmoXuyIWWE94gzg4U5Tw7Nk2sobm6mbkjcTa34qRZqy/cW7o28Fv5jbj+IdOl8gcUq1OiywPyT
	t/08ZxVpH2/PmNaA9ebg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7hEd-0008FP-7C; Tue, 10 Sep 2019 14:35:11 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7hEZ-000797-H9
 for linux-mtd@lists.infradead.org; Tue, 10 Sep 2019 14:35:09 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2D199258;
 Tue, 10 Sep 2019 10:35:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 10 Sep 2019 10:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Yn2LW5Cn6NDpHwAp8OL/VHEBLuD
 Ea+FvY5tcN4UAkhY=; b=E1l0FDeU0uUFm7pcZuFCt4iz6yOAMuia+vNX5NgkfB9
 OZ+OCRjCjmAheEZ/c0h/S46faHhQNilYVNSjtRKtEaHY/kG/ecQRjLJyA2moFe/m
 QiGLzarjz3ucq0RiMxzat8L+2491N7JAvPBXH5i/on3KZHNI2lQwlnftpgcTIunw
 A2NMpap8CEX7RSvWM0WTG7HhOKYDG79boZ3pcNrA9xmbAaShQHWxTV1aAAcZUyjx
 xXnPucNsfVuZ2moPw5EHpIQCIY/t7qYRleuWKHPRmlKSbgnCLB/7ZJGL/c4QiN1X
 SMJaboUtlK9Z54p+uBTgSHA0yDYE70+fSngiiws5SHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Yn2LW5
 Cn6NDpHwAp8OL/VHEBLuDEa+FvY5tcN4UAkhY=; b=NNHX+V7aLEcSUnQcXHmGE3
 nqfAJ1DZb+GMtyCwjtXktd01OmnSK0LMe3vSOTjBUaGAmSF46McHmEA3ASkbI6mz
 /a7H9PN7qTW/0XsNw2iOX08ic59QTPZhc/VAXM3yORb5oQy1ZG0BW7a7s4EI5o4A
 /YzepHaWkEb181HwyWTWK75/RkLk2p3ZQ4DqHJvdHCtGUCIF3dzUuYI803HJwnw8
 jT18H5KQNk2bDKCwVxOKJO+PNKBMJcHn8B6sFBa90EWFzc5AoRr0afIFIuRBIZlH
 sZLwttpozKF0w0dWRQ9TMqOwO6P5OOkSQC0WP40bhyaPhw7E+0td0sURk7cfXZKw
 ==
X-ME-Sender: <xms:lbR3XeLGvUx4O31kAw2oE1n5l3b6fsed1JR-zVy08lObam-UxyKvhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtddtgdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepvddufedrfedtrdekrdduud
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhenucev
 lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:lbR3XcGSgZBgfUJoxZBU4g8S3NN0RXfw57IHLBKmHhDJsEAasRbyAg>
 <xmx:lbR3XcWakchC9nsJ8YlQPtYqK5DzoQcbNHxshQdTHqBMSbyym-Sh6Q>
 <xmx:lbR3XSMePnZU-G5F6G3_gJC1yDjQfi6DXoXu20hx31ihEJ3K3AB3zA>
 <xmx:lbR3XaV84X5qhBZCloMBm7H7idqNjs0OLhwR7hNP8BIkyQZHYjIeNg>
Received: from localhost (110.8.30.213.rev.vodafone.pt [213.30.8.110])
 by mail.messagingengine.com (Postfix) with ESMTPA id DE087D6005A;
 Tue, 10 Sep 2019 10:35:00 -0400 (EDT)
Date: Tue, 10 Sep 2019 15:34:59 +0100
From: Greg KH <greg@kroah.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [BACKPORT 4.14.y 03/18] drm/omap: panel-dsi-cm: fix driver
Message-ID: <20190910143459.GC3362@kroah.com>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
 <20190905161759.28036-4-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190905161759.28036-4-mathieu.poirier@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190910_073507_643724_49927011 
X-CRM114-Status: UNSURE (   9.11  )
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Sep 05, 2019 at 10:17:44AM -0600, Mathieu Poirier wrote:
> From: Tony Lindgren <tony@atomide.com>
> 
> commit e128310ddd379b0fdd21dc41d176c3b3505a0832 upstream
> 
> This adds support for get_timings() and check_timings()
> to get the driver working and properly initializes the
> timing information from DT.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 56 +++++++++++++++++--
>  1 file changed, 51 insertions(+), 5 deletions(-)

THis looks like a "new feature", right?  Why is this a stable patch?

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

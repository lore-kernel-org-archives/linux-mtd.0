Return-Path: <SRS0=z5Ut=XF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0F6C4740A
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2019 14:36:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DB792067B
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2019 14:36:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bWMcm8Rs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="lkh6dNnA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c3dcJSeZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DB792067B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Kxjp0hgCKygztBSdLZ9XVaL3Z3FLRT86AK9b5rCyW8=; b=bWMcm8RsmCYV4U
	46Jg9wkVMAJI7KRqPGTGuA8pRExS78J6Aos7Unu6+nJZlIyxBPh+Wo4CdX2btJYE33MDRon6pB//j
	BiGyz3cRqK4+Tsch2418cHBwAvgNuAXjMRkEmSNUhnsjDYNZhmOEAdrgPtRUCXQfYQy66Pz4wtvro
	tay6A9Om1FimUG3PWUqRxSckv4KMMMbtpGFlCoV/wPlDcSkL48OEk/3oG9iybbedORe/rmNIDLfur
	oqG5kVXA64GE5V/Gy3f2I0WAwr0+G1r5ZH5cWDEGQOTfkM00O942jk8tCGq8WeW4Pp2ybxNd8uRU5
	U8mInu6eq7SIyUeXGzzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7hFX-0008Tt-SB; Tue, 10 Sep 2019 14:36:07 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7hFV-0008Tb-OK
 for linux-mtd@lists.infradead.org; Tue, 10 Sep 2019 14:36:07 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 5B83D39D;
 Tue, 10 Sep 2019 10:36:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 10 Sep 2019 10:36:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=CTpkFiirlhlfJdSOyJ+gt7DX6Cy
 zDZ62hzOsET0mhbo=; b=lkh6dNnA3YhMT+NXx0V2JjxLY7ygwA858KG/TNG82FR
 l+c0YziEnMJXolVI1m9Y06jNivfKgKPI8B5Z1Y+JDXa6H/7UpdPydIVoHGpBukhR
 ndb0uDrrTUgJ5pxvb71eV6p84+TdYDaXvm1vuS4zOpwo1uxsoIn3tITv9TsKBsYV
 VyaJR/07WM0YbsPuBfofcizQp0dqsI44yjNfRggE7QnC7t8sD2WE492HDr0AbPDe
 sBj0rD8VzwPtv9vPpQmVlXSpH6EZPsgL8PLcj6PF8WjlULjFtwSyg1hFXBEeM1C2
 VEn3ytXGUkxKgPU316VxQwhqw2NOgULhGe2K5XRKVMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CTpkFi
 irlhlfJdSOyJ+gt7DX6CyzDZ62hzOsET0mhbo=; b=c3dcJSeZEG1PqPZAbXtE0N
 1hRnC1pV4ZOMXbarctoPPUYS6zQdxGjFCmkKR7SV3892oLJRuujtuPjVlJd3vYoR
 Tl0rRjQK5Z0767L/PL78VlNvbWzCq45ioIR6PJ94Ux1t9IehrxP7WXZAGTGfAmxT
 wyw1lRpBTBKRl1LjlmkfR0svmvb6sfMg7bJd35/rZvkvEa+gMuTAeIcFy0aHHTHH
 XbyOH7BEnAWNwfuvy/qmcat6Cy2odTuoB7D8n+Rm+EHWmNyeYcHvUzOs8R5/Kw9a
 wUKl0hlaM92sOQpE/P9CLHq0OSbcUEBL2kBGfPmSS/hnbgmK+LHJhh83b9bizGsw
 ==
X-ME-Sender: <xms:07R3XYD3YvM0uVfjzS-sGVIlJ-VEfMYImfUF4DfbjfRAkK5c6FdbGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtddtgdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepvddufedrfedtrdekrdduud
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhenucev
 lhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:07R3XSozf-BdWF6nTSVNcofSfTsb1ymwvCRI7MjgdeeQWELQCvza-g>
 <xmx:07R3XbGScT5vv2mtk8uqx05QhjRKJ3sB8gWwFrQRQPpWTItLm4zxuw>
 <xmx:07R3Xev5vKvi9esoDJ0xfA1WnYASLl26F-ek7FWORmfLhS4q65OXPw>
 <xmx:1LR3XaYlSxd1KG3afAJf4xBB2ytd8KUbFayK_ZPrdno8OoI8FrYJVg>
Received: from localhost (110.8.30.213.rev.vodafone.pt [213.30.8.110])
 by mail.messagingengine.com (Postfix) with ESMTPA id F1F8D8005C;
 Tue, 10 Sep 2019 10:36:02 -0400 (EDT)
Date: Tue, 10 Sep 2019 15:36:01 +0100
From: Greg KH <greg@kroah.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [BACKPORT 4.14.y 04/18] usb: dwc3: Allow disabling of
 metastability workaround
Message-ID: <20190910143601.GD3362@kroah.com>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
 <20190905161759.28036-5-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190905161759.28036-5-mathieu.poirier@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190910_073605_829170_2D3D2459 
X-CRM114-Status: UNSURE (   8.91  )
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

On Thu, Sep 05, 2019 at 10:17:45AM -0600, Mathieu Poirier wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> commit 42bf02ec6e420e541af9a47437d0bdf961ca2972 upstream
> 
> Some platforms (e.g. TI's DRA7 USB2 instance) have more trouble
> with the metastability workaround as it supports only
> a High-Speed PHY and the PHY can enter into an Erratic state [1]
> when the controller is set in SuperSpeed mode as part of
> the metastability workaround.
> 
> This causes upto 2 seconds delay in enumeration on DRA7's USB2
> instance in gadget mode.
> 
> If these platforms can be better off without the workaround,
> provide a device tree property to suggest that so the workaround
> is avoided.
> 
> [1] Device mode enumeration trace showing PHY Erratic Error.
>      irq/90-dwc3-969   [000] d...    52.323145: dwc3_event: event (00000901): Erratic Error [U0]
>      irq/90-dwc3-969   [000] d...    52.560646: dwc3_event: event (00000901): Erratic Error [U0]
>      irq/90-dwc3-969   [000] d...    52.798144: dwc3_event: event (00000901): Erratic Error [U0]

Does the DT also need to get updated with this new id for this?  Is that
a separate patch somewhere?

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

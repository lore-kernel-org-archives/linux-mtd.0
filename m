Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F21C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:16:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 958D020674
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 09:16:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uBZmjy/B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="QL7E7y/E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bDztKrrA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 958D020674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4RcRqx49gg7VZrLF1gqJEgKwx1+oK48ReVlnaPMUyI=; b=uBZmjy/Bd7cE58
	zKMefksSxKBlggq45ymYAOkhy6sBl1mNtrovJdcmlweW2wMdEME7yUBBsqbiOtHhpBisVwXykTqTG
	shM/9YDF6/Dkzu6XLkdwQUiF+eJAWvkoPIcY3ECURB6/mOWisRBKqU/sOObEmAZuZ7xZPM5Jw0NRU
	vjzMOUBM7IRHkIIbKYSURCSHESGYftdHgQx4yrdmo4cj+XFWIk47UaWlXs1Dy0KnIwGN0wX4IdQ6f
	B1LwuLIpHiYQ8hVQei/zVuHVL6L8OMNy4YCQ1sHFWOtg4wmscWK6ZgvL2gIE50/N8ljq5h2vomA9x
	lPjKif8n7F9Kxflw5A7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU5oN-00064c-GG; Mon, 11 Nov 2019 09:16:39 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU5oK-00062v-QE
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 09:16:38 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id D10C34BB;
 Mon, 11 Nov 2019 04:16:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 11 Nov 2019 04:16:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=767pSBRJ5shuYMbgPGJ/NNfiJLw
 uGxahyROFUAPFCyc=; b=QL7E7y/EkKZiIaXtSdO5xlErh7sWmESOBvYArr7CVfp
 eQzc3UERDa9ID9hdy2lFIlSKG6qxAErTf3njeANYlVShDy6UuKgA7ijVOvSazPcr
 g3wjoXv9ZEYeqkbXvf0xTRSWRhXoa1JYrOQt2QjNXGY0UjKrpaPoCwunhc7kKjpb
 /frGGcTi8OBPNTf8rvHE3WO9zkj3pDCRuchNBLsC22DpVKVMK6qSAL+QAJF0ZvId
 utlEu3dYSA+MdZeJj/OfIlrYwLTu+kHwKlBxe0T/sjFJirwbVVtvZg9tz2skBtgb
 uIRhrA1vAjindtTZDdMuPzbNunRo9atznS0r8/pQOhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=767pSB
 RJ5shuYMbgPGJ/NNfiJLwuGxahyROFUAPFCyc=; b=bDztKrrAvA8V+7wLK3MLVe
 m8W/bcOJD8KxIyKB8OkXlQb0Y3RFA6OsgJx61wa5oIIG5+hDfQVPgsl7LWhb0p/+
 CT+mslvrBRj7y02GVeqDbQxbQquw6kAu7SXKQrHIr36J5XLqTphRRnaHX2zJKrLw
 3Du7MBVCEO7FZh58iviSUnQ9aA2j/QYYn9KDTo4a3JdK/+Z3yrKKPdciuyhU5crQ
 3LWP5KfWvJZ4dxW4zBxAXjNSxkKfjlqolNIGNH/8oH88a1nWMsEoD8yWATMpcd8X
 A+gaQo3VAbFQXhxOkPn9ubd42Yyj/3VBXnDOW/SoYSsYkQGIgiRVKAFeL6ey8jVw
 ==
X-ME-Sender: <xms:6ybJXeu0x1QJJObgsILvHQe3sOcXCVOvVrYyrT1UytIqV59h2uVRsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvjedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledrud
 dtjeenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmnecu
 vehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:6ybJXZfJyvDt3neyds_yxO2il2OqimVf6hPU5EQM6QAV3J2PtmykCA>
 <xmx:6ybJXXZ18rQyPBzQhbADNALFi019tBRuNUERxXgmFmzdQVC9g2o3Ww>
 <xmx:6ybJXUVQZqXp4-UBlASkwi0BVT8d-IaH2XgMqMnhdOezzcBG0xRdbg>
 <xmx:7CbJXe0xMG9EQdfRsehkw-9hE_MmqmKB8aUY2nxGKil6KH1KfHK83w>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0FF8F3060060;
 Mon, 11 Nov 2019 04:16:26 -0500 (EST)
Date: Mon, 11 Nov 2019 10:16:24 +0100
From: Greg KH <greg@kroah.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [BACKPORT 4.14.y 04/18] usb: dwc3: Allow disabling of
 metastability workaround
Message-ID: <20191111091624.GA4139389@kroah.com>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
 <20190905161759.28036-5-mathieu.poirier@linaro.org>
 <20190910143601.GD3362@kroah.com>
 <CANLsYkwkq2fLWsGXHxr2tSBLHdfe4JXgu8ehuD1FOEQeDAPNnA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANLsYkwkq2fLWsGXHxr2tSBLHdfe4JXgu8ehuD1FOEQeDAPNnA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_011636_889120_D713D4B7 
X-CRM114-Status: GOOD (  13.38  )
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
 linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 "# 4 . 7" <stable@vger.kernel.org>, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Sep 11, 2019 at 08:01:40AM -0600, Mathieu Poirier wrote:
> On Tue, 10 Sep 2019 at 08:36, Greg KH <greg@kroah.com> wrote:
> >
> > On Thu, Sep 05, 2019 at 10:17:45AM -0600, Mathieu Poirier wrote:
> > > From: Roger Quadros <rogerq@ti.com>
> > >
> > > commit 42bf02ec6e420e541af9a47437d0bdf961ca2972 upstream
> > >
> > > Some platforms (e.g. TI's DRA7 USB2 instance) have more trouble
> > > with the metastability workaround as it supports only
> > > a High-Speed PHY and the PHY can enter into an Erratic state [1]
> > > when the controller is set in SuperSpeed mode as part of
> > > the metastability workaround.
> > >
> > > This causes upto 2 seconds delay in enumeration on DRA7's USB2
> > > instance in gadget mode.
> > >
> > > If these platforms can be better off without the workaround,
> > > provide a device tree property to suggest that so the workaround
> > > is avoided.
> > >
> > > [1] Device mode enumeration trace showing PHY Erratic Error.
> > >      irq/90-dwc3-969   [000] d...    52.323145: dwc3_event: event (00000901): Erratic Error [U0]
> > >      irq/90-dwc3-969   [000] d...    52.560646: dwc3_event: event (00000901): Erratic Error [U0]
> > >      irq/90-dwc3-969   [000] d...    52.798144: dwc3_event: event (00000901): Erratic Error [U0]
> >
> > Does the DT also need to get updated with this new id for this?  Is that
> > a separate patch somewhere?
> 
> The upstream commit is:
> 
> b8c9c6fa2002 ARM: dts: dra7: Disable USB metastability workaround for USB2
> 
> Should I just send the latter or you prefer a resend with both patches?

I've queued this up now, along with the rest of this series, thanks.

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

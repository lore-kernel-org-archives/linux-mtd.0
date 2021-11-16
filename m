Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D61C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 14:21:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72A7E61502
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 14:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 72A7E61502
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j3E3zXBNBfPeh+YJu6UfGXTUR6lHrbSh1YwhZsYJo1s=; b=ciAMgUjBUg0k5b
	L+mzVe0T2uy118RFEeoYxi+qMPxfKeHGiMeY7EO54U6wf+Gy8PP9AIQ/zKiQmySjZadQs6l2Fs3ar
	WutzF2NbkuEIFni0b1YSscmJUoeaJkfYcmPqMQUfm10xj5aJ+7XC/dU4+Uq/sXGFaVQGbNaoW+6Xt
	Qj6vEjeOxgEQL3kSTK9t4voCuV+3xC/dyqbRP+6l3bAR+JgSev1tA7LvJ304Bho3OixDCt0gp0vZR
	AZGO2yJ+1L0cj07E6bBzQ8AV1vmpaFLUs9/0DJ4EV54f0yeBoiS6j4yKYpMfjQXA2UKxxuX8hwN/X
	vcIkp5lx5nnS39sImc/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmzK4-001saq-0R; Tue, 16 Nov 2021 14:20:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmzK1-001saM-Cp
 for linux-mtd@lists.infradead.org; Tue, 16 Nov 2021 14:20:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65FE261502;
 Tue, 16 Nov 2021 14:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1637072429;
 bh=Q20/g1l8rwfLVJucsg0fsXG7lkYQoLbtbOKw8Cy6Wn0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qADXFzDwg9EW9wLcTrtUHzWXjLxmsdUkga0I4W3t+MTAQ3ikfHGNlOUnlYaars6ID
 Xpjfgd0pEt+aTx/WCvXBbxtfTK16YV0hYvBqYUE+wSVh7H3ZBbc9/jZHOgKFLBuCQt
 GErLyMDwwaGObxBDjnLipH8mF6JiZ3xovAWxsJEQ=
Date: Tue, 16 Nov 2021 15:20:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kumaravel.Thiagarajan@microchip.com
Cc: lee.jones@linaro.org, Pragash.Mangalapandian@microchip.com,
 Sundararaman.H@microchip.com, axboe@kernel.dk,
 linux-block@vger.kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 LakshmiPraveen.Kopparthi@microchip.com
Subject: Re: Reg: New MFD Driver for my PCIe Device
Message-ID: <YZO+KktO3OhDEtlq@kroah.com>
References: <CH0PR11MB5380F5BD18F15014BA8B8479E9919@CH0PR11MB5380.namprd11.prod.outlook.com>
 <YYkEP62JRb4rCuXQ@google.com> <YYkGkEiPb+6J62hn@kroah.com>
 <YYkJsbbHH6wdPvB9@google.com> <YYkR/szsDirtj1FP@kroah.com>
 <CH0PR11MB5380791976D5837E024D5679E9999@CH0PR11MB5380.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5380791976D5837E024D5679E9999@CH0PR11MB5380.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_062029_500748_EDF17E6D 
X-CRM114-Status: GOOD (  14.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 16, 2021 at 11:34:24AM +0000, Kumaravel.Thiagarajan@microchip.com wrote:
> Dear Greg K-H & Lee Jones,
> 
> Thanks for your inputs and I need more of your help to understand things better.
> 
> I took this MFD route not just based on the recommendation from Linus Walleij but also based on the kernel documentation @ /Documentation/driver-api/driver-model/platform.rst which states as below.
> 
> "Rarely, a platform_device will be connected through a segment of some other kind of bus; but its registers will still be directly addressable."
> 
> I visualized these two (GPIO controller & OTP/EEPROM controller) devices as platform devices present on the same PCI function and these two devices are not detectable unless the base PCI function driver enumerates them and anyway their registers are directly addressable.
> Hence, I thought that the platform driver architecture is inclusive of devices like this.

Sorry, but no.  Again, platform devices are ONLY for actual platform
devices, not "things on a device that happens to be on another bus
device".  Like PCI devices.

That is what the auxiliary bus code was written for, please read
Documentation/driver-api/auxiliary_bus.rst for how to use it.

> Please let me know your comments.
> 
> Also please let me know if I can talk to any of you over a webex call to get clarifications on my further doubts.

Email works best, video chats for every patch review does not scale at
all :)

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

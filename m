Return-Path: <SRS0=0QAq=P3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4A5C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 11:15:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15DE161350
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 11:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15DE161350
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2VfhyZ7y15M8BjSnXjhRI8efLFNmA2gnB6y99xtW5A=; b=grOrxIc21qTjWK
	LuSarUKMEEj1V1hMCMOu22XNpEM1FdVdXfj7i8pvsEJp44CTCmXwQRFyfDdBzTAiEWOkhLGaVm2sQ
	/NyCpCdFoRqx5YUZaUGGPgUR1XCj8hXF/m8AUVN34311bFJVTQAu6dDNa+Ec03vdLZULtZehvtNUs
	/IOUwJFyMLeTRL/uvwJqwfo+1wHFTETx+e/bzEcF4dj1nedQFxZhxx8PwId0WcLcsjJO1pZ9KYPWQ
	fLhENO7dGdyr4eYZVEgEWwOHuP5gNAy/QAG5WZxzOCpw9zKZmdGUT1fWvRI8uzr3R3kCfZeuAEdW5
	3XbJ3J1IQeWUrxhOya7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk2bk-00GFqT-0k; Mon, 08 Nov 2021 11:14:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk2bg-00GFpA-Uv
 for linux-mtd@lists.infradead.org; Mon, 08 Nov 2021 11:14:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 374566101C;
 Mon,  8 Nov 2021 11:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1636370071;
 bh=qGAdeBQMkx/3cqepXuYISBgQJmXLDOOoCO8r0hQIXXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2Wcftaejl53wnWzsJMcQWv7LUoFmdx8TnuXeBs1YCSIl2TNl9mXdFlK2NoT+xcsV5
 ROA/D8c4IwzWvdwdJv0G0DgbQr33sv1KlROd1gpnU/YRRVzbtzbmnGdhissEsseKlc
 AC6isYkr06GlwvZm0OX/TJPYjxcS8vbpMSQqUXIw=
Date: Mon, 8 Nov 2021 12:14:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Kumaravel.Thiagarajan@microchip.com,
 Pragash.Mangalapandian@microchip.com, Sundararaman.H@microchip.com,
 axboe@kernel.dk, linux-block@vger.kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org
Subject: Re: Reg: New MFD Driver for my PCIe Device
Message-ID: <YYkGkEiPb+6J62hn@kroah.com>
References: <CH0PR11MB5380F5BD18F15014BA8B8479E9919@CH0PR11MB5380.namprd11.prod.outlook.com>
 <YYkEP62JRb4rCuXQ@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YYkEP62JRb4rCuXQ@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_031433_066108_3A093EF0 
X-CRM114-Status: GOOD (  14.00  )
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

On Mon, Nov 08, 2021 at 11:04:31AM +0000, Lee Jones wrote:
> On Mon, 08 Nov 2021, Kumaravel.Thiagarajan@microchip.com wrote:
> 
> > Dear Lee Jones,
> > 
> > I am Kumaravel Thiagarajan from Microchip, India and I am new to Linux Kernel development.
> > 
> > I am currently working on linux kernel driver for one of our PCIe based devices whose BAR 0 maps interface registers for a gpio controller, an OTP memory device controller and an EEPROM device controller into the host processor's memory space.
> > 
> > Based on earlier inputs from Linus Walleij, I have developed this as a multi-function device driver - First MFD driver (drivers/mfd) gets loaded for the PCIe device and then it spawns two child devices for OTP/EEPROM and GPIO separately.
> 
> You may wish to speak with Greg about your architectural decisions.
> 
> He usually dislikes the creation of platform devices from PCI ones.

Yes, that is NOT ok.

Platform devices are only for devices that are actually on a platform
(i.e. described by DT or other firmware types).  PCI devices are NOT
platform devices, please use the correct apis for this instead (i.e. the
aux bus)

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

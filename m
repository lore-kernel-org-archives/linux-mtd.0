Return-Path: <SRS0=0QAq=P3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70993C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 12:03:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 399EB611C0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 12:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 399EB611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oAAXEpir3wPTkocOrLD4jJFScBlUdyTspAHEdsatoBw=; b=AB4RVXhY+ug4m1
	ByWZrQx0srXY4TK/edpGdYI7pJ9ex/L7XWSOh0jfHnLt/eNYn6hi6XYidkq5eQ8zWn9cfcihmK4vh
	XMdd4PTY6w7BcIvjwefv6V1u1MPQMmB7Fc4KImR1hBsag3th9X5hpKF1U3S4RurvMtZqPqLcdMUfZ
	Yu/aZhzgBmtz6kllJLXh4MQdxOx4RwQi6Ez3DDGD0kvEtaATOEgB3iYgv1sasTq8oQEfATJ91Pnp0
	HVKRMQ9yNGQ2q3kqqkWwlSmpt1kMYD+Qa4IDBc88MO7vRwMO1i26+ijHJY0TW7RhscE0r34bpzK2A
	IoqN9HIIhb0eVfY9UOYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk3Mq-00GLws-Sq; Mon, 08 Nov 2021 12:03:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk3Mo-00GLwJ-JR
 for linux-mtd@lists.infradead.org; Mon, 08 Nov 2021 12:03:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1FBA1611C0;
 Mon,  8 Nov 2021 12:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1636372993;
 bh=iUquAhK1pe6WbCgNnyN0FkZoVabpGTyRukbbNwh8Ics=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=y6zI3G9dq6IwJdQXThAO6mGGpwKucH6IDfn9LTiIY39bPb2D7bsOKHuoEl6LAn39F
 gUQOY83+OShPjZZaCZY3VmL3lZimX4A2/bNzx0YjdsyycJsGid/X2YaAzPrc+58qfX
 VM/INvaaJ6CbILWI8JpAAjZcWwi+VnVue2Kbytv8=
Date: Mon, 8 Nov 2021 13:03:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Kumaravel.Thiagarajan@microchip.com,
 Pragash.Mangalapandian@microchip.com, Sundararaman.H@microchip.com,
 axboe@kernel.dk, linux-block@vger.kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org
Subject: Re: Reg: New MFD Driver for my PCIe Device
Message-ID: <YYkR/szsDirtj1FP@kroah.com>
References: <CH0PR11MB5380F5BD18F15014BA8B8479E9919@CH0PR11MB5380.namprd11.prod.outlook.com>
 <YYkEP62JRb4rCuXQ@google.com> <YYkGkEiPb+6J62hn@kroah.com>
 <YYkJsbbHH6wdPvB9@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YYkJsbbHH6wdPvB9@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_040314_697499_434C46D3 
X-CRM114-Status: GOOD (  19.11  )
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

On Mon, Nov 08, 2021 at 11:27:45AM +0000, Lee Jones wrote:
> On Mon, 08 Nov 2021, Greg KH wrote:
> > On Mon, Nov 08, 2021 at 11:04:31AM +0000, Lee Jones wrote:
> > > On Mon, 08 Nov 2021, Kumaravel.Thiagarajan@microchip.com wrote:
> > > 
> > > > Dear Lee Jones,
> > > > 
> > > > I am Kumaravel Thiagarajan from Microchip, India and I am new to Linux Kernel development.
> > > > 
> > > > I am currently working on linux kernel driver for one of our PCIe based devices whose BAR 0 maps interface registers for a gpio controller, an OTP memory device controller and an EEPROM device controller into the host processor's memory space.
> > > > 
> > > > Based on earlier inputs from Linus Walleij, I have developed this as a multi-function device driver - First MFD driver (drivers/mfd) gets loaded for the PCIe device and then it spawns two child devices for OTP/EEPROM and GPIO separately.
> > > 
> > > You may wish to speak with Greg about your architectural decisions.
> > > 
> > > He usually dislikes the creation of platform devices from PCI ones.
> > 
> > Yes, that is NOT ok.
> > 
> > Platform devices are only for devices that are actually on a platform
> > (i.e. described by DT or other firmware types).
> 
> This is probably a bit of an over-simplification.  Lots of legitimate
> platform devices are actually described by DT et al.

We are in violent agreement here, that is what I was trying to say :)

> However, it is true that devices which reside on definite buses; PCI,
> USB, PCMIA, SCSI, Thunderbolt, etc should not spawn their children off
> as platform devices.

Agreed, that is not ok, as those are not what the platform device code
was designed for.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

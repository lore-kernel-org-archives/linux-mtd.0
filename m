Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED1CC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 12:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnX+ZkhSEWyJYfj7F+k8FRNZYCtEy3Yx0ai5pFXzhkU=; b=CC8nfMwA6n18zWLfEh9kcbcvHL
	cVeO3fOWDAQV+fuVJ6IMSREXgNidv3aLkE3DL79lE5hIQIvf4Z4Xw07FSrw2Y8Vdsr+5fpvr3dish
	jsUVGEHsrzApGxE1WoJAPeEiNLm80XcktitrckinsvxC3mmWhCqFsxCZu19FpU3gi00YoN94dDDSW
	lSwe2ezC0y9xXLRO8fwZsa+ivskx5F6GaDglI5OR9QiNrYFx7UFuNeVEaAtnjuWzNXlJcUeHdc18N
	m8OaifJHce+eSrCebk/IN1DGSMdBUFsEYezeS9D6nju1P566Yv5woFNAl7WfM4kMx5PtZqLkRExhe
	sMK2ki4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt6iv-003viR-Fe; Mon, 23 May 2022 11:59:45 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt6Bi-003gMW-Fn
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 11:25:28 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 61A882223A;
 Mon, 23 May 2022 13:25:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1653305118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bsXq3th7KqpBvPTEbSWU6wXjcgL9YnnmXPhc+v/K/h4=;
 b=rwIFeJ5bAtimtL42sR4L5KB9hlq0ZYeY0eBYD4mmSfA6AnR2fL3qds3NkJyNhwkxmQaXIE
 dZWeRzb4f5/OwjeD1WFK1d/Jr1mMyEqmqTrgBmcUcP880Y0q7S1BEU5ThREYuHUc4Q412K
 abGZxDI0lFp10gGOBsZLV1NQkRe4eqk=
MIME-Version: 1.0
Date: Mon, 23 May 2022 13:25:16 +0200
From: Michael Walle <michael@walle.cc>
To: Paul Barker <paul.barker@sancloud.com>, linux-integrity@vger.kernel.org,
 linux-security-module@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Stuart Rubin <stuart.rubin@trustiphi.com>
Subject: Re: Sending vendor specific commands to spi-nor flash
In-Reply-To: <821b7140-abb0-17d2-4aab-07247a250e9c@sancloud.com>
References: <416958ee-c2df-0981-8c77-298561d09381@sancloud.com>
 <418e465f5156adb340976bac209539f8@walle.cc>
 <821b7140-abb0-17d2-4aab-07247a250e9c@sancloud.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9b85e0336f11fc6d4aa66f991ce9b9a9@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_042526_917680_2E769F2A 
X-CRM114-Status: GOOD (  43.77  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

[+ linux-security-module, linux-integrity, sorry if these are the
wrong MLs, but I don't have any experiences with crypto]

Am 2022-05-23 12:02, schrieb Paul Barker:
> On 23/05/2022 09:31, Michael Walle wrote:
>> Am 2022-05-18 14:32, schrieb Paul Barker:
>>> We're looking to add support for sending vendor specific commands to
>>> Micron Authenta flash devices over the SPI bus.
>> 
>> Please elaborate a bit more on the use case. Is this something 
>> specific
>> to the flash or is it more of a general feature?
> 
> The Authenta flash devices support two groups of vendor-specific 
> commands:
> 
> 1) "Advanced Sector Protection" commands, common to several Micron
> parts. These include volatile & non-volatile lock bits, password
> protection and a global freeze bit.

Parts of that isn't really specific to Micron, is it? Sounds like
a per sector locking. AFAIR Tudor was working on advanced sector
protection.

> 2) "Authenticated Core Root of Trust for Measurement (A-CRTM)"
> commands, specific to Authenta flash devices. These include
> authenticated write operations where the data to be written must be
> signed with a cryptographic key and measurement operations which allow
> remote attestation of the contents of the flash. These features
> interact with the cloud-based Authenta Key Management Service (KMS)
> provided by Micron and user-controlled cryptographic keys can also be
> supported for these devices.
> 
> To make use of these features vendor-specific commands are sent to the
> flash device. We expect to send these commands during the boot process
> and during the process of securely deploying a new software image to
> the flash device.
> 
> Brief information on the Authenta features is available as a PDF [1].
> 
> [1]:
> https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/mt25q_a_crtm_rpmc_addendum_rev_1_6_brief.pdf
> 
> 
>> 
>>> Since we're using the
>>> MTD block interface to support a filesystem on the SPI flash we need
>>> to send these vendor specific commands via some sort of IOCTL.
>>> 
>>> I can see a couple of ways to achieve this (as follows) and would 
>>> like
>>> to get some feedback from the MTD & spi-nor maintainers on which
>>> approach is preferred:
>>> 
>>> 1) Add new IOCTLs to the mtdchar device to support these vendor
>>> specific operations. An initial set of patches was sent back in
>>> October 2021 which took this route [1], but no further progress was
>>> made. The new IOCTLs would exist for all mtdchar devices (regardless
>>> of vendor) if we go this route and we'd need to ensure -EINVAL or
>>> -ENOTSUPP is returned as appropriate if these IOCTLs are called on a
>>> device which does not implement them.
>>> 
>>> 2) Add a vendor-specific IOCTL layer to the mtdchar device interface.
>>> When the mtdchar IOCTL handler is called with a command not defined 
>>> in
>>> mtdchar.c, pass the call on to a device-specific IOCTL handler which
>>> can potentially handle vendor specific commands.
>>> 
>>> 3) Add a generic SPI transfer IOCTL for spi-nor MTD devices. This
>>> would avoid the need to define IOCTLs for every vendor specific
>>> command supported by SPI flash devices. Instead, knowledge of the
>>> vendor specific commands would be kept in userspace and the kernel
>>> would simply provide an API for sending & receiving arbitrary bytes
>>> over the SPI bus. This is similar to the MMC_IOC_CMD IOCTL supported
>>> by the MMC driver.
>>> 
>>> My preference would be for option (3) since it minimizes the scope of
>>> the changes we need to make in the kernel. We're not tied to this
>>> though, so let us know if a different option is preferred.
>> 
>> I'm not sure we should allow a generic "issue anything to the spi
>> flash". It it is just a one time thing, like for example, program
>> a password during production, or program non-volatile memory during
>> production of the board, I'm fine with it. Most probably, calling
>> that ioctl will also call add_taint(). This will also need to go
>> with proper userspace util support.
>> 
>> But if it is something for general use, please provide a proper API
>> and don't write userspace drivers.
> 
> I've been looking at how the eMMC/SD and NVMe drivers support passing
> through vendor specific commands using MMC_IOC_CMD for eMMC/SD and
> NVME_IOCTL_ADMIN_CMD/NVME_IOCTL_IO_CMD for NVMe. Neither of these
> ioctl handlers appear to call add_taint().

I don't know the use case for MMC/NVMe, but until you convince me
otherwise, I see "sending raw commands to the SPI flash" as something
exceptional, and thus you'd taint the kernel.

> For A-CRTM operations, in our current use case the command bytes to be
> sent over the SPI bus to the flash device are sent from a cloud-based
> service to a userspace agent on the device. The agent simply needs a
> way to pass these command bytes over the SPI bus to the device and
> retrieve the sequence of response bytes to send back to the
> cloud-based service. For this we could use either a generic SPI
> transfer IOCTL or a Micron specific A-CRTM command IOCTL.
> 
> For the Advanced Sector Protection commands we can add IOCTLs for each
> command if that's the preferred approach. The command list can be seen
> on page 35 of the datasheet for the MT25QL02GCBB spi-nor flash device
> [2] and on other Micron flash device datasheets.

This doesn't sound like a proper abstraction to me. Again, the per
sector lock protection should be integrated into the current locking
ioctls. Regarding the security commands, I'm afraid I can't help
you on that point, but it sounds like bypassing the kernel is the
wrong thing to do.

-michael

> 
> [2]:
> https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_l_02g_cbb_0.pdf
> 
> We're happy to look at extending libmtd and/or mtd-utils to wrap any
> IOCTLs added to the drivers. Would that provide the proper API you're
> looking for?
> 
> Thanks,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

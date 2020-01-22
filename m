Return-Path: <SRS0=3Meg=3L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEF3C2D0DB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 12:46:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C4802467C
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 12:46:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bNnJm6h7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="uemOHiP0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C4802467C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5+Ou2PX7VyzXBrv4Q6dIALQDUYeDDQsR2Z3v0zJLma0=; b=bNnJm6h7dSP74xjckVnxMr8vd
	6C5L/xvKiPeTld5lx7d+fL16TGPqskTQj5wPsiCidzuMOG7BxG3Q7oNBdqNN5RvcOWvpG+73CLsVZ
	ngJbMtW3H/nqJxSAaT8r9Juecch1Y/mXkJnkr+n5H7LazcRHTB6ETThu+QawNJVYAwqdtElKoAmjd
	mFxz9ozB9P/11uNu1MVZqHy+j84n03qqi8wnI7BsYV3CxDqDtkdrGEjU6PVYcLvGLYXUFHDJCDKSr
	w8kI7l+wEvuQZzMgWbdx+B+UL0y5EM/EVyWoHJSMmwbeFoZa1ZdcwSpmnQmTO5MNdZN1tFEwulPP7
	FpL6zAhRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuFOM-0001t9-6J; Wed, 22 Jan 2020 12:45:54 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuFNK-00086l-2c
 for linux-mtd@lists.infradead.org; Wed, 22 Jan 2020 12:44:53 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id AAB6223061;
 Wed, 22 Jan 2020 13:44:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1579697085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c8glKPE3mtcxWK7EcKAqhmptjvy0DHsDGU/Oht3Gsm0=;
 b=uemOHiP0AM6jmU+xGLo1O55NL1lMnlXQvHkkaSrvJqMXFsxNAFCY9lIY08vBboWgZP8b6h
 zPFuoPjQGE219HHheFPmyKuIW8Ed1IwCsT3E0XiA2yJNXlKeCyMgc1sKvsmLx5jlGdTgRZ
 ShQjYvvJVlkUycCAIUfZOfHtFbLbsxI=
MIME-Version: 1.0
Date: Wed, 22 Jan 2020 13:44:44 +0100
From: Michael Walle <michael@walle.cc>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: spi-nor: keep lock bits if they are non-volatile
In-Reply-To: <990b9b16-36e5-ce73-36c7-0ebfa391c26b@ti.com>
References: <20200103221229.7287-1-michael@walle.cc>
 <8187061.UfBqSTmf1g@192.168.0.113>
 <62b578b07d5eb46a015dafd4c2f45bc2@walle.cc>
 <5323055.WqobA3rpa8@192.168.0.113>
 <990b9b16-36e5-ce73-36c7-0ebfa391c26b@ti.com>
Message-ID: <e64cc3ac32d2b44c9e6f4b4f795354ae@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.8
X-Spamd-Bar: /
X-Rspamd-Server: web
X-Rspamd-Queue-Id: AAB6223061
X-Spamd-Result: default: False [-0.10 / 15.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 NEURAL_HAM(-0.00)[-0.662]; RCVD_COUNT_ZERO(0.00)[0];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_044450_445484_08F28205 
X-CRM114-Status: GOOD (  22.24  )
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
Cc: marex@denx.de, Tudor.Ambarus@microchip.com, richard@nod.at,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Vignesh,

Am 2020-01-22 13:10, schrieb Vignesh Raghavendra:
> On 22/01/20 12:23 am, Tudor.Ambarus@microchip.com wrote:
>> Hi, Michael, Vignesh,
>> 
>> On Sunday, January 12, 2020 12:50:57 AM EET Michael Walle wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you 
>>> know the
>>> content is safe
> [...]
> 
>>>> I see three choices:
>>>> 1/ dt prop which gives a per flash granularity. The prop is related 
>>>> to
>>>> hw
>>>> protection and there might be some chances to get this accepted, 
>>>> maybe
>>>> it is
>>>> worth to involve Rob. But I tend to share Vignesh's opinion, this 
>>>> would
>>>> configure the flash and not describe it.
>>> 
>>> Still my preferred way. but also see below. But I wouldn't say it
>> 
>> Try to convince Rob.
>> 
>>> configures the
>>> flash but describe that the user want to use the write protection.
>>> 
>>>> 2/ kconfig option, the behavior would be enforced on all the 
>>>> flashes.
>>>> It would
>>>> be similar to what we have with CONFIG_MTD_SPI_NOR_USE_4K_SECTORS. I
>>>> did a
>>>> patch to address this some time ago:
>>>> https://patchwork.ozlabs.org/patch/
>>>> 1133278/
>>> 
>>> Mhh. If we would combine this with this patch that would be at least 
>>> a
>>> step into
>>> the right direction. At least a distro could enable that kernel 
>>> option
>>> without
>>> breaking old boards/flashes. Because as outlined about you need that 
>>> for
>>> flashes
>>> in category (2). Or you'd have to do a flash_unlock every time you 
>>> want
>>> to write
>>> to it. But that would be really a backwards incompatible change.. ;)
>>> 
>>>> 3/ module param, the behavior would be enforced on all the flashes.
>>>> 
>>>> Preferences or suggestions?
>>> 
>> I would go with 2/ or 3/. Vignesh, what do you prefer and why?
>> 
> 
> I dont like option 1, because I am not convinced that this is a HW
> description to be put in DT.  IIUC, problem is more of what to do with
> locking configuration that is done before Linux comes up(either in
> previous boot or by bootloader or POR default). Current code just
> discards it and unlocks entire flash.

But this is not the main problem. It is rather the intention of the
user to actually want write protect the flash (for flashes who has
proper support for them, that is the ones which have non-volatile
bits).

Flashes with volatile bits are another subject. Here it might be useful
to unlock them either at probe time or when we first write to them, so
the user doesn't need to know if its this kind of flash and he would
actually have to unlock the flash before writing. I've left the
behaviour for these flashes as it was before.

And yes, u-boot suffers from the same problem, eg. it unlocks the whole
flash too. I guess they inherited the behaviour from linux. But I
wanted to start with linux first.

> But proposal is not to touch those bits at probe time and leave this
> upto userspace to handle.

No, my proposal was to divide the flashes into two categories. The
unlocking is only done on the flashes which have volatile locking bits,
thus even when the new option is enabled it won't break access to these
flashes.

> Adding a Kconfig does not scale well for multi-platform builds. There
> would not be a way to have protection enabled on one platform but
> disabled on other. Does not scale for multiple flashes either
> 
> Option 3 sounds least bad among all. If module param can be designed to
> be a string then, we could control locking behavior to be per flash
> using flash name.

What about both? A kconfig option which defines the default for the
kernel parameter? My fear is that once it is a kernel parameter it is
easy to forget (thus having the non-volatile bits, the flash is
completely unlocked again) and it is not very handy; for proper write
protection you'd always have to have this parameter.

btw. I don't see a need to have this option per flash, because once
the user actually enables it, he is aware that its for all of his
flashes. I haven't seen flashes which has non-volatile protection bits
_and_ are protected by default. There shouldn't be a noticable
difference for the user if the option when enabled.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

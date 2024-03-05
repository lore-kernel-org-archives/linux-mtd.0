Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56680C54798
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2024 21:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2FzsWXPJqoEJ1ESt50pZqpwPbt4nUb9nM89pqmWjp74=; b=eY/M0X0C9vMfIt
	AgucischCW5ayAEUL8dMSeQeNBneO+qIQiNymwfjtZTCYG8SqQVK0YQ9GFJxIuwca/jvtdjMRQnfr
	Z1JbrQs1u3WMm4DCsPe2WEGqxjsvBPKzDGG2MytMI1QNXqlnKh2UFmM27eBBqBWB2dodBfpA5/+jr
	/rrEUbffA73Nepl9nlOmpWJC+LNZiLrguqXeJYZYmNWnUtGX7qoX+JTyJ8K4nzn35KbXqXKXbK159
	O6S+78nAmywEcUSZCNUD3kvTAtQky62wOe7MYs3913aphEGTfqJdGZjMtWIgc23fzbO1XWXUgZn47
	ipL85uoBtRAOSMdrbGwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhcXI-0000000FM8s-18p4;
	Tue, 05 Mar 2024 21:41:20 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhcXF-0000000FM7f-0dVX
	for linux-mtd@lists.infradead.org;
	Tue, 05 Mar 2024 21:41:19 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:6430:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id E9ED561A;
	Tue,  5 Mar 2024 22:41:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1709674872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJkLDh6rsmx3Gf4txI1BFmr9LOdJw01HgTTy7w8vrrc=;
	b=w06hAPqJByQc5x5/nu1tN0ongF0TW3nRvFy0wuYz+dAuNyigfImTs05Gz86E3B/tTZ513i
	Ku6XBxzyHzCejGi8DTyUQpnyji3T5Je9WfMpSrzVun9w5gLwO662WqGT7J8k73HgpReSL9
	mk40pMyrBpv+3Qpgm31i+MBRRjSbbohSgKVrW35/MFx6RcYzhlGhduNLFoq3oT3pzhXI98
	aw5FSmSXqQ3bd1ATrlRCwcl40YybT0/+K4fC96Vnovq9UYxaJEip1pQp/qnlXVdlVyMf8b
	w3rgEMiGNsluWl/pmnoBpymdWGbsCmoDrFvJKrTvc/0ozF3VEAnTgmnphPl7pQ==
Mime-Version: 1.0
Date: Tue, 05 Mar 2024 22:41:11 +0100
Message-Id: <CZM55T7YDKCR.3AIA4OQT2VG0S@walle.cc>
From: "Michael Walle" <michael@walle.cc>
To: "Marek Vasut" <marex@denx.de>, <u-boot@lists.denx.de>
Subject: Re: [PATCH] mtd: spi-nor: Clear Winbond SR3 WPS bit on boot
Cc: "Hai Pham" <hai.pham.ud@renesas.com>, "Heinrich Schuchardt"
 <xypron.glpk@gmx.de>, "Jagan Teki" <jagan@amarulasolutions.com>, "Johann
 Neuhauser" <jneuhauser@dh-electronics.com>, "Simon Glass"
 <sjg@chromium.org>, "Takahiro Kuwano" <Takahiro.Kuwano@infineon.com>,
 "Venkatesh Yadav Abbarapu" <venkatesh.abbarapu@amd.com>, "Vignesh R"
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.16.0
References: <20240304161607.82759-1-marex@denx.de>
 <CZLOVK212G8L.2ISEL1IIWU1YE@walle.cc>
 <7c0e2496-4338-497d-96cf-41d75e2fc52b@denx.de>
 <CZLTVKVR3AG1.BZIQQU2PYSU6@walle.cc>
 <a28b0543-67ee-4e33-91c1-86ae36eb44d5@denx.de>
 <CZLXRLFU5YKU.1S5D9EZ3GUTH4@walle.cc>
 <faa78709-6b7c-4394-8048-3c1f09b65a04@denx.de>
 <CZLZ391C9O5F.38A18T9S51BNT@walle.cc>
 <d522ac8e-8664-4798-9069-947691c6cd43@denx.de>
In-Reply-To: <d522ac8e-8664-4798-9069-947691c6cd43@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_134117_389211_948D21FE 
X-CRM114-Status: GOOD (  48.63  )
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

On Tue Mar 5, 2024 at 7:54 PM CET, Marek Vasut wrote:
> On 3/5/24 5:55 PM, Michael Walle wrote:
>
> [...]
>
> >>>>>> Clearing this SR3 WPS bit fixes that problem, both in U-Boot and in
> >>>>>> Linux, since Linux that is booted afterward then gets a device that has
> >>>>>> locking scheme configured in a way that Linux expects and can operate.
> >>>>>>
> >>>>>> Better yet, if some old LTS version of the Linux kernel is in use, it
> >>>>>> will also work correctly, because this patch will configure the SPI NOR
> >>>>>> locking scheme to what Linux expects it to be, before the SPI NOR is
> >>>>>> handed over to that old kernel.
> >>>>>
> >>>>> Agreed, but it should *not* be done automatically and nor
> >>>>> unconditionally. Please don't just overwrite any locking bits just
> >>>>> because there is one flash which have it set.
> >>>>
> >>>> The unlock code is not triggered unconditionally, it is protected by
> >>>>
> >>>> if (IS_ENABLED(CONFIG_SPI_FLASH_UNLOCK_ALL)...
> >>>>
> >>>> Kconfig option, so this can be turned on/off in board config already.
> >>>
> >>> Ahh, OK then :)
> >>>
> >>> But keep in mind that enabling this option is foobar and I've gone
> >>> lengths to eliminate it in linux. And actually made that option in
> >>> u-boot.
> >>>
> >>> See linux commit 31ad3eff093c ("mtd: spi-nor: keep lock bits if they
> >>> are non-volatile").
> >>
> >> So, how shall we proceed here?
> > 
> > Regarding this patch, I think it's fine. It will unlock the whole
> > flash as advertised.
>
> This change won't unlock the flash, it will switch to the supported 
> locking scheme, one which can then be used to unlock the flash.

I can't follow you here. The code is added right below the
write_sr(0), which will clear all the BP bits, thus unlocking
everything if WPS=0. Therefore, no locking will be enabled anymore
afterwards. What did I miss?

> > But u-boot should really consider making that a "default n" option.
> > And most likely adding =y to every existing defconfig out there so
> > that at least new boards will benefit from it.
>
> Yes, I agree with that.
>
> >> The way I see this, if Linux ever implements this scheme, Linux can set
> >> the SR3 WPS bit as needed, it does not matter which way bootloader sets
> >> the bit as the protection bits are not cleared when the bit is cleared,
> >> they seem to be stored elsewhere.
> > 
> > On each reboot you'd wear out that cell with two erases/writes.
> > That's another reason why that whole unlocking thing is foobar for
> > non-volatile bits. For me, non-volatile bits are for provisioning,
> > so during a normal boot they should not be touched at all. Just
> > during board manufacturing or because the user actively want to
> > protect something.
>
> That is what happens here, the write to clear the bit is triggered only 
> if the bit is set , so OK .
>
> And if Linux wants to use the new locking scheme, then the bootloader 
> should ideally be updated to match, i.e. SPI_FLASH_UNLOCK_ALL=n etc, so 
> that is also OK .

I'd argue if one wants to use the locking at all, you have to set
UNLOCK_ALL=n. Otherwise, the bootloader might come alone and just
clear your locking bits again. Clearing the WPS bit there is just
one more thing which IMHO doesn't make much sense.

> In other words, there should be no writes into the non-volatile bits, 
> unless U-Boot and Linux disagree on the locking scheme,

Agreed.

> in which case 
> writes are unavoidable (if you want unlock to work in both projects).

But this should only happen if the user want to change the locking
at all. u-boot should not just do "oh this bit is set, I'm clearing
it" during SPI flash probe. Again, I'm not caring much if this is
guarded by the UNLOCK_ALL=y, because u-boot is already doing "oh the
BP bits are set, lets clear em".

> > If you clear this bit during the unlock all command, all the locking
> > bits are cleared anyway. Or do you mean, the individual bits are
> > still retained?
>
> The lock bits themselves are retained, this SR3 WPS only selects which 
> of those bits take effect, whether the SR ones (standard locking scheme) 
> or the per-page ones (winbond custom locking scheme).

Ok. So switching back to WPS=1 might come with some suprises :)

-michael

> >> But, if Linux starts to use SR3 WPS, then U-Boot should be updated to
> >> match, i.e. both projects should agree on the locking scheme, so that
> >> there won't be a situation where on the same device, one project uses
> >> one scheme, the other project uses another scheme. I think this would
> >> technically work, but it would be horrible from the user perspective.
> >> And if that happens, both projects should then be updated in lockstep
> >> and this UNLOCK_ALL should be disabled for such a setup then.
> > 
> > If you don't touch it, I don't think you have a problem here. u-boot
> > and linux can support different schemes, as long as the user is
> > aware of that. I.e. if they want to lock a region and the flash is
> > configured in a mode which isn't supported in u-boot (or linux) it
> > should be rejected. There might of course be a command to switch the
> > scheme if someone want to do so.
>
> That is why I wrote that it is technically possible, but probably not a 
> good idea because it is inconsistent and therefore error prone.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

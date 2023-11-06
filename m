Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AFBC4167D
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Nov 2023 14:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZ/4c6+DNzf1sOjf4V7JCXvnqvUh8C1vu4Ir43QLwu0=; b=1ftr1Y7DzFzg+ym8gm7VSXLIeF
	NsqnwqKuB6lnFUI0vYK0Nc5oI/0UNaZAsVQPxgKTmo1NuUaosN3EZ7M01Y2KngWK5a+9uFRu6zzRm
	4f0I30Q2qqKIKudHI0kURzqsFZkEjAZuPth0cUmkJ3MyN7FKZ56DJNO/h9e9n4oChO6xizYcnbm2T
	4eGGyCHjCRz8VH/tyDp8l7v9e2OyDO534iCb2dEaPXI5s6v4Fp2JDUqM43MdmOKOmI6VkaVR5RZL5
	1t81vEIJotBW0zHPxnm7X6qQmDYFUAxvwwwR2tCP1yIUYJenEYznetfpTLto9dpZrz5DA5sgdhSrn
	az1OWwzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r00Zl-00GqY4-2v;
	Mon, 06 Nov 2023 14:27:37 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r00Zj-00GqWV-0t
	for linux-mtd@lists.infradead.org;
	Mon, 06 Nov 2023 14:27:37 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 3FDA7D4B;
	Mon,  6 Nov 2023 15:27:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1699280850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dUP1R4gND1+LvVnTYb5qvkeE13We2IemdOImxK0D8ok=;
	b=WID7QANRSvNtcNk5VasH3BiQDf2fEK9w6ELkyaWRTTC2KTk0nXomapk+28ui84KEsPoN1c
	E8827W9nLe/92OVnHmfbuaQq62ZY1mJZiM/BZCTj7Fn+mu5eFSDpNUrgAT+//Cj8Fr5kaW
	7W7d+cQ1W1B76jlPybAd0e3lCW6MEdY5MXi2e7vEcEMmEVZpq3r/jqX6RTLwqTOMnaeW3u
	JlSGNWL1Ar8Wk+F8BXOV6XDTp58gHYM6woSKCX/oYO9rtaF+wRqg9YvbQ3QM9fpsmtwJgc
	L54ZtiJTMiowDgAz2qTuyyut2uvLg8LjO/djPJuueQGyD2kgE2KilA+TC97BQg==
MIME-Version: 1.0
Date: Mon, 06 Nov 2023 15:27:30 +0100
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: AceLan Kao <acelan.kao@canonical.com>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mtd: spi-nor: Improve reporting for software reset
 failures
In-Reply-To: <mafs01qd3hvcd.fsf@kernel.org>
References: <20231026012017.518610-1-acelan.kao@canonical.com>
 <mafs0fs1xmrit.fsf@kernel.org>
 <8D87B330-8FA1-46BE-949E-5A8DFB8AACF3@walle.cc>
 <mafs01qd3hvcd.fsf@kernel.org>
Message-ID: <994df862c4f9f0c5974d064b84a2431c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_062735_493409_549EAE21 
X-CRM114-Status: GOOD (  48.59  )
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

>>>> When the software reset command isn't supported, we now report it
>>>> as an informational message(dev_info) instead of a 
>>>> warning(dev_warn).
>>>> This adjustment helps avoid unnecessary alarm and confusion 
>>>> regarding
>>>> software reset capabilities.
>>> 
>>> I still think the soft reset command deserves a warn, and not an 
>>> info.
>>> Because it _is_ a bad thing if you need to soft reset and are unable 
>>> to
>>> do so. Your bootloader (or linux if you rmmod and modprobe again) 
>>> might
>>> not be able to detect the flash mode and operate it properly.
>> 
>> agreed.. but..
>> 
>>> I think we should just not unconditionally run this and instead only
>>> call it when the flash reset is not connected -- that is only call 
>>> this
>>> under a check for SNOR_F_BROKEN_RESET, like we do for 4-byte 
>>> addressing
>>> mode.
>> 
>> .. keep in mind that this is a restriction of the flash controller. 
>> the Intel one seems to be the only affected one (for now) and it's 
>> doing a reset (according to mika) on its own.
>> 
>> snor_broken_reset is a property of the flash.
> 
> The documentation for the property says:
> 
>   broken-flash-reset:
>     type: boolean
>     description:
>       Some flash devices utilize stateful addressing modes (e.g., for 
> 32-bit
>       addressing) which need to be managed carefully by a system. 
> Because these
>       sorts of flash don't have a standardized software reset command, 
> and
>       because some systems don't toggle the flash RESET# pin upon 
> system reset
>       (if the pin even exists at all), there are systems which cannot 
> reboot
>       properly if the flash is left in the "wrong" state. This boolean 
> flag can
>       be used on such systems, to denote the absence of a reliable 
> reset
>       mechanism.

But still, this property is a child of the flash node. Anyway, we cannot
force a user to change their DTS, just to avoid that (spurious) warning 
in
this case.

Also, we don't *have* to change the DTS because we know that it is a
property of the spi driver anyway. So we could just ask it.

> So it is more a property of the system as a whole perhaps.
> 
>> 
>> 
>>> I don't have a strong opposition to this patch but I do think it is
>>> fixing the problem in the wrong place.
>> 
>> if the flash controller doesn't let you issue a soft reset (or does so 
>> on its own), what's the fix?
> 
> I think in those cases we could inquire the controller if it can do a
> soft reset (probably via spi_mem_supports_op()). If it can not do so
> _and_ the flash reset is broken, refuse to enter stateful modes like
> 8D-8D-8D or 4-byte addressing.

Mh, I tend to agree but see some drawbacks. What cases do we have.

For the controller:
  (1) Just a regular/dumb spi controller where the commands are somewhat
      opaque. That's the usual case.
  (2) We have some kind of high level controller which just allows a 
subset
      of commands but also do it's own handling, esp. bring the reset 
into a
      known state on bootup/reset.

For the flash:
  (a) The flash has a dedicated reset line
  (b) The flash doesn't have a dedicated reset line, but supports s/w 
reset
  (c) none of the above

(b) will also always just be a best effort thing. What if there is a 
hardware
reset and linux doesn't get to call the soft reset on shutdown. So I'd 
treat
(b) the same as (c). Except that we enter 4byte addressing mode even if 
the
flash doesn't have a reset line. I don't know if we can change this 
behavior
at this point. Might break some boards.

Let's start with the easy one (1a). The DT shouldn't contain the broken 
flash
reset property, but because there is a proper reset line we can just 
enter
stateful modes. Now we have (1c) where we cannot enter stateful modes, 
but
we do for the 4byte addressing mode (correct?). And as a workaround we 
try
our best to disable that mode (by disabling the mode and by doing a soft
reset).

If I understand you correctly, you suggest to keep the current behavior 
for
just (1b) and refuse any modes for (1c). I tend to disagree, because how 
useful
is the flash if it cannot enter 4byte mode (and doesn't have 4b 
opcodes). I'd
argue it's useless :) Or at least it is really unexpected that we can 
just
address the first 16MiB, and bad things will probably happen if 
partitions
go beyond that boundary.

That leaves us with (2). I don't thing we should do anything specific 
here
unless there is a real problem and let the controller handle all the 
cases
for us. Mika confirmed, that the intel controller will do the handling.
By just looking whether the controller might support the soft-reset 
operation,
we cannot know if we will have a problem on reboots or not. Maybe that
controller will issue the "get me out of 8d8d8d" sequence on it's own.
Therefore, the query to the SPI controller should rather be, "do we need
a soft reset at all" - or can we enter stateful modes without caring on 
how
to exit them.

-michael

> We already do so for the broken reset thing in
> spi_nor_spimem_adjust_hwcaps():
> 
> 	/*
> 	 * If the reset line is broken, we do not want to enter a stateful
> 	 * mode.
> 	 */
> 	if (nor->flags & SNOR_F_BROKEN_RESET)
> 		*hwcaps &= ~(SNOR_HWCAPS_X_X_X | SNOR_HWCAPS_X_X_X_DTR);
> 
> We should probably also add a spi_nor_spimem_can_soft_reset() (function
> doesn't exist as of now -- just using an example name) check here.
> 
> Note: This restriction is placed only for X-X-X modes, and not 4-byte
> addressing mode, which is an inconsistency on SPI NOR's part. See 
> below.
> 
> Alternatively, if we are more willing to let users shoot themselves in
> the foot if they so wish, we can just throw a warning that you might 
> not
> be able to recover, like we do in spi_nor_init():
> 
> 	/*
> 	 * If the RESET# pin isn't hooked up properly, or the system
> 	 * otherwise doesn't perform a reset command in the boot
> 	 * sequence, it's impossible to 100% protect against unexpected
> 	 * reboots (e.g., crashes). Warn the user (or hopefully, system
> 	 * designer) that this is bad.
> 	 */
> 	WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
> 		  "enabling reset hack; may not recover from unexpected reboots\n");
> 	err = spi_nor_set_4byte_addr_mode(nor, true);
> 
> In that case, we would only run spi_nor_soft_reset() if the reset is
> broken and let the user deal with the consequences if it fails.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

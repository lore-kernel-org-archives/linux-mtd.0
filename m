Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BDEC27C5E
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jun 2024 07:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtAVw4skYViV09N4KkfJnnYKJI92fgclCEI3fAnkrHQ=; b=OF2jkcSeWacpLZ
	uLJ1MMNkGR7b/X2ASqyiZimPpzK8/S6J/1Yxq3il7SzbA5OSSS6YgLVH21C6t2p39cjdXRiTDKdih
	8qcm8rZpXA92vGuCBBRM3BsUZcJwdpLnwvnCNDVDqOh4BLNnb9WbmHqQjZ5DCmw/Cuf8oqTjsdgr6
	9/Cdr5Y32jS9GpQ/bzL74b+k20aOD1h5FU7UqCX3VwDE5ejMyzpBEhdOLUBBW4od5IwrNnQBSNlvk
	/DDEHBo6/Qwca0WFioRq6/kakydfabJEfKc86c4Ep0ohQtGRGlaGUTwoqRrmXla1jgzFi+7LF5Js8
	xAktGXy2DWTbra9hsNMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGZok-000000048Ja-2V6l;
	Mon, 10 Jun 2024 07:51:50 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGZof-000000048AH-361f
	for linux-mtd@lists.infradead.org;
	Mon, 10 Jun 2024 07:51:49 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:4ee9:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 12B0F8D5;
	Mon, 10 Jun 2024 09:51:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1718005894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Cc7pO63ffCojUGj8vXWOCyEjel6dIliiCO6+jhIIIE=;
	b=rmGUEfo7PHzz+uxkJ5uiGs2h1mhQIfsPzUHHwF+uoUxXdo9NcpL6CBbLGZESUGVoQWGK27
	+esPy7TTDltzVzf8jIhb4lbNzwBVJEhM4hhcOguhn4H8sKHP7l5akt4612y8FPhG5gjcST
	bQVox9xmdBftwZyv0uxI5pYJEEJ/1abQex3oDkqkcegGHwsMYrgqDMZg2xTZ/aZiyKTmIQ
	yPJ5ApVdPFIBhJriNB9eBUPaGbOP18XiCwtqois9DzrK1Qz/ypXqExlfM7TkRYGoGYk4rL
	E1wl+v5Tz/KJq7H2LoJWwaGHC+fzeKlWp8iBE/4h36I30aISF1pgtUOHFCU4WQ==
Mime-Version: 1.0
Date: Mon, 10 Jun 2024 09:51:33 +0200
Message-Id: <D1W69FY9MUZL.33B8G1877MPBL@walle.cc>
Subject: Re: Definition for flash w25q128 is wrong
Cc: <linux-mtd@lists.infradead.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Linus
 Walleij" <linus.walleij@linaro.org>
From: "Michael Walle" <michael@walle.cc>
To: "Esben Haabendal" <esben@geanix.com>, "e9hack" <e9hack@gmail.com>
X-Mailer: aerc 0.16.0
References: <CALxbwRo_-9CaJmt7r7ELgu+vOcgk=xZcGHobnKf=oT2=u4d4aA@mail.gmail.com> <D1TNAMAIIHAF.1QD3BI5DZTZBF@walle.cc> <87y17h0ygd.fsf@geanix.com> <194d6f02-bd70-489d-b883-d7677b6f87b3@gmail.com> <87wmmxb5sk.fsf@geanix.com>
In-Reply-To: <87wmmxb5sk.fsf@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_005146_628020_9394DF70 
X-CRM114-Status: GOOD (  29.77  )
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

On Mon Jun 10, 2024 at 9:44 AM CEST, Esben Haabendal wrote:
> e9hack <e9hack@gmail.com> writes:
>
> > Am 07.06.2024 um 13:44 schrieb Esben Haabendal:
> >> "Michael Walle" <michael@walle.cc> writes:
> >> 
> >>> On Thu Jun 6, 2024 at 9:50 PM CEST, e9hack wrote:
> >>>> I'm using a TP-LINK WDR3600 with a bigger flash. Since some time the
> >>>> router hangs in an endless boot loop. I see the following message:
> >>>>
> >>>> ...
> >>>> [    0.402716] spi-nor spi0.0: BFPT parsing failed. Please consider
> >>>> using SPI_NOR_SKIP_SFDP when declaring the flash
> >>>
> >>> Looks like your flash doesn't support SFDP. Relevant threads are:
> >>> https://lore.kernel.org/r/d99d87e7-47ba-d6fe-735f-16de2a2ec280@linaro.org/
> >>> https://lore.kernel.org/r/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com/
> >>>
> >>>> [    0.413217] spi-nor: probe of spi0.0 failed with error -22
> >>>> ...
> >>>> [    0.926180] /dev/root: Can't open blockdev
> >>>> [    0.930427] VFS: Cannot open root device "(null)" or
> >>>> unknown-block(0,0): error -6
> >>>> [    0.938037] Please append a correct "root=" boot option; here are
> >>>> the available partitions:
> >>>> [    0.946520] Kernel panic - not syncing: VFS: Unable to mount root
> >>>> fs on unknown-block(0,0)
> >>>> [    0.954914] Rebooting in 1 seconds..
> >>>>
> >>>> It looks like the definition for the flash is wrong:
> >>>>
> >>>> --- a/drivers/mtd/spi-nor/winbond.
> >>>> c     2024-03-15 19:27:50.000000000 +0100
> >>>> +++ b/drivers/mtd/spi-nor/winbond.c     2024-04-01 05:59:17.166780732 +0200
> >>>> @@ -120,8 +120,8 @@ static const struct flash_info winbond_n
> >>>>                  NO_SFDP_FLAGS(SECT_4K) },
> >>>>          { "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16)
> >>>>                  NO_SFDP_FLAGS(SECT_4K) },
> >>>> -       { "w25q128", INFO(0xef4018, 0, 0, 0)
> >>>> -               PARSE_SFDP
> >>>> +       { "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
> >>>> +               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> >>>>                  FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> >>>>          { "w25q256", INFO(0xef4019, 0, 64 * 1024, 512)
> >>>>                  NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> >>>>
> >>>> With these changes, the flash will be detected properly. The chip is
> >>>> marked with:
> >>>> The chip (SOIC8) is marked with:
> >>>> winbond
> >>>> 25Q128FVSG
> >>>> 1327
> >>>>
> >>>> I use another TP-LINK router. This is an Archer C7 v2. It has the same
> >>>> flash chip with date code 1528. This router doesn't have this issue.
> >>>
> >>> Looks like some of these flashes support SFDP and some don't :/
> >
> > Related to the spec
> > 	https://www.winbond.com/hq/support/documentation/levelOne.jsp?__locale=en&DocNo=DA00-W25Q128FV
> > chapter 8.2.30, older flashes don't support SFDP. Newer flashes may support SFDP. From my two versions, one doesn't support SFDP, the other does support it.
>
> Ok. That is clear. Sort of. No concrete information on which flashes
> exactly supports SFDP. Thank you Winbond. Looks like we really need the
> SFDP with fallback to handle these flashes according to their
> "specification".

Shoot, I forgot to add you on CC:
https://lore.kernel.org/r/20240610074809.2180535-1-mwalle@kernel.org/

That's for the quick fix (and the backports). And yes we really need
that case (4) IMHO.

-michael

> /Esben
>
> >> Which means that for those (old) flashes without SFDP was broken by
> >> 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128").
> >> During patch review, the following was said:
> >> 
> >>>>> while here try, using INFO with INFO(0xef4018, 0, 0, 0), those
> >>>>> parameters shall be discovered at run-time, so we prepare to get rid of
> >>>>> explicitly setting them sooner or later.
> >>>>
> >>>> This is an entry matching various flash families from Winbond, see my
> >>>> reply in v1. I'm not sure we should remove these as we could break the
> >>>> older ones, which might or might not have SFDP tables. We don't know.
> >>>
> >>> I'd take the risk and break the older ones if there are some that don't
> >>> define SFDP indeed, just to handle the conflict properly. We can't
> >>> encourage code based on assumptions otherwise we'll get back to the
> >>> knotted spi-nor code that we tried to untie in the last years.
> >> I guess it is not an assumption anymore. There are flashes out there
> >> with this jedec id which does not have SFDP tables.
> >> So while parsing SFDP is good, keeping a fallback to some known "good"
> >> values are needed. Something similar to what we are discussing in
> >> https://lore.kernel.org/all/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

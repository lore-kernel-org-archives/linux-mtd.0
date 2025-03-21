Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6071BC35FF3
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Mar 2025 08:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfqsBWa+xBeCi5wWeuiRLDA+EJN4/4fGBtz5Y2yYgFo=; b=xymtMpHgCnV/V0
	u4M1cWW0wwRk8GvzdBL7d7+FSkpcaHgl8f0klEX5zq9rao/vrEw0vgy4HiQMOZlwV0NcFVLAAyHX3
	5o/Gjqq/EHHa+ENjUxB0ON6kN+afZutjqN5OVleZFysEcpLcCRsRVcEteVBewTDypRFBL0HC2gj0w
	B3NkB8Xli90fztWDjENfVnRcXPEFU+AO/sRHAo1o0Og/ub4z55bEKz6YVlmTxdRzLnFTFlfOt+rfh
	2haabkCnuoY50tpY/Gwf8Uo+2x2oQuSHNFIdmqr1GbDXVkHnZT0QSwWMXFROkKCZwY71yTGJRi7c/
	aohXLkrJd0SY35qGPA8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvXTB-0000000ED8S-3f7y;
	Fri, 21 Mar 2025 08:11:09 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvXIs-0000000EBBH-21w6
	for linux-mtd@lists.infradead.org;
	Fri, 21 Mar 2025 08:00:31 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id C13764CF;
	Fri, 21 Mar 2025 09:00:18 +0100 (CET)
Mime-Version: 1.0
Date: Fri, 21 Mar 2025 09:00:18 +0100
Message-Id: <D8LSAUU0358V.2H1D7QXB9WBOF@kernel.org>
Subject: Re: [PATCH 2/3] mtd: spi-nor: use rdid-dummy-ncycles DT property
Cc: "Takahiro Kuwano" <tkuw584924@gmail.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Bacem
 Daassi" <Bacem.Daassi@infineon.com>, "Takahiro Kuwano"
 <Takahiro.Kuwano@infineon.com>, "Mark Brown" <broonie@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring"
 <robh@kernel.org>
X-Mailer: aerc 0.16.0
References: <20250319-snor-rdid-dummy-ncycles-v1-0-fbf64e4c226a@infineon.com> <20250319-snor-rdid-dummy-ncycles-v1-2-fbf64e4c226a@infineon.com> <20250319233024.GA2625856-robh@kernel.org> <a3818477-5a67-43ad-8961-88fa02916968@linaro.org> <CAL_JsqKtz5+R1kjEzjo6bVicOX2c=UauC0_STAF0T02rSDqO+w@mail.gmail.com> <50de19f7-2021-433e-b8f8-d928ed7d5d57@linaro.org>
In-Reply-To: <50de19f7-2021-433e-b8f8-d928ed7d5d57@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_010030_675196_CCD301BA 
X-CRM114-Status: GOOD (  44.00  )
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

Hi,

> >>>> There are infineon flashes [1] that require 8 dummy cycles for the
> >>>> 1-1-1 Read ID command. Since the command is not covered by JESD216
> >>>> or any other standard, get the number of dummy cycles from DT and use
> >>>> them to correctly identify the flash.
> >>>
> >>> If Read ID fails, then couldn't you just retry with dummy cycles? Or
> >>
> >> I think Read ID won't fail when the op requires 8 dummy cycles, it
> >> probably just reads garbage on the first 8 cycles, so we risk to wrongly
> >> match other flash IDs.
> >>
> >>> would unconditionally adding dummy cycles adversely affect other chips?
> >>
> >> Adding 8 dummy cycles to chips that don't need it, would mean ignoring
> >> the first byte of the flash ID, thus we again risk to wrongly match
> >> against other flash IDs.
> >>
> >>>
> >>> Otherwise, add a specific compatible to imply this requirement. Adding
> >>> quirk properties doesn't scale.
> >>
> >> Do you mean a flash name compatible, like "cyrs17b512,spi-nor"?
> > 
> > Yes, but that's not the format of compatible strings.
> > 
> >> The
> >> problem that I see with that is that we no longer bind against the
> >> generic jedec,spi-nor compatible, so people need to update their DT in
> >> case they use/plug-in a different flash on their board.
> > 
> > This chip is clearly *not* compatible with a generic chip.
>
> I think it is compatible. The chip defines the SFDP (serial flash
> discoverable parameters) tables. At probe time we parse those tables and
> initialize the flash based on them.

I disagree. It's not compatible with "jedec,spi-nor", which is
defined as

      SPI NOR flashes compatible with the JEDEC SFDP standard or which may be
      identified with the READ ID opcode (0x9F) do not deserve a specific
      compatible. They should instead only be matched against the generic
      "jedec,spi-nor" compatible.

The first part was recently added and is a bit misleading. The old
definition was:

      Must also include "jedec,spi-nor" for any SPI NOR flash that can be
      identified by the JEDEC READ ID opcode (0x9F).

See my first reply, on how to possibly fix this mess (new
compatible if accepted, just use RDSFDP sequence which is backed by
the standard and do some fingerprinting).

FWIW, a new (or rather different) compatible is needed because we
cannot distinguish between random data returned during the dummy
cycles and a proper manufacturer id. So there is no way we could fix
this in the core itself.

At least if we keep the logic as it is for now, if we use RDSFDP to
fingerprint first and then fall back to RDID, we could get away with
the old compatible.

> We don't even care about the chip ID, if all the flash parameters can be
> discovered via SFDP. Unfortunately these tables do not describe all the
> flash capabilities (block protection being one). Or worse, manufacturers
> mangle these tables.
>
> So vendors need to identify chips to either fix those tables via some
> quirks after the parsing is done, or to specify support that's not
> covered by those tables.
>
> For basic ops, flashes that get the SFDP tables right, don't even need a
> flash entry defined, we don't care about their ID, we just initialize
> the flash solely based on SFDP.
>
> In this particular case, this flash needs identification to fix some
> wrong SFDP field, it corrects just the mode cycles for the FAST READ
> command. All the other commands seem fine according to patch 3/3.
>
> > 
> > You have the same problem with a property. Users have to add or remove
>
> True. It's the same problem. Even if we specify the dummy cycles via a
> property, the next plugged-in flash will use those. We can of course
> fallback to the SFDP only init if the ID doesn't match any flash entry,
> but the problem is the same.
>
> > the property if the flash changes. Anyone thinking they can use this
> > chip as a compatible 2nd source is SOL.
> > 
>
> I think the property vs compatible decision resumes at whether we
> consider that the dummy cycles requirement for Read ID is/will be
> generic or not.

It is not generic. Because it will break autodetection. And that is
the whole purpose of this. Adding that property means, we can just
autodetect flashes within this 'group'. And personally, I think this
is a bad precedent.

> I noticed that with higher frequencies or protocol modes (e.g, octal
> DTR), flashes tend to require more dummy cycles. I think with time,
> we'll have more flashes with such requirement. Takahiro can jump in and
> tell if it's already the case with IFX.

But hopefully not with RDID. Again this doesn't play nice with other
flashes (or all flashes for now). Instead of adding random delay
cycles one should rather define a max clock speed for this opcode.

-michael

> Thus instead of having lots of new compatibles for this, I lean towards
> having this property. I'm still open for the compatible idea, I just
> wanted to explain better where we are.
>
> Thanks,
> ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

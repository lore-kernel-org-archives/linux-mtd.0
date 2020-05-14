Return-Path: <SRS0=QwSX=64=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0740CC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 17:56:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE75320657
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 17:56:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pOT9ZKvT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0jxg65I7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE75320657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eWNazRd20W6TpEsbHRE9hf5KJ7c1ZBH7VgKPbCAtciY=; b=pOT9ZKvT4ao8aK
	hC/xIu4h7MYomHsFV6LAeOGiRxLhlP2rSqJQCn6IEeWULU9dsz1IbisNhzlj5TgUWcj09kVlhhnvY
	hseqYoWXKHTcZfAYHNvZn13C479vtDI0rq0a6zRIudUmSsE/E77e0t/jU68ahMs9FNQFqVxzVfF/y
	Tf16+OMeMINEeHomyhmdtM63g8SIRQ2c3Q3l4KEME8BY23dknme/wnoMTnlOxBTfzDlGPNBLA0pvn
	OpBIugQR4VuEySHcFgZD8RR6a7nmbOMIUcwJH+80t2snlicc2KW98SWDZzQwvNGQX2MAyisnY8bVn
	jhXzRh+kVdyFvhx6CcOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZI5C-0004vN-P3; Thu, 14 May 2020 17:55:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZI59-0004uu-Ft
 for linux-mtd@lists.infradead.org; Thu, 14 May 2020 17:55:44 +0000
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B459420657
 for <linux-mtd@lists.infradead.org>; Thu, 14 May 2020 17:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589478942;
 bh=YuV4JmNCFxZTXRRZDTourQqWeIzvbe4ZSXIszNZz9GA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0jxg65I7U1YC+2QZiesMn4vGp0WIuky80HBNGuRpR4HrtMFBsrL2SYVIr8paioqjs
 OvzoxVMjpM65TtU5at+jbcxTLZNlpU/7+IJqoD1Xn4P8t85g+ml4GEY/dhiT0YrdN3
 WUnsRJ4QDgq8jEgj5E0UTeFMkJrwirLa6BbtTIjs=
Received: by mail-oo1-f47.google.com with SMTP id a83so906688oob.9
 for <linux-mtd@lists.infradead.org>; Thu, 14 May 2020 10:55:42 -0700 (PDT)
X-Gm-Message-State: AOAM533zXCH73YqdCkKB8WlZaLStx7SRECwAxsFawbhgCcnTord2emQL
 /q9FCLo/gkxk8lVmaS+zhFrQHWMQR09BqxKySw==
X-Google-Smtp-Source: ABdhPJyYQ1f7xwVyNWr/S3JB/4XJ/2dszYIEcPkkumlKlHYG1FOqs0/y0vGXRbvvDqR04i1DfUOOMXv5SZ6p1Vso3BA=
X-Received: by 2002:a4a:894d:: with SMTP id g13mr4522354ooi.81.1589478941954; 
 Thu, 14 May 2020 10:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <1588756279-17289-7-git-send-email-christophe.kerello@st.com>
 <20200514150028.GB28489@bogus> <9ffc04cf-137f-5ee5-57ff-39a876abfb34@st.com>
In-Reply-To: <9ffc04cf-137f-5ee5-57ff-39a876abfb34@st.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 14 May 2020 12:55:30 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLTyDHBHncrQqtPdkCNgKDkEbp+ts7BOeqWmGv64kcAsg@mail.gmail.com>
Message-ID: <CAL_JsqLTyDHBHncrQqtPdkCNgKDkEbp+ts7BOeqWmGv64kcAsg@mail.gmail.com>
Subject: Re: [PATCH v4 06/10] dt-bindings: mtd: update STM32 FMC2 NAND
 controller documentation
To: Christophe Kerello <christophe.kerello@st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_105543_576694_6A4AC132 
X-CRM114-Status: GOOD (  26.04  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>, Vignesh R <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, May 14, 2020 at 11:35 AM Christophe Kerello
<christophe.kerello@st.com> wrote:
>
> Hi Rob,
>
> On 5/14/20 5:00 PM, Rob Herring wrote:
> > On Wed, May 06, 2020 at 11:11:15AM +0200, Christophe Kerello wrote:
> >> These bindings can be used on SOCs where the FMC2 NAND controller is
> >> in standalone. In case that the FMC2 embeds 2 controllers (an external
> >> bus controller and a raw NAND controller), the register base and the
> >> clock will be defined in the parent node. It is the reason why the
> >> register base address and the clock are now optional.
> >>
> >> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> >> ---
> >>   .../devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml   | 19 ++++++++++---------
> >>   1 file changed, 10 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
> >> index b059267..68fac1a 100644
> >> --- a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
> >> +++ b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
> >> @@ -18,13 +18,15 @@ properties:
> >>
> >>     reg:
> >>       items:
> >> -      - description: Registers
> >> +      - description: Registers (optional)
> >
> > The only thing that can be optional are the last entries. You have to do
> > a 'oneOf' with 6 entries and 7 entries.
>
> Ok, so the way to describe the reg property in my case should be:
>         reg:
>           oneOf:
>             - description: FMC2 embeds the NFC controller in standalone.
>               items:
>                 - description: Registers
>                 - description: Chip select 0 data
>                 - description: Chip select 0 command
>                 - description: Chip select 0 address space
>                 - description: Chip select 1 data
>                 - description: Chip select 1 command
>                 - description: Chip select 1 address space
>
>             - description: FMC2 embeds the NFC controller and the EBI
>                 controller.
>               items:
>                 - description: Chip select 0 data
>                 - description: Chip select 0 command
>                 - description: Chip select 0 address space
>                 - description: Chip select 1 data
>                 - description: Chip select 1 command
>                 - description: Chip select 1 address space
>
> >
> > And where's your new compatible string for this different h/w?
>
>  From NFC controller point of view, it is the same HW.

That's what everyone says until they have some quirk or integration
difference to handle.

> In the case that we have 2 controllers embedded, the register base is
> shared.
> The NFC driver will check at probe time the compatible string of its
> parent node.
> In case that it is "st,stm32mp1-fmc2-ebi", then the driver will find the
> register base in the parent node (EBI node), otherwise it will find it
> in the NFC node.
> Is it better to have 2 compatible strings (one for each reg description)
> than checking the parent's compatible string and have only one
> compatible string?

Why not just put the register base into the child node too? While
overlapping 'reg' regions for siblings is bad, it's fine for child
nodes. I guess since there are chip selects for the child nodes that
may not work here.

It doesn't hurt to have another compatible. You can always make the
old one a fallback. With different compatibles you can make sure reg
has the right number of entries.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

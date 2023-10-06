Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FC1E81DF0
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Oct 2023 12:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3G3RZwAZLD9fFqhK203iGz2+6cBIcaXE7H7TfWbJdRs=; b=V494pnfxbUdLYh
	dnXQ8YPAUz44LAstnMBStI57LUKBfOMhy2Whi6e2lfWBdBq+8Q4vvEygfw5coSJhTdQKrGWquY1MU
	xFmT/73sIH6R34VZfxHx47B7XonwoM9zBFINA7rLcWV56hPLF6oYTU9PcTDREVV4x7Z9Iv6O+lcza
	bVXhvX7QhKbsLIaEIC9o0uEdS5Gz6rfoh4zWfRwB/fbDuAZmdrwwMWrNKeBmpS8fk2jy6DIdcuDOm
	tg8AYOAbGlcJJ54CnkHVUd07tgVNv08OH9MK9XfFqeVARdxxHrM+NXc/dY16YRjfMYCfNLn1myIC6
	8yp7fr41jBvVUVWUo0Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qok7S-005nfC-1K;
	Fri, 06 Oct 2023 12:39:50 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qok7O-005ncy-2W
	for linux-mtd@lists.infradead.org;
	Fri, 06 Oct 2023 12:39:48 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9b2cee55056so385062866b.3
        for <linux-mtd@lists.infradead.org>; Fri, 06 Oct 2023 05:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696595975; x=1697200775; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zSVbwuMngsJ15cLY6pR9vh3z/k0osdSclV2xxkOB8v0=;
        b=GMtKyA0rpVpgIhTHQmF4rXskD6t9nHJJV9fywmuGWddsar6s0GfuqxMokBDKN+Cd+Y
         OXR83H9Rf3jt0wG8TCQjp+ZP+KLVnCJKrPIH0yMdz38Mcs45bRd1797BdG9B910nByKP
         vnRR9nAn1HSY8Y67L40aNxo71kVZJ4R7kSME8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696595975; x=1697200775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSVbwuMngsJ15cLY6pR9vh3z/k0osdSclV2xxkOB8v0=;
        b=GNwjtySpF5inmcN22mVoYNd0bgiat7rKs5miZn9WPnSyJdS2Ei2uDUTWjVzs85NIz3
         QadEwr9joaxtkAAMZ7eAOmA5kCuD56eeoWiEW4+I34kVhQ4pbCxWAufj6cWd5luo+ui1
         gnkl97xbgTDJ9Mzdhl3rmLX+mapDO1PuZr4GNQJeNCyjGB/glwtLtcrab1HGYePL/WvP
         FD6Rr/PxQ8W1SNLuJSroLREiDL19E5qIxtrOEgnwexOaAeJZzrBageu9e9fVcGsKjjG6
         C1W6mzlAYBOMQQ6TsGv0XtnWQb+coWf5Thd9qUvBxIwTx9J7fIfhrVSNYPXO94sQB6j6
         yngQ==
X-Gm-Message-State: AOJu0Yxs66Y/cWQ7KRhAsLSIvekE0DXaqnjUgQvz30ZbClE+Y4vBRo+X
	YeBa5Muw4l9V7cxW/JdlU2Lsahq4C0mmAyuXGnxgHw==
X-Google-Smtp-Source: AGHT+IHF9InDrK2DzmRcPJNljvQBGZsJ+Z8ieD2aVFJnvMVrHvX/38WK/Aqqz8/EkfszHWgRPCHmcw5S2YTuy902ocY=
X-Received: by 2002:a17:906:5342:b0:9ad:ef08:1f32 with SMTP id
 j2-20020a170906534200b009adef081f32mr7684677ejo.37.1696595974780; Fri, 06 Oct
 2023 05:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231004093620.2b1d6917@xps-13> <20231004113458.531124-1-mwalle@kernel.org>
 <CAPnjgZ2hWE6Sc=rg55W=-r-TnoWP7Y5gSpn41kwoyja-AMVw+w@mail.gmail.com>
 <9e588e3ec8c0c321a2861723d0d42b9a@kernel.org> <CAPnjgZ20ezipPWAj6bUM9_oCTcX1XzuLqQ7b7-nKjXf1t4p9-Q@mail.gmail.com>
 <a581ef73fa09c6ffeb83a1c1780053bd@kernel.org> <CAPnjgZ2PnKD5m0EgTdEAf-gcK3wuBZvWw_AO2iehb1dmfdoz3A@mail.gmail.com>
 <27d37d4c7cf353d99737a1e7a450f9f7@kernel.org>
In-Reply-To: <27d37d4c7cf353d99737a1e7a450f9f7@kernel.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 6 Oct 2023 06:39:16 -0600
Message-ID: <CAPnjgZ0OZubVaj1RR6rWrJu2MWD=4PEPOD39zhaHgm6OzsyQnw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: fixed-partitions: Add binman compatible
To: Michael Walle <mwalle@kernel.org>
Cc: miquel.raynal@bootlin.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, ptyadav@amazon.de, rafal@milecki.pl, 
	richard@nod.at, robh+dt@kernel.org, robh@kernel.org, trini@konsulko.com, 
	u-boot@lists.denx.de, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_053946_823084_7562322D 
X-CRM114-Status: GOOD (  48.16  )
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

Hi Michael,

On Fri, 6 Oct 2023 at 02:37, Michael Walle <mwalle@kernel.org> wrote:
>
> Hi,
>
> >> I'm still not sure why that compatible is needed. Also I'd need to
> >> change
> >> the label which might break user space apps looking for that specific
> >> name.
> >>
> >> Also, our board might have u-boot/spl or u-boot/spl/bl31/bl32, right
> >> now
> >> that's something which depends on an u-boot configuration variable,
> >> which
> >> then enables or disables binman nodes in the -u-boot.dtsi. So in linux
> >> we only have that "bootloader" partition, but there might be either
> >> u-boot+spl or u-boot+spl+bl31+bl32.
> >>
> >> Honestly, I'm really not sure this should go into a device tree.
> >
> > I think we might be getting a bit ahead of ourselves here. I thought
> > that the decision was that the label should indicate the contents.
> > If you have multiple things in a partition then it would become a
> > 'section' in Binman's terminology. Either the label programmatically
> > describes what is inside or it doesn't. We can't have it both ways.
> > What do you suggest?
>
> As Rob pointed out earlier, it's just a user-facing string. I'm a bit
> reluctant to use it programatically.
> Taking my example again, the string "bootloader" is sufficient for a
> user. He doesn't care if it's u-boot with spl or u-boot with tfa, or
> even coreboot. It just says, "in this partition is the bootloader".
> If you have an "bootloader" image you can flash it there.
>
> If it has a label "u-boot" and I want to switch to coreboot, will
> it have to change to "coreboot"? I really don't think this is practical,
> you are really putting software configuration into the device tree.

I thought Rob changed his mind on that?

I agree that compatible would make things easier. We could then
continue to use 'label' for whatever it currently has.

Note that some kernel drivers or user space will want to look at what
is there, e.g. to provide a way to extract, check or update a
particular part of the firmware.

>
> > At present it seems you have the image described in two places - one
> > is the binman node and the other is the partitions node. I would like
> > to unify these.
>
> And I'm not sure that will work for all the corner cases :/
>
> If you keep the binman section seperate from the flash partition
> definition you don't have any of these problems, although there is
> some redundancy:
>   - you only have compatible = "binman", "fixed-partition", no further
>     compatibles are required
>   - you don't have any conflicts with the current partition descriptions
>   - you could even use the labels, because binman is the (only?) user
>
> But of course you need to find a place where to put your node.

Sure, but I was pointed to partitions as the place where this should live.

>
> > What does user space do with the partition labels?
>
> I'm not sure. Also I'm not sure if it really matters, I just wanted to
> point out, that you'll force users to change it.

OK I'll send a version that uses compatible strings and see if that
makes any progress.

Regards,
Simon

>
> -michael
>
> >> >> What if a board uses eMMC to store the firmware binaries? Will that
> >> >> then
> >> >> be a subnode to the eMMC device?
> >> >
> >> > I thought there was a way to link the partition nodes and the device
> >> > using a property, without having the partition info as a subnode of
> >> > the device. But I may have imagined it as I cannot find it now. So
> >> > yes, it will be a subnode of the eMMC device.
> >>
> >> Not sure if that will fly.
> >
> > I can't find it anyway. There is somelike like that in
> > simple-framebuffer with the 'display' property.
> >
> > Regards,
> > SImon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

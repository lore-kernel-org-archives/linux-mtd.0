Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E222ECD612F
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Oct 2023 19:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaqVID60hr3F9uC8bsayLmTbS1uwpaR5FdzOFeKUWIk=; b=KHS3oXqsZYCVb9
	ZNsQwvdF+b9T82qg8D5PqQwnmb69BMkfw/xR/S7WX9l0YMWVF2KCsBZz79uOdXo4RGcgtWJ1h61fL
	0aMeanTsGX5/MbH4htCxIjRyDu3Ryd8+Xh2rDj/t1BzyP/lawsyszhSIshFecboTb4F9zPmWit/Zv
	nBmI+obx3exhYztvQ4jUinEE0Xzwq4x3EaTNXFYyDxbEIfGmc8PEGyN+bR46Bs4ENEb1mhHCdyD0V
	ErXL2BMqGm288c0kUOnEqy05eQgsHST0MPxCqfqhUNZUc6vmQMS1xHnzGZ4nOQ9qKUcOlJtWoLbY3
	WH7wvybwCtdWJD264UXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpwIx-00BWIa-2H;
	Mon, 09 Oct 2023 19:52:39 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpwIu-00BWEv-20
	for linux-mtd@lists.infradead.org;
	Mon, 09 Oct 2023 19:52:38 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40684f53d11so49930665e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Oct 2023 12:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696881141; x=1697485941; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kW7oULOl0tcK0vEB5NqrNsw6lYYhHfwAHHaIwEUxMyM=;
        b=XdSZKRxV4Ahu7pgIeKKepfO9AHONFCcljbztBZKHDU2PDZhPb8jgnOSteTu/rlYkJ1
         DN83saANcApUhwWpYgdqvlR5n+Cup2IQaU8xawbx0hXvTymtfkMjqlSsUPQRYsnDIWBI
         IjC/pE0FwSOPSK8PfN9DlqkyxZWzV2OQq4Uyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696881141; x=1697485941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kW7oULOl0tcK0vEB5NqrNsw6lYYhHfwAHHaIwEUxMyM=;
        b=aJJYcxNeSvyEGKheP9cLKJGbfh85qf9roROiHJA481S/28OJwintYIY9/dAAgzwbB9
         rTbEvKUN3QY+ol2nGIOtDVnlwg5OU1FE9Zc+FrVuvicMDTMCOIJaRf1G9FI+jvCRhRPn
         1g2qTdOarusMTbax1/Os1fzHb59acZSgWwHCYOmIdBQ+cPbZqvvuNRXYLuVp/cczbQKp
         XiomH2sxcQJMbYAOnn8eg4MxFAKimT7ZUN1yWCv+WdtJYEVawJqiEYr00tQiOYbCb2PD
         ECC/QhrS1L6IsIrSOiUChxc5wElO9mwna9sJtCGIfSsVXzXwC3Cowq6hpHQscpLE1Is6
         Y/QQ==
X-Gm-Message-State: AOJu0YweKihDw9w/kvJv0D9e/epDm8Get+khjUQjgzMSlkZQNBLXRXdz
	sPEsjkilx8110bpRyzbfkcsDP5KvTJuA/x1Vk0Ci+Q==
X-Google-Smtp-Source: AGHT+IEpbVNLiUNALTUpufwGdDawkPR2f/8t9G/X5X4usMASTCQ60W7JTnA2pm9BLCF8M4nViBTM4/u72lvKsnfVy+0=
X-Received: by 2002:a5d:680d:0:b0:319:83e4:bbbf with SMTP id
 w13-20020a5d680d000000b0031983e4bbbfmr15498175wru.20.1696881140946; Mon, 09
 Oct 2023 12:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231004093620.2b1d6917@xps-13> <20231004113458.531124-1-mwalle@kernel.org>
 <CAPnjgZ2hWE6Sc=rg55W=-r-TnoWP7Y5gSpn41kwoyja-AMVw+w@mail.gmail.com>
 <9e588e3ec8c0c321a2861723d0d42b9a@kernel.org> <CAPnjgZ20ezipPWAj6bUM9_oCTcX1XzuLqQ7b7-nKjXf1t4p9-Q@mail.gmail.com>
 <a581ef73fa09c6ffeb83a1c1780053bd@kernel.org> <CAPnjgZ2PnKD5m0EgTdEAf-gcK3wuBZvWw_AO2iehb1dmfdoz3A@mail.gmail.com>
 <27d37d4c7cf353d99737a1e7a450f9f7@kernel.org> <20231006161113.GA3983739-robh@kernel.org>
In-Reply-To: <20231006161113.GA3983739-robh@kernel.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 9 Oct 2023 13:52:02 -0600
Message-ID: <CAPnjgZ0jb0Y1dyVm9FX42G-xYr+8FE01n5GtzoKA-WCe0pa5oA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: fixed-partitions: Add binman compatible
To: Rob Herring <robh@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, miquel.raynal@bootlin.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	ptyadav@amazon.de, rafal@milecki.pl, richard@nod.at, trini@konsulko.com, 
	u-boot@lists.denx.de, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_125236_660456_A94771C6 
X-CRM114-Status: GOOD (  47.44  )
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

Hi Rob,

On Fri, 6 Oct 2023 at 10:11, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Oct 06, 2023 at 10:37:41AM +0200, Michael Walle wrote:
> > Hi,
> >
> > > > I'm still not sure why that compatible is needed. Also I'd need to
> > > > change
> > > > the label which might break user space apps looking for that specific
> > > > name.
> > > >
> > > > Also, our board might have u-boot/spl or u-boot/spl/bl31/bl32, right
> > > > now
> > > > that's something which depends on an u-boot configuration variable,
> > > > which
> > > > then enables or disables binman nodes in the -u-boot.dtsi. So in linux
> > > > we only have that "bootloader" partition, but there might be either
> > > > u-boot+spl or u-boot+spl+bl31+bl32.
> > > >
> > > > Honestly, I'm really not sure this should go into a device tree.
> > >
> > > I think we might be getting a bit ahead of ourselves here. I thought
> > > that the decision was that the label should indicate the contents.
> > > If you have multiple things in a partition then it would become a
> > > 'section' in Binman's terminology. Either the label programmatically
> > > describes what is inside or it doesn't. We can't have it both ways.
> > > What do you suggest?
> >
> > As Rob pointed out earlier, it's just a user-facing string. I'm a bit
> > reluctant to use it programatically.
>
> In general, yes, but the partition stuff has long (and still) uses
> label. As long as the values the tools understand are documented (which
> we don't normally do for label), I don't care so much. That's my
> opinion as long as this is shared with fixed-partitions. If it is not
> and there's little reason to use label, then absolutely, I think
> 'compatible' makes more sense.

OK I will try to drop the sharing with fixed-partitions

>
> > Taking my example again, the string "bootloader" is sufficient for a
> > user. He doesn't care if it's u-boot with spl or u-boot with tfa, or
> > even coreboot. It just says, "in this partition is the bootloader".
> > If you have an "bootloader" image you can flash it there.
>
> These days, there's generally not just 1 bootloader in the boot flow.
> Maybe there's 1 image, maybe not. Being more specific is hardly ever a
> bad thing. Only when the number of specific things becomes multiple 10s
> or 100s of them does it become a problem.
>
>
> > If it has a label "u-boot" and I want to switch to coreboot, will
> > it have to change to "coreboot"? I really don't think this is practical,
> > you are really putting software configuration into the device tree.
>
> On the input side (to binman), yes it is config, but on the output side
> (to the running system) we are saying what's there.
>
>
> > > At present it seems you have the image described in two places - one
> > > is the binman node and the other is the partitions node. I would like
> > > to unify these.
> >
> > And I'm not sure that will work for all the corner cases :/
> >
> > If you keep the binman section seperate from the flash partition
> > definition you don't have any of these problems, although there is
> > some redundancy:
> >  - you only have compatible = "binman", "fixed-partition", no further
> >    compatibles are required
> >  - you don't have any conflicts with the current partition descriptions
> >  - you could even use the labels, because binman is the (only?) user
> >
> > But of course you need to find a place where to put your node.
>
> And remove it. We don't need 2 sources of truth in the DTB.

I would certainly prefer to have one...I think using 'label' for the
existing case and 'compatible' for the new one could be a reasonable
compromise, so I will send v3.

Regards,
Simon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

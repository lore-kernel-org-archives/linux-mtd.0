Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FCCE7C4E8
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Oct 2023 18:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t1FDgVT/NmiP8yL3X7uZHUGCwwp0fHOCVR8+Pjxn3WQ=; b=ysb1tnVIsKZUEj
	T9xZwdQvFiAYDI8E8Iyvkvsz9DXK08SO2aICLG56HJZtvoh4lvoZM3k1Gaq6ic4L+IwfXZmroF+5v
	hPc6H5QkkRq7RKiF+t1tgW7oBWCFjwwS8qoXeS9wpQ8XtcXYppQiAV5fVcUGvKA+Xbf1LibL7f6bu
	528nSQeN6bemrwAp/CtwNwHSlPFfsMVobTQMWsGonZHA+ck2VbncVwrDtpV1od/lxv1+w+sQDV/4q
	sGlHQ+7H9vGrr2nuz3LcwnqvOb0D8FYOXhJTK/aI3eRvyzcc74FtjVUBMROKmQDmiFs+KEnTzzvmU
	ZR+3QK6aTEjyEOY1oymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo6J3-000fHb-0j;
	Wed, 04 Oct 2023 18:09:09 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo6J0-000fGV-0u
	for linux-mtd@lists.infradead.org;
	Wed, 04 Oct 2023 18:09:07 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9a9f139cd94so17470466b.2
        for <linux-mtd@lists.infradead.org>; Wed, 04 Oct 2023 11:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696442944; x=1697047744; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w5W+DRsl6OjglAC7XyeJBSxFDq32iO4B/LzeqS+l/1s=;
        b=ZvwlPBxyYXM7VJEK8Nz6ZoD1dlkoj29TcK90R4Ws3581bvjMJKuJrdiGfu6sVxAcFo
         lxGVYVxpIzn5XYS2EVj8PXiFm+MUtKkaSnrb8sn7/rhagnXEbBiZ5FlGI27qrw5pPc9A
         6AHRvKf/JkQulkgPrXJ2uRr/gly6oMQyeWzrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696442944; x=1697047744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5W+DRsl6OjglAC7XyeJBSxFDq32iO4B/LzeqS+l/1s=;
        b=Z3+aTSdi0ViasbL4LfPiDEKXicjtDy0A4JC8kjSgQl8QbYKVbayTSCBRJlzULSP4G1
         lLjeXV6MMqvkdgd3X2v8DT9EXYvbIjSU+v48j4k6/fedu66wzGcdUnChF3P2tIlhCm1L
         rv9M6j3oL4oli9cqLSdwwLqsz0OtZ6chNJyAurbJKcit7y9Nwa21f7UK3I//gMNlW+vc
         6TV2vP05b1U1YeSE/TXDtdOPqCHIhr1myNL73a8xCU4JGwtBSzh8f9rd3GNrYGUWAQN9
         oBP/arvP6enBeEWuN02EQ/2fq4M2kaF3eB83fznN3J/KIcYhdHg8HkreqfHeBHVeAafW
         dtig==
X-Gm-Message-State: AOJu0YzzhhcXeRHLbbTDGGdkBbGMeTP76geOSRMOPhb3ZGE7dcX4W+Oz
	R7bGcWbxnCuCpqNLnxO2z1FXpwO44+fiRuI8KHWv7g==
X-Google-Smtp-Source: AGHT+IHJlWNCUprSTsy/mi7E27yDL7LOdfmyTuqtZ+hKQqyfalMc4s2i7/u3zX2OuEnZBbKnARbShh/CVYkbdMcM8rE=
X-Received: by 2002:a17:907:7f26:b0:99d:ddae:f5d4 with SMTP id
 qf38-20020a1709077f2600b0099dddaef5d4mr3289336ejc.44.1696442943851; Wed, 04
 Oct 2023 11:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231004093620.2b1d6917@xps-13> <20231004113458.531124-1-mwalle@kernel.org>
 <CAPnjgZ2hWE6Sc=rg55W=-r-TnoWP7Y5gSpn41kwoyja-AMVw+w@mail.gmail.com> <9e588e3ec8c0c321a2861723d0d42b9a@kernel.org>
In-Reply-To: <9e588e3ec8c0c321a2861723d0d42b9a@kernel.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Oct 2023 12:08:52 -0600
Message-ID: <CAPnjgZ20ezipPWAj6bUM9_oCTcX1XzuLqQ7b7-nKjXf1t4p9-Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: fixed-partitions: Add binman compatible
To: Michael Walle <mwalle@kernel.org>
Cc: miquel.raynal@bootlin.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, ptyadav@amazon.de, rafal@milecki.pl, 
	richard@nod.at, robh+dt@kernel.org, robh@kernel.org, trini@konsulko.com, 
	u-boot@lists.denx.de, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_110906_337733_2ED1108D 
X-CRM114-Status: GOOD (  38.96  )
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

On Wed, 4 Oct 2023 at 11:17, Michael Walle <mwalle@kernel.org> wrote:
>
> Hi,
>
> >> >> Add a compatible string for binman, so we can extend fixed-partitions
> >> >> in various ways.
> >> >
> >> > I've been thinking at the proper way to describe the binman partitions.
> >> > I am wondering if we should really extend the fixed-partitions
> >> > schema. This description is really basic and kind of supposed to remain
> >> > like that. Instead, I wonder if we should not just keep the binman
> >> > compatible alone, like many others already. This way it would be very clear
> >> > what is expected and allowed in both cases. I am thinking about
> >> > something like that:
> >> >
> >> >       Documentation/devicetree/bindings/mtd/partitions/brcm,bcm4908-partitions.yaml
> >> >
> >> > this file is also referenced there (but this patch does the same, which
> >> > is what I'd expect):
> >> >
> >> >       Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
> >> >
> >> > I'll let the binding maintainers judge whether they think it's
> >> > relevant, it's not a strong opposition.
> >>
> >> What is the overall goal here? To replace the current binman node
> >> which is
> >> usually contained in the -u-boot.dtsi files? If one is using binman to
> >> create an image, is it expected that one needs to adapt the DT in
> >> linux?
> >> Or will it still be a seperate -u-boot.dtsi? > Because in the latter
> >> case
> >> I see that there will be conflicts because you have to overwrite the
> >> flash node. Or will it be a seperate node with all the information
> >> duplicated?
> >
> > The goal is simply to have a full binding for firmware layout, such
> > that firmware images can be created, examined and updated. The
> > -u-boot.dtsi files are a stopgap while we sort out a real binding.
> > They should eventually go away.
>
> You haven't answered whether this node should be a seperate binman
> node - or if you'll reuse the existing flash (partitions) node(s) and
> add any missing property there. If it's the latter, I don't think
> compatible = "binman", "fixed-partitions"; is correct.

My intent is to make it compatible, so wouldn't it make sense to have
binman as the first compatible, then falling back to fixed-partitions
as the second?

>
> >> Maybe (a more complete) example would be helpful.
> >
> > Can you please be a bit more specific? What is missing from the
> > example?
>
> Like a complete (stripped) DTS. Right now I just see how the individual
> node looks like. But with a complete example DTS, my question from above
> would have been answered.
>
> What if a board uses eMMC to store the firmware binaries? Will that then
> be a subnode to the eMMC device?

I thought there was a way to link the partition nodes and the device
using a property, without having the partition info as a subnode of
the device. But I may have imagined it as I cannot find it now. So
yes, it will be a subnode of the eMMC device.

Regards,
Simon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

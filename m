Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F378AE92707
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Oct 2023 15:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FX62okuxctxDVDkuU+PsN1wwgnu4JPN37ivwuXpuA+k=; b=RRmYrqYE4eRpjF
	8JXMl1Gd/GYvpAGOj9gHoCSpuZHvA7yz9U9MZnKAWYwfYt0l3F6sBSMr3oX1MzbLFEreXLAPMuQH5
	X6naIAThXouFXKebzuh/WZiLqG3Ly1s6kMu2cJP+OzLgpzNLRLi1gitUSiYPkN0ih0PJPTZmqM8nq
	K0p5/OuWNjvjIFV7oR29lgCggFOV29xN0lLksh5bSpLxoD35BQVZ1QikHBYIlYsWiKzxRv7ayB2Ee
	6dRsbdRi7Hrlyf72WdYdKfqbpCquYR8cl+s63NvhGeCKY8BjffMjNwa6/06lWdHmxsU46hwRIn4cc
	eX+sInbDomCufYbnfa6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoPrU-003pXc-0f;
	Thu, 05 Oct 2023 15:02:00 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoPrR-003pWb-1N
	for linux-mtd@lists.infradead.org;
	Thu, 05 Oct 2023 15:01:59 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9a9f139cd94so186253466b.2
        for <linux-mtd@lists.infradead.org>; Thu, 05 Oct 2023 08:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696518116; x=1697122916; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h8XSo8vWm36LWZ3rSW1zGfYcKapAXqlUUdfuMgk7jlw=;
        b=PwJuA+W6qPxdMmgmrHZBoyEU73WlWSyinqc2tDUfaUoFi/F7wUQzrtNHJsB+zK+Qp3
         ESkqBxNfVm3+rz6BZq8sPFv9ym+MLXZcGBcfpLtU4DYECLbiSwTfKvMpvZnAjYVi6WEe
         ZgTFyKla2exRkMyYaoNHGRIJTzJIS8CKWHuCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696518116; x=1697122916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8XSo8vWm36LWZ3rSW1zGfYcKapAXqlUUdfuMgk7jlw=;
        b=FAV++QzU+pFQv9TwXSD9FIC3F681A5+tf5f1Yn1lYO/lQPq/iS1LQwKjG8qshyjwCE
         TNf/uW0IDlW2ZQO1StNdzgXBuSju84U4UJ3rV+MS/r179DgzDgRQWdWmY/+Zhe0QKQ8a
         wQi0CZj9X/h570M4NKwHurx3rfVroHnnX42FCWQfm5RIzJjecUZiVS19wy5WQmOklVJS
         VkqAaz/WunyX0OaESA8RypqMYQJMIo/7kwsLoF+V1WoMg0UTJJo40y2AzDnBk4qL0Z8w
         WCsX7p+20A2FD7gsWxpOaL+BvRaWTfgR52bFJ/PUM7vMpwkt/T7R4bLh/8OGkFJbcngr
         aCgQ==
X-Gm-Message-State: AOJu0YyMylw+P4ewAfQUFf6k+QhAWe0VzbTJmSIc0uCjfh8/y5Aigb/4
	yw8i+k+coUiWu2ckst0uwo8qx/MF5sXTr8MWX5snwg==
X-Google-Smtp-Source: AGHT+IFI48BhuG1G9AcuKAA3kW3STHzt2tYWan2TMR0zXe+CE2tzMeLHhTwaWbF+UTvq43r1Tk83kFqtaBcaiUN3uyg=
X-Received: by 2002:a17:907:9802:b0:9ae:56ad:65a7 with SMTP id
 ji2-20020a170907980200b009ae56ad65a7mr5692569ejc.45.1696518115514; Thu, 05
 Oct 2023 08:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231004093620.2b1d6917@xps-13> <20231004113458.531124-1-mwalle@kernel.org>
 <CAPnjgZ2hWE6Sc=rg55W=-r-TnoWP7Y5gSpn41kwoyja-AMVw+w@mail.gmail.com>
 <9e588e3ec8c0c321a2861723d0d42b9a@kernel.org> <CAPnjgZ20ezipPWAj6bUM9_oCTcX1XzuLqQ7b7-nKjXf1t4p9-Q@mail.gmail.com>
 <a581ef73fa09c6ffeb83a1c1780053bd@kernel.org> <CAPnjgZ2PnKD5m0EgTdEAf-gcK3wuBZvWw_AO2iehb1dmfdoz3A@mail.gmail.com>
In-Reply-To: <CAPnjgZ2PnKD5m0EgTdEAf-gcK3wuBZvWw_AO2iehb1dmfdoz3A@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 5 Oct 2023 09:01:38 -0600
Message-ID: <CAPnjgZ1rbXgAK94KfMi4wp3=jcug9CHyDzZuhqbuzrBiMmrhTA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: fixed-partitions: Add binman compatible
To: Michael Walle <mwalle@kernel.org>
Cc: miquel.raynal@bootlin.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, ptyadav@amazon.de, rafal@milecki.pl, 
	richard@nod.at, robh+dt@kernel.org, robh@kernel.org, trini@konsulko.com, 
	u-boot@lists.denx.de, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_080157_490848_120E2A27 
X-CRM114-Status: GOOD (  65.62  )
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

On Thu, 5 Oct 2023 at 07:28, Simon Glass <sjg@chromium.org> wrote:
>
> Hi Michael,
>
> On Thu, 5 Oct 2023 at 02:54, Michael Walle <mwalle@kernel.org> wrote:
> >
> > Hi,
> >
> > >> >> >> Add a compatible string for binman, so we can extend fixed-partitions
> > >> >> >> in various ways.
> > >> >> >
> > >> >> > I've been thinking at the proper way to describe the binman partitions.
> > >> >> > I am wondering if we should really extend the fixed-partitions
> > >> >> > schema. This description is really basic and kind of supposed to remain
> > >> >> > like that. Instead, I wonder if we should not just keep the binman
> > >> >> > compatible alone, like many others already. This way it would be very clear
> > >> >> > what is expected and allowed in both cases. I am thinking about
> > >> >> > something like that:
> > >> >> >
> > >> >> >       Documentation/devicetree/bindings/mtd/partitions/brcm,bcm4908-partitions.yaml
> > >> >> >
> > >> >> > this file is also referenced there (but this patch does the same, which
> > >> >> > is what I'd expect):
> > >> >> >
> > >> >> >       Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
> > >> >> >
> > >> >> > I'll let the binding maintainers judge whether they think it's
> > >> >> > relevant, it's not a strong opposition.
> > >> >>
> > >> >> What is the overall goal here? To replace the current binman node
> > >> >> which is
> > >> >> usually contained in the -u-boot.dtsi files? If one is using binman to
> > >> >> create an image, is it expected that one needs to adapt the DT in
> > >> >> linux?
> > >> >> Or will it still be a seperate -u-boot.dtsi? > Because in the latter
> > >> >> case
> > >> >> I see that there will be conflicts because you have to overwrite the
> > >> >> flash node. Or will it be a seperate node with all the information
> > >> >> duplicated?
> > >> >
> > >> > The goal is simply to have a full binding for firmware layout, such
> > >> > that firmware images can be created, examined and updated. The
> > >> > -u-boot.dtsi files are a stopgap while we sort out a real binding.
> > >> > They should eventually go away.
> > >>
> > >> You haven't answered whether this node should be a seperate binman
> > >> node - or if you'll reuse the existing flash (partitions) node(s) and
> > >> add any missing property there. If it's the latter, I don't think
> > >> compatible = "binman", "fixed-partitions"; is correct.
> > >
> > > My intent is to make it compatible, so wouldn't it make sense to have
> > > binman as the first compatible, then falling back to fixed-partitions
> > > as the second?
> >
> > As far as I know, the compatibles should get more specific with each
> > string.
>
> That's the opposite to what I understood.
>
> > But "binman" seems to be used as a kind of tag which could be
> > added to any compatible under the flash node. What if one wants to build
> > an image which isn't compatible = "fixed-partitions"? E.g.
> > "linksys,ns-partitions", will it then have
> > compatible = "binman", "linksys,ns-partitions"?
>
> I suppose so.
>
> >
> >
> > >> >> Maybe (a more complete) example would be helpful.
> > >> >
> > >> > Can you please be a bit more specific? What is missing from the
> > >> > example?
> > >>
> > >> Like a complete (stripped) DTS. Right now I just see how the
> > >> individual
> > >> node looks like. But with a complete example DTS, my question from
> > >> above
> > >> would have been answered.
> >
> > So to give an example myself, please correct it if it's wrong. From
> > our board (kontron-sl28):
> >
> > &fspi {
> >          status = "okay";
> >
> >          flash@0 {
> >                  compatible = "jedec,spi-nor";
> >                  m25p,fast-read;
> >                  spi-max-frequency = <133000000>;
> >                  reg = <0>;
> >                  /* The following setting enables 1-1-2 (CMD-ADDR-DATA)
> > mode */
> >                  spi-rx-bus-width = <2>; /* 2 SPI Rx lines */
> >                  spi-tx-bus-width = <1>; /* 1 SPI Tx line */
> >
> >                  partitions {
> >                          compatible = "fixed-partitions";
> >                          #address-cells = <1>;
> >                          #size-cells = <1>;
> >
> >                          partition@0 {
> >                                  reg = <0x000000 0x010000>;
> >                                  label = "rcw";
> >                                  read-only;
> >                          };
> >
> >                          partition@10000 {
> >                                  reg = <0x010000 0x1d0000>;
> >                                  label = "failsafe bootloader";
> >                                  read-only;
> >                          };
> >
> >                          partition@200000 {
> >                                  reg = <0x200000 0x010000>;
> >                                  label = "configuration store";
> >                          };
> >
> >                          partition@210000 {
> >                                  reg = <0x210000 0x1d0000>;
> >                                  label = "bootloader";
> >                          };
> >
> >                          partition@3e0000 {
> >                                  reg = <0x3e0000 0x020000>;
> >                                  label = "bootloader environment";
> >                          };
> >                  };
> >          };
> > };
> >
> > In u-boot we use binman, see
> > arch/arm/dts/fsl-ls1028a-kontron-sl28-u-boot.dtsi
> > in the u-boot repository.
> >
> > Now to use the new method, am I expected to adapt the dts in the
> > linux kernel? As far as I understand that is the case. So that node
> > from above would look something like the following:
> >
> > &fspi {
> >          status = "okay";
> >
> >          flash@0 {
> >                  compatible = "jedec,spi-nor";
> >                  m25p,fast-read;
> >                  spi-max-frequency = <133000000>;
> >                  reg = <0>;
> >                  /* The following setting enables 1-1-2 (CMD-ADDR-DATA)
> > mode */
> >                  spi-rx-bus-width = <2>; /* 2 SPI Rx lines */
> >                  spi-tx-bus-width = <1>; /* 1 SPI Tx line */
> >
> >                  partitions {
> >                          compatible = "binman", "fixed-partitions";
> >                          #address-cells = <1>;
> >                          #size-cells = <1>;
> > [..]
> >                          partition@210000 {
> >                                  reg = <0x210000 0x1d0000>;
> >                                  label = "u-boot"; /* or "u-boot+atf" ?
> > */
> >                          };
> >
> >                          partition@3e0000 {
> >                                  reg = <0x3e0000 0x020000>;
> >                                  label = "bootloader environment";
> >                          };
> >                  };
> >          };
> > };
> >
> > I'm still not sure why that compatible is needed. Also I'd need to
> > change
> > the label which might break user space apps looking for that specific
> > name.
> >
> > Also, our board might have u-boot/spl or u-boot/spl/bl31/bl32, right now
> > that's something which depends on an u-boot configuration variable,
> > which
> > then enables or disables binman nodes in the -u-boot.dtsi. So in linux
> > we only have that "bootloader" partition, but there might be either
> > u-boot+spl or u-boot+spl+bl31+bl32.
> >
> > Honestly, I'm really not sure this should go into a device tree.
>
> I think we might be getting a bit ahead of ourselves here. I thought
> that the decision was that the label should indicate the contents. If
> you have multiple things in a partition then it would become a
> 'section' in Binman's terminology. Either the label programmatically
> describes what is inside or it doesn't. We can't have it both ways.
> What do you suggest?
>
> At present it seems you have the image described in two places - one
> is the binman node and the other is the partitions node. I would like
> to unify these.

I should also mention that I originally proposed a binman in the
/firmware node, but Rob indicated that the /firmware node is not for
that sort of purpose.

>
> What does user space do with the partition labels?
>
> >
> > >> What if a board uses eMMC to store the firmware binaries? Will that
> > >> then
> > >> be a subnode to the eMMC device?
> > >
> > > I thought there was a way to link the partition nodes and the device
> > > using a property, without having the partition info as a subnode of
> > > the device. But I may have imagined it as I cannot find it now. So
> > > yes, it will be a subnode of the eMMC device.
> >
> > Not sure if that will fly.
>
> I can't find it anyway. There is somelike like that in
> simple-framebuffer with the 'display' property.

Regards,
Simon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

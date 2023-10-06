Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9806E81E17
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Oct 2023 16:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GmpfUhDSp8ldqIE2xRHQ6JT3GLLzSAfra4KBkge1aWc=; b=4xVzJoaD+x73WY
	PHCPbkjpDqyyFskOEfwAiwZDpAwgIYQhbXH5Pndm8yOtPtksK7/qEMfI0jBWionELygaLqwte4JiI
	SbiO0ISox8FZ2ZWVMuiHMvQdg7lOPTr6Uz85qnfpcdbmByjFTHqKoBuez3+Toy6ZGfjIgl5bHox0E
	3MOUvxNbIQL0EG5kdfSUnlfwHC3EIrDOIGPz3fpW0OugCk0NN0237iv/ctwu8gpJxDx6r80hrbUVX
	MiMk0ndXHBBx9U09BcF58yJ0mbTZO/E++Mvf8k+e0T8numLAqhKdegPj2IkLnFk7YlIYus2IsIQBO
	yudDegbecyzPYofbnDNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qonQ9-0069OZ-1a;
	Fri, 06 Oct 2023 16:11:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qonQ6-0069NG-2q
	for linux-mtd@lists.infradead.org;
	Fri, 06 Oct 2023 16:11:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C0D361242;
	Fri,  6 Oct 2023 16:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A9BC433C7;
	Fri,  6 Oct 2023 16:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696608676;
	bh=2E1MNctTSxoG5VE50oJM9yMY/dfSLIM7MkC8uY5n6I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ndf7M6I2Ha7XUsr7BbDTNhDj9gLpk/Iui5kN6/CI4DaL7NubEIq2KjsGCtRLhiBBw
	 JCCJ+sJpzASxFIRjx1xBGpWYjcBxJEa8RxYiWPbzuN1jNQQJpLxmYwIj5b5lTWmY5m
	 NYeU1AIPn0Fa8GZitrh4ihWmaaCagI0N9FjMcCf+JYqzjbN5X0kcmpGoewd9ppxw3F
	 +9D+uOGyJeaZT4JKaU+LezQ/Mci/Yy99M0NC899FUn473ikndsKYOoG9Ow2WXSRzGJ
	 +T1m1tm19vjw5DsACRmWo5GMxyDJWd0xidAsGiZfNT0bJWNUd4oX4CNB5xonhPgWJw
	 WrkAcKEk28Hsw==
Received: (nullmailer pid 4016330 invoked by uid 1000);
	Fri, 06 Oct 2023 16:11:13 -0000
Date: Fri, 6 Oct 2023 11:11:13 -0500
From: Rob Herring <robh@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Simon Glass <sjg@chromium.org>, miquel.raynal@bootlin.com, conor+dt@kernel.org, devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, ptyadav@amazon.de, rafal@milecki.pl, richard@nod.at, trini@konsulko.com, u-boot@lists.denx.de, vigneshr@ti.com
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: fixed-partitions: Add binman
 compatible
Message-ID: <20231006161113.GA3983739-robh@kernel.org>
References: <20231004093620.2b1d6917@xps-13>
 <20231004113458.531124-1-mwalle@kernel.org>
 <CAPnjgZ2hWE6Sc=rg55W=-r-TnoWP7Y5gSpn41kwoyja-AMVw+w@mail.gmail.com>
 <9e588e3ec8c0c321a2861723d0d42b9a@kernel.org>
 <CAPnjgZ20ezipPWAj6bUM9_oCTcX1XzuLqQ7b7-nKjXf1t4p9-Q@mail.gmail.com>
 <a581ef73fa09c6ffeb83a1c1780053bd@kernel.org>
 <CAPnjgZ2PnKD5m0EgTdEAf-gcK3wuBZvWw_AO2iehb1dmfdoz3A@mail.gmail.com>
 <27d37d4c7cf353d99737a1e7a450f9f7@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <27d37d4c7cf353d99737a1e7a450f9f7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_091119_009071_5C896C41 
X-CRM114-Status: GOOD (  39.50  )
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

On Fri, Oct 06, 2023 at 10:37:41AM +0200, Michael Walle wrote:
> Hi,
> 
> > > I'm still not sure why that compatible is needed. Also I'd need to
> > > change
> > > the label which might break user space apps looking for that specific
> > > name.
> > > 
> > > Also, our board might have u-boot/spl or u-boot/spl/bl31/bl32, right
> > > now
> > > that's something which depends on an u-boot configuration variable,
> > > which
> > > then enables or disables binman nodes in the -u-boot.dtsi. So in linux
> > > we only have that "bootloader" partition, but there might be either
> > > u-boot+spl or u-boot+spl+bl31+bl32.
> > > 
> > > Honestly, I'm really not sure this should go into a device tree.
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

In general, yes, but the partition stuff has long (and still) uses 
label. As long as the values the tools understand are documented (which 
we don't normally do for label), I don't care so much. That's my 
opinion as long as this is shared with fixed-partitions. If it is not 
and there's little reason to use label, then absolutely, I think 
'compatible' makes more sense. 

> Taking my example again, the string "bootloader" is sufficient for a
> user. He doesn't care if it's u-boot with spl or u-boot with tfa, or
> even coreboot. It just says, "in this partition is the bootloader".
> If you have an "bootloader" image you can flash it there.

These days, there's generally not just 1 bootloader in the boot flow. 
Maybe there's 1 image, maybe not. Being more specific is hardly ever a 
bad thing. Only when the number of specific things becomes multiple 10s 
or 100s of them does it become a problem.


> If it has a label "u-boot" and I want to switch to coreboot, will
> it have to change to "coreboot"? I really don't think this is practical,
> you are really putting software configuration into the device tree.

On the input side (to binman), yes it is config, but on the output side 
(to the running system) we are saying what's there.


> > At present it seems you have the image described in two places - one
> > is the binman node and the other is the partitions node. I would like
> > to unify these.
> 
> And I'm not sure that will work for all the corner cases :/
> 
> If you keep the binman section seperate from the flash partition
> definition you don't have any of these problems, although there is
> some redundancy:
>  - you only have compatible = "binman", "fixed-partition", no further
>    compatibles are required
>  - you don't have any conflicts with the current partition descriptions
>  - you could even use the labels, because binman is the (only?) user
> 
> But of course you need to find a place where to put your node.

And remove it. We don't need 2 sources of truth in the DTB.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

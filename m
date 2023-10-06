Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581FFE92FF8
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Oct 2023 08:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFshC8MONJvClN4xW2iB/9k2liZiT651e+cW3DKdjxA=; b=p6Lqk9hxxWN0GwTKGelderMhvc
	tGi4TXUK68gzu+1ElbQsRVCtvoLMVQR8JKevzahbQmwSIaOmK+lIj8aTUtPxUm4I3SKWcT6ynTxUu
	k/2YzrzeWoylfXyuWSP1nA+mDDfm53FI/PLOZ+4kECyJ+ZnIrLJYB3/QvHBAAiWpUdgQEMOaVy3mV
	cGN6s+uFoKIFb3yQUfNQ/We3fSEUVPeog8qpTnk5FR5xPaSfh6XvdMvmoD2uZR9gH+kpzcVk5MhZ4
	UUpmHevO0xWhqKVMBWeXe0/SV4H9AdgSXzhWu3XjQ937BF2rrdxqAyjZX7og8xBrIfB3Ii5j9+WlS
	D+gX0PNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qogLJ-005ImL-2I;
	Fri, 06 Oct 2023 08:37:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qogLG-005Iku-04
	for linux-mtd@lists.infradead.org;
	Fri, 06 Oct 2023 08:37:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F2B48B8272A;
	Fri,  6 Oct 2023 08:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CC7C433C7;
	Fri,  6 Oct 2023 08:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696581467;
	bh=FgJYm01/N7btQ6Qz+G8RgkTRmDSNcZ+Y3gfxNpLK3Tg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iH3wJagTAe22K+Ho9b7VGPb4l4lwixmsS4OrGinVrtNjm56X8TWlcag3S4Pe0akve
	 GMwvi2ADg93Sb0+A/dIQFcv+QWfjRof7It7afH70n+Zc/SHU1tNrI8cv4O0YPv/S5Y
	 vfBrwcAP5o2I7/khzmM5esD2aO+XNle5mqK0pUMIRf+SGmzDAOaPpS8Al/gmwrbsB8
	 LNJVySamIQ6vTUofquyw5J+5/NzthSkN0pXcO0zTj3QY1SMC3Xom7VwBa2rWa2uFN2
	 QBLgX31TpeS0lfMQ116AnrP4EKQ3wHQqMVZq+YCz5kpLXJLsze3Rqin2tnaPlq8BEr
	 QcqJ5gPkLtD/A==
MIME-Version: 1.0
Date: Fri, 06 Oct 2023 10:37:41 +0200
From: Michael Walle <mwalle@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: miquel.raynal@bootlin.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ptyadav@amazon.de, rafal@milecki.pl, richard@nod.at, robh+dt@kernel.org,
 robh@kernel.org, trini@konsulko.com, u-boot@lists.denx.de, vigneshr@ti.com
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: fixed-partitions: Add binman
 compatible
In-Reply-To: <CAPnjgZ2PnKD5m0EgTdEAf-gcK3wuBZvWw_AO2iehb1dmfdoz3A@mail.gmail.com>
References: <20231004093620.2b1d6917@xps-13>
 <20231004113458.531124-1-mwalle@kernel.org>
 <CAPnjgZ2hWE6Sc=rg55W=-r-TnoWP7Y5gSpn41kwoyja-AMVw+w@mail.gmail.com>
 <9e588e3ec8c0c321a2861723d0d42b9a@kernel.org>
 <CAPnjgZ20ezipPWAj6bUM9_oCTcX1XzuLqQ7b7-nKjXf1t4p9-Q@mail.gmail.com>
 <a581ef73fa09c6ffeb83a1c1780053bd@kernel.org>
 <CAPnjgZ2PnKD5m0EgTdEAf-gcK3wuBZvWw_AO2iehb1dmfdoz3A@mail.gmail.com>
Message-ID: <27d37d4c7cf353d99737a1e7a450f9f7@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_013750_385800_CD4363F2 
X-CRM114-Status: GOOD (  30.10  )
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

Hi,

>> I'm still not sure why that compatible is needed. Also I'd need to
>> change
>> the label which might break user space apps looking for that specific
>> name.
>> 
>> Also, our board might have u-boot/spl or u-boot/spl/bl31/bl32, right 
>> now
>> that's something which depends on an u-boot configuration variable,
>> which
>> then enables or disables binman nodes in the -u-boot.dtsi. So in linux
>> we only have that "bootloader" partition, but there might be either
>> u-boot+spl or u-boot+spl+bl31+bl32.
>> 
>> Honestly, I'm really not sure this should go into a device tree.
> 
> I think we might be getting a bit ahead of ourselves here. I thought
> that the decision was that the label should indicate the contents.
> If you have multiple things in a partition then it would become a
> 'section' in Binman's terminology. Either the label programmatically
> describes what is inside or it doesn't. We can't have it both ways.
> What do you suggest?

As Rob pointed out earlier, it's just a user-facing string. I'm a bit
reluctant to use it programatically.
Taking my example again, the string "bootloader" is sufficient for a
user. He doesn't care if it's u-boot with spl or u-boot with tfa, or
even coreboot. It just says, "in this partition is the bootloader".
If you have an "bootloader" image you can flash it there.

If it has a label "u-boot" and I want to switch to coreboot, will
it have to change to "coreboot"? I really don't think this is practical,
you are really putting software configuration into the device tree.

> At present it seems you have the image described in two places - one
> is the binman node and the other is the partitions node. I would like
> to unify these.

And I'm not sure that will work for all the corner cases :/

If you keep the binman section seperate from the flash partition
definition you don't have any of these problems, although there is
some redundancy:
  - you only have compatible = "binman", "fixed-partition", no further
    compatibles are required
  - you don't have any conflicts with the current partition descriptions
  - you could even use the labels, because binman is the (only?) user

But of course you need to find a place where to put your node.

> What does user space do with the partition labels?

I'm not sure. Also I'm not sure if it really matters, I just wanted to
point out, that you'll force users to change it.

-michael

>> >> What if a board uses eMMC to store the firmware binaries? Will that
>> >> then
>> >> be a subnode to the eMMC device?
>> >
>> > I thought there was a way to link the partition nodes and the device
>> > using a property, without having the partition info as a subnode of
>> > the device. But I may have imagined it as I cannot find it now. So
>> > yes, it will be a subnode of the eMMC device.
>> 
>> Not sure if that will fly.
> 
> I can't find it anyway. There is somelike like that in
> simple-framebuffer with the 'display' property.
> 
> Regards,
> SImon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

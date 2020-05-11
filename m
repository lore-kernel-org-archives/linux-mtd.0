Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5ECC47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 14:45:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C66F20708
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 14:45:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T9RTSOaE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C66F20708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJyFQA83XbnEz8ulv1WajjO+uxMhHM6I0OKdiN2VmyI=; b=T9RTSOaE2OJFyE
	krpy+NUUXX5esQ85x56TQoO5IgRJvkLWzCnMSkmGD0wKgc/+MkvI9XcE2338lBnNsqDY50CcMnEgC
	FO5SxbX/yXrejUPOk5eSFstqIGsupbmdDAuO35HIFoGVsxQedDj9dsJcpYzeqowh9grKLUCCqtApN
	WipFd5s3M6R674D4hcLuRca0mEWGcMjwyvkax4P6DZYLxSDkhJlb6ID1ndjHeC/2lTMykhJJuFgaa
	qOpb2p+v80aTjGimR1iYAyyJEcaPgKNOG857p49kZ74NemVHhxlA2oakuW5gqgFRiZxFguPA7LhqW
	ipr2qJ2XBtdhNXecsTNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY9gX-00054D-AZ; Mon, 11 May 2020 14:45:37 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY9gU-00053V-35
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 14:45:35 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5EA232000D;
 Mon, 11 May 2020 14:45:29 +0000 (UTC)
Date: Mon, 11 May 2020 16:45:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH v4 10/10] mtd: rawnand: stm32_fmc2: get resources from
 parent node
Message-ID: <20200511164524.3f94ba31@xps13>
In-Reply-To: <6f822f79-18f1-5308-16cc-b31f0be80d5a@st.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <1588756279-17289-11-git-send-email-christophe.kerello@st.com>
 <20200511111855.48216940@xps13>
 <3377adc6-3e5e-b9b7-12be-c7aa44bfac82@st.com>
 <20200511135926.3e5c622d@xps13>
 <0c704fea-f2a6-2cec-8741-d322acf6afd5@st.com>
 <20200511145855.35c6abfb@xps13>
 <6f822f79-18f1-5308-16cc-b31f0be80d5a@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_074534_403944_E004C391 
X-CRM114-Status: GOOD (  27.02  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, gregkh@linuxfoundation.org, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, boris.brezillon@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Christophe,

Christophe Kerello <christophe.kerello@st.com> wrote on Mon, 11 May
2020 16:19:47 +0200:

> Hi Miquel,
> 
> On 5/11/20 2:58 PM, Miquel Raynal wrote:
> > Hi Christophe,
> > 
> > Christophe Kerello <christophe.kerello@st.com> wrote on Mon, 11 May
> > 2020 14:47:09 +0200:
> >   
> >> Hi Miquel,
> >>
> >> On 5/11/20 1:59 PM, Miquel Raynal wrote:  
> >>> Hi Christophe,
> >>>
> >>> Christophe Kerello <christophe.kerello@st.com> wrote on Mon, 11 May
> >>> 2020 12:21:03 +0200:  
> >>>    >>>> Hi Miquel,  
> >>>>
> >>>> On 5/11/20 11:18 AM, Miquel Raynal wrote:  
> >>>>> Hi Christophe,
> >>>>>
> >>>>> Christophe Kerello <christophe.kerello@st.com> wrote on Wed, 6 May 2020
> >>>>> 11:11:19 +0200:  
> >>>>>     >>>> FMC2 EBI support has been added. Common resources (registers base  
> >>>>>> and clock) are now shared between the 2 drivers. It means that the
> >>>>>> common resources should now be found in the parent device when EBI
> >>>>>> node is available.
> >>>>>>
> >>>>>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> >>>>>> ---  
> >>>>>
> >>>>> [...]  
> >>>>>     >>>> +  
> >>>>>> +static bool stm32_fmc2_nfc_check_for_parent(struct platform_device *pdev)
> >>>>>> +{
> >>>>>> +	u32 i;
> >>>>>> +	int nb_resources = 0;
> >>>>>> +
> >>>>>> +	/* Count the number of resources in reg property */
> >>>>>> +	for (i = 0; i < pdev->num_resources; i++) {
> >>>>>> +		struct resource *res = &pdev->resource[i];
> >>>>>> +
> >>>>>> +		if (resource_type(res) == IORESOURCE_MEM)
> >>>>>> +			nb_resources++;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	/* Each CS needs 3 resources defined (data, cmd and addr) */
> >>>>>> +	if (nb_resources % 3)
> >>>>>> +		return false;
> >>>>>> +
> >>>>>> +	return true;
> >>>>>> +}  
> >>>>>
> >>>>> This function looks fragile. Why not just checking the compatible
> >>>>> string of the parent node?  
> >>>>>     >>  
> >>>> Yes, it is another way to check that we have an EBI parent node.
> >>>>
> >>>> In this implementation, I was checking the number of reg tuples.
> >>>> In case we have 6, it means that the register base address is defined in the parent node (EBI node).
> >>>> In case we have 7, it means that the register base address is defined in the current node (NFC node).  
> >>>
> >>> Yes, I understand what you are doing, but I kind of dislike the logic.
> >>> Relying on the number of reg tuples is something that can be done (I
> >>> used it myself one time), but I think this is more a hack that you do
> >>> when you have no other way to differentiate. I guess the proper way
> >>> would be to look at the parent's compatible. If it matches what you
> >>> expect, then you can store the dev->of_node->parent->dev somewhere in
> >>> your controller's structure and then use it to initialize the clock and
> >>> regmap. This way you don't have to move anything else in the probe path.  
> >>>    >>  
> >> OK, I will check the compatible string of the parent device using of_device_is_compatible API in v5.
> >> In case of the parent is found, I will add it in the structure of the controller (dev_parent).
> >> I will rely on this field only to get the common resources (the register base address and the clock) in the NFC node or in the EBI node.  
> > 
> > I had something slightly different in mind: what about setting a
> > default value to this field as being the controller's device itself.
> > This way, once it is set to either the parent device or the device
> > itself, you can use it "blindly" in your devm_clk_get/regmap_init calls?
> >   
> 
> I will try to explain what I have in mind.
> 
> I will add a new field in the structure of the controller (not called dev_parent but cdev)
> struct device *cdev;
> 
> Then, at probe time, this field will be assigned:
> nfc->cdev = of_device_is_compatible(dev->parent->of_node, "bla bla") : dev->parent ? dev;

That's what I had in mind. Maybe you'll have to use
dev->of_node->parent though, I think they are not equivalent.

> 
> For the clock, it will be
> nfc->clk = devm_clk_get(nfc->cdev, NULL);
> 
> For the register base, I need to replace:
> res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> mmio = devm_ioremap_resource(dev, res);
> if (IS_ERR(mmio))
> 	return PTR_ERR(mmio);
> 
> nfc->regmap = devm_regmap_init_mmio(dev, mmio, &stm32_fmc2_regmap_cfg);
> if (IS_ERR(nfc->regmap))
> 	return PTR_ERR(nfc->regmap);
> 
> nfc->io_phys_addr = res->start;
> 
> With:
> 
> ret = of_address_to_resource(nfc->cdev->of_node, 0, &res);
> if (ret)
> 	return ret;
> 
> nfc->io_phys_addr = res.start;
> 
> nfc->regmap = device_node_to_regmap(nfc->cdev->of_node);
> if (IS_ERR(nfc->regmap))
> 	return PTR_ERR(nfc->regmap);
> 
> I expect that you were thinking about something like this proposal.

This means the regmap has already been initialized, can you make sure
it is actually the case? What if the probe of the EBI block happens
next, or is deferred? (maybe you'll get a -EPROBE_DEFER, which is fine
then). Please try booting with the EBI node but without the EBI driver
and see if this is handled gracefully.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

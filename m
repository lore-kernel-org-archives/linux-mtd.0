Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78817C47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 12:59:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4822F20736
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 12:59:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i7JOhjRE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4822F20736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mntf8hVkiLicBa2npIRkbhl+v5qLZyA4Xg1zwHS86Mg=; b=i7JOhjRE9kWzk2
	LSLKDNoW5sjSMmVOaQ7aIbiFUX2moIoV5MZQKdZ/NKnrB3u3qDskVw3F9Q+jm7HOcRJ7sUrJOrLxa
	F32kBpt3rQCyqT6UhrzsmuOqvW8FD8KB0srLjKnshfO0IPUvpllaWhBYmgh0zqsWDQA0SOw44SPHi
	3zjSBscdwEejqbSTphLMSA8bb+knp0j292rJOV8p2ZrKYTsEDQisfE0PrdkqGDZHIts7/g/v8SVGq
	+RnQG3LuBO2eNvHEJiLam0G9DZ1CRCawDrh+aaiQBM9TqAVXxPNWH2OMRGSJA42jYREvJDFlwUkLL
	q3+j77cL0g0I/lit54Vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY81S-000179-Ss; Mon, 11 May 2020 12:59:06 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY81O-00015z-Nw
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 12:59:04 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id BBCCF24001A;
 Mon, 11 May 2020 12:58:56 +0000 (UTC)
Date: Mon, 11 May 2020 14:58:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH v4 10/10] mtd: rawnand: stm32_fmc2: get resources from
 parent node
Message-ID: <20200511145855.35c6abfb@xps13>
In-Reply-To: <0c704fea-f2a6-2cec-8741-d322acf6afd5@st.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <1588756279-17289-11-git-send-email-christophe.kerello@st.com>
 <20200511111855.48216940@xps13>
 <3377adc6-3e5e-b9b7-12be-c7aa44bfac82@st.com>
 <20200511135926.3e5c622d@xps13>
 <0c704fea-f2a6-2cec-8741-d322acf6afd5@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_055903_049011_040A75F0 
X-CRM114-Status: GOOD (  21.70  )
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
2020 14:47:09 +0200:

> Hi Miquel,
> 
> On 5/11/20 1:59 PM, Miquel Raynal wrote:
> > Hi Christophe,
> > 
> > Christophe Kerello <christophe.kerello@st.com> wrote on Mon, 11 May
> > 2020 12:21:03 +0200:
> >   
> >> Hi Miquel,
> >>
> >> On 5/11/20 11:18 AM, Miquel Raynal wrote:  
> >>> Hi Christophe,
> >>>
> >>> Christophe Kerello <christophe.kerello@st.com> wrote on Wed, 6 May 2020
> >>> 11:11:19 +0200:  
> >>>    >>>> FMC2 EBI support has been added. Common resources (registers base  
> >>>> and clock) are now shared between the 2 drivers. It means that the
> >>>> common resources should now be found in the parent device when EBI
> >>>> node is available.
> >>>>
> >>>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> >>>> ---  
> >>>
> >>> [...]  
> >>>    >>>> +  
> >>>> +static bool stm32_fmc2_nfc_check_for_parent(struct platform_device *pdev)
> >>>> +{
> >>>> +	u32 i;
> >>>> +	int nb_resources = 0;
> >>>> +
> >>>> +	/* Count the number of resources in reg property */
> >>>> +	for (i = 0; i < pdev->num_resources; i++) {
> >>>> +		struct resource *res = &pdev->resource[i];
> >>>> +
> >>>> +		if (resource_type(res) == IORESOURCE_MEM)
> >>>> +			nb_resources++;
> >>>> +	}
> >>>> +
> >>>> +	/* Each CS needs 3 resources defined (data, cmd and addr) */
> >>>> +	if (nb_resources % 3)
> >>>> +		return false;
> >>>> +
> >>>> +	return true;
> >>>> +}  
> >>>
> >>> This function looks fragile. Why not just checking the compatible
> >>> string of the parent node?  
> >>>    >>  
> >> Yes, it is another way to check that we have an EBI parent node.
> >>
> >> In this implementation, I was checking the number of reg tuples.
> >> In case we have 6, it means that the register base address is defined in the parent node (EBI node).
> >> In case we have 7, it means that the register base address is defined in the current node (NFC node).  
> > 
> > Yes, I understand what you are doing, but I kind of dislike the logic.
> > Relying on the number of reg tuples is something that can be done (I
> > used it myself one time), but I think this is more a hack that you do
> > when you have no other way to differentiate. I guess the proper way
> > would be to look at the parent's compatible. If it matches what you
> > expect, then you can store the dev->of_node->parent->dev somewhere in
> > your controller's structure and then use it to initialize the clock and
> > regmap. This way you don't have to move anything else in the probe path.
> >   
> 
> OK, I will check the compatible string of the parent device using of_device_is_compatible API in v5.
> In case of the parent is found, I will add it in the structure of the controller (dev_parent).
> I will rely on this field only to get the common resources (the register base address and the clock) in the NFC node or in the EBI node.

I had something slightly different in mind: what about setting a
default value to this field as being the controller's device itself.
This way, once it is set to either the parent device or the device
itself, you can use it "blindly" in your devm_clk_get/regmap_init calls?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

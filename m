Return-Path: <SRS0=OCz7=HG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B4BC433E0
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Feb 2021 09:05:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8360C64F44
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Feb 2021 09:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8360C64F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ew42KcW5Nyx+b5OV83/MBKu+Zo9IniDYtusDwKVniNw=; b=Bp5jnGyEwBBjrLXCBGD7EhiQ5
	7XHbC8v4iQI0DdxIYdBkF1n26UwLxfbmoAHGL3mZE4QwOtGFhSXaGdpg1D+pWveCs95CHAWMNcr43
	yiSiZUEuPRqkDDEicDDepmk6W6Trva7ZVvk/Xw4a1FRAkOdjbpdItX12vctsldRC74yb3M+XUiRdQ
	sN+czUVxOZ5PKfBBHCTgR8bq9PZs777C6TzPUb35LUu8+WonpYz1Rbcu6GGiHXoO+gVbU3pBHaCvz
	aGBc7v9zgs3/u43e/BdQtQ8nmv0W7uc5NVKK0OfJJH09m2XSIXLG7GQmr8lT5qBKYj+xLrG70PIm2
	jX99Jy7cA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7aYn-0006cg-83; Thu, 04 Feb 2021 09:04:21 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7aYh-0006bc-J6
 for linux-mtd@lists.infradead.org; Thu, 04 Feb 2021 09:04:19 +0000
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 470C7240018;
 Thu,  4 Feb 2021 09:04:09 +0000 (UTC)
Date: Thu, 4 Feb 2021 10:04:08 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
Message-ID: <20210204100408.6eb053d8@xps13>
In-Reply-To: <20210204095945.51ef0c33@collabora.com>
References: <20210202041614.GA840@work> <20210202091459.0c41a769@xps13>
 <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org>
 <20210203110522.12f2b326@xps13>
 <EBDAB319-549F-4CB1-8CE3-9DFA99DBFBC0@linaro.org>
 <20210203111914.1c2f68f6@collabora.com>
 <8A2468D5-B435-4923-BA4F-7BF7CC0FF207@linaro.org>
 <20210203122422.6963b0ed@collabora.com>
 <F55F9D7B-0542-448E-A711-D1035E467ACA@linaro.org>
 <20210204091336.1406ca3b@xps13> <20210204085221.GB8235@thinkpad>
 <20210204095945.51ef0c33@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_040415_873593_049460F4 
X-CRM114-Status: GOOD (  28.56  )
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
Cc: vigneshr@ti.com, richard@nod.at,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 4 Feb
2021 09:59:45 +0100:

> On Thu, 4 Feb 2021 14:22:21 +0530
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> 
> > On Thu, Feb 04, 2021 at 09:13:36AM +0100, Miquel Raynal wrote:  
> > > Hi Manivannan,
> > > 
> > > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Wed,
> > > 03 Feb 2021 17:11:31 +0530:
> > >     
> > > > On 3 February 2021 4:54:22 PM IST, Boris Brezillon <boris.brezillon@collabora.com> wrote:    
> > > > >On Wed, 03 Feb 2021 16:22:42 +0530
> > > > >Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > > > >      
> > > > >> On 3 February 2021 3:49:14 PM IST, Boris Brezillon      
> > > > ><boris.brezillon@collabora.com> wrote:      
> > > > >> >On Wed, 03 Feb 2021 15:42:02 +0530
> > > > >> >Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > > > >> >        
> > > > >> >> >> 
> > > > >> >> >> I got more information from the vendor, Telit. The access to      
> > > > >the        
> > > > >> >3rd          
> > > > >> >> >partition is protected by Trustzone and any access in non      
> > > > >privileged      
> > > > >> >> >mode (where Linux kernel runs) causes kernel panic and the device
> > > > >> >> >reboots.         
> > > > >> >
> > > > >> >Out of curiosity, is it a per-CS-line thing or is this section
> > > > >> >protected on all CS?
> > > > >> >        
> > > > >> 
> > > > >> Sorry, I didn't get your question.       
> > > > >
> > > > >The qcom controller can handle several chips, each connected through a
> > > > >different CS (chip-select) line, right? I'm wondering if the firmware
> > > > >running in secure mode has the ability to block access for a specific
> > > > >CS line or if all CS lines have the same constraint. That will impact
> > > > >the way you describe it in your DT (in one case the secure-region
> > > > >property should be under the controller node, in the other case it
> > > > >should be under the NAND chip node).      
> > > > 
> > > > Right. I believe the implementation is common to all NAND chips so the property should be in the controller node.     
> > > 
> > > Looks weird: do you mean that each of the chips will have a secure area?    
> > 
> > I way I said is, the "secure-region" property will be present in the controller
> > node and not in the NAND chip node since this is not related to the device
> > functionality.
> > 
> > But for referencing the NAND device, the property can have the phandle as below:
> > 
> > secure-region = <&nand0 0xffff>;  
> 
> My question was really what happens from a functional PoV. If you have
> per-chip protection at the FW level, this property should be under the
> NAND node. OTH, if the FW doesn't look at the selected chip before
> blocking the access, it should be at the controller level. So, you
> really have to understand what the secure FW does.

I'm not so sure actually, that's why I like the phandle to nand0 -> in
any case it's not a property of the NAND chip itself, it's kind of a
host constraint, so I don't get why the property should be at the
NAND node level?

Also, we should probably support several secure regions (which could be
a way to express the fact that the FW does not look at the CS)?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EB2C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 19:14:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DF7761AE2
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 19:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DF7761AE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kgpxtORHRlRBDyghKOWPdScJG7G4sIpZvNpukSRvJS0=; b=SGdfqTDO3krYiu
	u/ZDZCW5YaITe97AkHhigYja34JGcRgKhNm5XmBHOKhx2wZii86s9GSYUXcwBOqFLGl78JF107aem
	GRAhJlndcNhE1BumJYb6i8azRzfB6aGK0AZ5BkbdV65BZaO6rqUA5Thskh0lWyP982AWCQSSGSftb
	OncJhLQBgpDvW8ehSCUsCUlnvOsvl2EzZwz2GNwyXeoOQEOFUcEL7RggQJJaXD9hFr8M1ik0KHlUx
	2ZKnG3x4gCMb6MXnFkagRtIw9M3qWKKLt5b+E3kTNHO6IE7AoUJJi393rTQRa5azYPZiVx6rt1bVI
	Ejc+fQyIJARGmeh1AOfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo9K9-00BPrj-6j; Fri, 19 Nov 2021 19:13:25 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo97f-00BNaX-Lu
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 19:00:33 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AJJ0RHc055819;
 Fri, 19 Nov 2021 13:00:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1637348427;
 bh=dfEoMm7hITLdgNfFMQTJFr4xTgXw+iMI67chxIK/sHg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=NvoiIHKFrysRI40PiQ3igBgKoHiMPHmQVIjRx/vKeglWfl3P0A8lrdG6t827LNYwi
 ZXw26kCBG9RFMJs4VTCwzbhBxMhqIjub7NGhq7HmRfMDgHzxgTj0HQxFrNhLbeXpk8
 uMuWXtDlHLYsqCI9euBNJG+j1nXsuXoiSU0rtAqU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AJJ0Ruw117808
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 19 Nov 2021 13:00:27 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 19
 Nov 2021 13:00:27 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 19 Nov 2021 13:00:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AJJ0Qp9075775;
 Fri, 19 Nov 2021 13:00:26 -0600
Date: Sat, 20 Nov 2021 00:30:25 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Tudor Ambarus <Tudor.Ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>, Mark Brown
 <broonie@kernel.org>, <linux-mtd@lists.infradead.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Michal Simek <monstr@monstr.eu>
Subject: Re: [RFC PATCH 0/3] Dual stacked/parallel memories bindings
Message-ID: <20211119190023.rzcvxonvtl7pwjl4@ti.com>
References: <20211112152411.818321-1-miquel.raynal@bootlin.com>
 <20211115102308.64chfwj2vtssiyin@ti.com>
 <20211116091918.62143e75@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211116091918.62143e75@xps13>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_110031_845386_013BAB76 
X-CRM114-Status: GOOD (  46.63  )
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

On 16/11/21 09:19AM, Miquel Raynal wrote:
> Hi Pratyush,
> 
> p.yadav@ti.com wrote on Mon, 15 Nov 2021 15:53:10 +0530:
> 
> > On 12/11/21 04:24PM, Miquel Raynal wrote:
> > > Hello Rob, Mark, Tudor & Pratyush,
> > > 
> > > Here is an RFC to open the discussion about the sensitive task of
> > > supporting specific SPI controller modes like Xilinx's where the
> > > controller can highly abstract the hardware and provide access to a
> > > single bigger device instead. I'll let you go through the series and
> > > tell me what you think.
> > > 
> > > I think there are two possible approaches:
> > > 1- Describe the two devices as being a single one which is what we will
> > >    get from the controller anyway (implies supporting two CS per SPI
> > >    device)
> > > or
> > > 2- Describe the two devices in the device tree and then by software hack
> > >    into the MTD core to simulate a single device to talk to.  
> > 
> > Approach 1 makes more sense to me since once we implement it you can 
> > also use such multi-CS flashes with "dumber" controllers as well like 
> > spi-cadence-quadspi. There, the driver would have to manually set the 
> > chip select instead of it being done automatically by looking at the top 
> > bit. This would at least work for the dual-stacked memories.
> 
> I believe it would. But in that case we should think about a more
> generic binding for the stacked mode. So far I've proposed:
> - xlnx,dual-stacked-memories
> - xlnx,dual-parallel-memories
> 
> It actually looks like the former might be a generic binding. What do
> you think is best between:
> - 'dual-stacked-memories'
> - 'stacked-memories' ('dual' is encoded in the reg property)

I think this works best. This would also allow "triple" and "quad" 
stacked flashes.

> - no specific property, it's just a memory with two CS, again 'reg'
>   gives us the information.
> 
> Then we could keep only the latter property, which looks more specific
> to Xilinx and use it as a flash node property instead (as advised
> by Mark).

Even if the parallel mode is only implemented by the Xilinx controller, 
we would need to support it in the core, right? So we need to figure out 
how that case would work as well.

> 
> > How I envision this being implemented is that SPI NOR would be aware of 
> > the number of Chip Selects and when to use which one, and it would 
> > specify the CS value in the SPI MEM op.
> 
> Yes, this is the approach I had in mind to. This fits both the purpose
> of SPI-NOR and SPI-NAND which will both need to be updated as well tu
> support multi-CS.
> 
> > The controller driver can then 
> > execute this op as needed. One point to note here is that the entire 
> > memory won't be read in a single transaction. There would be 2 
> > transactions: one with CS=0 and one with CS=1. Is this fine for you? Do 
> > you have something else in mind?
> 
> I believe this should be let to the controller's discretion and appear
> like a single op in the upper layers.

But then how do you tell the controller when to change the CS if all it 
sees is a single large transaction that spans across multiple flashes? 
You mention in patch 1 that your controller automatically switches CS 
based on most significant address bit, but that would only work if you 
have two 2 GiB flashes wired in. In case someone uses two 1 GiB flashes, 
the MSB always remains 0. And what about controllers that can't switch 
the CS automatically?

> 
> > I am not sure how this model would work for a dual-parallel memory 
> > though.
> 
> If the controller is aware of the two CS and knows about the full
> request we can hope that integration won't be difficult (last famous
> words).

For your specific controller this might work but if we want this feature 
implemented generically I think it would need some more thought.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

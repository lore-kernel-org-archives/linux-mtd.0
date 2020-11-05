Return-Path: <SRS0=L3KX=EL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D01C00A89
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 13:20:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A908B206FA
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 13:20:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zPqZ3oUb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="q2zJCP8U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A908B206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pcMIQ+6W5o5cQeBUa8T14FjWMXSacy9nJ/YFqKdbjMo=; b=zPqZ3oUbIfY1bT4yFOK7iqOXe
	JDJ2ptFhNA/+LMn/5pCBfHxiEPvlG6e1h7T5Zc+yAh1KRk5sUNL8Bhns05NVM0nYXJsd8+2nxUbie
	LtYfXMzTQV9NqrG/iS4yYMPTxnFSWftIz2C+nK1ybZx0NiyIpWul197DiLV0LQmDLavv8TyW2BPSz
	fHNcS9+xMXYW0QgdqGywJkADx3sV5yex6jz/qoJq7LZFkIjpShVCWL1U5tGs8NEV5sn8inAeFO/f4
	LSfsNuyoLRl7fqT534Uiqc8Kw6//BttvNd5IZ6FNEL5KxokQYttDzJsxi9kHKOafq1SHoTa51tnkL
	tPhAVTCDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kafBP-0000C2-75; Thu, 05 Nov 2020 13:20:07 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kafBL-0000Am-DE
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2020 13:20:04 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5DJsSR098062;
 Thu, 5 Nov 2020 07:19:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604582394;
 bh=0qHAFsOzwvqtIpEDT9UpQO7R066zTF/Z4aiWxAAUldc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=q2zJCP8U41EUlG0Gw0vqxU5pwaMKdbgDZao0RuIguCt6aGt6FRkea/5Ql5ktdfyGH
 yEssWLsB1A3samTGkOGI6vvdavkSDulswC5+JzGDqbIFKM5UOXByPg0u9PiO8+j8c2
 nuk93pI1z23/fLDToG1OOCa0uvPBiUaUEwSxMqzI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5DJsKF102644
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 5 Nov 2020 07:19:54 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 07:19:53 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 07:19:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5DJq3X103771;
 Thu, 5 Nov 2020 07:19:53 -0600
Date: Thu, 5 Nov 2020 18:49:52 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 0/3] mtd: Make sure UBIFS does not do multi-pass page
 programming on flashes that don't support it
Message-ID: <20201105131950.73iqi5izdi6w5nog@ti.com>
References: <20201012180404.6476-1-p.yadav@ti.com>
 <20201027111804.e27pyvf62eksngmp@ti.com>
 <CAFLxGvxc=EqBStzLz3ApwYDomKMe=WeK22ohfPQs1WrMCsaVQg@mail.gmail.com>
 <fa578bda-132a-320a-264c-d973bae194dd@ti.com>
 <20201103124527.x6mp6slck44aotzn@ti.com>
 <4c0e3207-72a4-8c1a-5fca-e9f30cc60828@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c0e3207-72a4-8c1a-5fca-e9f30cc60828@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_082003_599567_31D67D3C 
X-CRM114-Status: GOOD (  41.57  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 05/11/20 05:51PM, Vignesh Raghavendra wrote:
> 
> 
> On 11/3/20 6:15 PM, Pratyush Yadav wrote:
> > On 03/11/20 05:05PM, Vignesh Raghavendra wrote:
> >>
> >>
> >> On 11/1/20 3:14 AM, Richard Weinberger wrote:
> >>> On Tue, Oct 27, 2020 at 12:24 PM Pratyush Yadav <p.yadav@ti.com> wrote:
> >>>>> [0] https://lore.kernel.org/linux-mtd/20201005153138.6437-1-p.yadav@ti.com/
> >>>>
> >>>> Ping. Any comments on the series?
> >>>
> >>> From the UBIFS point of view I'd like to avoid as many device specific
> >>> settings as possible.
> >>> We check already for NOR flash, checking for NOR *and* SPI_NOR_NO_MULTI_PASS_PP
> >>> feels a bit clumsy.
> >>>
> >>> Tudor, what do you think about SPI_NOR_NO_MULTI_PASS_PP?
> >>> This kind of NOR seems to be a little NAND'ish. Maybe we can hide this detail
> >>> in the mtd framework?
> >>>
> >>
> >> Agree with Richard. I don't see need for SPI_NOR_NO_MULTI_PASS_PP. From
> >> MTD point of view setting mtd->writesize to be equal to pagesize should
> >> be enough. Its upto clients of MTD devices to ensure there is no multi
> >> pass programming within a "writesize" block.
> > 
> > That is what I initially thought too but then I realized that multi-pass 
> > programming is completely different from page-size programming. Instead 
> > of writing 4 bytes twice, you can zero out the entire page in one single 
> > operation. You would be compliant with the write size requirement but 
> > you still do multi-pass programming because you did not erase the page 
> > before this operation.
> > 
> 
> Right...
> 
> > It is also not completely correct to say the Cypress S28 flash has a 
> > write size of 256. You _can_ write one byte if you want. You just can't 
> > write to that page again without erasing it first. For example, if a 
> > file system only wants to write 128 bytes on a page, it can do so 
> > without having to write the whole page. It just needs to make sure it 
> > doesn't write to it again without erasing first.
> > 
> 
> As per documentation:
> mtd_info::writesize: "In case of ECC-ed NOR it is of ECC block size"
> 
> This means, it is block on which ECC is calculated on ECC-ed NOR and
> thus needs to be erased every time before being updated.
> 
> Looking at flash datasheet, this seems to be 16 bytes.
> 
> So mtd->writesize = 16 and not 256 (or pagesize)

Ok.
 
> Also, It does not imply length of data being written has to be multiple
> of it. At least NAND subsystem does not seem to care that during  writes
> len < mtd->writesize[1].

Ok.
 
> > nor_erase_prepare() was written to handle quirks of some specific 
> > devices. Not every device starts filling zeroes from the end of a page. 
> > So we have device-specific code in UBIFS already. You will obviously 
> > need device-specific settings to have control over that code.
> > 
> 
> UBIFS intends to be robust against rogue power cuts and therefore would
> need to ensure some consistency during erase which explains flash
> specific quirk here.

Yes. There is no arguing if this is needed. The only question is how to 
skip it on flashes that don't support doing this.
 
> > One might argue that we should move nor_erase_prepare() out of UBIFS. 
> > But requiring a flash to start erasing from the start of the page is a 
> > UBIFS-specific requirement. Other users of a flash might not care about 
> > it at all.
> > 
> 
> Yes. But I don't see much harm done.
> 
> > And so we have ourselves a bit of a conundrum. Adding 
> > SPI_NOR_NO_MULTI_PASS_PP is IMHO the least disruptive answer. If the 
> > file system wants to do multi-pass page programming on NOR flashes, how 
> > else do we tell it not to do it for this specific flash?
> > 
> 
> I see don't see need for SPI_NOR_NO_MULTI_PASS_PP as
> SPI_NOR_NO_MULTI_PASS_PP is implied within a ECC block and writesize is
> supposed to represent the same.

Ok. So we can control the execution of nor_erase_prepare() with 
mtd->writesize. Will re-roll. Thanks.
 
> >> If this is not clear in the current documentation of struct mtd, then
> >> that can be updated.
> > 
> 
> [1]
> https://elixir.bootlin.com/linux/latest/source/drivers/mtd/nand/raw/nand_base.c#L4166

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

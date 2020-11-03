Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F360BC388F7
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 12:47:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7597A20731
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 12:47:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cpsfxEut";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uaS1XINN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7597A20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NTT2mouwnKEGeekjMS7GuvAlRngyGjcP8LoZHj0rXaY=; b=cpsfxEutioOQG5hmYWYZjerN7
	3LrAO2Bb+UdGJxDG3p5+8vKKEAIJ4tNe3nZusQ1KRACrqkHMq1aBXCWD/dqJEA83VXWp5lPI6/MLO
	Htuc5tlS4sd1vn/63plzdYb4L6h/FSGTQKgHdcqkw/kp+6GdS3tGsctyqV0QuUvZnDCoVbl2E9RbN
	/uPU0FfWvpDsG7VTXrtVdNX+3sa4x2fipMMp0JaMPtcg0VImn3fYgVK0oSZc1XkhoVGIE36rDt2fy
	HrDS+3tiIkjn9KWCAEaor6/xUjL0ZV/hOEYpkST+16Do8vc99ZXX/9oc+H9JNVYw1c/cNK7AD8nB0
	6MfpZOYrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZvgy-0006Bm-Mg; Tue, 03 Nov 2020 12:45:40 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZvgv-0006AV-6w
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2020 12:45:38 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A3CjU30093058;
 Tue, 3 Nov 2020 06:45:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604407530;
 bh=MX6c8hjcZDZUesVswKmxwJG1AWhIKQOHy2Qu8D7QvJg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=uaS1XINNYyC0R4S5tpUfC7m9Pf6LJJLEsRUVV7cPrn6drpafw+CLXOlLf7ryjg8kn
 M3DvKSAJDnwg4ribErcNQryKtbC9SDj0BOGZxba6m+sk5th1B1myRSRxpdYpmeB3SZ
 Yhd4UU/012yXsBaY12YsmVU+V/ISTmk1swng2P1k=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A3CjU4b059231
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 3 Nov 2020 06:45:30 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 3 Nov
 2020 06:45:30 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 3 Nov 2020 06:45:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A3CjTv0038496;
 Tue, 3 Nov 2020 06:45:30 -0600
Date: Tue, 3 Nov 2020 18:15:29 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 0/3] mtd: Make sure UBIFS does not do multi-pass page
 programming on flashes that don't support it
Message-ID: <20201103124527.x6mp6slck44aotzn@ti.com>
References: <20201012180404.6476-1-p.yadav@ti.com>
 <20201027111804.e27pyvf62eksngmp@ti.com>
 <CAFLxGvxc=EqBStzLz3ApwYDomKMe=WeK22ohfPQs1WrMCsaVQg@mail.gmail.com>
 <fa578bda-132a-320a-264c-d973bae194dd@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa578bda-132a-320a-264c-d973bae194dd@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_074537_444321_51C20CBD 
X-CRM114-Status: GOOD (  26.49  )
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

On 03/11/20 05:05PM, Vignesh Raghavendra wrote:
> 
> 
> On 11/1/20 3:14 AM, Richard Weinberger wrote:
> > On Tue, Oct 27, 2020 at 12:24 PM Pratyush Yadav <p.yadav@ti.com> wrote:
> >>> [0] https://lore.kernel.org/linux-mtd/20201005153138.6437-1-p.yadav@ti.com/
> >>
> >> Ping. Any comments on the series?
> > 
> > From the UBIFS point of view I'd like to avoid as many device specific
> > settings as possible.
> > We check already for NOR flash, checking for NOR *and* SPI_NOR_NO_MULTI_PASS_PP
> > feels a bit clumsy.
> > 
> > Tudor, what do you think about SPI_NOR_NO_MULTI_PASS_PP?
> > This kind of NOR seems to be a little NAND'ish. Maybe we can hide this detail
> > in the mtd framework?
> > 
> 
> Agree with Richard. I don't see need for SPI_NOR_NO_MULTI_PASS_PP. From
> MTD point of view setting mtd->writesize to be equal to pagesize should
> be enough. Its upto clients of MTD devices to ensure there is no multi
> pass programming within a "writesize" block.

That is what I initially thought too but then I realized that multi-pass 
programming is completely different from page-size programming. Instead 
of writing 4 bytes twice, you can zero out the entire page in one single 
operation. You would be compliant with the write size requirement but 
you still do multi-pass programming because you did not erase the page 
before this operation.

It is also not completely correct to say the Cypress S28 flash has a 
write size of 256. You _can_ write one byte if you want. You just can't 
write to that page again without erasing it first. For example, if a 
file system only wants to write 128 bytes on a page, it can do so 
without having to write the whole page. It just needs to make sure it 
doesn't write to it again without erasing first.

nor_erase_prepare() was written to handle quirks of some specific 
devices. Not every device starts filling zeroes from the end of a page. 
So we have device-specific code in UBIFS already. You will obviously 
need device-specific settings to have control over that code.

One might argue that we should move nor_erase_prepare() out of UBIFS. 
But requiring a flash to start erasing from the start of the page is a 
UBIFS-specific requirement. Other users of a flash might not care about 
it at all.

And so we have ourselves a bit of a conundrum. Adding 
SPI_NOR_NO_MULTI_PASS_PP is IMHO the least disruptive answer. If the 
file system wants to do multi-pass page programming on NOR flashes, how 
else do we tell it not to do it for this specific flash?

> If this is not clear in the current documentation of struct mtd, then
> that can be updated.

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

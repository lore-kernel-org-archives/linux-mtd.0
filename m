Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F8CC48BF6
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVBLuoAis68qIthqiwNDvvVfaYa6e4ew7Y/oVhaqwD0=; b=iXYNVtklJnwkva
	oqk+H2qlIY4u5JLUc1bMytEd9KMWFO/w7JXDgyCaqfIDPNo0wmnzmudIvS2tlSFmazi/G4W3FHjOM
	peua753IAJPDFSbkJZvuB8DFa4WR5GQE9jDomGIWeVI8kdNw0GRO8mKo9Lys1w63WqoQjnv53POj4
	tRNqGO5GVY5fGFg7Xieo1zdLjkn73m9y2lLkCmDWPnag1/S/k1AY6rM5Voxdx1enbtor6LGFdiKfK
	T+2tBbozPsOuo37bxrXDeXxg4IADhCk0TQihLNjVKqj7gCe9ZcazifqYTgsS4uoIOBDlohmoww36j
	Zq65ZvfnVXK4JEoFt7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riGCW-00000005OlZ-0lx2;
	Thu, 07 Mar 2024 16:02:32 +0000
Received: from mail.thorsis.com ([92.198.35.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riGCR-00000005Oj5-340X
	for linux-mtd@lists.infradead.org;
	Thu, 07 Mar 2024 16:02:30 +0000
Date: Thu, 7 Mar 2024 17:02:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=default;
	t=1709827335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=qNHy0ey9Rh5SkT/53hLFdIyIDdFiIk0IR0E13PdFioI=;
	b=E+e5my4E7F4awvZ2mTvJztGmw9kmA5Znr5n03/FWxR0jS5qXRXTTys4QY6IsLuVIFV26pM
	08Y/Nlif9P6prtPxiiXob2ffH7N7K/hXIi1+A1DuQOeslZivL4UoQuZ474fK4r7M5ptgeI
	fSvjhUYED8Or2XoRjIxvCA+KlIpIG6F3WlXAml3J7DxJhP39HSys5QDM4zVdybs5rmm3M7
	qMVnH7zzVgSsH2R0YWAKkv46TTFB3GDjgnOP5qtAgvzwKv04E1FNj4y2m7WF/+X9mAF1eV
	juvo/if/vvrMB6Tiz16qew6OgVwWqVbgTwtVeH7eA4PZ1eBjBGlZLoLnIjTrgA==
From: Alexander Dahl <ada@thorsis.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Alexander Dahl <ada@thorsis.com>, linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: mtd: nand: raw: Possible bug in nand_onfi_detect()?
Message-ID: <20240307-pantry-deceit-78ce20f47899@thorsis.com>
Mail-Followup-To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
References: <20240306-shaky-bunion-d28b65ea97d7@thorsis.com>
 <20240306164831.29eed907@xps-13>
Content-Disposition: inline
In-Reply-To: <20240306164831.29eed907@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_080228_747894_F0EB6370 
X-CRM114-Status: GOOD (  46.10  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Miquel,

thanks for looking into this, see my remarks below.

Am Wed, Mar 06, 2024 at 04:48:31PM +0100 schrieb Miquel Raynal:
> Hi Alexander,
> 
> ada@thorsis.com wrote on Wed, 6 Mar 2024 15:36:04 +0100:
> 
> > Hello everyone,
> > 
> > I think I found a bug in nand_onfi_detect() which was introduced with
> > commit c27842e7e11f ("mtd: rawnand: onfi: Adapt the parameter page
> > read to constraint controllers") back in 2020.
> 
> Interesting. I don't think this patch did broke anything, as
> constrained controllers would just not support the read_data_op() call
> anyway.
> 
> That being said, I don't see why the atmel controller would
> refuse this operation, as it is supposed to support all
> operations without limitation. This is one of the three issues
> you have, that probably needs fixing.

I found a flaw in my debug messages hiding the underlying issue for
this.  I'm afraid this is another bug introduced by you with commit
9f820fc0651c ("mtd: rawnand: Check the data only read pattern only
once").  See this line in rawnand_check_data_only_read_support():

    if (!nand_read_data_op(chip, NULL, SZ_512, true, true))

This leads to nand_read_data_op() returning -EINVAL, because it checks
if its second argument is non-NULL.

I guess not only the atmel nand controller is affected here, but _all_
nand controllers?  The flag can never be set, and so use_datain is
false here?

> > Background on how I found this: I'm currently struggling getting raw
> > nand flash access to fly with an at91 sam9x60 SoC and a S34ML02G1
> > Spansion SLC raw NAND flash on a custom board.  The setup is
> > comparable to the sam9x60 curiosity board and can be reproduced with
> > that one.
> > 
> > NAND flash on sam9x60 curiosity board works fine with what is in
> > mainline Linux kernel.  However after removing the line 'rb-gpios =
> > <&pioD 5 GPIO_ACTIVE_HIGH>;' from at91-sam9x60_curiosity.dts all data
> > read from the flash appears to be zeros only.  (I did not add that
> > line to the dts of my custom board first, this is how I stumbled over
> > this.)
> > 
> > I have no explanation for that behaviour, it should work without R/B#
> > by reading the status register, maybe we investigate that
> > in depth later.
> 
> I don't see why at a first look. The default is "no RB" if no property
> is given in the DT so it should work.

Correct, nand_soft_waitrdy() is used in that case.

> Tracing the wait ready function calls might help.

Did that already.  On each call here the status register read contains
E0h and nand_soft_waitrdy() returns without error, because the
NAND_STATUS_READY flag is set.  It just looks fine, although it is
not afterwards.

> >  However those all zeros data reads happens when
> > reading the ONFI param page as well es data read from OOB/spare area
> > later and I bet it's the same with usual data.
> 
> Reading data without observing tWB + tR may lead to this.

I already suspected some timing issue.  Deeper investigation will have
to wait until we soldered some wires to the chip and connect a logic
analyzer however.  At least that's the plan, but this will have to
wait some days until after I finished some other tasks.

> > This read error reveals a bug in nand_onfi_detect().  After setting
> > up some things there's this for loop:
> > 
> >     for (i = 0; i < ONFI_PARAM_PAGES; i++) {
> > 
> > For i = 0 nand_read_param_page_op() is called and in my case all zeros
> > are returned and thus the CRC calculated does not match the all zeros
> > CRC read.  So the usual break on successful reading the first page is
> > skipped and for reading the second page nand_change_read_column_op()
> > is called.  I think that one always fails on this line:
> > 
> >     if (offset_in_page + len > mtd->writesize + mtd->oobsize) {
> > 
> > Those variables contain the following values:
> > 
> >     offset_in_page: 256
> >     len: 256
> >     mtd->writesize: 0
> >     mtd->oobsize: 0
> 
> Indeed. We probably need some kind of extra check that does not perform
> the if clause above if !mtd->writesize.
> 
> > The condition is true and nand_change_read_column_op() returns with
> > -EINVAL, because mtd->writesize and mtd->oobsize are not set yet in
> > that code path.  Those are probably initialized later, maybe with
> > parameters read from that ONFI param page?
> > 
> > Returning with error from nand_change_read_column_op() leads to
> > jumping out of nand_onfi_detect() early, and no ONFI param page is
> > evaluated at all, although the second or third page could be intact.
> > 
> > I guess this would also fail with any other reason for not matching
> > CRCs in the first page, but I have not faulty NAND flash chip to
> > confirm that.
> 
> Thanks for the whole report, it is interesting and should lead to fixes:
> - why does the controller refuses the datain op?

See above.

> - why nand_soft_waitrdy is not enough?

I don't know.  That's one reason I asked here.

> - changing the condition in nand_change_read_column_op()
> 
> Can you take care of these?

The last one probably after in depth reading of the code again, unsure
for the other two.

Greets
Alex


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

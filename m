Return-Path: <SRS0=1krx=SB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A2FC43381
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2019 18:20:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA3B6217F5
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2019 18:20:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XI4kBKmq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA3B6217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=92enqpVt7XF0Hx8U+ENcHDQdqGX0G5tFMrFLfagaUls=; b=XI4kBKmqcJkNXj
	VIu5K3vUrLvhJRbrEImTuCx8fMUwdrnLkSUrpxWPcKzMDMB5vDgytF6gWbss9zueTCH9jO4RgRb+U
	5Y4Gg5llO+3inco+KnGLDoqmBCCl1FWm2w9GBbj5DKVEX48l/QVQuLB2jTLsByIrqdLVAIHkb5L7m
	Uw2brUBJYegb7hpK4Mz4jBvu9tOlKuRSE22pTDjG5vxEUC8dTK5D5WOBNhuyxKPm10f/aVbRVjkzU
	xP+or4i5BSfcAS5ZnxNLgD6CrQx7uADOjjyG0AsbYC1PmzMHFUGbAiIORwJ6SwjPiDmlNi94oOFvA
	YteUSugtvTqg7oHMP+iA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAIb4-0002qE-5I; Sat, 30 Mar 2019 18:20:50 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAIav-0002jN-K2; Sat, 30 Mar 2019 18:20:43 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AAA56280B0E;
 Sat, 30 Mar 2019 18:20:38 +0000 (GMT)
Date: Sat, 30 Mar 2019 19:20:36 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: select target before setting up
 data interface
Message-ID: <20190330192036.193e9e1c@collabora.com>
In-Reply-To: <60179efc-122f-2439-bd20-ab27b29afa32@zonque.org>
References: <20190321212010.3995-1-daniel@zonque.org>
 <20190322093046.71df010d@xps13>
 <6bcd6f18-6e57-2221-9e32-5bbabfffc48d@zonque.org>
 <20190325100909.5f3558b9@xps13>
 <60179efc-122f-2439-bd20-ab27b29afa32@zonque.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_112042_108318_325EBD22 
X-CRM114-Status: GOOD (  22.96  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard.weinberger@gmail.com>, haojian.zhuang@gmail.com,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, robert.jarzmik@free.fr,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 25 Mar 2019 17:21:42 +0100
Daniel Mack <daniel@zonque.org> wrote:

> Hi Miquel,
> 
> On 25/3/2019 10:09 AM, Miquel Raynal wrote:
> > Daniel Mack <daniel@zonque.org> wrote on Fri, 22 Mar 2019 19:48:08
> > +0100:
> >   
> >> Hi Miquel,
> >>
> >> On 22/3/2019 9:30 AM, Miquel Raynal wrote:  
> >>> + Richard: this is fixes materials
> >>>
> >>> Daniel Mack <daniel@zonque.org> wrote on Thu, 21 Mar 2019 22:20:10
> >>> +0100:
> >>>     
> >>>> Now that the nand drivers are responsible for selecting the target
> >>>> prior to hardware access, a call to marvell_nfc_select_target() is
> >>>> necessary from marvell_nfc_setup_data_interface().
> >>>>
> >>>> This is a regression introduced by commit b25251414f6e ("mtd:
> >>>> rawnand: marvell: Stop implementing ->select_chip()").
> >>>>
> >>>> Fixes: b25251414f6e ("mtd: rawnand: marvell: Stop implementing ->select_chip()")
> >>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> >>>> Cc: <stable@vger.kernel.org>
> >>>> Signed-off-by: Daniel Mack <daniel@zonque.org>
> >>>> ---
> >>>>  drivers/mtd/nand/raw/marvell_nand.c | 2 ++
> >>>>  1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> >>>> index 84283c6bb0ff..93abe5be8995 100644
> >>>> --- a/drivers/mtd/nand/raw/marvell_nand.c
> >>>> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> >>>> @@ -2325,6 +2325,8 @@ static int marvell_nfc_setup_data_interface(struct nand_chip *chip, int chipnr,
> >>>>  	struct marvell_nfc_timings nfc_tmg;
> >>>>  	int read_delay;
> >>>>  
> >>>> +	marvell_nfc_select_target(chip, chip->cur_cs);
> >>>> +
> >>>>  	sdr = nand_get_sdr_timings(conf);
> >>>>  	if (IS_ERR(sdr))
> >>>>  		return PTR_ERR(sdr);    
> >>>
> >>> I had a short look yesterday and this is very likely to be the root
> >>> cause of the regression, thank you very much!    
> >>
> >> Yes it is, it fixes the regression I have reported.
> >>
> >> Do you want me to resend with that nit addressed you mentioned? My
> >> version works well, I know that much :)  
> > 
> > Yes please, resent with Boris' comment addressed and we'll be fine.  
> 
> I tried this now, and with 'chip->cur_cs' instead of 'chipnr', the
> regression is back. This function is invoked twice during boot, and in
> both cases, 'chip->cur_cs' is -1, while 'chipnr' is 0. The 2nd time this
> function is invoked, the 'selected_die' cache value is 0, so
> marvell_nfc_select_target() bails early, which seems to be a problem.
> 
> I can't quite make sense of that yet, all I know is that calling
> marvell_nfc_select_target() with -1 from
> marvell_nfc_setup_data_interface() makes the driver functional again. Hmm.

Can you try with the following diff applied?
--->8---
diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index f38e5c1b87e4..e8eccf6afc8f 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -722,9 +722,6 @@ static void marvell_nfc_select_target(struct nand_chip *chip,
        struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
        u32 ndcr_generic;
 
-       if (chip == nfc->selected_chip && die_nr == marvell_nand->selected_die)
-               return;
-
        writel_relaxed(marvell_nand->ndtr0, nfc->regs + NDTR0);
        writel_relaxed(marvell_nand->ndtr1, nfc->regs + NDTR1);
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

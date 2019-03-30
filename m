Return-Path: <SRS0=1krx=SB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A357C43381
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2019 18:10:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E43C2184C
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2019 18:10:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gSnRwu7g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E43C2184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a76ynnCqeXwbLrKYMuLzowyggP5Y1+dPrfkkKlzOfcY=; b=gSnRwu7gdO5ZcG
	XcULxV1u2qMj2WrdOvAEns1ulpi6sLm6E0oVheMxrSR4PZjR3RnuS6dB3T9o0imXbJ+ZlcUWXQIG9
	bBYW+lt+yeHjRnKRTKZew2f/AXRag5MEZZAeo/VbsFQXPxC9ygocKGM5gPbgbO37lr6x1xCXIiSI8
	2BcSyw3EIGuRnxTeO/ZUjT3znKl6/pQqKaeDzWcuMidKsI9Av5dQ3pOa6+Be5CundcwQMNks5VfwD
	X1V7v5dx4QJM+ZeGJjij+0QXIXCW8zRCtN08XA25EAUprMKn8D/5JsCJUdSvhBLra35rejRfQBkZM
	NEVDdAkZAekGPBRrHHyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAIQq-0007u7-Vz; Sat, 30 Mar 2019 18:10:16 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAIQi-0006vl-Mu; Sat, 30 Mar 2019 18:10:10 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BB029280B0E;
 Sat, 30 Mar 2019 18:10:02 +0000 (GMT)
Date: Sat, 30 Mar 2019 19:09:59 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: select target before setting up
 data interface
Message-ID: <20190330190959.080de229@collabora.com>
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
X-CRM114-CacheID: sfid-20190330_111009_012869_4080EFF5 
X-CRM114-Status: GOOD (  22.33  )
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

I had a quick look at the marvell_nfc_setup_data_interface() function
and it doesn't make sense to call marvell_nfc_select_target() there.
The fact that calling marvell_nfc_select_target(cur_cs) fixes your
problem is probably a side effect, and the bug might come from other
changes I made in b25251414f6e (missing call to
marvell_nfc_select_target() somewhere else in the driver?).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

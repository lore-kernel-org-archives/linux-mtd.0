Return-Path: <SRS0=PNEu=GI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C884C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jan 2021 12:19:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A582D229C4
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jan 2021 12:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A582D229C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3OEm6K0V3eZ0il1W0o3vh/PjcrsfgDBHFEL9olo1G9M=; b=v/xHnjk7+TBqasoiZ+7touUFU
	yFkLqFuIjxg2JO6NIlbDiAk6ubnODI3wLbfYz24Lg5FfYhEOKkDcxSv1v7VaVLSrfHIJNetIuX5/q
	teZ8iGCAC5IL/RBmZNiUrpTZiMP0EzXMLyh3V+CixZW6Ej8/NgTPDa187e6889/+hmwj4RDq6EBYI
	j+8It1gqE+cWVYvSbOiBRIfnQyZR2xJDfPVf6hQLLS53c5Dl/E9cwWrwkf9+hQzl5L8J0CLNWRs7k
	npXWyGV9uIuQPtLIjphFfYn7RTP9C+KrV6p5jnO9OkPBN4A9jBa+OLNRPfBqIA9QNOmaSe9p5xyQy
	so/ZjrPSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwlHS-0002bO-4j; Tue, 05 Jan 2021 12:17:42 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwlHP-0002Z2-1p
 for linux-mtd@lists.infradead.org; Tue, 05 Jan 2021 12:17:40 +0000
Received: by mail-qk1-x729.google.com with SMTP id n142so26199652qkn.2
 for <linux-mtd@lists.infradead.org>; Tue, 05 Jan 2021 04:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uHVyppheAtUsYWey0/FRVVlGWEXQunaZTKwgRTn10C4=;
 b=PjXAeqXP4DYwIsAsQ2O4Wvyds0A/KBI/EsGeMQmaFHnc4wqH02GyXchj4HN8SUEolr
 PHK27WI1BXuqv8NgDGDFiQwm2P9lHa2Kd3MJQxJ9FTGfphPfl+Dwb9fKBbqo7I9+CpWg
 M+gOWEE/mSgmFe7pOxIwoo8FpAnQwxG+sDQXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uHVyppheAtUsYWey0/FRVVlGWEXQunaZTKwgRTn10C4=;
 b=AzTGHJo4mrsCVm7/fbn+w70Cx6pDiCuS9fIP0uBgxZ70Qutq30xFEbQsAaDMYtLK46
 OabRe3G6I6QDSC9ZuAWwCtFYHg32yGWO7EZJetL/Gw223WK0Jxg6Omc+k+/rpfTsOVk/
 eqYRUTy1Ynd9Om98dWemYeSpgZjfwlfsv68RKgo/g+GRRrI75+xklSV+1G0xXbxC+/EX
 71W8bJA7+FxQFyAOHnnCm1fSdUHizB5wkhYAjISKh/c5kJsetQBcD14NQ4Y4BJkfY7tK
 Z1nY6J+mSUrMSOhbERKO8VSxfbFc0kSMApX6JRyrBGp4sQjvfPspvSpnwCZNPyfzQ+U1
 V6Cg==
X-Gm-Message-State: AOAM533uW565h7RPLpHrhhRd24tw+HYBO3Eqc52MtgpCM3yfvqaY9y/p
 1U1gqFW+bDKnx5ZL5IFCzWLWbMXPeW+UEihnyk14dNb3EDs=
X-Google-Smtp-Source: ABdhPJy5tjzaibSH7lb3AbHXayPPYaReUKnA+qJZEoC40CBWlYyT/l9r2rHRDXectmH9clM8fVamvSEK+Fs2WH7cnQo=
X-Received: by 2002:a37:2742:: with SMTP id n63mr77678787qkn.390.1609849054700; 
 Tue, 05 Jan 2021 04:17:34 -0800 (PST)
MIME-Version: 1.0
References: <20201229055059.2255021-1-daniel@0x0f.com>
 <20201229055059.2255021-2-daniel@0x0f.com>
 <20210104151746.21cdde24@xps13>
In-Reply-To: <20210104151746.21cdde24@xps13>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 5 Jan 2021 21:18:21 +0900
Message-ID: <CAFr9PXmPEQ2poQUTtaBH4CZ-S+sJjoUjJ5D_qA5aHZj7AASg7w@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: spinand: add support for Foresee FS35ND01G
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_071739_282060_418D926A 
X-CRM114-Status: GOOD (  17.30  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Mon, 4 Jan 2021 at 23:17, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Perhaps giving the link of the datasheet here makes sense.

Noted. I'll put that into v2.

> > +#define SPINAND_MFR_LONGSYS          0xcd
>
> Nitpick: I personally prefer uppercase hex numbers.
>

Noted.

> > +                  NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
> > +                  NAND_ECCREQ(4, 512),
> > +                  SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> > +                                           &write_cache_variants,
> > +                                           &update_cache_variants),
>
> This device probably supports more variants (especially dual/quad
> ones) but I guess it's not a problem to not have them here right now.

Right now I can't really test dual or quad because my SPI driver
doesn't know to do dual or quad io.
I plan to add those in once I can validate they work.

> > +                  SPINAND_HAS_QE_BIT,
> > +                  SPINAND_ECCINFO(NULL,
> > +                                  NULL)),
>
> You should define the ->ecc and ->free hooks of the
> mtd_ooblayout_ops structure and point to it here. It defines the free
> OOB bytes and bytes used by the on-die ECC engine. You should find this
> in the datasheet. You may look at other manufacturer drivers for
> examples of how it should be implemented. It is the way to tell the
> upper layers that eg. "byte 2 to 17 are ECC bytes, 18 until the end are
> free to use".

Ok I'll add those in. Is there a way I can test that my implementation is right?
I.e. is writing something, reading it back and checking if the data is
correct a good enough test here?
I don't really want to make it look like this flash is supported and
break someone's data. :)

Thanks,

Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6076CDB46E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 08:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IXR7ZLd9jLhzelbz+ofCnLgVChcDiZti6K7o5HIN7pg=; b=MBMplCuGC9RncG
	zy4su2ZV1PNfTx0p42HidwNeDpnOhXKSRFTaJT+ANjmaeaser5PGGr5UsNS40pgBSJ0LIJsF7Nj9A
	R6hqS7SFnHHsZq55z6OE+gtftn6dbqMQsaF8ioKhJwS1wuFJC0J/S6zYaxZP80GwrckdEXT753cQS
	EkW3Ssr99GdTtMj3mRbaBGvgXneo9fC7Ked/cc/GhjiraEPwcY9JNooEQMxB/+qrayRVzrjqN8LeF
	yOhC28ixOkO6s5D9MexqU7db/EAUlI3vCd8MJDHGG6BSn+5NHHxx2ka2WIJo31XuWfLuJs6VL0jSM
	lf3hvUqEFmLY/0nBhOkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrXn-000HzB-2t;
	Thu, 12 Oct 2023 08:59:47 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrXl-000Hxb-2H
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 08:59:47 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2774874c3daso557775a91.1
        for <linux-mtd@lists.infradead.org>; Thu, 12 Oct 2023 01:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697101184; x=1697705984; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o9uprgBW+dbegmp74vVfmKth4R26Cfc4fh6n1LeLCa0=;
        b=m7v05IP5l8IOjFf33N4sqQDlIf35w4zQlniyQjguQbFOC+/EWoXb7vqx2AtsFGsmrG
         R/djx2KHm540aZoswLLSiAtPM6QQFZlaznco/GuAnDJPn1drjZcPqAb/CFhCyb6mXowv
         DNawKpbaBNrDgQMR1m5heorjdT4w19RGZLl/rAZHlXVQgqTL0kvophtsPGjJhQ56IPqJ
         nK/Bt9C54f8VKOeWNGmrauz3LmbqV75bU0mZqfPm4qUwaKtFKZamF9s+5xAyebr9jyBT
         GPCPyJu9gKHR2A9sqFgK7oOx8q7qt4tdtt68S0YCoxYfPVqnM2FaqU9s4W9K7RweNfT1
         y9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697101184; x=1697705984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o9uprgBW+dbegmp74vVfmKth4R26Cfc4fh6n1LeLCa0=;
        b=DmJpAWXSK9hW/uswxJdj7c/0VTQSf49qQ7sP8y+4dBoenBirnbUFweEJUyB5t++Ofn
         cy4xun6Rq9MP8woxztGVEkTwnJclmb5zu8G0asdVv5rv5YsSPALh3rjD4YSS+saZ5PMb
         2MlAHyLcoavjAg2IaB96zI8Mt8FmbuX0+2easAtJPsp08RloaxQB5Ho5lK0th7HCoYHd
         IFc4RzJmMeZIWDxJjffz9LHU7Vaioa4RUndNSYkmT6fnZkX3MsGH9ZZ2LqDkA9qr5YTK
         b+MgTjemqBZ1ytip6ZMk8cHhGD3rSAhC7F7oMy131va14kTXJdf2B/3fuyoMCtyj6xUu
         sr3w==
X-Gm-Message-State: AOJu0YzZ+7YcY9rlPwQpcEr8dGNIteMaQrpq1W6P1sikIWLH3GXX7+Wn
	h6oDgWZaHsHY5zIsGaT6QKvsGW8mG4okaT6MDaU=
X-Google-Smtp-Source: AGHT+IFjb+Sys6kLuU/BwD3ZipuHy22imoPZEUnVCtD/GUMjcCBKiuA60fYhtCCx2u/fbMDUUYstUccdc8xcgzqNgR8=
X-Received: by 2002:a17:90a:1196:b0:262:f449:4497 with SMTP id
 e22-20020a17090a119600b00262f4494497mr21978334pja.2.1697101183569; Thu, 12
 Oct 2023 01:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
 <20230908064304.27757-2-jaimeliao.tw@gmail.com> <b998ea18-8ce9-83b0-f42f-18e5ea08175b@linaro.org>
 <mafs034yppc28.fsf@kernel.org> <f60995d3d02d7639204c2c16abf9bfd7@walle.cc>
 <54e5662f-baf4-4660-9fc4-7959d2405120@linaro.org> <29bb3d952b9f49961da5e01cf86f9c4f@walle.cc>
 <b705c36c-1d76-45a4-ab8e-dacdcb844509@linaro.org> <cdd8fb4d9261892345588388a5de262f@walle.cc>
In-Reply-To: <cdd8fb4d9261892345588388a5de262f@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Thu, 12 Oct 2023 16:59:21 +0800
Message-ID: <CAAQoYRn9C2biQXfcJYK3SKQcGVZc3ibvP6q5pbk8v78CS+gWVA@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] mtd: spi-nor: Add manufacturer read id function
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_015945_751117_13B53CD1 
X-CRM114-Status: GOOD (  39.62  )
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

Hi,

>
> Hi,
>
> >>>>>> I see this flash supports 1-1-1, 8-8-8, and 8d-8d-8d, there are no
> >>>>>> mixed
> >>>>>> modes supported, thus a 8d-8d-8s mode seems just like a hardware
> >>>>>> bug to
> >>>>>> me. So my proposal is to leave the core away and to handle the
> >>>>>> read id
> >>>>>> hack just in the macronix driver.
> >>>>>
> >>>>> +1
> >>>>
> >>>> I've looked at the xspi spec. There is no RDID specified. So I'd
> >>>> argue,
> >>>> the only pseudo standard is that RDID was only ever used with
> >>>> 1s1s1s.
> >>>> But
> >>>> we added spi_nor_read_id() with parameters suited for the "unusual"
> >>>> 8d8d8d
> >>>> case with additional address and dummy cycles. Just for checking
> >>>> whether
> >>>> the
> >>>> octal-dtr switch was successful. Therefore, we've already added
> >>>> parameters to
> >>>> spi_nor_read_id() which are not standard. Then we can just add one
> >>>> more.
> >>>> It's
> >>>> just how macronix is doing it. Again there is no standard.
> >>>> If we'd only put standard (or for the 9F pseudo standard) things in
> >>>> the
> >>>> core,
> >>>> then spi_nor_read_id() would need to check whether the flash is in
> >>>> 1s1s1s
> >>>> mode. And no I wouldn't prefer that ;)
> >>>>
> >>>
> >>> If we really want to be catholic, we should switch to 8d-8d-8s mode
> >>> and
> >>> then issue the read id and the core will handle the readid correctly.
> >>> But there is no such a thing, because macronix considers that it is
> >>> in
> >>> 8d-8d-8d mode at the time of issuing 8d-8d-8s read id. That's why I
> >>> say
> >>> it's a bug on their side. The core is meant to be generic, I don't
> >>> want
> >>> to pollute the core with manufacturer specific fixes.
> >>
> >> Then why does spi_nor_read_id() have the following parameters:
> >>
> >>  * @naddr:      number of address bytes to send. Can be zero if the
> >> operation
> >>  *              does not need to send an address.
> >>  * @ndummy:     number of dummy bytes to send after an opcode or
> >> address. Can
> >>  *              be zero if the operation does not require dummy bytes.
> >>  * @proto:      the SPI protocol for register operation.
> >>
> >> They aren't standard either. It's just the way spansion and micron
> >> transfers
> >> the ID via RDID in octal DTR mode. And now there's macronix who does
> >> it
> >> slightly
> >> different. But *neither* of them are standard. Why should one be in
> >> the
> >> core and
> >> one shouldn't.
> >>
> >> spi_nor_read_id() should just handle proto == SNOR_PROTO_8D_8D_8S.
> >
> > Yes, it should, but mx is in 8d-8d-8d at the time it issues the read
> > id,
> > thus it passes the core proto == SNOR_PROTO_8D_8D_8D, isn't it?
>
> The flash device is in octal dtr mode, which means it will expect the
> opcode in octal dtr mode. But the data phase mode depends on the opcode
> (and theoretically, the address phase, too). If you use the
> (non-standard) RDID on this flash command has to be executed as 8d8d8s.
>
> > If you
> > care about this, please send a patch addressing it, it's better to talk
> > on code. I don't see yet how you will handle it, but I'm open to review
> > some code.
>
> I really don't have time right now. But something along:
>
> spi_nor_read_id(.., proto) {
>    bool emulated_8d8d8s;
>
>    op = assemble_op(.., proto);
>
>    /* Emulate 8d8d8s if the controller doesn't support it */
>    if (!spi_mem_supports_op(op) && proto == 8d8d8s) {
>       op = assemble_op(.., 8d8d8d);
>       emulated_8d8d8s = true;
>    }
>    execute_op()
>    if (emulated_8d8d8s) {
>       /* discard every other byte of the response */
>    }
> }
After checking with Macronix designer, a-a-b-b-c-c is the data arrangement for
read id operation of flash in 8D-8D-8D.
Flash transfer data while DQS raising and falling edge exactlly.
It is not a hardware bug or 8D-8D-8S.
So that I think we only need a method for specific comparison after
read id in 8d-8d-8d.

>
> Later (or even now), that could be moved down the callstack into
> the spimem core.
>
> -michael

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

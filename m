Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90066CDB46E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 09:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=skEUn/ZZy6HC7Dxs2ko71IG8FAZa4/WkCiqlJ/Vo9C8=; b=bzYdJnp58nLF7U
	6vrYCARGPSrzh8roHX269n2msFgowMApE9mG65ln6VrbyFjXs3CYwnHWKLvbVjYQKXN2v/BqEGE/1
	dFkO7glihU1M1cBTf4qYh7/sfQq/wcXpg9X5L8A6iPfS9/6z9Oj8BXyH4CSnrr7nV29oDDBKkCgPX
	weY8iQLzcsfEj2BSYrrQspCGKMuFturyL8m9rGPLsecijbA2qRciNBPsNkOAonnGErjI119CKsE88
	PQsoRJyJeq0O1zhZhliSehTVyUIgXeozLS09NEATNbFIOP+KQiCmRfk70XyzG4NI9LfuEi2ZNHVtj
	nuElw6VQ4kRewe9rzd5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsLF-000S0A-2L;
	Thu, 12 Oct 2023 09:50:53 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsLC-000Rys-0d
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 09:50:51 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-27d1aee5aa1so580329a91.0
        for <linux-mtd@lists.infradead.org>; Thu, 12 Oct 2023 02:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697104245; x=1697709045; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBU2PUD/NY62/eU9uDtIWvJjIkz/z8Hzki2KE0CQJZw=;
        b=IxR5CuZMUA2od42D2KwHX9RnGNXtzS79gLI9UOFAu+nPjuiUmaxnh0v1upIAgWfDTA
         1ho0zd0JKZJugFsQ2rm4YTFR7PdMsV3DSf0lEgBdKdOLwX4wMbCDbQcmKJZZPi7tWxtb
         PMH30NB6HsigoBwxmU4zZtKu8hWHia+yYghQyJTIc21GEFUW6zxwjl7JEDsoJcEhjNju
         QvlVJG/K4NiDPwSmw8JXi7tyih0K2kPTPVEEk8YKAfSmyB/BVPuiKBKrWHVPtluLIbwD
         cl9C8QdpsTyU5gQSoxoATRCcpVlMvGL8kOL99/99rc0svzFb3/KbHfzpllTJBwazz/2N
         UskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697104245; x=1697709045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBU2PUD/NY62/eU9uDtIWvJjIkz/z8Hzki2KE0CQJZw=;
        b=RvPTa6HY17xSitThBx6Akt3zgz8KNCt7Agt7j/UC8vJ1H6ypSeyd3br4qMpw4sO6Zp
         Fpw1hRyc5j5zUk9FQLhxo/Fr9hWld/06SQxale7tMtHOQEloJCQcpkqo8+dJ9gVub8Nb
         AT8zkB9xRL7bSYDp9jGSwBg3JyJ0YAp7R7fadUzLqtD5wGMhruSElzu4YZojsgET1Ur1
         JW0kWADq6WnpRqXfp5Za0cAhfipA6vMTo9SyQQKlCV1P3F6jS1FwJO93iK2o3oWN98+F
         mNikwCjyfnFsJaegrVE84GnKwBUZYKRumAygguq1xq3l0ftMMANS7im0wYtvF8yX+YfV
         UM4Q==
X-Gm-Message-State: AOJu0Yzbm/Va2HylWC3svBtjcpV3wxuD23Sigeiyx0zQ7qc8wSUP5K9k
	pRP2//ocZb54aBYK4j6IPY+ZPcGanvhR/hlaB7ZzjwvB
X-Google-Smtp-Source: AGHT+IHdUCgvbo4wsBc0+wielSMiZHyjg4NpFs3H2/ViuPSWeOoKZVp6CbxC4TLkVetr0cUshjgJ5niSFhXxW2JE2v4=
X-Received: by 2002:a17:90b:1bc4:b0:274:dd15:87bf with SMTP id
 oa4-20020a17090b1bc400b00274dd1587bfmr29877212pjb.20.1697104245227; Thu, 12
 Oct 2023 02:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
 <20230908064304.27757-2-jaimeliao.tw@gmail.com> <b998ea18-8ce9-83b0-f42f-18e5ea08175b@linaro.org>
 <mafs034yppc28.fsf@kernel.org> <f60995d3d02d7639204c2c16abf9bfd7@walle.cc>
 <54e5662f-baf4-4660-9fc4-7959d2405120@linaro.org> <29bb3d952b9f49961da5e01cf86f9c4f@walle.cc>
 <b705c36c-1d76-45a4-ab8e-dacdcb844509@linaro.org> <cdd8fb4d9261892345588388a5de262f@walle.cc>
 <CAAQoYRn9C2biQXfcJYK3SKQcGVZc3ibvP6q5pbk8v78CS+gWVA@mail.gmail.com> <5fcf12b6fdb2afbeb6fd1f0c22e691c7@walle.cc>
In-Reply-To: <5fcf12b6fdb2afbeb6fd1f0c22e691c7@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Thu, 12 Oct 2023 17:50:22 +0800
Message-ID: <CAAQoYRn51R3Ok1KEbdRVvwEoU+A4DEK8h2f7jCvn-cotmzFx8A@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] mtd: spi-nor: Add manufacturer read id function
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_025050_286908_762B66F7 
X-CRM114-Status: GOOD (  40.73  )
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

Hi Michael

>
> Hi,
>
> >> >>>>>> I see this flash supports 1-1-1, 8-8-8, and 8d-8d-8d, there are no
> >> >>>>>> mixed
> >> >>>>>> modes supported, thus a 8d-8d-8s mode seems just like a hardware
> >> >>>>>> bug to
> >> >>>>>> me. So my proposal is to leave the core away and to handle the
> >> >>>>>> read id
> >> >>>>>> hack just in the macronix driver.
> >> >>>>>
> >> >>>>> +1
> >> >>>>
> >> >>>> I've looked at the xspi spec. There is no RDID specified. So I'd
> >> >>>> argue,
> >> >>>> the only pseudo standard is that RDID was only ever used with
> >> >>>> 1s1s1s.
> >> >>>> But
> >> >>>> we added spi_nor_read_id() with parameters suited for the "unusual"
> >> >>>> 8d8d8d
> >> >>>> case with additional address and dummy cycles. Just for checking
> >> >>>> whether
> >> >>>> the
> >> >>>> octal-dtr switch was successful. Therefore, we've already added
> >> >>>> parameters to
> >> >>>> spi_nor_read_id() which are not standard. Then we can just add one
> >> >>>> more.
> >> >>>> It's
> >> >>>> just how macronix is doing it. Again there is no standard.
> >> >>>> If we'd only put standard (or for the 9F pseudo standard) things in
> >> >>>> the
> >> >>>> core,
> >> >>>> then spi_nor_read_id() would need to check whether the flash is in
> >> >>>> 1s1s1s
> >> >>>> mode. And no I wouldn't prefer that ;)
> >> >>>>
> >> >>>
> >> >>> If we really want to be catholic, we should switch to 8d-8d-8s mode
> >> >>> and
> >> >>> then issue the read id and the core will handle the readid correctly.
> >> >>> But there is no such a thing, because macronix considers that it is
> >> >>> in
> >> >>> 8d-8d-8d mode at the time of issuing 8d-8d-8s read id. That's why I
> >> >>> say
> >> >>> it's a bug on their side. The core is meant to be generic, I don't
> >> >>> want
> >> >>> to pollute the core with manufacturer specific fixes.
> >> >>
> >> >> Then why does spi_nor_read_id() have the following parameters:
> >> >>
> >> >>  * @naddr:      number of address bytes to send. Can be zero if the
> >> >> operation
> >> >>  *              does not need to send an address.
> >> >>  * @ndummy:     number of dummy bytes to send after an opcode or
> >> >> address. Can
> >> >>  *              be zero if the operation does not require dummy bytes.
> >> >>  * @proto:      the SPI protocol for register operation.
> >> >>
> >> >> They aren't standard either. It's just the way spansion and micron
> >> >> transfers
> >> >> the ID via RDID in octal DTR mode. And now there's macronix who does
> >> >> it
> >> >> slightly
> >> >> different. But *neither* of them are standard. Why should one be in
> >> >> the
> >> >> core and
> >> >> one shouldn't.
> >> >>
> >> >> spi_nor_read_id() should just handle proto == SNOR_PROTO_8D_8D_8S.
> >> >
> >> > Yes, it should, but mx is in 8d-8d-8d at the time it issues the read
> >> > id,
> >> > thus it passes the core proto == SNOR_PROTO_8D_8D_8D, isn't it?
> >>
> >> The flash device is in octal dtr mode, which means it will expect the
> >> opcode in octal dtr mode. But the data phase mode depends on the
> >> opcode
> >> (and theoretically, the address phase, too). If you use the
> >> (non-standard) RDID on this flash command has to be executed as
> >> 8d8d8s.
> >>
> >> > If you
> >> > care about this, please send a patch addressing it, it's better to talk
> >> > on code. I don't see yet how you will handle it, but I'm open to review
> >> > some code.
> >>
> >> I really don't have time right now. But something along:
> >>
> >> spi_nor_read_id(.., proto) {
> >>    bool emulated_8d8d8s;
> >>
> >>    op = assemble_op(.., proto);
> >>
> >>    /* Emulate 8d8d8s if the controller doesn't support it */
> >>    if (!spi_mem_supports_op(op) && proto == 8d8d8s) {
> >>       op = assemble_op(.., 8d8d8d);
> >>       emulated_8d8d8s = true;
> >>    }
> >>    execute_op()
> >>    if (emulated_8d8d8s) {
> >>       /* discard every other byte of the response */
> >>    }
> >> }
> > After checking with Macronix designer, a-a-b-b-c-c is the data
> > arrangement for
> > read id operation of flash in 8D-8D-8D.
>
> Could you please point to any specification? I doubt there is one
> and every vendor will do it slightly differently. I mean we already
> have some flashes which (apparently) reply to RDID in 8d8d8d.
>
> For example, see the Semper flash datasheet:
> https://www.infineon.com/dgdl/Infineon-S28HS256T_S28HS512T_S28HS01GT_S28HL256T_S28HL512T_S28HL01GT_256-Mb_(32-MB)_512-Mb_(64-MB)_1-Gb_(128-MB)_HS-T_(1.8-V)_HL-T_(3.0-V)_Semper_Flash_with_Octal_Interface-DataSheet-v03_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ee6bca96f97&da=t
>
> Have a look at Table 78 (or search for RDIDN_4_0) and Figure 28.
For Figure 28 in this datasheet, I think it means that data latch
while DS raising and falling edge.
The data arrangement of read id follow the 9.2(Manufacturer and Device ID).
As below are the data arrangement for vendors.
For Infineon, a-b-c-d-e-f
For Micron, a-b-c-d-e-f
For Macronix, a-a-b-b-c-c

Most of vendor a, b and c are manufacturer ID, memory type and memory density.
Some vendors may add extended information in read id like d, e and f.
For Infineon, 03-05h provide extend in formations for flash.
For Micron, 03h-19h(4-20 bytes) are called UID which are factory descriptions.
For Macronix, a, b and c are all informations in read id operation.

>
> -michael

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

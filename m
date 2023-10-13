Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAFECDB47E
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Oct 2023 09:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyTZWvSzDmTwTN24f7Z2b8A4BPY8M7GyP6nYMCNb0yA=; b=JrJ/9cy8D/vzQu4SzV7SLOWqel
	2ZTcvVi0dR2xGs99A/P1jGFSCzLKn+PTic6D+SeUF0SHbiHhG/BEzf80m1zLrEuOxp2/ncADyrB7h
	tgcKHUFJBbCQkXT70Y6cgCuWYt/8Ja/aKnE9k2nzo7SXVx9TtKAOs67WuBsCN0IPAdaeROnIJZGll
	Rys8KnzgdFfC5S9EpecOYsdHXRX9yokuNZhm2Ov+aGeqjR6Z0+an1nAAg+BlSf2HjWTDVPFBzqe29
	taDnntl26gNfeQcI4jGb1QCr56T0bLKRCJ+f92RqrRmLngAPpU2K/7U2rohgFWFy16ZszjuTau1TO
	dJdhymQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrE5Z-002tna-1O;
	Fri, 13 Oct 2023 09:04:09 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrE5W-002tmz-19
	for linux-mtd@lists.infradead.org;
	Fri, 13 Oct 2023 09:04:08 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 3F60F3D5;
	Fri, 13 Oct 2023 11:04:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1697187844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQfhPaW5aQ22UM8tENVLxMy0LQ9IBnF53pneEYbhSHE=;
	b=chyL4hMaIry0+FHj38P1uHU3JgTZCqSb//N5OIjvg8s1626CnWkdapc+moZvJ15/fjyyE/
	sTBWK/6Pm/7pCYOQEtkZCyVbQ5Oploy6gFmpm2CWjIW4SXbKfhex042oPaOp21U0+3oQiR
	cqh/yFVaLaDI8AI46U3Oy+gfgOEuH0L5WKBwNHxepiwYZerrQlaPFPD7OShAYhoLduZ0NB
	Et9vdu26Y7NdhsI0PHeHjvGTzKZeNzBQAFHzT6j+TSzZQ0A78FCRjVg2SOca9o2EiXDpps
	9RCYR+98vTGuBIl+WpYgBn/bmykkHQsr/RW5EF0c/xR7NFcUM/QnRhJOOfUy4g==
MIME-Version: 1.0
Date: Fri, 13 Oct 2023 11:04:04 +0200
From: Michael Walle <michael@walle.cc>
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
Subject: Re: [PATCH v4 1/6] mtd: spi-nor: Add manufacturer read id function
In-Reply-To: <CAAQoYRnYQBXPX59u3y7_Omz1qW=XuqGi8dy6trzfJXGTA_QCqQ@mail.gmail.com>
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
 <20230908064304.27757-2-jaimeliao.tw@gmail.com>
 <b998ea18-8ce9-83b0-f42f-18e5ea08175b@linaro.org>
 <mafs034yppc28.fsf@kernel.org> <f60995d3d02d7639204c2c16abf9bfd7@walle.cc>
 <54e5662f-baf4-4660-9fc4-7959d2405120@linaro.org>
 <29bb3d952b9f49961da5e01cf86f9c4f@walle.cc>
 <b705c36c-1d76-45a4-ab8e-dacdcb844509@linaro.org>
 <cdd8fb4d9261892345588388a5de262f@walle.cc>
 <CAAQoYRn9C2biQXfcJYK3SKQcGVZc3ibvP6q5pbk8v78CS+gWVA@mail.gmail.com>
 <5fcf12b6fdb2afbeb6fd1f0c22e691c7@walle.cc>
 <CAAQoYRn51R3Ok1KEbdRVvwEoU+A4DEK8h2f7jCvn-cotmzFx8A@mail.gmail.com>
 <8ec055f3a5bb69e6d72d4f4c5c7946bf@walle.cc>
 <CAAQoYRnYQBXPX59u3y7_Omz1qW=XuqGi8dy6trzfJXGTA_QCqQ@mail.gmail.com>
Message-ID: <8b19eae720f0e0a8285993f3627eeff7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_020406_553019_FD6B213C 
X-CRM114-Status: GOOD (  18.13  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Am 2023-10-13 10:23, schrieb liao jaime:
>> >> > After checking with Macronix designer, a-a-b-b-c-c is the data
>> >> > arrangement for
>> >> > read id operation of flash in 8D-8D-8D.
>> >>
>> >> Could you please point to any specification? I doubt there is one
>> >> and every vendor will do it slightly differently. I mean we already
>> >> have some flashes which (apparently) reply to RDID in 8d8d8d.
>> >>
>> >> For example, see the Semper flash datasheet:
>> >> https://www.infineon.com/dgdl/Infineon-S28HS256T_S28HS512T_S28HS01GT_S28HL256T_S28HL512T_S28HL01GT_256-Mb_(32-MB)_512-Mb_(64-MB)_1-Gb_(128-MB)_HS-T_(1.8-V)_HL-T_(3.0-V)_Semper_Flash_with_Octal_Interface-DataSheet-v03_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ee6bca96f97&da=t
>> >>
>> >> Have a look at Table 78 (or search for RDIDN_4_0) and Figure 28.
>> > For Figure 28 in this datasheet, I think it means that data latch
>> > while DS raising and falling edge.
>> > The data arrangement of read id follow the 9.2(Manufacturer and Device
>> > ID).
>> > As below are the data arrangement for vendors.
>> > For Infineon, a-b-c-d-e-f
>> > For Micron, a-b-c-d-e-f
>> > For Macronix, a-a-b-b-c-c
>> 
>> So there is no standard among vendors, infineon as well as micron is
>> using 8d8d8d and macronix is using 8d8d8s. And - please correct me if
> Macronix read id operation is not 8d8d8s, it just look like 8d8d8s on 
> datasheet
> but flash send 2 bytes data per DQS cycle exactly.

Two DQS edges, yes.

> I think whether to use 8d or 8s depends on how many times data is 
> latched
> within per cycle.

I see and I agree with you. The flash behaves like it's in 8d8d8d mode, 
but
just send every byte of the id twice. Well, then I'd argue, it's a quirk 
of
your flash.

So Tudor and Pratyush want to hide that away in macronix.c. I would like 
to
see this handled in the core, because all flashes do the very same after
switching to octal mode and that is trying to do a rdid and see whether
they got a sane response. And during cleanup I noticed that this code is
pretty much copy and paste among all these flashes and looks very
open-coded.

But to move forward here, keep it in macronix.c.

>> I'm wrong - the data strobe signal is optional.
> As I know, data strobe signal is needed when 8D-8D-8D mode.
> Infineon data strobe signal called "DS".
> Macronix and Micron data strobe signal called "DQS"

Maybe Pratyush can help here. But as far as I know, the data strobe
is optional. E.g. on a layerscape ls1028 you can use an internal dummy
strobe if it's not connected. The timing is then determined by pad
delays.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

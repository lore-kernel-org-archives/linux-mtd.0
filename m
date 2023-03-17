Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A84C74A5B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 07:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqFPGIh0kVsvdk7w7ktlf+iFOzEbF9OvyXl4Jrsr+Zw=; b=vH4V57R21bqRpN
	OnSkdQhmsUfNl+BGsR8JCxS8FRK46bKJiLAVLhVj9YiWdD/K2LeRY2Q1SNNrHIukhTPx8drpQTVrL
	4F5mL1okBFkup85/OTn5jFiG6QQSg3eM+Q6wmEK5MR0wN/yrQRJ1bSlfm4GBryBDaVrPiUyBlNBSZ
	vVeiaH1yjqJFG6IXmz9Ympj/RjZ/+H7XfeXcaQ0ThL5154Z+OI22OzFBc/qD3reMS8zVhDnuwncjy
	H9L+UoWd+FElSZ3Tr3/Uqq8XHHvzBbvLptjYAayHJIHoso4T2kgJo1ouF/cMYRR/HTr3sOAr9E/UB
	kqE8aObEOevC+DLMJmtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd4ke-001K8g-2U;
	Fri, 17 Mar 2023 07:43:48 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd4kc-001K7Q-0S;
	Fri, 17 Mar 2023 07:43:47 +0000
Received: by mail-pl1-x62d.google.com with SMTP id iw3so4479155plb.6;
        Fri, 17 Mar 2023 00:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679039024;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CChaWG1gFFoYHtP3iaA6HjuBSgLAz7V8FgN0lGzLkLI=;
        b=TsvbSS71bsJ8SjnA3/xTySORzhScNDeAQYRzY8S4dJaMDhJmR88ub2KNvj+oB87VfD
         qW0sCaZV5FgpffllYOKfoOUHLHBYk7UpGJ3bo4GgPrV7wZPvluGHK1n+to179Akwqwnt
         xOyqnLXST/dxceUYXGuc1N6BC8di/fAT9nWl6gL0H7Oh0ncaocbHgLHckU1CuDYoOrVC
         9JXq1P5IaaUAvWGllIKO7gN8HpKMHmpXuU8NYisfpTciMhnQ+6nPq6are0LlQkOA23qM
         9vr+p3Ii/L+RxrPrKqb9RbMrqd3RpgbW+8kVdBov2JGbB06PkczHMb5qsUnIk697FFOc
         6EOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679039024;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CChaWG1gFFoYHtP3iaA6HjuBSgLAz7V8FgN0lGzLkLI=;
        b=m5mgSHdiq93cYoEsmkGpINpuPbK6YX0dU98soZE8/lxo23Y/3Vz0NMmZqLzEfHX47W
         2vMP2LaXNHYdnbjGgdeeLnVdVInJ4Yflpc71mru80PN8fH5FzvaletlmJpwr9Gb/WWGJ
         ZBeaf9AaEWaveF0JUU3i0G6tzhXq8Jlynt9IGkf2I99VvglwMkGgf71Stg70Y6n/xWf7
         NCeqG617ex+uprJpmy2bH8U+qzIz1Pkb9Ww1tv5jCoHfu/OLChugVMX4BOTqoI3spBXy
         2vjrzB3HkCq64tlxq4lL/ofVd3p+x/5WUvDQP/WFVhLb4C5/V9poCgo1FsKFnbvFPt/g
         YX5Q==
X-Gm-Message-State: AO0yUKW2QkmCkCUNi0Sxw/JOLtIQKrpFSc4E5z0e5doJ76QYYpKkO3g+
	v7yuCrHTBtaTk322iaWBB66dmf2g/1kA61d3Bckg79xRlzA=
X-Google-Smtp-Source: AK7set+IlFL84tFmGN1pWFcsGQAjdGLS7PCJi9NiGaXpQpFplGwkcLE7gU0trVHh5yw5JVVN1nH8rk8DoCYhK3gKfYs=
X-Received: by 2002:a17:902:f80a:b0:1a0:5445:c565 with SMTP id
 ix10-20020a170902f80a00b001a05445c565mr2607697plb.5.1679039024601; Fri, 17
 Mar 2023 00:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230201113603.293758-1-miquel.raynal@bootlin.com>
 <20230201113603.293758-9-miquel.raynal@bootlin.com> <8c54df69-52ac-b2e7-09d8-2066fb15c998@linaro.org>
In-Reply-To: <8c54df69-52ac-b2e7-09d8-2066fb15c998@linaro.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Fri, 17 Mar 2023 15:43:33 +0800
Message-ID: <CAAQoYRmk6X287B5-U3sk-ThUrm-210W_u8mkvBcsxBwaCDX53w@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] mtd: spi-nor: macronix: Add support for
 mx25uw51245g with RWW
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
	linux-mtd@lists.infradead.org, Jaime Liao <jaimeliao@mxic.com.tw>, 
	Julien Su <juliensu@mxic.com.tw>, Alvin Zhou <alvinzhou@mxic.com.tw>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Michal Simek <monstr@monstr.eu>, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_004346_198358_5F14B4C7 
X-CRM114-Status: GOOD (  21.12  )
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

Hi Tudor

>
> Hi, Jaime, Miquel,
>
> Any news with the datasheet, can you send me a copy of it?
>
> On 2/1/23 11:36, Miquel Raynal wrote:
> > Describe this new part and provide the RWW flag for it.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/mtd/spi-nor/macronix.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> > index 6853ec9ae65d..655e7eec865c 100644
> > --- a/drivers/mtd/spi-nor/macronix.c
> > +++ b/drivers/mtd/spi-nor/macronix.c
> > @@ -82,6 +82,9 @@ static const struct flash_info macronix_nor_parts[] = {
> >       { "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024)
> >               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> >               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> > +     { "mx25uw51245g", INFOB(0xc2813a, 0, 16 * 1024, 1024, 4)
> > +             NO_SFDP_FLAGS(SECT_4K | SPI_NOR_RWW)
> > +             FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>
> Is this flash not really supporting SFDP?
Yap MX25UW51245G have SFDP table support.
As below is the link of octal DTR feature patch which include
MX25UW51245G SFDP information.

https://patchwork.ozlabs.org/project/uboot/patch/20220718064922.20193-2-jaimeliao.tw@gmail.com/

Sorry for that I can't share the link of datasheet cause Macronix
didn't make it public.
>
> We ask people that update or add new flash entries to do a erase, verify
> erase, write, read back and compare test. Also to dump the sysfs
> entries. Here's how to do that:
>
> https://lore.kernel.org/lkml/97a3b023-b9bc-c34d-45a4-ddd56f47bd76@microchip.com/T/
>
> Thanks,
> ta
Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

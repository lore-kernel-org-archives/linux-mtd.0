Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E908C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 10:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ax3vcPoN3h7pcaXQex7PwOgFP9AeC6ZJr6tzqjGQPoY=; b=vQ8KRTOfL9MXOC
	DCW+ccJUv0gnGfFOrtbDgNimbW4vgA47WiTSPSnnjKBXzxlT9aCo6kJOMBk1eK7WPFMramruapiEK
	AqBhqVlM52zV8cS535m7gjp2VsDDWYdcXD/+Ay5W301Kyu7EVrx/EJZi8JhWCiFln9xcE4bk2GYF+
	wwhB9VqvJuvsuAwgBHdPXLfe5vn4uzrfnD/iIwfbzZZ/cCSR1/rGPe7md+3aA4cBAXXctMJup9YuS
	hhNvBcv/KjvXh6LDodglYyJaK6DF8Y7UBp1py5gz+1vuRZVkrBBtcnCTitoi3on7+C1E5/YkV3OA3
	MJV7YO2zvwt5pRMejTxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEpsn-002fwO-Sz; Fri, 22 Jul 2022 10:27:46 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEpq9-002dY2-0y
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 10:25:06 +0000
Received: by mail-ej1-x629.google.com with SMTP id mf4so7850263ejc.3
        for <linux-mtd@lists.infradead.org>; Fri, 22 Jul 2022 03:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EOEXLOldU7ZOXJVFuOzzIy1TJAM2KQnM9rtTSEMd8Is=;
        b=Z5hOVzONR2hSjRiyIpxdvM0KIHcqCLzpk7zVnvTl4U4q0oGJ+R8P1MSOShCivcDGPg
         w8hwkX8kyTjjAAIk2mOyB0xkssTj/6xp6+a184MJvz9UeZvrql57jfD+xFo7ENa3Qrc8
         sANHEoKz+JtJ7cRXPj+cmURudkULMeTEs0ykQbzpj8OsfhkMdf7L0McBepSGu3461xKW
         CYiPiZ+KlveknszWEKo+3uOnsp5wt7wKAI+sSz8udVjsRPZVmBxI0lwUcFYr3ck9C7z2
         TuVFMN2spFkZ4bZcReL/03ezepwh79rnn5AOa+K8IkYMOquX1hg7Ni/r1TtIMHn0etDe
         qGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EOEXLOldU7ZOXJVFuOzzIy1TJAM2KQnM9rtTSEMd8Is=;
        b=wJ5qpDLXESdTlP0NnqvzciJk6j9l07b0Uu9pqB2hycqjsTerzTS1lJilOaq5XRcaLM
         pz5ykFHKC+X+iMZ8zCf5SMN4pm6BnMnUj85oS3tZddyRb8jutknJ76+1I+gR997LelWy
         3Tmc0zjlGm5E6ZOUE8ZahvQQyhpTMM+TcwAhDtUbA5R8STvAfgp0+o1hNEIT2Rx5ynzn
         ldZH+RUGHAosLguKwfTe1+WckFfixJT35bTlNJgXNsqbei/2uNJsemrnwe0h4Gr3+Bsf
         eiSjQ9BzuYBBv383aGc1PnaJEaxkLN68GBJpGeoBDdGvbssi7U5tfjJjfs/T8KaQf7De
         ycsg==
X-Gm-Message-State: AJIora/BZe1c+0JNEfpLl20hnREo6XNktxwQVSLbgD3ohVAFUFAp0Ux7
	TEaM2usxDMWJzk8Uzlhn15wo5iqCO8pxaK789UECYw==
X-Google-Smtp-Source: AGRyM1vFYiAtSA3wjdx/WgQoZqrPge2ctC3H+IT42M19E6+c398L6CTRywieE5NphxcXhV4vq3frhmFGe2h4M/MlBmY=
X-Received: by 2002:a17:907:2888:b0:72b:8f41:1405 with SMTP id
 em8-20020a170907288800b0072b8f411405mr2483664ejc.564.1658485497471; Fri, 22
 Jul 2022 03:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220712163823.428126-1-sudip.mukherjee@sifive.com>
 <20220712163823.428126-3-sudip.mukherjee@sifive.com> <3a9877d0-3cc5-6452-764b-d07b38c72b00@microchip.com>
 <CAHyZL-fK-d+dPWG63dcFUz17uP-sG4bnSFVW_gt16snnOVTzpQ@mail.gmail.com>
In-Reply-To: <CAHyZL-fK-d+dPWG63dcFUz17uP-sG4bnSFVW_gt16snnOVTzpQ@mail.gmail.com>
From: Sudip Mukherjee <sudip.mukherjee@sifive.com>
Date: Fri, 22 Jul 2022 11:24:46 +0100
Message-ID: <CAHyZL-c9iSd8=CaQ00Nptea4cqp9f7oqS5VefT3vfcr2J3hmSQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: add support for Quad Page Program to no_sfdp_flags
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Jude Onyenegecha <jude.onyenegecha@sifive.com>, William Salmon <william.salmon@sifive.com>, 
	Adnan Chowdhury <adnan.chowdhury@sifive.com>, Ben Dooks <ben.dooks@sifive.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_032501_177248_E64024F9 
X-CRM114-Status: GOOD (  21.09  )
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

Hi Tudor,

On Mon, Jul 18, 2022 at 7:49 PM Sudip Mukherjee
<sudip.mukherjee@sifive.com> wrote:
>
> On Mon, Jul 18, 2022 at 6:02 PM <Tudor.Ambarus@microchip.com> wrote:
> >
> > On 7/12/22 19:38, Sudip Mukherjee wrote:
> > > [You don't often get email from sudip.mukherjee@sifive.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > >
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > >
> > > Some flash chips which does not have a SFDP table can support Quad
> > > Input Page Program. Enable it in hwcaps if defined.
> > >
>
> <snip>
>
> > > diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> > > index 58fbedc94080f..dde636bdb1a7c 100644
> > > --- a/drivers/mtd/spi-nor/core.h
> > > +++ b/drivers/mtd/spi-nor/core.h
> > > @@ -462,6 +462,7 @@ struct spi_nor_fixups {
> > >   *   SPI_NOR_OCTAL_READ:      flash supports Octal Read.
> > >   *   SPI_NOR_OCTAL_DTR_READ:  flash supports octal DTR Read.
> > >   *   SPI_NOR_OCTAL_DTR_PP:    flash supports Octal DTR Page Program.
> > > + *   SPI_NOR_QUAD_PP:         flash supports Quad Input Page Program.
> >
> > You don't need this flag if your flash supports the 4-byte Address
> > Instruction Table. Does you flash support it? Can you dump all the
> > SFDP tables, please?
>
> Not sure what the correct way to dump sfdp is. I did this from sysfs.

I tried decoding this SFDP table and I think the parameters table says
it has "3-Byte only addressing".
So, I guess that means it does not support 4-byte Address Instruction
Table. And the datasheet
says it supports "Quad Input Page Program (3-byte Address)".
My existing patchset works for Quad Input Page Program, and I can send
a v2 with the previous
patch and this merged together (as you suggested) or I can try
enabling sfdp for this chip and then use
a fixup_flags to enable "Quad Input Page Program" which I think will
be more complicated.
Which one will you suggest?

--
Regards
Sudip

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

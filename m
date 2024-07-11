Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC224C3DA4A
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 22:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omBi53kREIVDkzxKBFhzIeU+d09vas9tWo1xJrRTeEg=; b=t3vdfeI6VszuOV
	+MmavSBXyznI0Pm2aJk4JKSxKzDPIA4VnlNLB2czHia0FVVyDjvQWIptydY9s5i845IGgfLPlk++q
	KTpv4RhnjJTkekk5fNs/PNNmr1XvuF3iGFsEtdjnLeQTC6brGxiWdnbi7iBlFNscNqgKV7I9z5nO/
	9D+7zm9K7x0z0OYbDPV9eUpeAsQmWTS8HDTTfbYqah7zF27uECgMrcyTVCesax/gkQMZCjamu6qKC
	EkBOAPjTswA5GUYYrJdsA3Cn3OJS0OtVTe0HwgiMsjjoznz0nf8NRbewHSnNcXW+tTxo25ywFqDNo
	fIeoPueE8mMtrRX/QgEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS1z0-0000000Fc24-0yPg;
	Thu, 11 Jul 2024 22:09:46 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS1yx-0000000Fc1U-2TEp
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jul 2024 22:09:45 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ee9505cd37so12563411fa.2
        for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2024 15:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720735782; x=1721340582; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KBJ0y3g1ruClksG7c8rC7Ii3NaLmFEryT+9N6mGNKtI=;
        b=HWqyVaxMiW9qjZMVxYE3ZtOVD8pNZ8MEMsSCMAeCchwHIjidRyP6aiRzfG72RBU1Se
         N+ea6B9OqJUbQkWZOJo0suwUVeveDlmettl88Edd8lndpWXMpHDrqThV067t1OXBrrsh
         V9t75f49JxWSfxApIZPN1XTR0T1DaVNwzmSG1ESTZTvLcgP90OH8OiwEBXyvSZrCFVX+
         FnUzHxqRex1oObRjXh7S3q80aDlsxuUYFPfA0oZfMVfQVMZwq1Q8/pDN/jgTvpv4lnOB
         gUgPRj7vIDNe1eT8YKqmFfhvms3vBFZ1OjdicaqKtr7SRcD8I43ilrRp2XRr7MqydPY5
         dpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720735782; x=1721340582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBJ0y3g1ruClksG7c8rC7Ii3NaLmFEryT+9N6mGNKtI=;
        b=wiBJth2f+XcPC1JDZxNwVN003Z/1Yb9vyTNO6VQEwJaUtQzZfICyCLOw4rAn1Dwju2
         vzvIJe1FNbrlTKE1Ozpx9hXT0q0BQ0LLukskF3LtmZ0LJwGH0gZxvEBDOwtEyc1YX4Wy
         UUzRpR/mOXsVYYL2ZtaQg2eZtzKAQU+QJIr8h6JdtQANkZ56hzTEEgmkwBP+++3rELtJ
         SjH7OSqOUalHvmYaw4AmLnFWrVjaDE7+POO3lnY7b2NEFcf8vvKVeKwahkFLNRXkwzkm
         CrE3/M8hNdDvaipgxZ05JcX/2MAJKrLmU5PIy52sdobUH46pYrZsRzzi6ZTlgaW6H83e
         RNag==
X-Forwarded-Encrypted: i=1; AJvYcCV1vLJCUc+s5v/o2/JIU9YVVIefEqVZA10hLQpnUfA3nolFMR2YFa1vkcY/1hxvRpKJAaiqq92H7shFPaK1KumTRAUaLs6MIFWdKm5UoQ==
X-Gm-Message-State: AOJu0Yx0lEOCU+1YZbpbTTGYTEUMRj2G4TndFPTzXt2JW2IVuYCpz5Oj
	ODf9SdFnGW0MoFmA/1Igc5wkXayO8UsWDqSkwd5lLlvE9nP/2OZYnUH9SlcAO07Q8XEtyzuIjrU
	YAbugpE1HQEdeXv+v6VZsBaKZsA==
X-Google-Smtp-Source: AGHT+IH9Ai9bYIEYD8w0b32hmLEFwAiKQ3UxPHulvoySXmj8ntnjYdf509mA6eeQGNEfme8k5ZSedfSwv9yzk9A1wPE=
X-Received: by 2002:a2e:8297:0:b0:2ec:5b17:29a2 with SMTP id
 38308e7fff4ca-2eeb318aaf4mr57430711fa.32.1720735781263; Thu, 11 Jul 2024
 15:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240629103914.161530-1-erezgeva@nwtime.org> <20240629103914.161530-4-erezgeva@nwtime.org>
 <1c457520-07b7-4bde-b040-e8bca959a4f5@linaro.org> <CANeKEMOODBNZA6efh0E0Ga_KaVs5Y3WLcUftRhNwYHhnXO=GNw@mail.gmail.com>
 <CANeKEMO42rJt5Ob4_HDcZ3eEMvuMOPvRaFaLwL8SA65NtxSV7A@mail.gmail.com>
 <1d56c3b2-7adf-45b9-a509-956340f3f17b@linaro.org> <CANeKEMMe-Onpn7xWQHgWz1Ps_uQPEMa7HrKA00HpoKjG+DCJNQ@mail.gmail.com>
 <3bafcbea-6aa5-43ca-9d12-3916be3fe03d@linaro.org> <CANeKEMM02-Jvb8Pd0fZJFnRg-hsAW+hckYWm11tZZXNMPSPJ=w@mail.gmail.com>
 <9b45cc73-2251-4085-af95-7ccd00dd6d3b@linaro.org> <CANeKEMP+mRefYZNb+TuBmOD7dC6=7Rg7D1EcfnjJoiaeaV28SQ@mail.gmail.com>
 <875xtd48ps.fsf@geanix.com> <CANeKEMNJ3_ET5pQo2wg7_GSLX+vE+dqW-CV=v2DnG10xcgSdzQ@mail.gmail.com>
 <D2MZ405LVTN8.3LTVN3KTUD6A3@kernel.org>
In-Reply-To: <D2MZ405LVTN8.3LTVN3KTUD6A3@kernel.org>
From: Erez <erezgeva2@gmail.com>
Date: Fri, 12 Jul 2024 00:09:01 +0200
Message-ID: <CANeKEMNtXb4ZV7kcLbHY+Mti6dPV9UZ2wTyUq5z0qtmtNNqSVA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: mtd: macronix,mx25l12833f: add
 SPI-NOR chip
To: Michael Walle <mwalle@kernel.org>
Cc: Esben Haabendal <esben@geanix.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jaime Liao <jaimeliao@mxic.com.tw>, leoyu@mxic.com.tw, 
	Alvin Zhou <alvinzhou@mxic.com.tw>, Julien Su <juliensu@mxic.com.tw>, 
	Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_150943_671092_79D1BF05 
X-CRM114-Status: GOOD (  22.73  )
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

On Thu, 11 Jul 2024 at 21:57, Michael Walle <mwalle@kernel.org> wrote:
>
> Hi Erez,
>
> No top posting please, see also
> https://subspace.kernel.org/etiquette.html

It was a single question. Which I think can be answered in one reply.
In cases where there are different parts in the mail, it makes sense
to avoid top posting.
I do not believe we need to be pedantic.
The guidance is not holy, it is aimed to make communication more comprehensive.

>
> On Thu Jul 11, 2024 at 8:57 PM CEST, Erez wrote:
> > Yes, I think we should.
> >
> > Reading the specification provided publicly by Macronix.
> > For all the JEDEC IDs with the no SFDP flag in drivers/mtd/spi-nor/macronix.c
> > All of them have a new version or a new chip with the same JEDEC ID
> > that supports SFDP.
> > There are 2 chips that Macronix does not provide spec. in public.
> > I can ask Macronix technical support on these 2 chips.
>
> We don't add flashes we cannot test.

I did not suggest adding anything new.
I refer to the list of chips we already have in drivers/mtd/spi-nor/macronix.c
I presume someone tested them before adding them to the list in the past.
And probably the old chip did not have the SFDP table back then.

What I checked with the chip specifications is that all Macronix chips
since 2010 have SFDP.

The situation today is that all Macronix chips that are NOT in the
Macronix table work based on the SFDP table.
But new chips that use a JEDEC found in the Macronix table, skip the
SFDP table and
 use the setting of the old chip.

So I suggest we read the SFDP table for all Macronix chips.
Old Macronix chips that do not have SFDP will use the setting from the
Macronix table. i.e backward compatible.
While new chips which do have an SFDP table will work with the new
setting we find in the table.

Of course, we might have issues in parsing the SFDP table itself.
So we fix them as developers report and send chip ID and part number
with the SFDP table content.
I do not see the point of "hiding" with the old setting.
Anyhow, as we do not like the IDs table and keep it for backward-compatible,
  so it only makes sense we should use the SFDP table as much as possible.

My check was to ensure Tudor that all Macronix chips have SFDP whether
they are in the IDs table or not
 and we are not wasting a no-op on a chip which can not have an SFDP table.

All I suggest is we add the new 'SPI_NOR_TRY_SFDP' flag, to all Macronix chips..
Which will try to read the SFDP to any Macronix chip.

Erez

>
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

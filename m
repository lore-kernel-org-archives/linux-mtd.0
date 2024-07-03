Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C18BC2BD09
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2024 08:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N236vACw7WI+ufhYv4knAFwFUmDKaBp88paxHEJTMqU=; b=AR4CRFRNGfVV7Z
	Ig3MjSaVc2dHmRO1c74rLv2gbLn0Etikn+g+catrFNrGY+0VVCsuHqk0wFnNe64Juj2obmxGPlnGU
	grlruv9qDV3kcGCXne6CXV7NPRPQQODTO4uWGyCVaMZowz6JzcCULkDPcNTWKC0ywGHXcq50dT6DZ
	VXXD/47sqT5jKKhRnrZzf0tqK4BiL0GXTxvnS9b2dR9HjifnhdEpTPHOanvcXJMf502kdXr5ZAOp+
	sL3PVMaue1kJxSc2ZtpOOLY9tLZoSdxfaTj5SsEajL6JLJxEkYKyAJJH8hB667RfMJSCgKHXz24bG
	J5jF3yNgKxVrorFNDBOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOvHS-00000009Pzx-3cmw;
	Wed, 03 Jul 2024 08:23:58 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOvHP-00000009PzT-2Xit
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jul 2024 08:23:57 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a724b3a32d2so592922266b.2
        for <linux-mtd@lists.infradead.org>; Wed, 03 Jul 2024 01:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719995033; x=1720599833; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zCMYXJXadwK61w5sdXjhb6LXfr4ZtVK+ganCBejHY3k=;
        b=fYIX077IRyS/klakKv/QCbqG4CE49OA8AUk5RY/iroSCFgph0GNfKnRUaXN0UCnncG
         0PZzW/EOz5aN3WsCZLcvzKW40cjY+qJqM57PqfKox53181SQjlLYZjzGJm9tIufiLZUt
         DFTi8kg49lSwoufQHVyfNBVqx6wR8/c3Y4sZJakOh8aP2NvUs/489hTvelDeM/2d+zuc
         GYQHCZ4btwJ8xkB+XlaqiZazcyb9Qcrnd40iwNkMIF+guKEoS0/iBYW8c8uiGNYI+YwH
         7Gcr3dT6KO3yXUdYB/PCsMug4Cveurtw7oRt3f6bY5nzmm289P7eIp+jWPHV/rDyEjcL
         ngBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719995033; x=1720599833;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCMYXJXadwK61w5sdXjhb6LXfr4ZtVK+ganCBejHY3k=;
        b=eCuA1RXIVti0FISlUK5hxn35gQMO9g45ZxfeWANy+aIrOIXeNdkKIcHA9+zw294dIC
         MPsSFo6OBqKYYcyL9Xy+8q9zQa2TZOUBAOsPPul1U92AXYMAmzccOXG8S8DQm2+sxZQF
         d/1sG46TtI+gFyEJl5/YTlQApRdwZxP/+iaBdLHrNlJEPWsChNLWb8gHQuAR+RekAVf9
         vLdYgOANI6eHacYZwvF0m2WZeLGH8S2HrM9pdEbK/+hSmUjS7h6MGx8LP/sgDQ/7B5w7
         6lCfPldua0xvvYoFFmLigm0Sgf7FKeJPHai8NXSPhpdSgh+8wSF8xZ4UKfBDI/Vy7r7V
         yQAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjLXnEMyviMMNBvVXfoFKwDBak5QzlJQmKCsNAiqNR//TDoKNDKxIM7pQa8ZrYHtnzdxupa3clrkPbLvTSOt16DBKp6LAbAXQvk77U8w==
X-Gm-Message-State: AOJu0YxPI9NwLa6W4hpzJ2kj2noNIXBhmpaxOY83nKzluBk//PtMQ7Sy
	q7wID8KLRh4lGuHt+Qrjykmah8i1hD/LUUycohlK2B7+LOwa4cKODEzGf5SC8jbMnLnqw2WvE5F
	h5LlcSvDe8UcvhjYkCCb3A5CuaQ==
X-Google-Smtp-Source: AGHT+IELcZTIilt/NDQQO1QrB9EIggXdx7nlZ6ejwLcXZXR9gSKZjLqipfoOr74YTbP8BXrqr93Wpl4wY+4zDdSTw8s=
X-Received: by 2002:a17:907:84d:b0:a75:29ea:283f with SMTP id
 a640c23a62f3a-a7529ea28d3mr540210566b.66.1719995033305; Wed, 03 Jul 2024
 01:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240629103914.161530-1-erezgeva@nwtime.org> <20240629103914.161530-4-erezgeva@nwtime.org>
 <1c457520-07b7-4bde-b040-e8bca959a4f5@linaro.org> <CANeKEMOODBNZA6efh0E0Ga_KaVs5Y3WLcUftRhNwYHhnXO=GNw@mail.gmail.com>
 <CANeKEMO42rJt5Ob4_HDcZ3eEMvuMOPvRaFaLwL8SA65NtxSV7A@mail.gmail.com>
 <1d56c3b2-7adf-45b9-a509-956340f3f17b@linaro.org> <CANeKEMMe-Onpn7xWQHgWz1Ps_uQPEMa7HrKA00HpoKjG+DCJNQ@mail.gmail.com>
 <3bafcbea-6aa5-43ca-9d12-3916be3fe03d@linaro.org> <CANeKEMM02-Jvb8Pd0fZJFnRg-hsAW+hckYWm11tZZXNMPSPJ=w@mail.gmail.com>
 <9b45cc73-2251-4085-af95-7ccd00dd6d3b@linaro.org>
In-Reply-To: <9b45cc73-2251-4085-af95-7ccd00dd6d3b@linaro.org>
From: Erez <erezgeva2@gmail.com>
Date: Wed, 3 Jul 2024 10:23:16 +0200
Message-ID: <CANeKEMP+mRefYZNb+TuBmOD7dC6=7Rg7D1EcfnjJoiaeaV28SQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: mtd: macronix,mx25l12833f: add
 SPI-NOR chip
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jaime Liao <jaimeliao@mxic.com.tw>, leoyu@mxic.com.tw, 
	Alvin Zhou <alvinzhou@mxic.com.tw>, Julien Su <juliensu@mxic.com.tw>, 
	Esben Haabendal <esben@geanix.com>, Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_012355_672424_8D634AEA 
X-CRM114-Status: GOOD (  40.16  )
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

On Wed, 3 Jul 2024 at 09:12, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
>
>
> On 7/3/24 12:16 AM, Erez wrote:
> > On Tue, 2 Jul 2024 at 07:00, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> >>
> >>
> >>
> >> On 7/1/24 6:08 PM, Erez wrote:
> >>> On Mon, 1 Jul 2024 at 12:15, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 7/1/24 10:46 AM, Erez wrote:
> >>>>> When using mx25l12805d, we do not read SFDP.
> >>>>> As it uses the no-SFDP flags.
> >>>>> When using mx25l12833f hardware with mx25l12805d driver, it did not
> >>>>> try to read the SFDP.
> >>>>> Yet mx25l12833f does have SFDP, when I remove the no-SFDP flags, the
> >>>>> driver fetch the SFDP.
> >>>>>
> >>>>> Secondly SFDP does not contain OTP information.
> >>>>>
> >>>>> mx25l12805d has two OTP regions of 128 KiB and 384 KiB (yes asymmetric).
> >>>>> While mx25l12833f has two OTP regions of 512 KiB.
> >>>>>
> >>>>> How do we handle it?
> >>>>
> >>>> You would first try to parse SFDP and initialize the flash based on
> >>>> SFDP. If there's no SFDP then you fallback to the flags declared at
> >>>> flash declaration. Esben had a try recently, see [1]. I don't know if
> >>>> there's any progress in that direction.
> >>>>
> >>>> Also, you haven't mentioned anything about the testing. Do you have the
> >>>> flash?
> >>>>
> >>>> [1]
> >>>> https://lore.kernel.org/linux-mtd/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com/
> >>>
> >>> Looking at "mtd: spi-nor: macronix: workaround for device id re-use"
> >>> I guess it can be applied to all Macronix devices.
> >>
> >> No, no, we're going to do it individually just where it's needed.
> >> Issuing unsupported commands is not that great.
> >
> > Would be nice if we could ask Macronix directly.
>
> we did. They said it's not ideal, but it's okay.
> >
> > Looking on their web site and reading some spec. and status reports.
> > Using the IDs with  'no_sfdp_flags' in drivers/mtd/spi-nor/macronix.c
> > I did not search for new chips reusing IDs of chips at end of life.
> > But we found 3 already:
> > MX25U51245G appears in the table with the same ID as MX66U51235F.
>
> is there an extension ID that differentiate the two?
>
> > Esben Haabendal found MX25L3233F which reuses  MX25L3205D ID.
> > And I found MX25L12833F reuses MX25L12805D ID.
>
> Yes. And we already have a plan for these. We need someone that cares
> about them to implement it.
>
> > Chips that are not in end of life do support SFDP, at least the new
> > versions of the chips according to their spec.
> > It seems quite systematic.
> >
>
> maybe

I check the public spec of all chips, but one, which are in the
Macronix driver table and are still in production.
They all support SFDP. I do not understand the "maybe".
As for the chips in end of life, we found 3 new chips that reuse the
ID, we can find the rest.

>
> > By the way, the chip MX25L2005A part number is 'MX25L2005' without the 'A'.
>
> feel free to propose a patch
>
> >
> > We can support Macronix chips that are not in the table, just by
> > reading the SFDP.
> > In that case we can name them like "mx-szNN".
>
> We don't care about the flash name.

Agree.

>
> If all the flash settings that we care about can be discovered by SFDP
> then one won't need to declare a flash entry at all, and instead rely on
> the driver to setup the flash settings solely based on the SFDP tables.
> See spi-nor-generic handling.

Excellent feature!

>
> >
> > The table below uses fixed width characters.
> >
> > ID      Part.         Size              Status          SFDP status
> > according to spec.
> >                                                         New chip with
> > SFDP for EOL
> > c22012  MX25L2005(A)  SZ_256K =  2Mb    EOL             MX25L2006E
> > c22532  MX25U2033E    SZ_256K =  2Mb    EOL
> > c22013  MX25L4005A    SZ_512K =  4Mb    EOL
> > c22533  MX25U4035     SZ_512K =  4Mb    EOL
> > c22534  MX25U8035     SZ_1M   =  8Mb    EOL
> > c22016  MX25L3205D    SZ_4M   =  32Mb   EOL             MX25L3233F
> > c29e16  MX25L3255E    SZ_4M   =  32Mb   EOL
> > c22017  MX25L6405D    SZ_8M   =  64Mb   EOL
> > c22018  MX25L12805D   SZ_16M  =  128Mb  EOL             MX25L12833F
> > c22538  MX25U12835F   SZ_16M  =  128Mb  EOL
> > c2253a  MX66U51235F   SZ_64M  =  512Mb  EOL             MX25U51245G
> > c22010  MX25L512E     SZ_64K  =  512Kb  NO_REC          Have-SFDP!
> > c22015  MX25L1606E    SZ_2M   =  16Mb   NO_REC          Have-SFDP!
> > c22536  MX25U3235F    SZ_4M   =  32Mb   NO_REC          Have-SFDP!
> > c22816  MX25R3235F    SZ_4M   =  32Mb   NO_REC          Have-SFDP!
> > c22537  MX25U6435F    SZ_8M   =  64Mb   NO_REC          Have-SFDP!
> > c22019  MX25L25635E   SZ_32M  =  256Mb  NO_REC          Have-SFDP!
> > c22539  MX25U25635F   SZ_32M  =  256Mb  NO_REC          Have-SFDP!
> > c2201a  MX66L51235F   SZ_64M  =  512Mb  NO_REC          Have-SFDP!
> > c2261b  MX66L1G55G    SZ_128M =  1Gb    NO_REC          Spec. is not public
> > c22314  MX25V8035F    SZ_1M   =  8Mb    PROD            Have-SFDP!
> > c22815  MX25R1635F    SZ_2M   =  16Mb   PROD            Have-SFDP!
> > c2201b  MX66L1G45G    SZ_128M =  1Gb    PROD            Have-SFDP!
> > c2253c  MX66U2G45G    SZ_256M =  2Gb    PROD            Have-SFDP!
> > c2253a  MX25U51245G   SZ_64M  =  512Mb  PROD            Have-SFDP!
> >
> > EOL     End of Life
> > PROD    Normal Production
> > NO_REC  Not recommend for new design
> >
> >
>
> not sure what you want me to do with these.

That we can read SFDP for all chips from Macronix.
Only old chips before 2010 do not have SFDP.

Erez

>
> Cheers,
> ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

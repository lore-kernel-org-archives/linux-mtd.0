Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34115C3065C
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jul 2024 23:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qaDqB0xG1f0u5BXHu6+Mk6l/kmsp/Iv7YWhFqq8kxhI=; b=N/PwtegG4o9M78
	NXzzrm0x4sV4GL+dnPe0G0urWEdlgpoyu+xDgQj0fQJ2AaSxiDg4vSdH9CF5m95SrzKFXeSV629r/
	A0/nhw/pK45KD/a4Y+/UxPq9ckMZqIytdCl3+GphFQL7Tf5hFDubHl2OezHe4aqC3DE0g8/Pz/Tm8
	XrUMyK+4GwKB2cIVOCYFa12feFThMAjmW2bGgnBpaI9iecE2GI18hiCVE0RyFg7IP64+HMJyRfKjo
	psyxlsLXuEYZm4rvd8GMu3PNJH2PR7f4V2HEoZFs268aThQ676f3Dnzb2Qs+EemRdVm/UvqL3K1Le
	Q1w0Nyb4hDTOmCKUoJWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOmkP-00000008HcH-392x;
	Tue, 02 Jul 2024 23:17:17 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOmkN-00000008Hbo-13hJ
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jul 2024 23:17:16 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-52cdfb69724so5854625e87.1
        for <linux-mtd@lists.infradead.org>; Tue, 02 Jul 2024 16:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719962232; x=1720567032; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E+WDS3Cw1/CilyNtoq0dIMkfkf+u6o8YFkOYBScGZNQ=;
        b=InIXEzrjDJmX6Yt+SxI3NcIqjtQdfSgbqGQZRd/VM8kECsltHBGMJFDo9rWBO1N0j5
         Y4hs2BdeqBI0Nhn84+MPgJAMCfWzsqITE2+s4LdEhgH/+/itrV8RmJAur0zUSDGWG3fd
         7RdKm8MKs9T2RNbQMNvokcsMCjeIkrSk2zz+DGCm7kPqeWVx8Dyn5u0L5Lb/hnO0P8NO
         nzp+Zm7OHwNjRC0KmoaLwsHcL7u3sZ2gQYnFoR97YjiYvI2McxoGocjGJuatZTwzvCqX
         0fhyLdh/D6kVm8RC3Gs3qiZPu+tB/RwE3MnOSnIhvSs5JbdNyOw794SDfzj7DVSxEH9u
         C6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719962232; x=1720567032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+WDS3Cw1/CilyNtoq0dIMkfkf+u6o8YFkOYBScGZNQ=;
        b=A2P25fTw1hQu8gvjsmAkWUuumrP2qBvFMk7VGwgue/9k2vcDK4q065NKPWiTcLZI1t
         ft8tGC+P2I7INN+yzFKJ97H0MTIYEU3EZxmld8fSNlWTVc/ox0Rhp9GJHiyMcywiBRJY
         5558O73ng73OILTCZKy4sun8W0rLKq7B6I4c5Ak/K5zfSkzVZv1swV3/HEnx8tt4ip2y
         2a3wnCci8S/RnbbLY2n7cudq0kn1aDWwiIxT0BKVIXXlQaJYOAyLMBz7dcEcSuk2/uCy
         eZG2GDrnPp2RvhimObwQla7aEcxcD7Nv6RGqa8d4N1wKR0TaiTLAnBuiAGfVT6XnkPdi
         Dx2g==
X-Forwarded-Encrypted: i=1; AJvYcCWw6lKjuyQTunffybzEgmZlGvqVCjc2u1pnnfxfDE8qJqukDQlUnC7pnp0VeIsLdo1Pda+sISQC0ntNo5smWx01ElG844Uodq2wPsvuUQ==
X-Gm-Message-State: AOJu0YwbjaG+g7OAqchzaoQ0MUyhuXTc23CDCmeZScrqjQgvZVukFv1R
	3L2AFJU9CPsTt675yFU3R/Pklcg0DSAQUd9Vewxzvm7MFlswQhAZ+f5UMWnXK5YWoZrqyGooiSV
	aosYpUzwTwqH+OYST+CJiObG88Q==
X-Google-Smtp-Source: AGHT+IGUrAle9P4qHxoMCji91OCZUobXpE4p22u72lr+1KS5uFziGTL4CUHfyGcnvZ5HbXIna8Gf4ZY4TB2Nr/Umdww=
X-Received: by 2002:a05:6512:3194:b0:52e:717c:d8d2 with SMTP id
 2adb3069b0e04-52e8273f721mr6424076e87.63.1719962231685; Tue, 02 Jul 2024
 16:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240629103914.161530-1-erezgeva@nwtime.org> <20240629103914.161530-4-erezgeva@nwtime.org>
 <1c457520-07b7-4bde-b040-e8bca959a4f5@linaro.org> <CANeKEMOODBNZA6efh0E0Ga_KaVs5Y3WLcUftRhNwYHhnXO=GNw@mail.gmail.com>
 <CANeKEMO42rJt5Ob4_HDcZ3eEMvuMOPvRaFaLwL8SA65NtxSV7A@mail.gmail.com>
 <1d56c3b2-7adf-45b9-a509-956340f3f17b@linaro.org> <CANeKEMMe-Onpn7xWQHgWz1Ps_uQPEMa7HrKA00HpoKjG+DCJNQ@mail.gmail.com>
 <3bafcbea-6aa5-43ca-9d12-3916be3fe03d@linaro.org>
In-Reply-To: <3bafcbea-6aa5-43ca-9d12-3916be3fe03d@linaro.org>
From: Erez <erezgeva2@gmail.com>
Date: Wed, 3 Jul 2024 01:16:34 +0200
Message-ID: <CANeKEMM02-Jvb8Pd0fZJFnRg-hsAW+hckYWm11tZZXNMPSPJ=w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: mtd: macronix,mx25l12833f: add
 SPI-NOR chip
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Esben Haabendal <esben@geanix.com>, Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_161715_316429_BFED0186 
X-CRM114-Status: GOOD (  29.34  )
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

On Tue, 2 Jul 2024 at 07:00, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
>
>
> On 7/1/24 6:08 PM, Erez wrote:
> > On Mon, 1 Jul 2024 at 12:15, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> >>
> >>
> >>
> >> On 7/1/24 10:46 AM, Erez wrote:
> >>> When using mx25l12805d, we do not read SFDP.
> >>> As it uses the no-SFDP flags.
> >>> When using mx25l12833f hardware with mx25l12805d driver, it did not
> >>> try to read the SFDP.
> >>> Yet mx25l12833f does have SFDP, when I remove the no-SFDP flags, the
> >>> driver fetch the SFDP.
> >>>
> >>> Secondly SFDP does not contain OTP information.
> >>>
> >>> mx25l12805d has two OTP regions of 128 KiB and 384 KiB (yes asymmetric).
> >>> While mx25l12833f has two OTP regions of 512 KiB.
> >>>
> >>> How do we handle it?
> >>
> >> You would first try to parse SFDP and initialize the flash based on
> >> SFDP. If there's no SFDP then you fallback to the flags declared at
> >> flash declaration. Esben had a try recently, see [1]. I don't know if
> >> there's any progress in that direction.
> >>
> >> Also, you haven't mentioned anything about the testing. Do you have the
> >> flash?
> >>
> >> [1]
> >> https://lore.kernel.org/linux-mtd/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com/
> >
> > Looking at "mtd: spi-nor: macronix: workaround for device id re-use"
> > I guess it can be applied to all Macronix devices.
>
> No, no, we're going to do it individually just where it's needed.
> Issuing unsupported commands is not that great.

Would be nice if we could ask Macronix directly.

Looking on their web site and reading some spec. and status reports.
Using the IDs with  'no_sfdp_flags' in drivers/mtd/spi-nor/macronix.c
I did not search for new chips reusing IDs of chips at end of life.
But we found 3 already:
MX25U51245G appears in the table with the same ID as MX66U51235F.
Esben Haabendal found MX25L3233F which reuses  MX25L3205D ID.
And I found MX25L12833F reuses MX25L12805D ID.
Chips that are not in end of life do support SFDP, at least the new
versions of the chips according to their spec.
It seems quite systematic.

By the way, the chip MX25L2005A part number is 'MX25L2005' without the 'A'.

We can support Macronix chips that are not in the table, just by
reading the SFDP.
In that case we can name them like "mx-szNN".

The table below uses fixed width characters.

ID      Part.         Size              Status          SFDP status
according to spec.
                                                        New chip with
SFDP for EOL
c22012  MX25L2005(A)  SZ_256K =  2Mb    EOL             MX25L2006E
c22532  MX25U2033E    SZ_256K =  2Mb    EOL
c22013  MX25L4005A    SZ_512K =  4Mb    EOL
c22533  MX25U4035     SZ_512K =  4Mb    EOL
c22534  MX25U8035     SZ_1M   =  8Mb    EOL
c22016  MX25L3205D    SZ_4M   =  32Mb   EOL             MX25L3233F
c29e16  MX25L3255E    SZ_4M   =  32Mb   EOL
c22017  MX25L6405D    SZ_8M   =  64Mb   EOL
c22018  MX25L12805D   SZ_16M  =  128Mb  EOL             MX25L12833F
c22538  MX25U12835F   SZ_16M  =  128Mb  EOL
c2253a  MX66U51235F   SZ_64M  =  512Mb  EOL             MX25U51245G
c22010  MX25L512E     SZ_64K  =  512Kb  NO_REC          Have-SFDP!
c22015  MX25L1606E    SZ_2M   =  16Mb   NO_REC          Have-SFDP!
c22536  MX25U3235F    SZ_4M   =  32Mb   NO_REC          Have-SFDP!
c22816  MX25R3235F    SZ_4M   =  32Mb   NO_REC          Have-SFDP!
c22537  MX25U6435F    SZ_8M   =  64Mb   NO_REC          Have-SFDP!
c22019  MX25L25635E   SZ_32M  =  256Mb  NO_REC          Have-SFDP!
c22539  MX25U25635F   SZ_32M  =  256Mb  NO_REC          Have-SFDP!
c2201a  MX66L51235F   SZ_64M  =  512Mb  NO_REC          Have-SFDP!
c2261b  MX66L1G55G    SZ_128M =  1Gb    NO_REC          Spec. is not public
c22314  MX25V8035F    SZ_1M   =  8Mb    PROD            Have-SFDP!
c22815  MX25R1635F    SZ_2M   =  16Mb   PROD            Have-SFDP!
c2201b  MX66L1G45G    SZ_128M =  1Gb    PROD            Have-SFDP!
c2253c  MX66U2G45G    SZ_256M =  2Gb    PROD            Have-SFDP!
c2253a  MX25U51245G   SZ_64M  =  512Mb  PROD            Have-SFDP!

EOL     End of Life
PROD    Normal Production
NO_REC  Not recommend for new design


Erez





>
> > Adding something like the following in macronix_nor_default_init():
> >
> > if (info>no_sfdp_flags)
> >     info>no_sfdp_flags |= SPI_NOR_TRY_SFDP
> >
> > It seems Macronix did many reuse of IDs.
> > I saw it with "mx25l12833f" reusing "mx25l12805d".
> > And Esben saw it with MX25L3233F reusing "MX25L3205D".
> >
> > The only thing I notice is the flash using the same size.
> > A sort of "backward" compatible.
> >
> > Erez

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

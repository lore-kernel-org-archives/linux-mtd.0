Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB9AC3DA4B
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 18:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cs62PgvVQzIvmib0rku4A9kIMX4nvQtC8BPZUkKvr2k=; b=myLHztEWwffLNW
	iTbkRX+LxZoG9N28xCKnAe4wiIrT3uWIDLWs1o1ANqPZBS6jXAtlLorXGwyYudGb5Eafrl3sU0zMk
	LXCZ5tB8+RChYLiliSqzzyFX5om0qPFeJxgC/dC8PnrlNPhH+bc8E+0acchPGorKQj0md8ZGcdg+g
	i1cQoPZZoGs1fHNSMD673wheK+OrbqCrvUCuVA6HJp3b9NuSL9SgeCUrF9SFNZQoN4NiOcNGkSBQt
	kAtbh5UCVsY42jLgPQ0HFqXJa3uUkg+fhUqbygfX9MvgjPMITsmFEo8YeZ93zPki1zlhZOYFrN7FX
	KrC144O/DPiEqtND4zdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRz03-0000000F7ro-1NnA;
	Thu, 11 Jul 2024 18:58:39 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRz00-0000000F7qt-272K
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jul 2024 18:58:37 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-58ba3e38028so1707620a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2024 11:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720724314; x=1721329114; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7BPXidIi57y7av2TEkb5R0zgpsgd6KdF8/DSPaJwaQ8=;
        b=eyZvvbWWIxDQb2bQEbbeE8twXRC6MgfFbNcIhFPbryIdA8lJ0x2iW2xCcEMuYYPuF/
         1aIlDPRPqYWv00XOL4kXGhVsqQRMFlvxDC9c4gdQxcpzN5d9eVhtv0sujGkVPuohLMJy
         yjX1C/lntOoETbtJBOaS4UasSUZ360ZBljK5+HN7V8wIGw0JrfFsKd//X+230+eyr80B
         m6rYUzwpzL8RRNRA4WtgS+EZ2nKy9biZVIngIkPo2IrXNMY/66+w2+Zvv3onvg5CanCW
         tDup7NVOiG2iCE5kGkyEwXUwUbZsGseYiHPzZuZdDDwU5ZGLFUQ2DLWsnhlZrY6b2BYN
         8+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720724314; x=1721329114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BPXidIi57y7av2TEkb5R0zgpsgd6KdF8/DSPaJwaQ8=;
        b=PSlAt79TxH5p/PeXawxpl1il8ktzH0Wn0Z5nPyye016t+fSEOgg/m6AA64uWm6fSlC
         eIKihG4FJyKZMgPyonzXr1SRcSU22ubYF5Q4b/Ftw3b1AQWkRF2NZVgFyuENp4qY7kZg
         JtqJjE6Yk5rPQJURSrAXx5iyrS8aFI667u1SdF8zm0XdIx7RoE/vSvLkzYvg5XwBN4Gf
         XwNKxX6Ut/ohh2jZvEjzsEO48oFJKBVmictVfiPtNJmiD28EjF5TCEXWRhi9/LsI7y17
         JOeM8CChqOgl4KBYoLz0N+zKHZW0Epp1E/LXZn+RiE3MjnxgnVsnMqC0RekUDMKwiC89
         HnQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVREaLx6kr0oKTBSiqqiWaiq1i6s93W8G/ufUGcU4ksBq1Mt5Nenx5dW1IttBjznHHb2zfoDUyKdm+a97wraooYMqUkPyjF12TfHCiy0A==
X-Gm-Message-State: AOJu0YxUvIretx1ZAcgh6hFird9oeT7yeeKN/0nyocohn1a5PKAZXn7e
	B1Sc5Z06iyTep5Vb+Vz+nGyhUZPfqWBF2h2ozjnjpgf84I5zTosez72+xdJBsUz5U/yBMy/F7GH
	HLjQD7FYIPpMSSWjq3uPHZhHwtQ==
X-Google-Smtp-Source: AGHT+IHUue7KlCkosbibWLlrwqSbPA31mFvvX7MrL47CNXsBcvVqQiOnEkanbSXVw3FeHULhCh5GuIhNrpSRu3Msg64=
X-Received: by 2002:a05:6402:34d5:b0:57c:a49f:ddd4 with SMTP id
 4fb4d7f45d1cf-594b9ee10d4mr6979931a12.17.1720724313998; Thu, 11 Jul 2024
 11:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240629103914.161530-1-erezgeva@nwtime.org> <20240629103914.161530-4-erezgeva@nwtime.org>
 <1c457520-07b7-4bde-b040-e8bca959a4f5@linaro.org> <CANeKEMOODBNZA6efh0E0Ga_KaVs5Y3WLcUftRhNwYHhnXO=GNw@mail.gmail.com>
 <CANeKEMO42rJt5Ob4_HDcZ3eEMvuMOPvRaFaLwL8SA65NtxSV7A@mail.gmail.com>
 <1d56c3b2-7adf-45b9-a509-956340f3f17b@linaro.org> <CANeKEMMe-Onpn7xWQHgWz1Ps_uQPEMa7HrKA00HpoKjG+DCJNQ@mail.gmail.com>
 <3bafcbea-6aa5-43ca-9d12-3916be3fe03d@linaro.org> <CANeKEMM02-Jvb8Pd0fZJFnRg-hsAW+hckYWm11tZZXNMPSPJ=w@mail.gmail.com>
 <9b45cc73-2251-4085-af95-7ccd00dd6d3b@linaro.org> <CANeKEMP+mRefYZNb+TuBmOD7dC6=7Rg7D1EcfnjJoiaeaV28SQ@mail.gmail.com>
 <875xtd48ps.fsf@geanix.com>
In-Reply-To: <875xtd48ps.fsf@geanix.com>
From: Erez <erezgeva2@gmail.com>
Date: Thu, 11 Jul 2024 20:57:57 +0200
Message-ID: <CANeKEMNJ3_ET5pQo2wg7_GSLX+vE+dqW-CV=v2DnG10xcgSdzQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: mtd: macronix,mx25l12833f: add
 SPI-NOR chip
To: Esben Haabendal <esben@geanix.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Jaime Liao <jaimeliao@mxic.com.tw>, leoyu@mxic.com.tw, 
	Alvin Zhou <alvinzhou@mxic.com.tw>, Julien Su <juliensu@mxic.com.tw>, 
	Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_115836_566702_C214CD77 
X-CRM114-Status: GOOD (  17.40  )
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

Yes, I think we should.

Reading the specification provided publicly by Macronix.
For all the JEDEC IDs with the no SFDP flag in drivers/mtd/spi-nor/macronix.c
All of them have a new version or a new chip with the same JEDEC ID
that supports SFDP.
There are 2 chips that Macronix does not provide spec. in public.
I can ask Macronix technical support on these 2 chips.

Erez

"RDID"    "Part."         "Size"              "Status"          "SFDP
status according to spec. or new chip replacing with same RDID and
SFDP supported according to spec."
c22012  MX25L2005(A)  SZ_256K =  2Mb    EOL             MX25L2006E
c22013  MX25L4005A    SZ_512K =  4Mb    EOL             MX25L4006E
c22533  MX25U4035     SZ_512K =  4Mb    EOL             MX25U4033E
c22534  MX25U8035     SZ_1M   =  8Mb    EOL             MX25U8033E
c22016  MX25L3205D    SZ_4M   =  32Mb   EOL             MX25L3233F
c22017  MX25L6405D    SZ_8M   =  64Mb   EOL             MX25L6406E / MX25L6433F
c22018  MX25L12805D   SZ_16M  =  128Mb  EOL             MX25L12833F
c22538  MX25U12835F   SZ_16M  =  128Mb  EOL             MX25U12832F
c2253a  MX66U51235F   SZ_64M  =  512Mb  EOL             MX25U51245G
c22532  MX25U2033E    SZ_256K =  2Mb    EOL             Have-SFDP!
c22010  MX25L512E     SZ_64K  =  512Kb  NO_REC          Have-SFDP!
c22015  MX25L1606E    SZ_2M   =  16Mb   NO_REC          Have-SFDP!
c22536  MX25U3235F    SZ_4M   =  32Mb   NO_REC          Have-SFDP!
c22816  MX25R3235F    SZ_4M   =  32Mb   NO_REC          Have-SFDP!
c22537  MX25U6435F    SZ_8M   =  64Mb   NO_REC          Have-SFDP!
c22019  MX25L25635E   SZ_32M  =  256Mb  NO_REC          Have-SFDP!
c22539  MX25U25635F   SZ_32M  =  256Mb  NO_REC          Have-SFDP!
c2201a  MX66L51235F   SZ_64M  =  512Mb  NO_REC          Have-SFDP!
c2253a  MX25U51245G   SZ_64M  =  512Mb  PROD            Have-SFDP!
c22314  MX25V8035F    SZ_1M   =  8Mb    PROD            Have-SFDP!
c22815  MX25R1635F    SZ_2M   =  16Mb   PROD            Have-SFDP!
c2201b  MX66L1G45G    SZ_128M =  1Gb    PROD            Have-SFDP!
c2253c  MX66U2G45G    SZ_256M =  2Gb    PROD            Have-SFDP!
c2261b  MX66L1G55G    SZ_128M =  1Gb    NO_REC          Spec. is not public
c29e16  MX25L3255E    SZ_4M   =  32Mb   PROD            Spec. is not public

EOL     End of Life
PROD    Production
NO_REC  Not recommend


On Wed, 10 Jul 2024 at 16:34, Esben Haabendal <esben@geanix.com> wrote:
>
> Erez <erezgeva2@gmail.com> writes:
>
> > On Wed, 3 Jul 2024 at 09:12, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> >> On 7/3/24 12:16 AM, Erez wrote:
> >>> On Tue, 2 Jul 2024 at 07:00, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> >>>
> >>> The table below uses fixed width characters.
> >>>
> >>> ID      Part.         Size              Status          SFDP status
> >>> according to spec.
> >>>                                                         New chip with
> >>> SFDP for EOL
> >>> c22012  MX25L2005(A)  SZ_256K =  2Mb    EOL             MX25L2006E
> >>> c22532  MX25U2033E    SZ_256K =  2Mb    EOL
> >>> c22013  MX25L4005A    SZ_512K =  4Mb    EOL
> >>> c22533  MX25U4035     SZ_512K =  4Mb    EOL
> >>> c22534  MX25U8035     SZ_1M   =  8Mb    EOL
> >>> c22016  MX25L3205D    SZ_4M   =  32Mb   EOL             MX25L3233F
> >>> c29e16  MX25L3255E    SZ_4M   =  32Mb   EOL
> >>> c22017  MX25L6405D    SZ_8M   =  64Mb   EOL
> >>> c22018  MX25L12805D   SZ_16M  =  128Mb  EOL             MX25L12833F
> >>> c22538  MX25U12835F   SZ_16M  =  128Mb  EOL
> >>> c2253a  MX66U51235F   SZ_64M  =  512Mb  EOL             MX25U51245G
> >>> c22010  MX25L512E     SZ_64K  =  512Kb  NO_REC          Have-SFDP!
> >>> c22015  MX25L1606E    SZ_2M   =  16Mb   NO_REC          Have-SFDP!
> >>> c22536  MX25U3235F    SZ_4M   =  32Mb   NO_REC          Have-SFDP!
> >>> c22816  MX25R3235F    SZ_4M   =  32Mb   NO_REC          Have-SFDP!
> >>> c22537  MX25U6435F    SZ_8M   =  64Mb   NO_REC          Have-SFDP!
> >>> c22019  MX25L25635E   SZ_32M  =  256Mb  NO_REC          Have-SFDP!
> >>> c22539  MX25U25635F   SZ_32M  =  256Mb  NO_REC          Have-SFDP!
> >>> c2201a  MX66L51235F   SZ_64M  =  512Mb  NO_REC          Have-SFDP!
> >>> c2261b  MX66L1G55G    SZ_128M =  1Gb    NO_REC          Spec. is not public
> >>> c22314  MX25V8035F    SZ_1M   =  8Mb    PROD            Have-SFDP!
> >>> c22815  MX25R1635F    SZ_2M   =  16Mb   PROD            Have-SFDP!
> >>> c2201b  MX66L1G45G    SZ_128M =  1Gb    PROD            Have-SFDP!
> >>> c2253c  MX66U2G45G    SZ_256M =  2Gb    PROD            Have-SFDP!
> >>> c2253a  MX25U51245G   SZ_64M  =  512Mb  PROD            Have-SFDP!
> >>>
> >>> EOL     End of Life
> >>> PROD    Normal Production
> >>> NO_REC  Not recommend for new design
> >>>
> >>>
> >>
> >> not sure what you want me to do with these.
> >
> > That we can read SFDP for all chips from Macronix.
> > Only old chips before 2010 do not have SFDP.
>
> So, should we try and identify new chips (with SFDP) that re-use the ID of all the
> above mentioned EOL chips that does not have SFDP?
>
> As I read the communication from Macronix, then we should expect new
> chips re-using the ID for all of them. It is just a matter of digging.
>
> /Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

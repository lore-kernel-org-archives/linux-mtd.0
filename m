Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46B2C2BD09
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/Xi/VBYm4TDf6IVB6FXIfugt5hP9+so04dkXh5QsoY=; b=VfPZzsH2FeSM81
	YzfVYdEsezFGp9IoZOTqktARwveqshRSM0TUDAkaNxjS+bgNPaflLIpx7K3xPDJifJDLgVjKOPBMm
	ouETJskpOsaDDsD4rt6pwnOMKl7ZNcbVx0sC0SXvbHTKxH153eR4vEmYtKgA7+N2/YQRJifFgnBMr
	PyG/NHLzpnN/pCuxBiV5/BpUrX+EVDaaDrvdeJA/cb5JAkALpOx9bW6t+RVjx9Il8ya+E2cCn/qPG
	ox0Ew3KoH9QvLUpmMPrU1TaWe5qcXs4u4msEDtM3vVQCl8QiwyUHs7SEMQpEaG1vxst12wxZEx3W+
	JyFzdy7NpOuiLNAKOgOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOJeg-000000043vX-0z9p;
	Mon, 01 Jul 2024 16:13:26 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOJed-000000043uE-30Nc
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 16:13:25 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-57cc1c00ba6so711215a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 01 Jul 2024 09:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719850401; x=1720455201; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tJORc4y41njo2myTxYBaIZoGdagWJX2FVE52D6Y2Z1U=;
        b=SXsNBJNZevfEc0mKjnkbwRZPWYYwZeoIim+qzeJh5VfBP2TpcUCbUgREc0bR65sNh4
         W/s9PyaIn83NmGJ3FPPt3oqLnwEnuFjaRhmEFASbUTuFX0C0hurBHPIDdv85Z+z6TFkG
         93UpwjhnUHo9VLlKMpJKSrGCyzXaPdFozEvRJn59ixXUz9rBk5P9r6WhM4KT6tcT0V+Q
         16TLQBZ8IG/CT0iilIOr0WN13zOUg7nRwS5m253CZnVVm+BypblFCBxYOBVpvwETJmzB
         zNUPmQTIexNZRuPTPUTNZWUrsOhcgugidAgslpycI6mgCimLu+olK67ZOIbWmwZUcroM
         AUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719850401; x=1720455201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJORc4y41njo2myTxYBaIZoGdagWJX2FVE52D6Y2Z1U=;
        b=T1o95I4Q+te28t1W5R6yniL4D/j6FBEpRaYVUuvZs0cT6Jcaiue4FmbOMlwd86I/OF
         MvJDikq46dvgsAgyIApBWQamNmmPmNADiKHiizkNaTK/bcPJTxsV+XCpCH6vIpyjCwmk
         Hjm60LA6oyAPjsDjqfgoroP8W2jodfBin22y5+BbUpW2YoAgJPQt0iS6kXrtk0KIkeJQ
         MqBwMpG6y3mPmEUBCJoVUAryqpOFH7AvTD8MWKwXXL4RgYpcnem3M+GgUF03eDD9hIpt
         0nDzsYmXISgwEBHHAg6VUHrcvXAQQPVB43fUR3bwBWjBUvcAWXSjGbE891m6SPUz8hgz
         lImw==
X-Forwarded-Encrypted: i=1; AJvYcCVT+0uah+tPBk7ZlE79/KXkb0P1UVtvsaZNlGOk0djIRw0Pbs0V2ekbtGEGDlzGIALuwzBy2Qy0i2BVEBhp4lrR1LH4tZAtRe8WQNWCVA==
X-Gm-Message-State: AOJu0Yx3OsLN4uFB9hb/AbnmQ0j5z2snJ8OLA+jeYOoHFEpJ3YmspTIk
	ypUawjom4WpJnCQ8lEAdC4AQx1vGwuDRBVpafjuZE8VlJglu/qsV1vcy9DlEkt2FmLZZAXtKDM3
	NooHbYIKLocQSAsqB4GHjlLD81g==
X-Google-Smtp-Source: AGHT+IGhN32U3cLFjDcl/ZaK+BN5oNiVFeatcJG7osJjACBaeXKS643lckiY3fxmVC9Kln5Tlpu49ktmbd8AO6QKvjs=
X-Received: by 2002:a17:906:a091:b0:a6f:49eb:31a5 with SMTP id
 a640c23a62f3a-a75144b67a4mr312328166b.77.1719850400469; Mon, 01 Jul 2024
 09:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240629103914.161530-1-erezgeva@nwtime.org> <20240629103914.161530-4-erezgeva@nwtime.org>
 <1c457520-07b7-4bde-b040-e8bca959a4f5@linaro.org> <CANeKEMOODBNZA6efh0E0Ga_KaVs5Y3WLcUftRhNwYHhnXO=GNw@mail.gmail.com>
 <CANeKEMO42rJt5Ob4_HDcZ3eEMvuMOPvRaFaLwL8SA65NtxSV7A@mail.gmail.com>
 <1d56c3b2-7adf-45b9-a509-956340f3f17b@linaro.org> <04f5162d-8a95-45ce-a891-3f711b27a469@linaro.org>
 <CANeKEMPAng8K1Gbab-MXP0KodS=r1Bzstsvg4zadWdu1O7wqWg@mail.gmail.com> <be8daf89-14a9-41ad-9403-8e550e5ae284@linaro.org>
In-Reply-To: <be8daf89-14a9-41ad-9403-8e550e5ae284@linaro.org>
From: Erez <erezgeva2@gmail.com>
Date: Mon, 1 Jul 2024 18:12:42 +0200
Message-ID: <CANeKEMMA5L4pu7Vyyv0wU7VcEYK6q2Tk8p4BKPe5E5qXdHzWZQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: mtd: macronix,mx25l12833f: add
 SPI-NOR chip
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Esben Haabendal <esben@geanix.com>, Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_091323_781665_D27D01C2 
X-CRM114-Status: GOOD (  37.73  )
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

On Mon, 1 Jul 2024 at 14:53, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
>
>
> On 7/1/24 12:03 PM, Erez wrote:
> > On Mon, 1 Jul 2024 at 12:23, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> >>
> >>
> >>
> >> On 7/1/24 11:15 AM, Tudor Ambarus wrote:
> >>>
> >>>
> >>> On 7/1/24 10:46 AM, Erez wrote:
> >>>> When using mx25l12805d, we do not read SFDP.
> >>>> As it uses the no-SFDP flags.
> >>>> When using mx25l12833f hardware with mx25l12805d driver, it did not
> >>>> try to read the SFDP.
> >>>> Yet mx25l12833f does have SFDP, when I remove the no-SFDP flags, the
> >>>> driver fetch the SFDP.
> >>>>
> >>>> Secondly SFDP does not contain OTP information.
> >>>>
> >>>> mx25l12805d has two OTP regions of 128 KiB and 384 KiB (yes asymmetric).
> >>>> While mx25l12833f has two OTP regions of 512 KiB.
> >>>>
> >>>> How do we handle it?
> >>>
> >>> You would first try to parse SFDP and initialize the flash based on
> >>> SFDP. If there's no SFDP then you fallback to the flags declared at
> >>> flash declaration. Esben had a try recently, see [1]. I don't know if
> >>> there's any progress in that direction.
> >>>
> >>
> >> And you can then decide which OTP org to use based on whether SFDP is
> >> present or not.
> >
> > That can work, but sound like a hack.
>
> It's not a hack, we're just doing our best to dynamically identify the
> flash.

Call it whatever you want.

>
> > Is that really that important to hack?
>
> we push really hard against new compatibles. Users shouldn't care about
> what SPI NOR flash is there.

I am in. I do not like compatibility.
I do not like to see them in the device tree.
I did not create the mess.
It seems like Macronix likes to reuse JEDEC IDs.
As most new chips have SPDF, the mess is with OTP mainly.
We can think about a different model.
Perhaps allow the user to define the OTP size and number of regions
using a 'flash_otp_set' tool?
I am open to ideas.

>
> > Just for OTP, that very few use?
> > And if in the future Macronix adds a newer one with the same JEDEC ID,
> > but a different OTP size?
>
> we'll compare SFDP data and choose based on the differences. This is not
> encouraged. Instead ask for unique IDs or choose other flash.

That requires additional callback in the SFDP, not a big challenge.
Yet most SFDP tables are not sufficient to determine OTP.
Found only one table with OTP support flag.
No size, offset  and number of regions to work with.
The only hint is do we have SFDP or not.

>
> > Macronix does not consult with the Linux Kernel on these matters.
> >
>
> I'm complaining about unique flash IDs for years now. Hopefully vendors
> have learnt their lesson. I didn't see new flash designs reusing old IDs.

I can not speak in Macronix's name.
I know they did that, not sure if they stop.

>
> > Anyhow as I do not have the hardware anymore, I can not do more
> > changes and test them.
> >
>
> Be aware that we're not queuing patches without some minimal tests. If
> you don't have the hardware, contact mchp and see if they care,
> otherwise we're wasting our time. Here are the minimum testing requirements:
> https://docs.kernel.org/driver-api/mtd/spi-nor.html#minimum-testing-requirements
> For OTP we'll also need some OTP tests.

OTP as its name can be written once.
So a simple OTP test would be nice.

Anyhow I ordered 3 Macronix's MX25L3233F that have OTP.
The OTP works the same as the other Macronix chips.
The MX25L3233F ID is 0xc22016 same as "mx25l3205d".
Seems Macronix are persistent on reusing IDs.
First revision of MX25L3233F was in 2015,

I will connect to my old BeagleBone-black.
I think I can perform the test with it.

As I say, I am more interested in testing the code.
Less on which Macronix chip we use.

Thanks for your time
 Erez

>
> Cheers,
> ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

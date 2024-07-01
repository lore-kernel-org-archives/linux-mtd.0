Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52E1C30653
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 09:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y28+QAIlFu5UYQPkd7n4lP36Mfw1XoJmlYCM5sC/3Lc=; b=HyTsXuywBYh4/1
	KD8wghe6lJbCTKlm/zKp0FDW86yovMWDg/fo21WvpwOJOwO1sIAmnjnZD+Mp56ThLi/uQJVHuO0rL
	eIr7oGc45Fxb8nTsEV9UZhxKja9kmZrzpNriaPkNUkmFWC205M/nPqWWocTQdCCcGHqxjMyWedLGA
	Uu+DKdbFe1a30mHB8wg1uYzC+NNsEnyDa9yUPErHDKlXgtrsArB6pqQBqaF+HsBjdQXtxRhCjiFRw
	a6HamD21Jw7OKEX9zVgP9kmEfrSe0gnYiLTNoJy29qRBz8JaKOOlXtzwn/cjZXQ/Cz1GQ1z4Ftl96
	0JIwyUaKLF9Y5Ud6Y4Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sODch-00000002Ujg-2mt2;
	Mon, 01 Jul 2024 09:46:59 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sODcf-00000002Uj7-0tsl
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 09:46:58 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a725a918edaso394734766b.3
        for <linux-mtd@lists.infradead.org>; Mon, 01 Jul 2024 02:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719827215; x=1720432015; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QJ8hznQdBSpW/pK4jDinmZ2F4dwUUNDMvQFJh/2PnF8=;
        b=jBtz1WVFcx+b7M8hnhwDpAbpPbMC0/xtu2pWQ/mdHRfuPl9n9N1+PCQyhgkxINNWfL
         c1szBEXKdEaTIVmLgUISfg6NqWiKL3iIwv2iv1ySu3UYhybUSnbO4J1qV7r66awCwylD
         iHu3CWQutgC2xaANDkjQ/UhGV1B1vB5x8lJl3z45EXlvXPLZnYDPK+nmD3pBYSEJPaop
         FFTIpsJUOns6NS6fKUQ+fkLzHP6EaFGBytxYGNkbtPPBimu0cBx7Ch2RFP3aBx91zTqA
         oe/vX0iA5gZE1V3wt7+680leS3qwhZRApMkk75DXHSDuPFTwTfamxIKg2F8Q2VrfVBfR
         qRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719827215; x=1720432015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJ8hznQdBSpW/pK4jDinmZ2F4dwUUNDMvQFJh/2PnF8=;
        b=j37pSsBnx6FcYV/5w3mJVWHSsDUdN1nCsfKVj2fsqj7LELUxjs0lHgJBr2h3OkQKOe
         Qve6yxOVf1MYQRfgnnfdTqheEzqJ9YqCvKZ9z8hy4oHptBHsbMqGGfsXK1r5qd4brvK2
         z6EJtsErl1kFrhXurpsjPZXgHUrTfohDtNR2eW571JqOyitZcnQMvhYel3ZCo1ui4oxK
         z1N9AaM6VMZNlcApIyoUF85hD0N9W3o1ugDfnTmAvrdTyKPNnAzqMrsDiCT6OaAjNtva
         zhp9saYI94H7FZr4Dl2Q/WLqWIufJYTOG1mmuACpTui7M8WlH7gBDOQZrCr74Wk3zRg1
         I0uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUBji3o0PFE7HcGJQJpXfpKyqfkur4R1rU0bACqTu4T2ZhBjccr6jKTBEtW3dwVuToE0gDGr5DTJzZ6WbdhoS+yHfF1Uhym8BO8V7U+g==
X-Gm-Message-State: AOJu0Yz8IMzkcUbSsLVaAtr1m4lhuNoeXDVWWdgPi5uQzlxijUvEEQMO
	KlNaOjaEuIkvn1kunss8e7xkvhh1iTbLQgjtPs5dE+Cz6cVr42wh9OkX1XsK1q2Dftczl5fZ5Xz
	i+Wi5tJAktqJnq83kItTp+Bu7Kw==
X-Google-Smtp-Source: AGHT+IHDggheRf09W9QEoK9AQzFlLZt2A//Iiql249o+YW7xCeGM2QIwLllRZevmRIDL1Bw4ZPjbtWr2EPs32Qz1SSA=
X-Received: by 2002:a17:907:7207:b0:a72:7ffc:f54a with SMTP id
 a640c23a62f3a-a7514467505mr469201466b.5.1719827215242; Mon, 01 Jul 2024
 02:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240629103914.161530-1-erezgeva@nwtime.org> <20240629103914.161530-4-erezgeva@nwtime.org>
 <1c457520-07b7-4bde-b040-e8bca959a4f5@linaro.org> <CANeKEMOODBNZA6efh0E0Ga_KaVs5Y3WLcUftRhNwYHhnXO=GNw@mail.gmail.com>
In-Reply-To: <CANeKEMOODBNZA6efh0E0Ga_KaVs5Y3WLcUftRhNwYHhnXO=GNw@mail.gmail.com>
From: Erez <erezgeva2@gmail.com>
Date: Mon, 1 Jul 2024 11:46:18 +0200
Message-ID: <CANeKEMO42rJt5Ob4_HDcZ3eEMvuMOPvRaFaLwL8SA65NtxSV7A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: mtd: macronix,mx25l12833f: add
 SPI-NOR chip
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_024657_276701_8E7C5345 
X-CRM114-Status: GOOD (  19.22  )
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

Sorry, I resend the same mail, as I send it again as HTML.

How?

When using mx25l12805d, we do not read SFDP.
As it uses the no-SFDP flags.
When using mx25l12833f hardware with mx25l12805d driver, it did not
try to read the SFDP.
Yet mx25l12833f does have SFDP, when I remove the no-SFDP flags, the
driver fetch the SFDP.

Secondly SFDP does not contain OTP information.

mx25l12805d has two OTP regions of 128 KiB and 384 KiB (yes asymmetric).
While mx25l12833f has two OTP regions of 512 KiB.

How do we handle it?
I would gladly remove the obsolete mx25l12805d.
And skp compatibles all together.

Thanks
    Erez Geva




On Mon, 1 Jul 2024 at 11:40, Erez <erezgeva2@gmail.com> wrote:
>
> How?
>
> When using mx25l12805d, we do not read SFDP.
> As it uses the no-SFDP flags.
> When using mx25l12833f hardware with mx25l12805d driver, it did not try to read the SFDP.
> Yet mx25l12833f does have SFDP, when I remove the no-SFDP flags, the driver fetch the SFDP.
>
> Secondly SFDP does not contain OTP information.
>
> mx25l12805d has two OTP regions of 128 KiB and 384 KiB (yes asymmetric).
> While mx25l12833f has two OTP regions of 512 KiB.
>
> How do we handle it?
> I would gladly remove the obsolete mx25l12805d.
> And skp compatibles all together.
>
> Thanks
>     Erez Geva
>
>
>
>
>
> On Mon, 1 Jul 2024 at 07:23, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> Hi,
>>
>> On 6/29/24 11:39 AM, Erez Geva wrote:
>> > From: Erez Geva <ErezGeva2@gmail.com>
>> >
>> > Add Macronix SPI-NOR mx25l12833f.
>> >
>> > mx25l12833f uses the same JEDEC ID as mx25l12805d.
>> >
>> > Although mx25l12833f is a new chip that support read ID and SFDP,
>> >  users might want to specify it in the device tree,
>> >  to differ it from the old mx25l12805d chip.
>>
>> As Michael said in a reply in v1, we try really hard to don't introduce
>> new compatibles and instead rely on the generic "jedec,spi-nor". In your
>> case you can differentiate between the two flavors of flashes based on
>> the SFDP presence. We won't apply this.
>>
>> Cheers,
>> ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

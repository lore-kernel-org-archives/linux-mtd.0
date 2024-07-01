Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14F8C2BD09
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 17:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6wnkXJEyObPrhRM1hX/i6j549hLvMVfT07kyDTG2Rho=; b=ZOUr9I2gogT7Ua
	oqhyvOr2DftZUWKZMSjq2YioTk6G9qwGdxO6oPG12BVwAFaIXP1yEWQ7Rfp8oiIQDMKdxcvx2ZS+k
	Ro9CD0dHR1nI3oxiIlxqqnqRElsQYJ42nXJhLQjN4GVH96dnZdksAfSHD4XsEy4oTOCbHV8v1uAOz
	nvnL7PYpFy0YD5Gjqa19BWSykcQp8ln0yHA76apPoQC+pZNPW2ZiuDUOsqxIlqUKZCL1DwdgxNu/y
	ICOuB6xifmGRFvWhNbHKPxnPaPD8cakrI5mCgeBauS981smKaScIZv5MSgXj5mvehkBinblu2kYHL
	dCFC8ELRJW7rv8k4oL3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOKX7-00000004G33-32t7;
	Mon, 01 Jul 2024 17:09:41 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOKX3-00000004G2c-3QQj
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 17:09:39 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-52cdcd26d61so3592787e87.2
        for <linux-mtd@lists.infradead.org>; Mon, 01 Jul 2024 10:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719853776; x=1720458576; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x2AvaZ/UqlvKRYfAtV7P9vybf13O6HOVkfDtPt1cvUk=;
        b=Gm2++vB1zaY4Ejv2RCKeUJcsn0lavLT2wKo+hMqJwsPnXCkoiDklwfwqprKxKB+9bh
         Ago9Xy3/H/Tr6mPCsitg6LUR58kv4HjXUq2T7EUZbFve9WaIvguTbxVh5S3aEh5mDItj
         QxMLIy7zc1NiYorseMRlA73UYBVhpCmuNMQMnE4mx56abWpyfqkJ26hlg5G8usX9AzTE
         bFNHEGQ954ag7AQGa8j9yX2zW1NYD4oOg7fgCOtlhheWZ8JtoNEoyrrguTqzxW2+uXdG
         7iqTPmT72Hetb6M35y+SH5K6Wz65E48tkws/uaha+RVZqY3ffiK6s3b3GAihMyJSkZNn
         rUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719853776; x=1720458576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2AvaZ/UqlvKRYfAtV7P9vybf13O6HOVkfDtPt1cvUk=;
        b=GUKJcJhOXed3YmOAXpIY6Raj4RwI7wJnHnDFWOfnnqI8jP0ez2Gb/ixy+uFz5WGlRh
         X6mGY4cMgsSQLW0kjkQ8gU4fAxIMO5luWcFNtF0lobBGMTl9GcFH4qXC92ZtOw3SrNZY
         yV0JPbfgeDcpEKXJeDq+mMw9/cQg3dsyeAIYBJvNIZ7yDPs7V2FfxXy2qOsK5Dk8KkPK
         EGEz5JsqnphVRmMEzz3lE6Vkf8irlFuLjifcF9JEGjlgbqaoYFs3f41lGiu7pv+v9sB8
         QJjqgdrTa760lc7FbSuzkICXq961SSyrbFVFWRTB8JNFHXxf4cr+H+yt+RkQJqLdPyzO
         2C9A==
X-Forwarded-Encrypted: i=1; AJvYcCWLl4Twa4r+V4EE9H2K0gfeVPy4asaHrQ4T8sQEbONoknM0xR8MgqGqWh/xbkKSA9eFaBi8sGmKdwiiK8TVB3z3zEcGly3/vdYla92tQw==
X-Gm-Message-State: AOJu0YxlkqpRZDKVpcX9D4KkAdLpDFRIqfxkXSMnIQgGby1ZL0IRwe9R
	AEn8zo2MX5EtWeetWDCqPplC6avbOc0mmbeAKjgxaDa5MMENihBngyeuKqWGiQw59XXpsmrC+w6
	tIBLqaZBwaukOZMtpgMv0P6GlrA==
X-Google-Smtp-Source: AGHT+IGYYNCj47g6ucYfUx88jylfxwmzthcbBunBR6FSqs2Zy9xB27gXOmjZv5e2f+ERX7Yl2NsAnugoE22lg1LI1Pg=
X-Received: by 2002:a05:6512:3b12:b0:52c:e17c:3753 with SMTP id
 2adb3069b0e04-52e82647353mr4096272e87.5.1719853775769; Mon, 01 Jul 2024
 10:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240629103914.161530-1-erezgeva@nwtime.org> <20240629103914.161530-4-erezgeva@nwtime.org>
 <1c457520-07b7-4bde-b040-e8bca959a4f5@linaro.org> <CANeKEMOODBNZA6efh0E0Ga_KaVs5Y3WLcUftRhNwYHhnXO=GNw@mail.gmail.com>
 <CANeKEMO42rJt5Ob4_HDcZ3eEMvuMOPvRaFaLwL8SA65NtxSV7A@mail.gmail.com> <1d56c3b2-7adf-45b9-a509-956340f3f17b@linaro.org>
In-Reply-To: <1d56c3b2-7adf-45b9-a509-956340f3f17b@linaro.org>
From: Erez <erezgeva2@gmail.com>
Date: Mon, 1 Jul 2024 19:08:57 +0200
Message-ID: <CANeKEMMe-Onpn7xWQHgWz1Ps_uQPEMa7HrKA00HpoKjG+DCJNQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: mtd: macronix,mx25l12833f: add
 SPI-NOR chip
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Esben Haabendal <esben@geanix.com>, Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_100937_877087_D6AD96AD 
X-CRM114-Status: GOOD (  21.08  )
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

On Mon, 1 Jul 2024 at 12:15, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
>
>
> On 7/1/24 10:46 AM, Erez wrote:
> > When using mx25l12805d, we do not read SFDP.
> > As it uses the no-SFDP flags.
> > When using mx25l12833f hardware with mx25l12805d driver, it did not
> > try to read the SFDP.
> > Yet mx25l12833f does have SFDP, when I remove the no-SFDP flags, the
> > driver fetch the SFDP.
> >
> > Secondly SFDP does not contain OTP information.
> >
> > mx25l12805d has two OTP regions of 128 KiB and 384 KiB (yes asymmetric).
> > While mx25l12833f has two OTP regions of 512 KiB.
> >
> > How do we handle it?
>
> You would first try to parse SFDP and initialize the flash based on
> SFDP. If there's no SFDP then you fallback to the flags declared at
> flash declaration. Esben had a try recently, see [1]. I don't know if
> there's any progress in that direction.
>
> Also, you haven't mentioned anything about the testing. Do you have the
> flash?
>
> [1]
> https://lore.kernel.org/linux-mtd/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com/

Looking at "mtd: spi-nor: macronix: workaround for device id re-use"
I guess it can be applied to all Macronix devices.
Adding something like the following in macronix_nor_default_init():

if (info>no_sfdp_flags)
    info>no_sfdp_flags |= SPI_NOR_TRY_SFDP

It seems Macronix did many reuse of IDs.
I saw it with "mx25l12833f" reusing "mx25l12805d".
And Esben saw it with MX25L3233F reusing "MX25L3205D".

The only thing I notice is the flash using the same size.
A sort of "backward" compatible.

Erez

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

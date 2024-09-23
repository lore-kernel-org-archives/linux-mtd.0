Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA8BCF9C6F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 10:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKy6IUazqVEMTpNiIGbTwaDCixIYsuH23DTK1XykacI=; b=nWhxexvSrNfwA9
	6eAYG37nQV4ES9M/26U+jGADWtl8QzcVA9tDfN8oFnMpJRlRrSjhn3ZoDuvTIx6NrFg3Kdeg0OtNJ
	6OqioOJOBqvTlmtu2UUCqkPpD1ZIygaC0hY+GB93EDyqJesMdtiq/DYq6/5Ym5s7nsALSeu++K0fs
	YMJP44WYpt4QDpaI+hYjskofDJ4q68ztOcafyFVKHFZmuerzTJEGLMfq6YMhv1xLQ1JuB7HR3Qq3U
	k658eLUpb/CS96meiAvJTV2Id5LrvoBe3HKuhXsyjlUTdN2KH6c3HwwS0h6dh+mAj+6UnNmy8JBW9
	UmJ9YtzLhvj324prPvpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssgMi-0000000Gymz-40Wh;
	Mon, 23 Sep 2024 10:32:24 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssgMf-0000000GymL-3tVs
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 10:32:23 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a8a789c4fc5so2075166b.0
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 03:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727087540; x=1727692340; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t7WybMhTFjyQNe3MuiaKvgD14pvzxhatRQ1+PvPY2Qk=;
        b=EoQjgMC+TkkeV2C22cHv1K+Dg5r97W8hC5bVgRZjWNwHlyM8z7jUbOHPk0sATd1oCG
         MDQY+sS8/n1vRY5x07rskOtASfmWRBE3o6K9GYa2A3dOni7jbyVAhmzZeHs4gntdLbdl
         UUQ89Xsiyo+GIOlr8zByfwwNB7lxHVl9utpXCDJcGCVf6JTersinM7FcMQUL0Ckhl19x
         NBvf4JHzD52RCidlyMHkaqfseTphRcZGWBGpbAS2IYF+LXMgj3MG83RIe/6bHIbTUAxr
         3WpZ8hadY2WvmOu63oRyq7T1InuklWrmdIlNvnCaAMSZ6c9l+rhNpcajbXWmXr0kQHOS
         nrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727087540; x=1727692340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7WybMhTFjyQNe3MuiaKvgD14pvzxhatRQ1+PvPY2Qk=;
        b=I5ueZA23DjQGdb35tmcxH3zOgKZE7SZxdBVtFLFSQ0LieQazKZia4jQFNpwxwMK4d4
         gihdXBc10zcuBZCgp6xM/L8d8c58rX06Avefra7hgZVyb22YAAiYIrqsTdTb2QMHgQiR
         ty+HBr/aRxUCHvwk/PKNPv3VHlZsy3TQ8MDC09Fbg284KsXB5oJnwkviOGiocAAho7JL
         GV67ZWIFSp0EI/eoT90ABh/DGGP5aJEvwkbmYXf0/urNSLm9+bPNbu/KAJf4yyNGMoLX
         OvpA57UzaSfUg2XqEt7VAguLUxamKdmvtEnTGVipzkTnb3NHfxeraksaB3aXfgpO8awG
         R3Iw==
X-Forwarded-Encrypted: i=1; AJvYcCX+fyNMDrHcXY5OCBv2v+5tBwZHGGDgwY4OH5Bknf/y1ZGFWbgtRwDSjsWBaRT/5BPthiOwQ/l51kQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyETkS2vXQE7K22MZgkGDXU3pqYVdStvRhaJEBL8gwyb2z/GqdK
	iw64xcMcfdlt8dVeWRr8ph5uhhRC/xnAhy0GkWhqYXJ1nazjUz7enHJuG3VBLis02Tc6zrob/FM
	mHukR91Rb4G2nAG84w9m2EoCBMA==
X-Google-Smtp-Source: AGHT+IHeqaggM+UXfU/T/6f5PbCqBXtnxIWll8SaceKEzyUrkfKVLbRY45ZmR2+j9VeHTNJR6u24o1KKU9NZSFh29b8=
X-Received: by 2002:a17:907:3daa:b0:a86:6a9a:d719 with SMTP id
 a640c23a62f3a-a90d364310fmr1068934966b.29.1727087539905; Mon, 23 Sep 2024
 03:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240920181231.20542-1-erezgeva@nwtime.org> <20240920181231.20542-2-erezgeva@nwtime.org>
 <4e0cf43c-4843-451c-ac6f-86775dbccb2b@linaro.org>
In-Reply-To: <4e0cf43c-4843-451c-ac6f-86775dbccb2b@linaro.org>
From: Erez <erezgeva2@gmail.com>
Date: Mon, 23 Sep 2024 12:31:42 +0200
Message-ID: <CANeKEMOmhAPM1j1_ihzcC2wL6jKsWXPCGfZs+euS8mRvtqgE5A@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] mtd: spi-nor: core: add manufacturer flags
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_033222_012259_AE0B23BC 
X-CRM114-Status: GOOD (  28.28  )
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

On Mon, 23 Sept 2024 at 08:04, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Hi,
>
> On 9/20/24 7:12 PM, Erez Geva wrote:
> > From: Erez Geva <ErezGeva2@gmail.com>
> >
> > Add flag for always trying reading SFDP:
> > Some vendors reuse all JEDEC IDs on manufacture table
> >  with new chips that support SFDP.
> >
> > Add flag for reading OTP parameters from device tree.
> > Some vendors reuse JEDEC IDs
> >  with several chips with different OTP parameters.
> > Alternatively we read parameters from SFDP.
> > But the OTP parameters are absent from the SFDP.
>
> Do you have some specific flashes that you try to identify? Why can't
> they be differentiated at runtime?

You can not figure OTP parameters based on  JEDEC ID and SFDP existence.
I did send a few examples.

One of them:
"How?

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
And skp compatibles all together."


>
> > So there is not other way but to add the OTP parameters in the device tree.
> >
>
> If there isn't any way to distinguish the flashes at runtime (which I
> doubt/challenge btw), then as a last resort we introduce a dedicated
> compatible for the flash in cause and specify all needed parameters in a
> dedicated flash entry. This shall be more generic as further flash
> parameters can be statically specified in the dedicated flash entry,
> less invasive for dt, and less confusing for people when they decide
> whether to use OTP or not. OTP params in device tree is a no-go.
>
> But again, you have to prove why you can't distinguish the flash at
> runtime before introducing a new flash compatible. So don't go this path
> before sharing with us what you're trying to achieve.

You keep sending me contradictory messages.

I told you we can not "guess" OTP settings based on JEDEC ID and SFDP existence.
It may be partial and Macronix may add new chips in the future.
They reuse JEDEC ID only retaining flash size and blocks.
This is why compatibilities work with new Macronix chips . Although by
reading the SFDP, we can use higher speeds.
We can use SFDP parameters to read  flash size, blocks and speed.
But it does not contain any OTP parameters.
I found only one Macronix chip with an enterprise SFDP table with a
boolean flag for OTP, this does not help us much.
Macronix technical support was explicit on OTP settings. You can not
deduce them. You must know what chip you use.
As far as I can see, Macronix does not reuse module names (god thanks for that).

I do not mind using flash compatible.
Just clarify that point.
And I will send the patches accordingly.

Thanks
Erez

>
> Cheers,
> ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

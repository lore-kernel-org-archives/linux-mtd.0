Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1329CF9C72
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 13:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zH/NRG+iNPAN3PMI4twWn9BnYWqHv25NxuY0d0EZtFs=; b=ZSV2BYRizq9KNN
	i1gcrSly5mBFRdS2UgOyHt2GYZcAtA27uDS/lDIu1Px3KJhUmcHojkBGzZuqmKXuYgRy4iTRVWurP
	L3U9uPbamU+BHcYNENQmn0cr55f0pIGULWAv/cxGZPUdIl6Daui4w/1fkOT/hzFEZEtChkrq9qGw+
	o7iF2TWsLWjOSJpUREK1fyy72XS9DR7iGPweHE53YRiRy9iUpElN5sdKvjkS4xxDiMx0cxIV9/+2t
	IRiA+hKJnDr8MJEnVn58uZsv+XP20UuvkuZ2Jdi9enbjbWNdIDBPRIqBn0fSSN6FulXb8+g7twLSG
	8oO5hzpR2l39CpovzZ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssj5S-0000000HGsI-2IgB;
	Mon, 23 Sep 2024 13:26:46 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssj4q-0000000HGne-2esO
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 13:26:10 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5c245c62362so5238651a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 06:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727097967; x=1727702767; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yf4/nRvCuEzmaiaVcScrGIX1Fqwwbl2EfrCWoGhAWx8=;
        b=SCuV919/bLJTrsMAWlVgaMVSnDwWpZQhCGzc0dfQvlCROEGCNaMv52wsOhp2inUhKP
         hlRaH7GN9K3wXVVHVbvPvYQpK5tdHha9BPIrI2ADokapQ5bF+f+XZ93UfJQY4z1JS+A1
         Jzd+82eEHpB8kOOLvCwzrOA3f0TGsWgwT6hBJmw7bTsLQ49PdsDspHCC8I0IemelNmBC
         b1dKoO7rRDE49gWXCCvV+enVjvdP+f+Rzj5ma4xsFD7l1+wK10cypsbg0K6I7N3IC89K
         AWzDdEviy0JcKdqyngv66NoaJ5FY6E2lU5ArBzbibhaWhN+qNzftMcrnfQ5KKW+Fp/Sh
         RQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097967; x=1727702767;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yf4/nRvCuEzmaiaVcScrGIX1Fqwwbl2EfrCWoGhAWx8=;
        b=aK2BrDaL0UAZfTNO8kgLGwSsTcORpQP5I72Tr3UU4zxcLBxoI2pL3/kWjJCtG2UaSr
         elV10u5s3puzmcszZpGyVc2bjX1kQSrVqm0XUcoANZoejlhAuptall6umRInwempaScW
         C57n3Z7fH8WREFWbbToE/Iyg7Js3pDrAc9HOzbtHvF2rIYqYF/udwiH/ioj68XfePa5j
         xlR+8xDoV+na0IBOP3yIATerVQKpx4JId1bSTt4BjBzf1PweyYFvay2q9SvgnBj7TxJ4
         dfB9WpLKuimkovU8GtSsIW2zqhixmsfYOLnY4wgLYhdH2/pGXNvXmkLjVW9KMVLY66iV
         q/1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpGIyZPR57qWO5V8T1+CgYNubJAtyAzXuj7Oq24yEqZFInmD9EFzNWNKyvt0lulDutVTw/fDSICAw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0R+++aNcR1PNK9sUvOXY3cmdkcqiBQZIVrPcUg9G/Me+/L732
	LeMXL8Pb6SNfcQa3P/wPBgSYvjgnB/mqYFD7j1RlCmVsWZVY5KTSIdEpRYG4DLkY69KVKTsaBcP
	4J25+TeqzSyYXhcqh1jl9p8Zl1g==
X-Google-Smtp-Source: AGHT+IFX6LAbjPZNPZbNmSp+ctjB+4B1CfWLMYqjFYMdeclx8ePL73CjwOMiK5uMOzSTV+LApwjbnwaYTbCyXr4+vi8=
X-Received: by 2002:a17:907:9443:b0:a8a:7062:23ef with SMTP id
 a640c23a62f3a-a90d561ffd8mr1198840866b.32.1727097966528; Mon, 23 Sep 2024
 06:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240920181231.20542-1-erezgeva@nwtime.org> <20240920181231.20542-2-erezgeva@nwtime.org>
 <4e0cf43c-4843-451c-ac6f-86775dbccb2b@linaro.org> <CANeKEMOmhAPM1j1_ihzcC2wL6jKsWXPCGfZs+euS8mRvtqgE5A@mail.gmail.com>
 <D4DLQGLJSKPB.3OOW4RU9Q3K5O@kernel.org>
In-Reply-To: <D4DLQGLJSKPB.3OOW4RU9Q3K5O@kernel.org>
From: Erez <erezgeva2@gmail.com>
Date: Mon, 23 Sep 2024 15:25:29 +0200
Message-ID: <CANeKEMPSoUu7GW5bL8nuyC5xCKG7Tt0=SvWTL_CcX5oebqN_YA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] mtd: spi-nor: core: add manufacturer flags
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Erez Geva <erezgeva@nwtime.org>, 
	linux-mtd@lists.infradead.org, Pratyush Yadav <pratyush@kernel.org>, 
	linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_062608_696757_9EE31E63 
X-CRM114-Status: GOOD (  35.83  )
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

On Mon, 23 Sept 2024 at 12:46, Michael Walle <mwalle@kernel.org> wrote:
>
> Hi,
>
> > I would gladly remove the obsolete mx25l12805d.
>
> Why? I don't see any need for that.

Maybe because we do not want compatibility table?

>
> > > If there isn't any way to distinguish the flashes at runtime (which I
> > > doubt/challenge btw), then as a last resort we introduce a dedicated
> > > compatible for the flash in cause and specify all needed parameters in a
> > > dedicated flash entry. This shall be more generic as further flash
> > > parameters can be statically specified in the dedicated flash entry,
> > > less invasive for dt, and less confusing for people when they decide
> > > whether to use OTP or not. OTP params in device tree is a no-go.
> > >
> > > But again, you have to prove why you can't distinguish the flash at
> > > runtime before introducing a new flash compatible. So don't go this path
> > > before sharing with us what you're trying to achieve.
> >
> > You keep sending me contradictory messages.
> >
> > I told you we can not "guess" OTP settings based on JEDEC ID and
> > SFDP existence.
>
> What are you trying to achieve here? I've told you we are trying
> hard to figure out everything out at runtime. I'd suggest you start
> with one particular device where you want OTP support for. If the
> flash id is already in our database, find a way to distinguish
> between the old and the new one; probably by looking at some SFDP
> parameters. No need for any new compatibility. Don't try to solve the
> problem for all the chips out there.

I start with "Add support for SPI-NOR Macronix OTP".
With one flash chip and move to another one chip.
I never suggested adding multiple.

Yet, after some research I find that all Macronix chips in the last 15
years have SFDP.
So I added a second patch to always read the SFDP of Macronix chips.
Perhaps I should send it separately,as it seems to confuse you.

And no, I do not try to support all chips, just to remove the
restriction that if
Macronix reuses an old chip JEDEC ID, we skip the SFDP of the new
chip, because we have the old chip in the compatibility table,
although there are two distinct chips. They use different model names.
There is no reason to differentiate chips in that way, at least not
with Macronix chips.

>
> Again, the reason why we are trying hard to determine that at
> runtime is that these flashes are usually second source devices and
> a manufacturer might just replace it with a (more or less)
> compatible one. Therefore, the less information we put into the
> devicetree the better. So before you are sending a new version with
> the flash compatibles, you actually have to convince us that there
> is no other way of knowing what kind of flash there is on your
> board except for providing the name by the firmware.

No, reading the SFDP is great.
Except for OTP parameters/configuration.
As there is not way to find OTP parameters using JEDEC ID/SFDP
So as I understand there are only 2 ways to set the OTP parameters:
* Use a compatibility.
* Use dynamic OTP configuration, through DT, sysfs,

Erez


>
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

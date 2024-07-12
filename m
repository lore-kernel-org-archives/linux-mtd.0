Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78E0C2BD09
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jul 2024 05:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W7+wObiCBOnwHCu5CqlOu6zhRWT3tUqnaU+WLGbkrdg=; b=F/StZAxWq3w7hm
	fHkPuMuAxuAGDiOjRKeBwyC/+ZE/D67lLsHtu5XlqeiaDl9i4t10B2eq9HPYGNSHOfcFqy9jHppiF
	neK30eVRHgCcOG0Y7zOCF0CnhrDdK6wrMJ5U+QvoxOmXQCe9QwTgWpfoAO1xHRq2n0k8YBo+WH+pD
	D9mr+TeMLsiS92aVqO2aODePyQG+Q7Aqlh0WACEMeGAGqfK1v0/fihphtlMULXcXGa5vuiPjWKA1M
	/svqxL6Kv3HqI371F6Ndzcs49vsCcqcob7UWYOghJ2X59IMDNbJ0VBYBY/d6z8fDtPhWHzHi65r1e
	abI1cUg+qe7Pf/RQhPPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS8bq-0000000GU3S-3MBH;
	Fri, 12 Jul 2024 05:14:18 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS8bn-0000000GU2q-3duc
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jul 2024 05:14:17 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2eebc76119aso18151231fa.2
        for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2024 22:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720761254; x=1721366054; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NMFC30txfsq92Dfx6kq9iMPwL95nsCp8lXcX7M2w2v0=;
        b=ayOaJD731yLyCG4ZOCVKdj0a3mDXQeS3YoQZLk/Dv+1mJh4C3HCsP+qH1PYdvPi4kb
         U1OR2g2kmQCriE3D0qBAkmM2CJr+5kCP3UpIignn3v0A1INcgqheuTB8estsNA80TgA5
         RWMslLd2H0gfyqlYkE92vdQj/kcdWT3kAiFu2FezWzlbRivSs/KLRgMtUVXxXTe0yKOH
         HW+OK+Ecr5tydIHgOe3he2QBOJ4k98uens3rPZkfxxP4j/1kxjBd+PzKha9mViGDpn0d
         xfsP3Ve0pLflqlNlKdwPaJWySibX8hAl30fHd4cVPvyTzTvdrSBIsQhJpYuoWMPdzO8L
         ne/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720761254; x=1721366054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMFC30txfsq92Dfx6kq9iMPwL95nsCp8lXcX7M2w2v0=;
        b=m5FHOn86W/Kocf1v3NO9bkJPewd+SF9I/MH5dNGGpkjbvQWr9rwHIsqmzUGqaVKR8s
         VXOj3yEdJOFvH5HxYXU+I9IpsV432q1FbCm0RtGuRUY0uVG3Ac/wMNa+sgws6UtB0zBq
         go3HlDpEHrVmywFUzUjvfH9ThdW2C6KtPnaSHXOCNE8HOh7blSueqwTvjrVEaSnBpDXF
         1JXZP2XyDrwq5mKMEtYnzcqCvWaNWRVr3z7Ea+BPzBLfjx8kRihskZPEOc0tS/WzJedh
         EdVd4FdkaCHH4IbQbHM7/eW0B3Q4s+tZGrj1N5tE7fshlhTwODTePE2WDvTo4DK/cnrx
         fOXw==
X-Forwarded-Encrypted: i=1; AJvYcCW3hsz/Ric+9Fv7yUBpg+DC4lcx16WIfCCDYuAFyPV3IsN0VTcPnhDwMsWn0AhelmUb0i0tGRAQeyvqo4kOyqszcAi+7EPOo6zud5PrIg==
X-Gm-Message-State: AOJu0YxT5LTBmO0OcqbAZmoYGmHp7n0waDv1WqR63bt6BH63Mf3OJ44A
	yh1ZgRyOnJgFLU4Itgy0+PMV/qQzb9DtCX6fCUsIQ642qi+8IvwsAYr4L7di6An+g/0/3E25/Ag
	HmHUuUtFqn6mxDd33utMnm7G9Cw==
X-Google-Smtp-Source: AGHT+IGBI5iCwBB9eH/bc/39EcbPRi8ExzKrhHUNXI2RWEUigoA0xaqti8YY43MlF/6vgKlgBmBcjzhOS2wl0AeBzHk=
X-Received: by 2002:a2e:990f:0:b0:2ec:5b10:685a with SMTP id
 38308e7fff4ca-2eeb30e5dfamr67980611fa.17.1720761253525; Thu, 11 Jul 2024
 22:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240629103914.161530-1-erezgeva@nwtime.org> <20240629103914.161530-4-erezgeva@nwtime.org>
 <1c457520-07b7-4bde-b040-e8bca959a4f5@linaro.org> <CANeKEMOODBNZA6efh0E0Ga_KaVs5Y3WLcUftRhNwYHhnXO=GNw@mail.gmail.com>
 <CANeKEMO42rJt5Ob4_HDcZ3eEMvuMOPvRaFaLwL8SA65NtxSV7A@mail.gmail.com>
 <1d56c3b2-7adf-45b9-a509-956340f3f17b@linaro.org> <CANeKEMMe-Onpn7xWQHgWz1Ps_uQPEMa7HrKA00HpoKjG+DCJNQ@mail.gmail.com>
 <3bafcbea-6aa5-43ca-9d12-3916be3fe03d@linaro.org> <CANeKEMM02-Jvb8Pd0fZJFnRg-hsAW+hckYWm11tZZXNMPSPJ=w@mail.gmail.com>
 <9b45cc73-2251-4085-af95-7ccd00dd6d3b@linaro.org> <CANeKEMP+mRefYZNb+TuBmOD7dC6=7Rg7D1EcfnjJoiaeaV28SQ@mail.gmail.com>
 <875xtd48ps.fsf@geanix.com> <CANeKEMNJ3_ET5pQo2wg7_GSLX+vE+dqW-CV=v2DnG10xcgSdzQ@mail.gmail.com>
 <D2MZ405LVTN8.3LTVN3KTUD6A3@kernel.org> <CANeKEMNtXb4ZV7kcLbHY+Mti6dPV9UZ2wTyUq5z0qtmtNNqSVA@mail.gmail.com>
 <D2N20HB4BIC4.O13SZINCMJ9P@kernel.org>
In-Reply-To: <D2N20HB4BIC4.O13SZINCMJ9P@kernel.org>
From: Erez <erezgeva2@gmail.com>
Date: Fri, 12 Jul 2024 07:13:37 +0200
Message-ID: <CANeKEMObi8G4yt=pScLQXxY_owa=sRAV0NRu=oEw-o1Ug344rg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240711_221415_929383_CF39612E 
X-CRM114-Status: GOOD (  15.63  )
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

On Fri, 12 Jul 2024 at 00:13, Michael Walle <mwalle@kernel.org> wrote:
>
> On Fri Jul 12, 2024 at 12:09 AM CEST, Erez wrote:
> > On Thu, 11 Jul 2024 at 21:57, Michael Walle <mwalle@kernel.org> wrote:
> > >
> > > Hi Erez,
> > >
> > > No top posting please, see also
> > > https://subspace.kernel.org/etiquette.html
> >
> > It was a single question. Which I think can be answered in one reply.
> > In cases where there are different parts in the mail, it makes sense
> > to avoid top posting.
> > I do not believe we need to be pedantic.
> > The guidance is not holy, it is aimed to make communication more comprehensive.
> >
> > >
> > > On Thu Jul 11, 2024 at 8:57 PM CEST, Erez wrote:
> > > > Yes, I think we should.
>
> Regarding top posting, what was the question here?
>
> I don't see any context. So don't expect any reply from me.

Fair point.
I'll try better next time and write more comprehen answers.
I do hope my reply on the second part was more informative.

Erez

>
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

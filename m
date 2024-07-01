Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD03C2BD09
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 11:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLQGLdWVfXGHnsKWvHFJa5OTs1J7BhlyKQFP+I65Wzk=; b=zYG/WHptLVpIfu
	cXj330ncMZVnpcz6QMfd+zGmh+GF0X+5NowMtEzOtt7/9k6gBXw7GD+y+LeN2ev2MXa+9rL2lQeND
	ZsayN8Lq+nHrxV1hAyU7GqCTClcfFgc+ooNxKyoBU+RX0wCX85eSndpshEQJa6JuFF9zfCDUDRxb7
	nAXvLZuvlghI0KNOWQv28jJ99negnTXoiA3pf1PDdQ664pnEAcVYhQfW3jLqHIEZuArq0cR2r7rvP
	muXWI6W9HkuEQxt6GybQCRsStG+MvdmJby2503IJQupUKKO0zDnjTElY+osDpbyh7QvdZGbAtZ797
	evvEgAq2jP7yDYjtOacg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOEpV-00000002po7-2JFf;
	Mon, 01 Jul 2024 11:04:17 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOEou-00000002pag-38ki
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 11:03:42 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a751ed17b1eso191421066b.1
        for <linux-mtd@lists.infradead.org>; Mon, 01 Jul 2024 04:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719831819; x=1720436619; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qqZmjCpo5232y3o5lsDCc1JbC2eeUqONBtr6F00VKRk=;
        b=RV0Yb5/ReM2gxpvJ6Z7Kv5v2SU1tSLiZwuhu4iGzxbGtrOzjnB9h6BHJAMusLZceXt
         oxhxvG773GsSlZCmY9qX4fORYPGhTs3ZUXpZOQ5w3FqEM7V6vNtdc9tDVLdol9uhxahX
         M/LdxSJzoLk4ZgtgsoWrk8wkZLXSEGATLDluXiySNVUpCUWsDN2NDRlc2aYkocRamrQI
         7jj/j9nnEmwmECs/Yh6g+nlVSvSBkPNoJn4d9SA7cE5hfm7ckGgN2RzcoxONF/u12qlx
         0rckh4N1qsWh+H0y2jdV+n8J6GQqUuzDO/MSffB7xys6ytALrD/F4e7U/PJkGQe8Yx2D
         kFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831819; x=1720436619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqZmjCpo5232y3o5lsDCc1JbC2eeUqONBtr6F00VKRk=;
        b=fRHEVoav2tfttr+23vC20MBRLWsnlueaYgB+5UHNchXIIT7kTVqfLM+vyYmNipFvFb
         u1D8Z87ReybscDcWf0OAVoAs2yBxpv3AmYURp0tgHtXJo15UIf8XZfTu7LJ9azKZSPhc
         KuQKLiGZ/8/l7cX6C/5P8Z+AW4z3C+R4jXNJuI8nOc6v7JmoepdO0QtQhMp5TQRKj7Op
         h3B6x+RdLG9GtfyvdZJ13j77UKZJe/8aIaV9vYTiZR9zCTbDqYrCilwPt/GEhMH04hcp
         MIbBolFkSYn/bKf6i6Hmb+M1Frspdxt9buv3ytZPhikobpb2L6icFsFq6/tWwej43Fbo
         hGFw==
X-Forwarded-Encrypted: i=1; AJvYcCXgB9SyT0FAfvBdyR86hqChWHiDu4xo8/1fIccl2LCVcHwj8jBtAG0/XFwYz3R/OgBpjawalJAYGeiniwYhF4+HN9ys3rTzaGumZC2iWg==
X-Gm-Message-State: AOJu0YzBc7S+cx76v4finC0vJfvyfOh/YQEVkc1oWnHr+Xx124QjcA2a
	qkLe/PDntnfF8+5VJZAf3dOG8t2plYrXMt8HEoFZuM+DPL1jxkUZfHmcBPOoEEx00P0WGjic6pC
	U4W+bKEAt4PP9WRCwb4Aqt/hR7A==
X-Google-Smtp-Source: AGHT+IHOLmypry9Z0LFXcuZ6zHoIhxdWJqXsqXi74RhD63ls/P3HArXrSTuTghZhvH07hjRgqQc9cqnm0cTt631Q4fs=
X-Received: by 2002:a17:906:154c:b0:a72:7bc0:efed with SMTP id
 a640c23a62f3a-a751388f6dbmr448175066b.13.1719831819095; Mon, 01 Jul 2024
 04:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240629103914.161530-1-erezgeva@nwtime.org> <20240629103914.161530-4-erezgeva@nwtime.org>
 <1c457520-07b7-4bde-b040-e8bca959a4f5@linaro.org> <CANeKEMOODBNZA6efh0E0Ga_KaVs5Y3WLcUftRhNwYHhnXO=GNw@mail.gmail.com>
 <CANeKEMO42rJt5Ob4_HDcZ3eEMvuMOPvRaFaLwL8SA65NtxSV7A@mail.gmail.com>
 <1d56c3b2-7adf-45b9-a509-956340f3f17b@linaro.org> <04f5162d-8a95-45ce-a891-3f711b27a469@linaro.org>
In-Reply-To: <04f5162d-8a95-45ce-a891-3f711b27a469@linaro.org>
From: Erez <erezgeva2@gmail.com>
Date: Mon, 1 Jul 2024 13:03:01 +0200
Message-ID: <CANeKEMPAng8K1Gbab-MXP0KodS=r1Bzstsvg4zadWdu1O7wqWg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: mtd: macronix,mx25l12833f: add
 SPI-NOR chip
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Esben Haabendal <esben@geanix.com>, Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_040341_129845_4592B0FC 
X-CRM114-Status: GOOD (  24.48  )
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

On Mon, 1 Jul 2024 at 12:23, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
>
>
> On 7/1/24 11:15 AM, Tudor Ambarus wrote:
> >
> >
> > On 7/1/24 10:46 AM, Erez wrote:
> >> When using mx25l12805d, we do not read SFDP.
> >> As it uses the no-SFDP flags.
> >> When using mx25l12833f hardware with mx25l12805d driver, it did not
> >> try to read the SFDP.
> >> Yet mx25l12833f does have SFDP, when I remove the no-SFDP flags, the
> >> driver fetch the SFDP.
> >>
> >> Secondly SFDP does not contain OTP information.
> >>
> >> mx25l12805d has two OTP regions of 128 KiB and 384 KiB (yes asymmetric).
> >> While mx25l12833f has two OTP regions of 512 KiB.
> >>
> >> How do we handle it?
> >
> > You would first try to parse SFDP and initialize the flash based on
> > SFDP. If there's no SFDP then you fallback to the flags declared at
> > flash declaration. Esben had a try recently, see [1]. I don't know if
> > there's any progress in that direction.
> >
>
> And you can then decide which OTP org to use based on whether SFDP is
> present or not.

That can work, but sound like a hack.
Is that really that important to hack?
Just for OTP, that very few use?
And if in the future Macronix adds a newer one with the same JEDEC ID,
but a different OTP size?
Macronix does not consult with the Linux Kernel on these matters.

Anyhow as I do not have the hardware anymore, I can not do more
changes and test them.

Erez


>
> > Also, you haven't mentioned anything about the testing. Do you have the
> > flash?
> >
> > [1]
> > https://lore.kernel.org/linux-mtd/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

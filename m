Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3955ECCF9E9
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DCb1hoQiYxShpL8xK0WJcgu+NgS8GqBEmdjyJ0WIbL8=; b=TsJaapQnkVyVeF
	jJyIik9rZHFdKpuU2URXHCcnnnnX7LgUGhjXJ2Hjvh/rTTUASlqM+W9s8dQt62PmoI87G3WTENwTo
	zZuRQhiArugLGgF5FZsdIOlwTEaLX4ULhGP8pmE56CtkL/SIzECzTPucd6LiBKplCQ4tR+PV6qSJ7
	yLzM+FZUl5WSp+lfAgDe3X/4D8TIGbZRvJy1NPt8IRIidGbSv0luNwlFJOVVOL2Mtu5YEiGhN90CT
	iA7RdN2N0IL4iECsFlkPdz9Jq6zFVR5UO7eJZTY9RvzfaWJlVcRIiCilR2rDahPfCy5/a4TmiTGjI
	mjgPsi6Pg3ApRDOgDLMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stmNR-00000008B7X-1LH6;
	Thu, 26 Sep 2024 11:09:41 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stmNN-00000008B6M-39OD
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 11:09:39 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a93b2070e0cso98323066b.3
        for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2024 04:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727348976; x=1727953776; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xdJOq5mfTWCYDUHlESn0SZzeVA7nWwKzf6sY87yK+oY=;
        b=XMSaCXuqr30jXKt+p1sefN0kCewhYJTF8hgKHNXzGZxtSRcKRL9UPHyUdB5E/VrRvU
         RmhbY3hPUJEJGMO+JeGzYddVsrkiNVakHq8mCdjKqXdQ2ompJ8tfv8TKk+aJqwf9WW3/
         RkIG2li3c9Gkb+7F+m3eDyMTgct21ZUiFAPz3LimovWrqF8AlO3+QEB7hZnrl6WsMIuK
         VYWdQdDsORlX8mgs1TyBr1dqF6/x1FjLKHwSARycZG5rg3rVGG2342dKNBxXg+T6kwla
         E14twd0UzyR8c+YJfHoCBCTiMHdSuWrFDGS8QvcTTyEy4wZFdt3FgX8SFVvD2bQoC32y
         nBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727348976; x=1727953776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdJOq5mfTWCYDUHlESn0SZzeVA7nWwKzf6sY87yK+oY=;
        b=PVvzItpa2rEIA3Yj/EFvIkxl74m1Ok16EJ/ECgRlEc4nlA2XK/yNCcH14OyzEj8Bs9
         myLw0wuzueeJ6gDZJ8x51TTjrNbx1czdg0XRhxoQG6T73Q058/zlXDeMHNxhqZNue9q/
         ukP8KCXbIZy+E+9X0lkkwbR8e5jUA5ou36Y9hGGJb5teNuh8mSlzHx1VbENjAUESmefg
         jOzq4GoehYmJLBLHvmUd4MMTuUqYZ4TtA1+s34R9u3g0QXlCRH/0o7xcY45Hg60DzRJ3
         tH/Mrl82hxeMJ6WFksksaNNgHTfXF3oFoJ+L3yHy0YXJOwqAs4WPgK4klSMJqkUKevOk
         1lXg==
X-Forwarded-Encrypted: i=1; AJvYcCWoVda6byGdhu7lB+Nvjdti+AMeFMLC54sXVGAnrgJE6ytIHxF2izRGxEvmUzydugvNIgZfo2Eppgc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzG+p1oXthHIZ7Gz0I7Qm6Cofvzl56Is51Bx9ScwwxVFQ67dyKS
	pp9SiWgxcvyFYdiMYdRYXkrtAA+/e61MlEOTJ4Kj6dLI8WaVbKYW9ltWH3BgNl9UYr4EhR6psaO
	ZlPB/swWONPd2tTYLnMChg7EoDw==
X-Google-Smtp-Source: AGHT+IEnuM6AlAaEVv+IZdO8uASoC+b+/IGZwpjZ6p5SSkChosB3pf+ha0nvbg1erWv7n2OT4aXkiPo6BtfqS02wxNU=
X-Received: by 2002:a17:907:987:b0:a91:15dc:31ab with SMTP id
 a640c23a62f3a-a93a066eceemr488435966b.53.1727348975649; Thu, 26 Sep 2024
 04:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240920181231.20542-1-erezgeva@nwtime.org> <20240920181231.20542-2-erezgeva@nwtime.org>
 <4e0cf43c-4843-451c-ac6f-86775dbccb2b@linaro.org> <CANeKEMOmhAPM1j1_ihzcC2wL6jKsWXPCGfZs+euS8mRvtqgE5A@mail.gmail.com>
 <D4DLQGLJSKPB.3OOW4RU9Q3K5O@kernel.org> <CANeKEMPSoUu7GW5bL8nuyC5xCKG7Tt0=SvWTL_CcX5oebqN_YA@mail.gmail.com>
 <D4DSTDA3HE2B.20ACE70SQAL7A@kernel.org> <CANeKEMO1nyzEKGCt8N8_UCmAcQ3L53=H8U07AdJzcnFaVuwjGQ@mail.gmail.com>
 <87y13ehn6y.fsf@geanix.com>
In-Reply-To: <87y13ehn6y.fsf@geanix.com>
From: Erez <erezgeva2@gmail.com>
Date: Thu, 26 Sep 2024 13:08:59 +0200
Message-ID: <CANeKEMMcZ+Y-f8Kty_4Nk-kRu+F7ZXBbxpAG1Bd_P1vcju1mUA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] mtd: spi-nor: core: add manufacturer flags
To: Esben Haabendal <esben@geanix.com>
Cc: Michael Walle <mwalle@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_040937_813382_120FFEEE 
X-CRM114-Status: GOOD (  20.54  )
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

On Thu, 26 Sept 2024 at 09:46, Esben Haabendal <esben@geanix.com> wrote:
>
> Erez <erezgeva2@gmail.com> writes:
>
> > On Mon, 23 Sept 2024 at 18:19, Michael Walle <mwalle@kernel.org> wrote:
> >>
> >> > > > I would gladly remove the obsolete mx25l12805d.
> >> > > Why? I don't see any need for that.
> >> > Maybe because we do not want compatibility table?
> >>
> >> I don't get this? Anyway, we do not remove support for older
> >> flashes for no reason.
> >
> > I did not insist, you asked.
> > Macronix stopped selling these chips 15 year ago.
> > How long do you want to support old chips?
>
> It is not unusual for embedded products to have a support span of more
> than 20 years. And chips such as these flashes might not be entirely new
> when the product is introduced. So dropping support for SPI-NOR flashes
> that are newer than 25-30 years is definitely a risk. Somebody out there
> might not be able to upgrade to latest kernel versions anymore, which is
> not a position we should put anyone in. With the increasing pressure to
> upgrade product for better security, we definitely should not make it
> more difficult to run newer kernel versions than absolutely necessary.

I do not insist. Nor send any patch in this direction.

Each project can define the extent of backward compatibility.
In terms of compilers, linkers and tools, i.e. build environment.
In terms of standards like the C standard we use.
In terms of network protocols.
And also what Hardware do we support.

There is no harm in asking where the boundaries are.
All projects move their boundaries all the time.
The Linux kernel is no exception.

Erez

>
> /Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

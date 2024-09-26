Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B8ECDE003
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 13:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nxzPe7dpBHiC8QjVsJjn1b/NufnItMhFgpUgPILvR8=; b=whfP7XkD//CBlv
	2mn720MY1P6rI3zw3JsscDbvTSJQNvO7clQTaLxMl8NRPTdKzLaMYt503qQBLesS/2A6vkJiFOyVr
	8d6asNs7003tfrv4WMRiwnCIjOpA7omFh/r2DBDar5Dp2YpmkiMRkbftUVCO6oNuVbx0Cuq12VYc/
	JwpBGnbu5/o1cWgWhkLM2nvkYeYuB/Nbo7k1GslGwOsfhU7whq/U0zI7/Q3kcbaO+6h7ClAu0mbZ1
	1p51kWbdoKINiYlmzeAzcCLCnF3PLbaHfRAV9SljuEIzkfhwDb+4JbxVjizhp2YWgCKhRqUKymNYV
	pyOLflllCCUXqg5GTYcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stoMt-00000008Rhw-1COy;
	Thu, 26 Sep 2024 13:17:15 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stoMq-00000008Rgo-1e9R
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 13:17:13 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a910860e4dcso136592666b.3
        for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2024 06:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727356630; x=1727961430; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cnx4zIAWJtFq9rSTLb7/0r8of7OoZslMoGPoymhstBM=;
        b=HMiSCs4V4v1W0b0r4qg7gLu/2eGRDmf+3ar9uUoZpdhci/01wxYBFVocIOHgodti5h
         VIObhhem3sLQV/bMwnF7pjCLypn8mKzbPVyXmSa4UDgf3f0o5thKVspPGDiqYFe4jUv3
         iuBe9Z7/DBh2M+wZymM7escaD5y1UMno/TKneZ1rR1XkRK2rCjBHTTEfTJkhUKvXS9hO
         pMeEQAurw8jqxtB26hoOthsD6jHxdH3UEaTc45lem7QESvv78AJsKL/jkZciUjWLI8CR
         chF8mT+UwHgjFUzI3oVbKsFPg16QUd4xvF+O/rtbDF7gdwPew7i8MfHCxrElZH5OLyv6
         ZZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727356630; x=1727961430;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnx4zIAWJtFq9rSTLb7/0r8of7OoZslMoGPoymhstBM=;
        b=tQqk2jthCLPrj4UEKoMEXUtd7k2MY2CkDZdIxWWopZxEDKFzPcs1GWBklb1ZMwcFBH
         9C/vsTTjxrYgFkLX+razBlyJIF8ltZdWlHwISlJst1S/TwrTp0y6UrSd5LICvDNiBQOJ
         TcStxsrqKvBu3ZeZVI6sGF4GTOR3tz8Y4rdncUmxvKcW4g9XMj6lG9GG05jiNh8cIFgT
         A/3jQNpQHsHBzlvCMSG83vFMKMiqW9uKFPKHWxQAZLWA4I908d/PMkjWOBIcLSboVGgs
         gTtRKnDPbCRxLYJ9AQYtueGQdOGu90jMKqSYIGokfLJEQGdKhpzdQH4l9tVDN3F9AUpU
         f7FA==
X-Forwarded-Encrypted: i=1; AJvYcCUYe9JazZgjRnR/kUBEYO1aqZ1HelTcimFEkVn6BFz2ErLr4xNs45fzAdEo6Kqg3Z6i0LkzeXy2IgM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrdoUNhLG6wxgr7bLh0cXxjHYNcLJjrvoKKa/40W21HhY0Z9Zm
	VDaxvwH9mevLC8L+73F8p6T2/cXnHU6nzbZ905OssOVI9giCW33JkfT71TBCE5RLdtqa+4uOclz
	1sp10XhsEfcscOCMHgfOHGvhLG1cR1lw=
X-Google-Smtp-Source: AGHT+IGxkuSZn14CGeSLBxg4a20MxMh+vZrJ6S9Uv0v7mFLjFUHwBvjRSVie0JOJ3Q7qB7rPKyG5eEcor9Qu4RuwHOI=
X-Received: by 2002:a17:907:e28c:b0:a86:6cb1:4d49 with SMTP id
 a640c23a62f3a-a93a0322a58mr558075166b.13.1727356630231; Thu, 26 Sep 2024
 06:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240920181231.20542-1-erezgeva@nwtime.org> <20240920181231.20542-2-erezgeva@nwtime.org>
 <4e0cf43c-4843-451c-ac6f-86775dbccb2b@linaro.org> <CANeKEMOmhAPM1j1_ihzcC2wL6jKsWXPCGfZs+euS8mRvtqgE5A@mail.gmail.com>
 <D4DLQGLJSKPB.3OOW4RU9Q3K5O@kernel.org> <CANeKEMPSoUu7GW5bL8nuyC5xCKG7Tt0=SvWTL_CcX5oebqN_YA@mail.gmail.com>
 <D4DSTDA3HE2B.20ACE70SQAL7A@kernel.org> <CANeKEMO1nyzEKGCt8N8_UCmAcQ3L53=H8U07AdJzcnFaVuwjGQ@mail.gmail.com>
 <87y13ehn6y.fsf@geanix.com> <CANeKEMMcZ+Y-f8Kty_4Nk-kRu+F7ZXBbxpAG1Bd_P1vcju1mUA@mail.gmail.com>
 <8734lmhcil.fsf@geanix.com>
In-Reply-To: <8734lmhcil.fsf@geanix.com>
From: Erez <erezgeva2@gmail.com>
Date: Thu, 26 Sep 2024 15:16:31 +0200
Message-ID: <CANeKEMMMYu9ugZksnJscCPROAS2vbi_BXHnJcc-MsDZMwJeTvg@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] mtd: spi-nor: core: add manufacturer flags
To: Esben Haabendal <esben@geanix.com>
Cc: Michael Walle <mwalle@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_061712_453969_B9E93D30 
X-CRM114-Status: GOOD (  26.39  )
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

On Thu, 26 Sept 2024 at 13:37, Esben Haabendal <esben@geanix.com> wrote:
>
> Erez <erezgeva2@gmail.com> writes:
>
> > On Thu, 26 Sept 2024 at 09:46, Esben Haabendal <esben@geanix.com> wrote:
> >>
> >> Erez <erezgeva2@gmail.com> writes:
> >>
> >> > On Mon, 23 Sept 2024 at 18:19, Michael Walle <mwalle@kernel.org> wrote:
> >> >>
> >> >> > > > I would gladly remove the obsolete mx25l12805d.
> >> >> > > Why? I don't see any need for that.
> >> >> > Maybe because we do not want compatibility table?
> >> >>
> >> >> I don't get this? Anyway, we do not remove support for older
> >> >> flashes for no reason.
> >> >
> >> > I did not insist, you asked.
> >> > Macronix stopped selling these chips 15 year ago.
> >> > How long do you want to support old chips?
> >>
> >> It is not unusual for embedded products to have a support span of more
> >> than 20 years. And chips such as these flashes might not be entirely new
> >> when the product is introduced. So dropping support for SPI-NOR flashes
> >> that are newer than 25-30 years is definitely a risk. Somebody out there
> >> might not be able to upgrade to latest kernel versions anymore, which is
> >> not a position we should put anyone in. With the increasing pressure to
> >> upgrade product for better security, we definitely should not make it
> >> more difficult to run newer kernel versions than absolutely necessary.
> >
> > I do not insist. Nor send any patch in this direction.
>
> I did not say or imply that you did any such thing.
>
> You asked an open question, and I gave my response. Nothing more,
> nothing less.

+

>
> > Each project can define the extent of backward compatibility.
> > In terms of compilers, linkers and tools, i.e. build environment.
> > In terms of standards like the C standard we use.
> > In terms of network protocols.
> > And also what Hardware do we support.
> >
> > There is no harm in asking where the boundaries are.
> > All projects move their boundaries all the time.
> > The Linux kernel is no exception.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

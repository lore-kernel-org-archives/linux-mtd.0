Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC67C54E49
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Mar 2024 02:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3SdQkLUI9tcOArIh4oSDWNkXEgSJ4rMe4id5GCoTWAE=; b=Jzzc8iLfsoyDe2
	55f7w3rPNEKHBGNePl7XuyBPf64SZrkH5NGJ+DNUS/x6DZFpi0svfLuZAJyIO5w5zcO7bCvLvnxT6
	6JrOzKUxdA+hgF+2rdKfmTu72Xz0/kRzgTQ9yxfqiqO10AaXbH8nzALFHwlTZI56Fo7bOkOgHV9RY
	7awNnZpjujT1MTt/uDQU9U0R4oLfNFhHT4n7lHD2aQ2COOZE3xmqf2BfHQNLaJMBCGf9qx4GVKG/w
	nt4ftZWQaca6J6XKN9XAFmh+0eosYGS8ZJSyAvs4QW4AIS79ZCGRNct/MuVAtM4hueXxfGtZNS9/I
	pbrOuYAvkfs5SE/1lsMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riQDx-00000007O0Y-3Jaj;
	Fri, 08 Mar 2024 02:44:41 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riQDv-00000007Nzr-05cB
	for linux-mtd@lists.infradead.org;
	Fri, 08 Mar 2024 02:44:40 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-68f41af71ebso14789496d6.1
        for <linux-mtd@lists.infradead.org>; Thu, 07 Mar 2024 18:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709865877; x=1710470677; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JxG3C1fNlHZOl1qKhga4bIFtxN+IbPgWY3WbkNFh0bI=;
        b=YnqxIvAdoS4+CNBPz8bcfY8DX4FVZQcR/6QA416gmBjBDupf/qyvnmVQNHhr2hiAfK
         kzdOsJXP9+IEH8qQV3e2mSQJuj0yjQY8cKBhI9Y5nOVolK5J11Nsks1NSy4Eig8UVp3f
         4ILH/GdPOTp8BbuxDJthtViiZ+otdy/Iu15iM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709865877; x=1710470677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxG3C1fNlHZOl1qKhga4bIFtxN+IbPgWY3WbkNFh0bI=;
        b=Xg4upFcyGlE+PA0MbHoeAHnDh3DEYlNQvHQRNlO0DY67vCA06uBR5DxghYOrhnphyM
         2KP7gMndzhpA0gjYO69BFc6fH2v439vpvrTq0Bo4EL0KciVHOM/uhlYG+hwCb1/gqFeL
         z5Fj4fRhUOddwOok8iDXFyX+ICXF5gyiYhY4rCc8CB0dm7nL0CK6HQDHZRa5ctCjQtKr
         zLRB1hVrTbkfP7gYX+e986E5/8kwQd1iYvNzrJj26mdHRatcgj5wcA0oR7cNsWJoaeBt
         +KLHQfCjmGRkp12iOpuCd/sTlcO9DxWaVBLfBfly39PkSi7GRbKEQH2HyloUd4f9Uxkb
         xphg==
X-Forwarded-Encrypted: i=1; AJvYcCXlYqxbiaKkdoUDJ/Lj2lDnORCVXc6hRKxaKQZz4TC7sYcrCmh+V+QCzyQiAWN+Y2NHJlN+axxqZdujZOo2CA0koKvNhLsY4idhkSz3Qw==
X-Gm-Message-State: AOJu0YxmuodjfbkwDLp4OaYfTgLd2G+wFUyLllD9D4ZYFpOWSndZW35v
	QGl+o0bjFnsX5n8RSCgvngQM0A/lSp8zn3ITrOngjaQhEDxKefFjX8KYjCjgv8vnf6MJIfpRzuH
	T4jXRaLIYfAcTsFRBOqLxj+ENy0dgamyea+L4
X-Google-Smtp-Source: AGHT+IHLOplxAthwVDMa5iIYXqMD2Wnv9EgNG65kksgNcwXIp1Hft/8lhsMRr2JKI0egPut76qGLphqo65qwRyxwU6g=
X-Received: by 2002:a0c:ec47:0:b0:690:aaa8:a019 with SMTP id
 n7-20020a0cec47000000b00690aaa8a019mr2720578qvq.47.1709865876833; Thu, 07 Mar
 2024 18:44:36 -0800 (PST)
MIME-Version: 1.0
References: <20231116172859.393744-1-sjg@chromium.org> <20231208150042.GA1278773-robh@kernel.org>
 <CAPnjgZ2i4gvgiUeHPOfHuOdBooV4e=QQEq6iMo0JbDwOS6dCwA@mail.gmail.com>
 <CAL_Jsq+xMZ8yz4H9D59uCSyX4h5W+4ruGF++=wVA=msXz+Y01A@mail.gmail.com>
 <CAPnjgZ1uW8T6woXSqFUNm301=W3zBYOrADREkrz=DuwSW87qZg@mail.gmail.com>
 <20231214172702.GA617226-robh@kernel.org> <CAPnjgZ2oJSGPO91Y_aLbe+v250WFrND4n3T0mOvhERYidVu=eQ@mail.gmail.com>
 <CAFLszTizRRVbRO6_ygE2X-Lp5dENWSc4uMGL5GPJAFGAbRdCyQ@mail.gmail.com>
 <CAL_Jsq+j7_KZtQ2ENq9+vsw0LOZF=spu293_G=AxOmBM+m_f-g@mail.gmail.com>
 <CAFLszTimaFw9sf=JKvQXG4fS6V_2T=2n+pfvYLCiuG1o+7cHPA@mail.gmail.com>
 <20240205085056.44278f2c@xps-13> <CAFLszTi+8ygXOidnhxj7sdJwc6X5i+++QvnUyfe-kde5eSts_w@mail.gmail.com>
 <20240205131755.3462084f@xps-13>
In-Reply-To: <20240205131755.3462084f@xps-13>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 8 Mar 2024 15:44:25 +1300
Message-ID: <CAFLszTh3t6wPz8PFhFzazTAGaLVpObkjY9qv7MtSkQ21zZFzKA@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: partitions: Add binman compatible
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, 
	Michael Walle <mwalle@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_184439_206562_67D4BE59 
X-CRM114-Status: GOOD (  45.47  )
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

Hi Miquel,

On Tue, 6 Feb 2024 at 01:17, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Simon,
>
> > > > > > > > > > > > > +description: |
> > > > > > > > > > > > > +  The binman node provides a layout for firmware, used when packaging firmware
> > > > > > > > > > > > > +  from multiple projects. It is based on fixed-partitions, with some
> > > > > > > > > > > > > +  extensions, but uses 'compatible' to indicate the contents of the node, to
> > > > > > > > > > > > > +  avoid perturbing or confusing existing installations which use 'label' for a
> > > > > > > > > > > > > +  particular purpose.
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +  Binman supports properties used as inputs to the firmware-packaging process,
> > > > > > > > > > > > > +  such as those which control alignment of partitions. This binding addresses
> > > > > > > > > > > > > +  these 'input' properties. For example, it is common for the 'reg' property
> > > > > > > > > > > > > +  (an 'output' property) to be set by Binman, based on the alignment requested
> > > > > > > > > > > > > +  in the input.
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +  Once processing is complete, input properties have mostly served their
> > > > > > > > > > > > > +  purpose, at least until the firmware is repacked later, e.g. due to a
> > > > > > > > > > > > > +  firmware update. The 'fixed-partitions' binding should provide enough
> > > > > > > > > > > > > +  information to read the firmware at runtime, including decompression if
> > > > > > > > > > > > > +  needed.
> > > > > > > > > > > >
> > > > > > > > > > > > How is this going to work exactly? binman reads these nodes and then
> > > > > > > > > > > > writes out 'fixed-partitions' nodes. But then you've lost the binman
> > > > > > > > > > > > specifc parts needed for repacking.
> > > > > > > > > > >
> > > > > > > > > > > No, they are the same node. I do want the extra information to stick
> > > > > > > > > > > around. So long as it is compatible with fixed-partition as well, this
> > > > > > > > > > > should work OK.
> > > > > > > > > >
> > > > > > > > > > How can it be both? The partitions node compatible can be either
> > > > > > > > > > 'fixed-partitions' or 'binman'.
> > > > > > > > >
> > > > > > > > > Can we not allow it to be both? I have tried to adjust things in
> > > > > > > > > response to feedback but perhaps the feedback was leading me down the
> > > > > > > > > wrong path?
> > > > > > > >
> > > > > > > > Sure, but then the schema has to and that means extending
> > > > > > > > fixed-partitions.
> > > > > > >
> > > > > > > Can we cross that bridge later? There might be resistance to it. I'm
> > > > > > > not sure. For now, perhaps just a binman compatible works well enough
> > > > > > > to make progress.
> > > > > >
> > > > > > Is there any way to make progress on this? I would like to have
> > > > > > software which doesn't understand the binman compatible to at least be
> > > > > > able to understand the fixed-partition compatible. Is that acceptable?
> > > > >
> > > > > There's only 2 ways that it can work. Either binman writes out
> > > > > fixed-partition nodes dropping/replacing anything only defined for
> > > > > binman or fixed-partition is extended to include what binman needs.
> > > >
> > > > OK, then I suppose the best way is to add a new binman compatible, as
> > > > is done with this v6 series. People then need to choose it instead of
> > > > fixed-partition.
> > >
> > > I'm sorry this is not at all what Rob suggested, or did I totally
> > > misunderstand his answer?
> > >
> > > In both cases the solution is to generate a "fixed-partition" node. Now
> > > up to you to decide whether binman should adapt the output to the
> > > current schema, or if the current schema should be extended to
> > > understand all binman's output.
> > >
> > > At least that is my understanding and also what I kind of agree with.
> >
> > I do want to binman schema to include all the features of Binman.
> >
> > So are you saying that there should not be a 'binman'  schema, but I
> > should just add all the binman properties to the fixed-partition
> > schema?
>
> This is my current understanding, yes. But acknowledgment from Rob is
> also welcome.

I am trying again to wade through all the confusion here.

There is not actually a 'fixed-partition' node. So are you saying I
should add one? There is already a 'partitions' node. Won't they
conflict?

Would it be possible for you to look at my patches and suggest
something? I think at this point, after so many hours of trying
different things and trying to understand what is needed, I could
really use a little help.

Thank you,
Simon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

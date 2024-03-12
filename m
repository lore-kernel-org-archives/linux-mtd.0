Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB919C54E5D
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2024 22:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ZWOPvwiIgFA1KAwGvHEsZcq+aBxlHVmYUJje4RdIk8=; b=d86Y3xdt6BfhTs
	uf03O+dXKerCfaao947+HD+GGge5Bch5REJaq+P1GdUgQq6PiWKDo+WpW7FG4DDFWv+W6zHI0F/gr
	6srQ7RtSsbAxC6PUnTFszx0+UGeVRpLJKb3594nrfXMFiljAKnmRqZSSNutpyzzCDrUNzuBPwXK68
	K6fZ9WaD1XkQRDMSyy6i57NQbuJrQInvU8NQ3ESXlWBMjsRgL0AoXtbQMmUkdDH3nTg6qOJTuGzXA
	dv6AGn5o5GgKwUq4LR+0K9WtMglzvbpbifxvFm/UMzciEo9i+GP4mKrdXuRGHhckIylfkc79liTZV
	pqcPT2X9MrhZpUFYc9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkAZN-00000007p0k-2cWA;
	Tue, 12 Mar 2024 22:26:01 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkAZI-00000007oze-0uBw
	for linux-mtd@lists.infradead.org;
	Tue, 12 Mar 2024 22:25:58 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-690b24973beso2631016d6.0
        for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2024 15:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710282354; x=1710887154; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OzQZAVQefo3mI7JaOv3i9HOffYntNfvUVWBj/1pTaQU=;
        b=G4HkWZ8skbcpoOAOAc8JhfAp3S6QrKDNFSry2ctWwMVEjMdE9vSYDthINB8t6kNzM8
         fuoZuGsrLtotLu3ktCsn/23wbOmm02TtameuOvLkMs/uA8NdnfcvymcG89iZJAqdcbsR
         sDeYKKdIVjqk+oFuRqkMMi7vJhek1ZqGhBjl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710282354; x=1710887154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzQZAVQefo3mI7JaOv3i9HOffYntNfvUVWBj/1pTaQU=;
        b=NsItvlHkxGD3M7RUws38e5VIpIWd7Tg5JXSIB85gdLGEya+v1rP00AEGyTfiHjOCft
         Am/jjShEWhikA11hNe/HNaVI84g5AHUFLT65cXDzwawsQFXkO1/KNtLqGE5MDxuImAlN
         E3CG4wYWASTZCTEsldxslx7Zg22h0eaxqRvTNHzAG98tEf9Zqp4R/sgxZC47UIovXnFp
         rl2wE1tcthd4MXLWqV+uiQXvCmCp9Z/HCgNmH4fzq14K21Mgoxjl13xVCzORMQGxop1n
         sLa6b06J1kITmO/8YiPyiMIxEVADsuZ/ZRahXKHQReTkkSELOzJb4RPYKJ9ChVcL+4ml
         ELsA==
X-Forwarded-Encrypted: i=1; AJvYcCVfoOaZrdAZBas1FBzSyCnMAkv2eB5dw8TSJ+8BStqt7BLvfxiwiz63lbTPLg8ifYqYObxiubQNz+STQfeSmqWwJa/p7KAm6d2/rgp+pQ==
X-Gm-Message-State: AOJu0Yyv1jP9fhNjoAL0Bgv2KcBe3sYUYIpOUilxTQGhLQ1fRdF46BGw
	CbLvrTE2ofx5NeLjuEFBthRljPVDXU5ZmDkcEAL+GfBYrJqxHh9Iy0iKXzt6XA41eu3GGlMUS4K
	H3ZgdrTu+DWLBk/9CJwG2tMHYkMmKGGAe5X1t
X-Google-Smtp-Source: AGHT+IGmyFqJ7I5OEdlVeWDP4fniRKop5+ziAYZpGgboPbvZWq7MrHq+rtsBULHzzfs4hoNrK7NjvGlYv1SDUXqSk04=
X-Received: by 2002:ad4:5c48:0:b0:68f:dde4:fb12 with SMTP id
 a8-20020ad45c48000000b0068fdde4fb12mr1707180qva.9.1710282354445; Tue, 12 Mar
 2024 15:25:54 -0700 (PDT)
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
 <20240205131755.3462084f@xps-13> <CAFLszTh3t6wPz8PFhFzazTAGaLVpObkjY9qv7MtSkQ21zZFzKA@mail.gmail.com>
 <20240308084212.4aa58761@xps-13>
In-Reply-To: <20240308084212.4aa58761@xps-13>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 13 Mar 2024 11:25:42 +1300
Message-ID: <CAFLszTi8w4gBoa-6uoKUN-Ng07ieA+DXy3gm2cdxfwgAybrgsQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240312_152556_338451_B98672D1 
X-CRM114-Status: GOOD (  55.22  )
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

On Fri, 8 Mar 2024 at 20:42, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Simon,
>
> sjg@chromium.org wrote on Fri, 8 Mar 2024 15:44:25 +1300:
>
> > Hi Miquel,
> >
> > On Tue, 6 Feb 2024 at 01:17, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > >
> > > Hi Simon,
> > >
> > > > > > > > > > > > > > > +description: |
> > > > > > > > > > > > > > > +  The binman node provides a layout for firmware, used when packaging firmware
> > > > > > > > > > > > > > > +  from multiple projects. It is based on fixed-partitions, with some
> > > > > > > > > > > > > > > +  extensions, but uses 'compatible' to indicate the contents of the node, to
> > > > > > > > > > > > > > > +  avoid perturbing or confusing existing installations which use 'label' for a
> > > > > > > > > > > > > > > +  particular purpose.
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +  Binman supports properties used as inputs to the firmware-packaging process,
> > > > > > > > > > > > > > > +  such as those which control alignment of partitions. This binding addresses
> > > > > > > > > > > > > > > +  these 'input' properties. For example, it is common for the 'reg' property
> > > > > > > > > > > > > > > +  (an 'output' property) to be set by Binman, based on the alignment requested
> > > > > > > > > > > > > > > +  in the input.
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +  Once processing is complete, input properties have mostly served their
> > > > > > > > > > > > > > > +  purpose, at least until the firmware is repacked later, e.g. due to a
> > > > > > > > > > > > > > > +  firmware update. The 'fixed-partitions' binding should provide enough
> > > > > > > > > > > > > > > +  information to read the firmware at runtime, including decompression if
> > > > > > > > > > > > > > > +  needed.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > How is this going to work exactly? binman reads these nodes and then
> > > > > > > > > > > > > > writes out 'fixed-partitions' nodes. But then you've lost the binman
> > > > > > > > > > > > > > specifc parts needed for repacking.
> > > > > > > > > > > > >
> > > > > > > > > > > > > No, they are the same node. I do want the extra information to stick
> > > > > > > > > > > > > around. So long as it is compatible with fixed-partition as well, this
> > > > > > > > > > > > > should work OK.
> > > > > > > > > > > >
> > > > > > > > > > > > How can it be both? The partitions node compatible can be either
> > > > > > > > > > > > 'fixed-partitions' or 'binman'.
> > > > > > > > > > >
> > > > > > > > > > > Can we not allow it to be both? I have tried to adjust things in
> > > > > > > > > > > response to feedback but perhaps the feedback was leading me down the
> > > > > > > > > > > wrong path?
> > > > > > > > > >
> > > > > > > > > > Sure, but then the schema has to and that means extending
> > > > > > > > > > fixed-partitions.
> > > > > > > > >
> > > > > > > > > Can we cross that bridge later? There might be resistance to it. I'm
> > > > > > > > > not sure. For now, perhaps just a binman compatible works well enough
> > > > > > > > > to make progress.
> > > > > > > >
> > > > > > > > Is there any way to make progress on this? I would like to have
> > > > > > > > software which doesn't understand the binman compatible to at least be
> > > > > > > > able to understand the fixed-partition compatible. Is that acceptable?
> > > > > > >
> > > > > > > There's only 2 ways that it can work. Either binman writes out
> > > > > > > fixed-partition nodes dropping/replacing anything only defined for
> > > > > > > binman or fixed-partition is extended to include what binman needs.
> > > > > >
> > > > > > OK, then I suppose the best way is to add a new binman compatible, as
> > > > > > is done with this v6 series. People then need to choose it instead of
> > > > > > fixed-partition.
> > > > >
> > > > > I'm sorry this is not at all what Rob suggested, or did I totally
> > > > > misunderstand his answer?
> > > > >
> > > > > In both cases the solution is to generate a "fixed-partition" node. Now
> > > > > up to you to decide whether binman should adapt the output to the
> > > > > current schema, or if the current schema should be extended to
> > > > > understand all binman's output.
> > > > >
> > > > > At least that is my understanding and also what I kind of agree with.
> > > >
> > > > I do want to binman schema to include all the features of Binman.
> > > >
> > > > So are you saying that there should not be a 'binman'  schema, but I
> > > > should just add all the binman properties to the fixed-partition
> > > > schema?
> > >
> > > This is my current understanding, yes. But acknowledgment from Rob is
> > > also welcome.
> >
> > I am trying again to wade through all the confusion here.
> >
> > There is not actually a 'fixed-partition' node. So are you saying I
> > should add one? There is already a 'partitions' node. Won't they
> > conflict?
>
> Sorry for the confusion, there is a 'partitions' node indeed. This
> node shall declare it's "programming model" (let's say), ie. how it
> should be parsed. What defines this programming model today is the
> 'fixed-partitions' compatible. I think we (Rob and myself, but again,
> Rob, please confirm) agree on the fact that we don't want to duplicate
> the fixed-partitions compatible/logic and thus the binman compatible
> was rejected.
>
> Hence, in order to move forward, I would definitely appreciate an
> update of the fixed-partitions binding in order to support what binman
> can generate.

OK, so I think my confusion is that I thought you were referring to a
'partitions' compatible. But you are just referring to the name of the
node being 'partitions', with the compatible string being
'fixed-partitions'.

I believe I can make this work by adding a new 'binman.yaml' with the
compatibles that I want to introduce. I cannot change partition.yaml
since it does not itself specify a compatible.

>
> We are here talking about the output of binman, not its input. TBH I
> haven't understood the point in having binman's input parsed by the
> generic yaml binding. I would advise to focus on binman's output first
> because it feels more relevant, at a first glance.

Yes that is fine.

>
> > Would it be possible for you to look at my patches and suggest
> > something? I think at this point, after so many hours of trying
> > different things and trying to understand what is needed, I could
> > really use a little help.
>
> I hope the above details will help.

I think so, thank you. I will send another version.

Regards,
Simon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

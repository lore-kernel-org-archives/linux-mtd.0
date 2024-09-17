Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB446CAC5A2
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2024 21:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnmvUK+WNC2JrdjFcj7OHndHOa702K+B31LjRrZAM1Y=; b=Dd5QJfvzFM9sSN
	1k0lisElDAissMIPF2PTSFq0pSXFaWIK31YiqAhsZMRYhfE6wET4ppKDqlNx/8jMPdF8Z81V3wSlK
	C2upcm/1om1OOIHpC6MqiQ7Z4eOmiVE0+8qw4V1cPqbTPrSH3p6LDMbV0sO1MPwebjgmuec6StQj2
	bPQv9jgafaXiK/FZPBxvjHiLS76oPpRvQXWGPfsmnJV8hdXv3SdrKIZr9AQ5qNKBReuEVWxKlmOQ6
	RW24f/sBgXa0b1m0kcroql7VH9aLGQwjhyDtlNet/XE9mJ7+c9rIxB7nr5MUmz52OnIzA6U821YvZ
	QNFSBDWVcoa6UnlmVobg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqfly-00000006yB1-4119;
	Tue, 17 Sep 2024 21:30:10 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqfls-00000006y3s-2y1T
	for linux-mtd@lists.infradead.org;
	Tue, 17 Sep 2024 21:30:09 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5c251ba0d1cso7884497a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 17 Sep 2024 14:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726608599; x=1727213399; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/5yS1EFc2UkCNqUe9XkDS8zSd6iM9CaMBvaXI1VqENI=;
        b=AS9d+hq9BNr2v7MLRtDa4NH81r0Q1GpqGY8MmkfFXBPZtGBJKURI3gJDNwGlp812nQ
         nrCPJLbM/feHY/r/kGL740x+ebzJToZb2w11Q5Zk+OeOWvgHid+qQgciH4lq4GF46hkl
         Bowvvz4kZLm7by1ZTmUm07sZ69e3ABgHtHRqvU8mhv2jRpUAiIhysOBjQaC8WH3ZxvRT
         ZJYK2fZe9Lt7plKNQL+zS4O8u+TgD3C3bHwgBey+saDOKsX9M3GjKHTyFzJ8rjkVmbJc
         jXiVQROoE4PCeoI/hP+tC1AB4AVPMdAmiQENZBCvorhibea2CI87fa3xSHKN1Bwua3+m
         6Mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726608599; x=1727213399;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/5yS1EFc2UkCNqUe9XkDS8zSd6iM9CaMBvaXI1VqENI=;
        b=pUt3MYUbkPNU7n+UY90ICSN727r2axgzOh2Nj6K0Clbpfm7JF7dyXF0L/iLpwlCHv4
         aVGXneqlIxbI8WpqEi6a3stTZ7Ja5obzdqyWHpCF7HZyJstuE9e0+nyZsdQRfxSR4KLP
         TieAMZU7GJdzsBOqwA/I7oKwduRSkZnLwl6LY1N1OCzlSnKSD9OLoUiyy9BceN7ol3SW
         XJR4ivRLxNiAactTBzjYfK5d6PYcgRQNjx96WfB+br/R2iObNxdj532Wy97393ALQDb3
         a7XHOgXyK2snX1pHxXd3px2vFwJkiDXX8lI2yFyaREDl09emDQIH7fBH23S3Nro6dysy
         8tYg==
X-Forwarded-Encrypted: i=1; AJvYcCXUWcjATiZFcv73f9wNuG7ynU2hHdUISALvEHtzOMWgsqrkbEiZ0+4LBUgkB/sqcjZeTdAF5/oRHaw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt2pgMr0bw5igdeSgoHDJXDS95gIfajSkxeRul5QnHwdPNhjDv
	GwcJuu3P2bbwVkBvqapz34XKYjslsTHWTJU7qITFB+Izzkge7T0qwOdEuBJbazdu8jC8b2851k0
	QNsajyj+Euz6EXEC4IQ1TG3dLPA==
X-Google-Smtp-Source: AGHT+IHZDSOWH5g2mse3vvoQufmbyrZHOiOqYeHvdcDTmjg09A/dKV48ek5QF2G9EkhG6CVgJbewgqf3PB397EjBApg=
X-Received: by 2002:aa7:c882:0:b0:5c4:b33:1f with SMTP id 4fb4d7f45d1cf-5c413e4d733mr16483402a12.28.1726608598858;
 Tue, 17 Sep 2024 14:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240917094956.437078-1-erezgeva@nwtime.org> <20240917094956.437078-4-erezgeva@nwtime.org>
 <9c273945-5a70-408e-a9da-a0797aa6d935@kernel.org> <CANeKEMN+ZUAGKGsqnaToDB3AxX9NN_JeCBWHwd-wwnTWLU3R+g@mail.gmail.com>
 <64ef46b1-7908-4b15-866d-9cabe2e5dc9e@kernel.org> <CANeKEMPwgtECfksgz6jXkR+bjVFwCB9DOh1q7t_3WeojReqxbA@mail.gmail.com>
 <e0db2f62-b2fd-4b61-932c-cc2caf5dd647@kernel.org> <CANeKEMNCFKX2thq+Ws0vy9ovbQ7dve3YPh_FbRaoOEgL+7c_Mw@mail.gmail.com>
 <fe98e49d-96d1-462f-99ac-93d8a53e55fd@kernel.org> <CANeKEMNg_hPcVHVo2c9u1Vdzaso0ODT+2uLmip6sd26uK8d_FQ@mail.gmail.com>
 <20240917-taps-applied-6c0d411bbe08@squawk>
In-Reply-To: <20240917-taps-applied-6c0d411bbe08@squawk>
From: Erez <erezgeva2@gmail.com>
Date: Tue, 17 Sep 2024 23:29:22 +0200
Message-ID: <CANeKEMOXZjgLm-Wb8+9RMJYNN1a2Oy81P3MXZiLxNaAerLhYEA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: mtd: spi-nor: add OTP parameters
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_143004_863274_5B458053 
X-CRM114-Status: GOOD (  33.43  )
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

On Tue, 17 Sept 2024 at 22:39, Conor Dooley <conor@kernel.org> wrote:
>
> On Tue, Sep 17, 2024 at 08:39:48PM +0200, Erez wrote:
> > On Tue, 17 Sept 2024 at 19:32, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > On 17/09/2024 19:24, Erez wrote:
> > > >>>>>>
> > > >>>>>> It does not look like you tested the bindings, at least after quick
> > > >>>>>> look. Please run `make dt_binding_check` (see
> > > >>>>>
> > > >>>>> I run "make dt_binding_check" on kernel 6.6.
> > > >>>>
> > > >>>> Yeah, we are no on kernel 6.6. You can run it also on kernel v4.1 -
> > > >>>> still does not matter.
> > > >>>>
> > > >>>> Don't develop on ancient code because then you ask us to review same
> > > >>>> broken stuff we already fixed.
> > > >>>
> > > >>> I test with Beaglebone black for testing, it is difficult to run the
> > > >>> last vanille version.
> > > >>> I did backport the spi-nor driver.
> > > >>> As for "make dt_binding_check" on last kernel, it need to upgrade the tools,
> > > >>>  and I did not think it could change that much.
> > > >>>
> > > >>
> > > >> Well, it is possible to build kernel on small embedded board, but that's
> > > >> quite cumbersone, slow and inefficient, considering that it's just
> > > >> easier to cross compile. But anyway, binding check does not even need
> > > >> cross compilation.
> > > >>
> > > >> Sorry, the code is obviously wrong, there is no such thing as u32, so
> > > >> you did not test it. I provided link which explains how to test it. You
> > > >> must do it on latest mainline kernel. Just like you must develop and
> > > >> generate patches on latest mainline kernel, because this is where we
> > > >> apply the patches. We do not apply them to v6.6.
> > > >
> > > > The patches are based on the lastest  mainline kernel.
> > > > I do not understand why you think otherwise.
> > >
> > > Because you wrote:
> > > "I run "make dt_binding_check" on kernel 6.6."
> > >
> > > The command is either part of build process or final check process
> > > (static analyzers etc). If you say you did this on v6.6, you got such
> > > response.
> >
> > I know you are NOT a service.
> > The device tree is not the focus of my work.
> > It should not be broken like that.
> >
> > I install dt-schema_2023.11-3_all.deb
> > with Debian trixie
> > I get:
> >
> > l
> >   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> > Traceback (most recent call last):
> >   File "/usr/bin/dt-mk-schema", line 8, in <module>
> >     sys.exit(main())
> >              ^^^^^^
> >   File "/usr/lib/python3/dist-packages/dtschema/mk_schema.py", line 28, in main
> >     schemas = dtschema.DTValidator(args.schemas).schemas
> >               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >   File "/usr/lib/python3/dist-packages/dtschema/validator.py", line
> > 363, in __init__
> >     self.make_property_type_cache()
> >   File "/usr/lib/python3/dist-packages/dtschema/validator.py", line
> > 420, in make_property_type_cache
> >     self.props, self.pat_props = get_prop_types(self.schemas)
> >                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >   File "/usr/lib/python3/dist-packages/dtschema/validator.py", line
> > 187, in get_prop_types
> >     del props[r'^[a-z][a-z0-9\-]*$']
> >         ~~~~~^^^^^^^^^^^^^^^^^^^^^^^
> > KeyError: '^[a-z][a-z0-9\\-]*$'
> > make[2]: *** [Documentation/devicetree/bindings/Makefile:64:
> > Documentation/devicetree/bindings/processed-schema.json] Error 1
> > make[2]: *** Deleting file
> > 'Documentation/devicetree/bindings/processed-schema.json'
> > make[1]: *** [/home/builder/kernel/Makefile:1435: dt_binding_schemas] Error 2
>
> Have you considered that this might be because of the invalid types you
> used?

I remove the types.
Anyway, scripts should report on errors, not crash.
This is the purpose of syntax scripts, to help us, developers find out errors.


Erez :-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

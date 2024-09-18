Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9626ECCD192
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Sep 2024 09:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9KAW1theCCp6GCnULLv5qtv+EWm1ceLjBdaINHNy6U=; b=orqY0LGZ7rF1Dt
	gbYBikuV05y2PhpWfxIUHyEqmseYuHV6LA8hpUUCLD45Voetr7Y12pFiLQcMLaeQqi4JziUYybE3L
	g0eTtmHp+FXZZMjlvU1ilbpWLDgYJcADVkClCr5vUl4YakqtcIphaqzhzQgWJdVQxy4aLXoypseUK
	Pp2NqX81OjAI8eMOYmofsm3beH5DXq1x2h8HcPdZoehKNgEr+dkY/TamQyKXX8AFnpM03jPB3N1bm
	2x9MYI4IAJuIEAbFCOvGS0FxHKO2Gte1G5aJSE2aPWGVHQLmD+fRViostwtQvkw7CYKM360NkcLGg
	VzrkVrmHsysQDDK1nUnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqrHX-00000007x64-2AAy;
	Wed, 18 Sep 2024 09:47:31 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqrHT-00000007x5h-0LUL
	for linux-mtd@lists.infradead.org;
	Wed, 18 Sep 2024 09:47:28 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-53567b4c3f4so6505396e87.2
        for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2024 02:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726652845; x=1727257645; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TY2rYPGlE0vWg6gT7yYeg30ZK7sblLGMWQMlgB7ozqM=;
        b=OMPT9fAQouXVh04NVRI5G7clNm+DdeaVrEuqdgE7h7I25KrPXvH2Fmlz803NI7KNrP
         dXj75kb+rZLVBY9QsEeCaYF4AgFAekYxUdQS73hRqU9KebiNAQyXA8bbQH4AEgVc/7A2
         bTlHSpKdbVCXwnrByGLRiBeVN/dzYXDDR3FsfsZZQEWE8ZDNkoFJHNEFmtLWBH6IkHVX
         BRslFdC0WiypnZD0yUwTzzXHBgtGymR1qnCLTsl3hCl7d9NoHxTPVLJ4ZKwUH++xfUIS
         IlCIIQsNJ+4sasdi2HTAUgOkvA9S20J/yUuZDTGIwxqk39z7HrvCTST4w1Zmf5//T92A
         k0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726652845; x=1727257645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TY2rYPGlE0vWg6gT7yYeg30ZK7sblLGMWQMlgB7ozqM=;
        b=rVqkZVTiNnUKhcZOooE3JadCuqU5g9EHEcW3fb3+V34cwDgmY21HJeO4lygYjrknmz
         Jnon24FDpkvnE3kADDkO05K5H8xVRC3YBtzSB3ByRB4Lm5kc/4AuDbNgQXdPkTlH3MY1
         GDa9YMBNRdiKwDaAAqe5dOx2Yp1XT934lPCfBJ57njQUWuIYcr957o4ZxMMc0cKegFPx
         VMSOeUWowSwntqpGuruQZ15CoI0xCmbUkPVKe+dRQWEhJXAUn2KtApB/CjJzfA+OCDrY
         4VzDlBisW+llHf5jhZ4oDQR999f/JrESOtDESGmdUzbIPLB22tlezpJmRUtPUpu0QPoL
         05YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGGiPgR5XUHKaFVVfB1QYlCzjQULrpcFvgJ6fh0tpeHbYPbg/caeMoIg291c8/gEjBpxOAOudman0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn7YlIz9mIeQ5ME5z27xMDtTTS6sAXGOKHvAcVGbehrKW0B/74
	E8xcVwUxn+j+5njrYSXTF8ReSuYIYhLuoNyYn0Y+TyZNWNPfplyOPh+KGyhjZ253M0Nfo4UW487
	IKpezgGettcTPXGZpm/20GzNqNQ==
X-Google-Smtp-Source: AGHT+IE8mSq9PP7PwdXQaB8swlr8wM6nQTvYf7oqaQMdaVQ5EDeydZlbEtu51pTvRiG7d2NjtJwikQ1Y/YBCFxmQE7A=
X-Received: by 2002:a05:6512:280d:b0:536:5413:2d47 with SMTP id
 2adb3069b0e04-53678feb11fmr12885649e87.41.1726652844767; Wed, 18 Sep 2024
 02:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240917094956.437078-1-erezgeva@nwtime.org> <20240917094956.437078-4-erezgeva@nwtime.org>
 <9c273945-5a70-408e-a9da-a0797aa6d935@kernel.org> <CANeKEMN+ZUAGKGsqnaToDB3AxX9NN_JeCBWHwd-wwnTWLU3R+g@mail.gmail.com>
 <64ef46b1-7908-4b15-866d-9cabe2e5dc9e@kernel.org> <CANeKEMPwgtECfksgz6jXkR+bjVFwCB9DOh1q7t_3WeojReqxbA@mail.gmail.com>
 <e0db2f62-b2fd-4b61-932c-cc2caf5dd647@kernel.org> <CANeKEMNCFKX2thq+Ws0vy9ovbQ7dve3YPh_FbRaoOEgL+7c_Mw@mail.gmail.com>
 <fe98e49d-96d1-462f-99ac-93d8a53e55fd@kernel.org> <CANeKEMNg_hPcVHVo2c9u1Vdzaso0ODT+2uLmip6sd26uK8d_FQ@mail.gmail.com>
 <20240917-taps-applied-6c0d411bbe08@squawk> <CANeKEMOXZjgLm-Wb8+9RMJYNN1a2Oy81P3MXZiLxNaAerLhYEA@mail.gmail.com>
 <a74cf534-b8ce-4d06-b15b-3df349b48c4e@kernel.org>
In-Reply-To: <a74cf534-b8ce-4d06-b15b-3df349b48c4e@kernel.org>
From: Erez <erezgeva2@gmail.com>
Date: Wed, 18 Sep 2024 11:46:47 +0200
Message-ID: <CANeKEMMGChm54BNJL6P+-K6OoD6U=OVXo8ss9JgxCQMY+_roqA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: mtd: spi-nor: add OTP parameters
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_024727_146751_8942B43D 
X-CRM114-Status: GOOD (  15.88  )
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

On Wed, 18 Sept 2024 at 10:23, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 17/09/2024 23:29, Erez wrote:
> >>>
> >>> I install dt-schema_2023.11-3_all.deb
> >>> with Debian trixie
> >>> I get:
> >>>
> >>> l
> >>>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> >>> Traceback (most recent call last):
> >>>   File "/usr/bin/dt-mk-schema", line 8, in <module>
> >>>     sys.exit(main())
> >>>              ^^^^^^
> >>>   File "/usr/lib/python3/dist-packages/dtschema/mk_schema.py", line 28, in main
> >>>     schemas = dtschema.DTValidator(args.schemas).schemas
> >>>               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>>   File "/usr/lib/python3/dist-packages/dtschema/validator.py", line
> >>> 363, in __init__
> >>>     self.make_property_type_cache()
> >>>   File "/usr/lib/python3/dist-packages/dtschema/validator.py", line
> >>> 420, in make_property_type_cache
> >>>     self.props, self.pat_props = get_prop_types(self.schemas)
> >>>                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>>   File "/usr/lib/python3/dist-packages/dtschema/validator.py", line
> >>> 187, in get_prop_types
> >>>     del props[r'^[a-z][a-z0-9\-]*$']
> >>>         ~~~~~^^^^^^^^^^^^^^^^^^^^^^^
> >>> KeyError: '^[a-z][a-z0-9\\-]*$'
> >>> make[2]: *** [Documentation/devicetree/bindings/Makefile:64:
> >>> Documentation/devicetree/bindings/processed-schema.json] Error 1
> >>> make[2]: *** Deleting file
> >>> 'Documentation/devicetree/bindings/processed-schema.json'
> >>> make[1]: *** [/home/builder/kernel/Makefile:1435: dt_binding_schemas] Error 2
> >>
> >> Have you considered that this might be because of the invalid types you
> >> used?
> >
> > I remove the types.
> > Anyway, scripts should report on errors, not crash.
> > This is the purpose of syntax scripts, to help us, developers find out errors.
>
> Yeah, things can be improved. Help in that is always welcomed.
>
> The package you installed is very old (almost a year old!). I suggest

Debian tend to be old and stable (althguh this packages comes from sid).

> using pip or pipx (or virtualenv or whatever Python setup you have).

I'll try.
Though I am not a python developer. I usually do not use pip.

I did see a version checking:

$ make dt_binding_check
sort: -:2: disorder: 2022.08.2
ERROR: dtschema minimum version is v2023.9

Thanks
Erez

>
> Best regards,
> Krzysztof
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

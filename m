Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEB0CAC595
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2024 18:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kmVQ6u1WqT9rSw2kaJLi5DWx0HY91T6aHpO/3bx/IA4=; b=LDobMDomHzjAlP
	w5y4Z2jZs4HzrOIYufGmgNQDmq8OEpMw+rQ/upqoVAMS3XsYZr4IoOdoq5xhSvOXVYYIyJb0ON7na
	K60s3GyQZUjrP4WADa6xSNxtNjYmaHd1gIgTU6Xj6KGbbQ76VO/LNS0GRaU3ydc+C7Uhs+mCaFmtw
	BWrBqeyTaC0l2evmusEYW1JDWC7vCb7BMYwPEg+ibPTJo/6LGVsUGa+jgn1tNpleH+gwJPUEKwOV8
	EBbl+/3woIy8opr8nKT+RoZ4lMIpD+pAz8L3jhSjoudZ//IAFu3ICK7jn4EFKhFZgNRqf0SHxLnzw
	yEanEm0jGnvxeB9XK5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqd7m-00000006hdJ-41FR;
	Tue, 17 Sep 2024 18:40:30 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqd7j-00000006hcw-45U8
	for linux-mtd@lists.infradead.org;
	Tue, 17 Sep 2024 18:40:29 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5c3d209db94so757542a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 17 Sep 2024 11:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726598426; x=1727203226; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3W43sCdJ9cKmQgVhii/XmReCdXpMFSO7vySLNva3/Fs=;
        b=Qz40eYotIip8a+IcPCKOwlBUua+v1SQW3/VNXfM1RzJE4F1BE8URth69zrrz6qW8LM
         Rw1si0gC4/isWEiwRpLt5DUa+OEHiKoQbia4e42gidIhTinlfnp1sFj4Ng1PvCVLsEY5
         eoF37NCCrjoGpheA/EV6E6IJ4InEVrEWoTCw8+CauqU4WjAtBE5fPlevR6tHb3nDjBkE
         Hl9xfkCRchwLBxlGe+R5yrVAacQiTa4N1w4wgokgiYga9Bdhj6uzDRIoqowE758c4Zk1
         8aCPsTloCpJn8Y+cdg/uecz7XYcbWJJKhalrRy1hRjZOpOC+nYOK3LXlSCkDCudTA6nb
         C3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726598426; x=1727203226;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3W43sCdJ9cKmQgVhii/XmReCdXpMFSO7vySLNva3/Fs=;
        b=EUirC85598KAJZIMxeBnah3POvnhZtUmU2/05J2vOo/5ZJFCAWy0RDenvc27kwI8K2
         w4pj4Vrrm04TIVKgDVxr1bgk2jK40MTKW3q0liSGSpCniuB/f140YHr0YbDALy1L/EOY
         WYZoDQe9YFHY98rOGsRZuRbuQk/SV8+9KLmEqgVD6wTNNPA4Tl66sWl+itbcATXTULxg
         iSmjBNVz9AJL0N0FXP3Bw+2JY8N9ANG/8+D6UmwXvrMDgo2PMcPcrGhYyfyphCl1ulK/
         3Ilkf4NT1tb1zs6wUDGRYAZI8+4BtrpEFCPSd8ywlcBopQ2yFZl/59K1P4R17akyAfkz
         orPw==
X-Forwarded-Encrypted: i=1; AJvYcCXhtHElSJ4MK96tb2dNnjOZGyF6ObzpencJBNvqLWUVAIDRrvX/B0R9+gcqpEx5cY8aMuXr/5FqSpw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxveJrVXbp+3i/SPWIDfpG/gbkdBYU6MxI/NhXQ2Dpcmd3DlAD9
	HvEqidKvL0zsVqXLE43fFSLzz18UgVdA7mY/Sytf+EBTGUb96C2B6DU9AIw2JCtYXNttSJnfnDU
	9BdXxTev8+C7fWz9XxA23xBDAjQ==
X-Google-Smtp-Source: AGHT+IH29/+BYE5mln0xpsH/jdA9PZESe+dgMZVTcHlxigwJB+Zea9uFdnvKEpDTHJkY5FarGlJrUhlikAmay0I7goM=
X-Received: by 2002:a50:cb8b:0:b0:5c4:95d:da34 with SMTP id
 4fb4d7f45d1cf-5c413e4d368mr14908962a12.26.1726598425680; Tue, 17 Sep 2024
 11:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240917094956.437078-1-erezgeva@nwtime.org> <20240917094956.437078-4-erezgeva@nwtime.org>
 <9c273945-5a70-408e-a9da-a0797aa6d935@kernel.org> <CANeKEMN+ZUAGKGsqnaToDB3AxX9NN_JeCBWHwd-wwnTWLU3R+g@mail.gmail.com>
 <64ef46b1-7908-4b15-866d-9cabe2e5dc9e@kernel.org> <CANeKEMPwgtECfksgz6jXkR+bjVFwCB9DOh1q7t_3WeojReqxbA@mail.gmail.com>
 <e0db2f62-b2fd-4b61-932c-cc2caf5dd647@kernel.org> <CANeKEMNCFKX2thq+Ws0vy9ovbQ7dve3YPh_FbRaoOEgL+7c_Mw@mail.gmail.com>
 <fe98e49d-96d1-462f-99ac-93d8a53e55fd@kernel.org>
In-Reply-To: <fe98e49d-96d1-462f-99ac-93d8a53e55fd@kernel.org>
From: Erez <erezgeva2@gmail.com>
Date: Tue, 17 Sep 2024 20:39:48 +0200
Message-ID: <CANeKEMNg_hPcVHVo2c9u1Vdzaso0ODT+2uLmip6sd26uK8d_FQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: mtd: spi-nor: add OTP parameters
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_114028_056036_F2871ED1 
X-CRM114-Status: GOOD (  25.45  )
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

On Tue, 17 Sept 2024 at 19:32, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 17/09/2024 19:24, Erez wrote:
> >>>>>>
> >>>>>> It does not look like you tested the bindings, at least after quick
> >>>>>> look. Please run `make dt_binding_check` (see
> >>>>>
> >>>>> I run "make dt_binding_check" on kernel 6.6.
> >>>>
> >>>> Yeah, we are no on kernel 6.6. You can run it also on kernel v4.1 -
> >>>> still does not matter.
> >>>>
> >>>> Don't develop on ancient code because then you ask us to review same
> >>>> broken stuff we already fixed.
> >>>
> >>> I test with Beaglebone black for testing, it is difficult to run the
> >>> last vanille version.
> >>> I did backport the spi-nor driver.
> >>> As for "make dt_binding_check" on last kernel, it need to upgrade the tools,
> >>>  and I did not think it could change that much.
> >>>
> >>
> >> Well, it is possible to build kernel on small embedded board, but that's
> >> quite cumbersone, slow and inefficient, considering that it's just
> >> easier to cross compile. But anyway, binding check does not even need
> >> cross compilation.
> >>
> >> Sorry, the code is obviously wrong, there is no such thing as u32, so
> >> you did not test it. I provided link which explains how to test it. You
> >> must do it on latest mainline kernel. Just like you must develop and
> >> generate patches on latest mainline kernel, because this is where we
> >> apply the patches. We do not apply them to v6.6.
> >
> > The patches are based on the lastest  mainline kernel.
> > I do not understand why you think otherwise.
>
> Because you wrote:
> "I run "make dt_binding_check" on kernel 6.6."
>
> The command is either part of build process or final check process
> (static analyzers etc). If you say you did this on v6.6, you got such
> response.

I know you are NOT a service.
The device tree is not the focus of my work.
It should not be broken like that.

I install dt-schema_2023.11-3_all.deb
with Debian trixie
I get:

l
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
Traceback (most recent call last):
  File "/usr/bin/dt-mk-schema", line 8, in <module>
    sys.exit(main())
             ^^^^^^
  File "/usr/lib/python3/dist-packages/dtschema/mk_schema.py", line 28, in main
    schemas = dtschema.DTValidator(args.schemas).schemas
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3/dist-packages/dtschema/validator.py", line
363, in __init__
    self.make_property_type_cache()
  File "/usr/lib/python3/dist-packages/dtschema/validator.py", line
420, in make_property_type_cache
    self.props, self.pat_props = get_prop_types(self.schemas)
                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3/dist-packages/dtschema/validator.py", line
187, in get_prop_types
    del props[r'^[a-z][a-z0-9\-]*$']
        ~~~~~^^^^^^^^^^^^^^^^^^^^^^^
KeyError: '^[a-z][a-z0-9\\-]*$'
make[2]: *** [Documentation/devicetree/bindings/Makefile:64:
Documentation/devicetree/bindings/processed-schema.json] Error 1
make[2]: *** Deleting file
'Documentation/devicetree/bindings/processed-schema.json'
make[1]: *** [/home/builder/kernel/Makefile:1435: dt_binding_schemas] Error 2

Erez


>
> Best regards,
> Krzysztof
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

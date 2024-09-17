Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3824CAC5A0
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2024 20:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZCIELKe0IYKI4h3PBxr5F3IkqiOfpuKFOFLe55J8OY=; b=FAYCMvMtgk6tQYdnRIRXU9p1hd
	k9khMWfw3mKZTsXzCiqCuYy7KWg7MwF9bUyDSDZpizgk2t4IP93jJr+NmYucyuSK0CdZgIejBy8MJ
	84X5qaSPCTNdjxkfPl7/7J+qAF7Dkqd7/RCeTiZzf1wUBDA/FPiZfHaIt/2AGuWxKwX01eZObN1Hh
	70ee0/A7Cq1yAqSd2Va4D86zOPriUg0576jDs+3gnuweNhcs1yMJXA/d5GAb3AscGvx6nh1YTU4WI
	F4CWdnPiE7mtDDEYCB0/+GI2lcpCqYL0cIpnYE3Vo/u3IOnLYWv2bvUqqdHsjjsYoV7+mv4miFplF
	RYXw/qfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqez7-00000006s4T-0joq;
	Tue, 17 Sep 2024 20:39:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqez3-00000006s2n-1ZQi
	for linux-mtd@lists.infradead.org;
	Tue, 17 Sep 2024 20:39:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F13DFA43234;
	Tue, 17 Sep 2024 20:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EE8C4CED6;
	Tue, 17 Sep 2024 20:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726605574;
	bh=0HicAuQ7P4k7rB6kUC65cuuL9SsgwfK6nMrWRe6yy8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DUxDeaUjr1AiI4x22SIwLPRU8w/fw+DEbzDo/m1zcyKg1Z7RjLQ3mNGT8CFF6uC3j
	 ssfi86AozeA8a6rrKVMdrfDL842Ct0o1hxBuLPPpi1iYdbelHJM33uSIFG7HwKJb4X
	 GGWzVyA7b7PkPQgRKAw8H1Au3DQGQL43w4WPbmQ7UMsZEtzeXoj4cNNeyIjlKP8bDm
	 U5B9BDHuZaULvZXZYrTfX72DO2KBW6Yyub8yT3A6iZ66hIci2ncFk3vv6GNtfRu+qD
	 bI05uEp6crFil6rckWh8XR3YpJeLozYNcIZszErdbmFKi+rYAe1FfgqG0nOnX0yHWV
	 VC7XzJmFa84ag==
Date: Tue, 17 Sep 2024 21:39:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Erez <erezgeva2@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Erez Geva <erezgeva@nwtime.org>,
	linux-mtd@lists.infradead.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: mtd: spi-nor: add OTP parameters
Message-ID: <20240917-taps-applied-6c0d411bbe08@squawk>
References: <20240917094956.437078-1-erezgeva@nwtime.org>
 <20240917094956.437078-4-erezgeva@nwtime.org>
 <9c273945-5a70-408e-a9da-a0797aa6d935@kernel.org>
 <CANeKEMN+ZUAGKGsqnaToDB3AxX9NN_JeCBWHwd-wwnTWLU3R+g@mail.gmail.com>
 <64ef46b1-7908-4b15-866d-9cabe2e5dc9e@kernel.org>
 <CANeKEMPwgtECfksgz6jXkR+bjVFwCB9DOh1q7t_3WeojReqxbA@mail.gmail.com>
 <e0db2f62-b2fd-4b61-932c-cc2caf5dd647@kernel.org>
 <CANeKEMNCFKX2thq+Ws0vy9ovbQ7dve3YPh_FbRaoOEgL+7c_Mw@mail.gmail.com>
 <fe98e49d-96d1-462f-99ac-93d8a53e55fd@kernel.org>
 <CANeKEMNg_hPcVHVo2c9u1Vdzaso0ODT+2uLmip6sd26uK8d_FQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANeKEMNg_hPcVHVo2c9u1Vdzaso0ODT+2uLmip6sd26uK8d_FQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_133937_596695_4AAAF24E 
X-CRM114-Status: GOOD (  30.18  )
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
Content-Type: multipart/mixed; boundary="===============2790307928849675313=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2790307928849675313==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nUwItat6u78HzFGR"
Content-Disposition: inline


--nUwItat6u78HzFGR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 08:39:48PM +0200, Erez wrote:
> On Tue, 17 Sept 2024 at 19:32, Krzysztof Kozlowski <krzk@kernel.org> wrot=
e:
> >
> > On 17/09/2024 19:24, Erez wrote:
> > >>>>>>
> > >>>>>> It does not look like you tested the bindings, at least after qu=
ick
> > >>>>>> look. Please run `make dt_binding_check` (see
> > >>>>>
> > >>>>> I run "make dt_binding_check" on kernel 6.6.
> > >>>>
> > >>>> Yeah, we are no on kernel 6.6. You can run it also on kernel v4.1 -
> > >>>> still does not matter.
> > >>>>
> > >>>> Don't develop on ancient code because then you ask us to review sa=
me
> > >>>> broken stuff we already fixed.
> > >>>
> > >>> I test with Beaglebone black for testing, it is difficult to run the
> > >>> last vanille version.
> > >>> I did backport the spi-nor driver.
> > >>> As for "make dt_binding_check" on last kernel, it need to upgrade t=
he tools,
> > >>>  and I did not think it could change that much.
> > >>>
> > >>
> > >> Well, it is possible to build kernel on small embedded board, but th=
at's
> > >> quite cumbersone, slow and inefficient, considering that it's just
> > >> easier to cross compile. But anyway, binding check does not even need
> > >> cross compilation.
> > >>
> > >> Sorry, the code is obviously wrong, there is no such thing as u32, so
> > >> you did not test it. I provided link which explains how to test it. =
You
> > >> must do it on latest mainline kernel. Just like you must develop and
> > >> generate patches on latest mainline kernel, because this is where we
> > >> apply the patches. We do not apply them to v6.6.
> > >
> > > The patches are based on the lastest  mainline kernel.
> > > I do not understand why you think otherwise.
> >
> > Because you wrote:
> > "I run "make dt_binding_check" on kernel 6.6."
> >
> > The command is either part of build process or final check process
> > (static analyzers etc). If you say you did this on v6.6, you got such
> > response.
>=20
> I know you are NOT a service.
> The device tree is not the focus of my work.
> It should not be broken like that.
>=20
> I install dt-schema_2023.11-3_all.deb
> with Debian trixie
> I get:
>=20
> l
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> Traceback (most recent call last):
>   File "/usr/bin/dt-mk-schema", line 8, in <module>
>     sys.exit(main())
>              ^^^^^^
>   File "/usr/lib/python3/dist-packages/dtschema/mk_schema.py", line 28, i=
n main
>     schemas =3D dtschema.DTValidator(args.schemas).schemas
>               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3/dist-packages/dtschema/validator.py", line
> 363, in __init__
>     self.make_property_type_cache()
>   File "/usr/lib/python3/dist-packages/dtschema/validator.py", line
> 420, in make_property_type_cache
>     self.props, self.pat_props =3D get_prop_types(self.schemas)
>                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3/dist-packages/dtschema/validator.py", line
> 187, in get_prop_types
>     del props[r'^[a-z][a-z0-9\-]*$']
>         ~~~~~^^^^^^^^^^^^^^^^^^^^^^^
> KeyError: '^[a-z][a-z0-9\\-]*$'
> make[2]: *** [Documentation/devicetree/bindings/Makefile:64:
> Documentation/devicetree/bindings/processed-schema.json] Error 1
> make[2]: *** Deleting file
> 'Documentation/devicetree/bindings/processed-schema.json'
> make[1]: *** [/home/builder/kernel/Makefile:1435: dt_binding_schemas] Err=
or 2

Have you considered that this might be because of the invalid types you
used?

--nUwItat6u78HzFGR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZunpBQAKCRB4tDGHoIJi
0tCaAQDTQkSgmgXWm5P+FDYxt/IgLEP6DuRS/KvfNoab8J93PAD/SGFDgPtP7E6b
XUuBR5CG2lxio6kd505+CpQsDLjghQ0=
=2n4F
-----END PGP SIGNATURE-----

--nUwItat6u78HzFGR--


--===============2790307928849675313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2790307928849675313==--


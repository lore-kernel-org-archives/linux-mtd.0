Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F06AC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 08:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgM1cxX8nI9lErCtLtlxn2886sUn5eOOMSGG2KuHG8Q=; b=gvi+7WjPLSNDHu6AdgNKGZ0S7W
	4BwRUqT5cxmOwyR8Vasi18mmm82P7NPSobjT8EglBijTRMi94zSRxCScAoHAW5kLTDIr+19U5b72/
	RanDeS41ZS/ipJFwmq3iew0hVu3bR+WnIaAJJbaEGsED9C3Elefx75GauawQ13VMq5/KJ7AAt+7qX
	OyzC1PsINTueY6UYbdSVijfAakUX6rouDHN3ZKlZuRfaIPdSJInNURUrMaotNQe7GcGPWW9p0UZgX
	6JJaLyq9ibfHeLhDH9/vCLdrQHa7w3qFC0QwGuP5364zagCP4+DCTByvrsxR9L/RkgvbdwOb7fRm8
	RGLVD+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muWAX-007cQN-IY; Tue, 07 Dec 2021 08:49:50 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muVxw-007Ya3-Dp
 for linux-mtd@lists.infradead.org; Tue, 07 Dec 2021 08:36:49 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso1114246wms.3
 for <linux-mtd@lists.infradead.org>; Tue, 07 Dec 2021 00:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hS4s0cfHaFB1mjZApAyxsxaBhzGf1CZ85k4YcjUrKs0=;
 b=ms2wDCeIABLZLNwTqJQlb4IogiGzKSjBjlsRJgIhXJQnsNiogd61pWnFME+eTqBUAa
 q6pkwktlkZPY8tEcqJiQL/hA0Hht/Hxq8KKqGlnMFfuWTK0ZLUEaKvnQwlB07xXK9zBU
 TxmXYx3v6JAYEvRYaMfAxg3fQcD+Yd4qcwbic02yHjdyEUYkL0dvjy/OK14edSu9CESC
 s5A8BbOhYqWvtCZvI4NsBYQDMWfKBu/NPFuCPNfiuEWb+GiNcbaJr2W6/CQqaWZVMxkn
 5KKgg0KkRdVQILQ55sqCtbXSBC0vrqk08QHT1SPIxnXNZuE53/uztdxlsxYy0dnsMMVu
 08Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hS4s0cfHaFB1mjZApAyxsxaBhzGf1CZ85k4YcjUrKs0=;
 b=BU9Nuj8AK7FR7POM9l7ujnTdsOnt92YRfSXrRUIpgDJmd321oRV+A98JJ+h2Il3bjF
 misavA176/zQf7AhQ6uEFDEASbrWxKml9HDDI7QxfcJSYcAZhQCRB57g/qsrBJMeCCsg
 Acs+x2q9ea+dBJyWc0VJvIB5112719uHJLwWmal/H/WSUggc8YPT7ByFai5U0y9k0cCC
 nt7yvVvkm2Y/aUMkEg1Wm43iUSjz+0pMBXRO9DuuKc9iuAsB7kN48Jo57wLantgJr+49
 qQn1YhVtLz/gMm5dY6BLVM+sTpJz/hA5FfIzJB6PG3C9kjqqW11rMRniHwMb5wkYFhdr
 H50w==
X-Gm-Message-State: AOAM5318N+LxDtqORgfQAIHdQpwAU7lM84V74NMI0/5rmDOO5CGrHVgw
 G2T1dGGlqU8TrqXUFE2AoAO7sbumQ3+jZw==
X-Google-Smtp-Source: ABdhPJwuCLqlycQzc8KhUT03MVCeXx/CaVFjpUJOwncm8ovBvTb1sAgznte1boCvq0BCgbYhk6LWIQ==
X-Received: by 2002:a05:600c:3846:: with SMTP id
 s6mr5173853wmr.55.1638866207094; 
 Tue, 07 Dec 2021 00:36:47 -0800 (PST)
Received: from orome.fritz.box ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id k8sm13651056wrn.91.2021.12.07.00.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 00:36:46 -0800 (PST)
Date: Tue, 7 Dec 2021 09:36:43 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: ti,gpmc-nand: Add missing 'rb-gpios'
Message-ID: <Ya8dG/pQ67XFacdO@orome.fritz.box>
References: <20211206174209.2297565-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211206174209.2297565-1-robh@kernel.org>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_003648_519307_615B6C05 
X-CRM114-Status: GOOD (  14.23  )
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
Content-Type: multipart/mixed; boundary="===============5726915531547398706=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5726915531547398706==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OdofmF9j5haQfHF0"
Content-Disposition: inline


--OdofmF9j5haQfHF0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 06, 2021 at 11:42:09AM -0600, Rob Herring wrote:
> With 'unevaluatedProperties' support implemented, the TI GPMC example
> has a warning:
>=20
> Documentation/devicetree/bindings/memory-controllers/ti,gpmc.example.dt.y=
aml: nand@0,0: Unevaluated properties are not allowed ('rb-gpios' was unexp=
ected)
>=20
> Add the missing definition for 'rb-gpios'.
>=20
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Roger Quadros <rogerq@kernel.org>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--OdofmF9j5haQfHF0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGvHRsACgkQ3SOs138+
s6EDahAApZ1NZlUaEmFdyjj8cjfwcm+jHarWYeJ+oLuebb2NEoaOeQX+PufHH2H7
D9f9rm/khm6NTEDhpm8xaoKqHx1FoHpSoc7eJZ+LrK7v/X2IMQK4/TDIcdsko8rt
qkwKr0KecdUQ84R0enDC8VS9Rh3RjS5BxVOOqL1cXt0HkAWwu/PDCeLJ/pugFbb6
BKNzArPXhl570OBbjkUEnpda4Fi+ut4dsIu/EC6oSKSmzXv5i/5+9WQy53Xb2lZU
JaOH/dovvpzlfrX23dFHukiPNCsgiupq9J+kzQSlX0JjuVaPYI/9u4vvPD53+WEs
JPZUaAUF4kyTJT76vMRca47AMuOEDmaVofeIoOCl2PzmSah8ZSPQq+YGJl/Q8imU
BilBwnlVb+9kxp2TSNgh90PUG2mUkfWQWESBYQ3u+u9+1nbRVVvJtzFX5ZBqWcMZ
GOuIfgKGv0s1JS/XN5Oyw9trGzgZ7vMODisDuB33mzciL0e70y97S8gz8q4sXi07
9zBHpJZkjaLWAwOg5SqyQ05EjWQ6c2nURGsicuBgKPqcdimWoyptwbHH/C8oqzu5
IzDLuALB/955QRoSI3hY1B+NwJ2gdUX0GmYn/ZiYb9J9LeF/le712kUIjMAnEFVp
9gDg7brijyvi9ULcK2MFQC9z9zwlDFNCwCyjEl2D73KCFBwCJwE=
=q8by
-----END PGP SIGNATURE-----

--OdofmF9j5haQfHF0--


--===============5726915531547398706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5726915531547398706==--


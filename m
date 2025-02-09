Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A84C0219B
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Feb 2025 20:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:
	References:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nr9uCdXibUjLofnOkYYuEzfzR3WM2JJFV+yFsNHb6JU=; b=BhaPFMa7UWo0my
	nq4c9yTfPtWrxQdBPaQlzd3LuarBrEBu++tMA0TyU1zegT5rZH5gEM/oeL9KA/sJseH0tDuuzjT22
	red8qqzJ4efyvCW3H6Hbn8SQW4U/Av/oYVqn0wj2xqdATG/vf7xfmIrqVHX51B6NbrghPnmGtoMBN
	wp97zbfDcgt6WoDMIQonvoe6IBANjdzQAeNZgFvV6a7340akf+YyDNJWZbcmD8kGvLz8TAt/5tddJ
	QKHyKIDRgYCByPNeQAG7Bor0ZT7i74HwZscHkPjunwRqITF4q+edph7PFTtCCNEvshI0TUyM3Q9mG
	qw9mGnsG1DPI1BUR+usg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thEGJ-0000000FXkj-3kZc;
	Sun, 09 Feb 2025 20:50:43 +0000
Received: from baldur.buserror.net ([165.227.176.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thEFZ-0000000FXcA-0WWk
	for linux-mtd@lists.infradead.org;
	Sun, 09 Feb 2025 20:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=buserror.net; s=rsa_sel; h=Subject:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Cc:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EpToGD3dUgsdAKwVgr42gOxVA1d/S1QPZ4reqp0Dgs8=; b=0UnPtkDcmzDcjvHDUHyLT2CjRU
	Wu31RLzuZn8p0dV1DURWjhl+4+u/yXCjfpbN//Fv+gzr7dFxyWAIY13siJk1+2c2h7flpXKEbo5GK
	Nzb0MrDhlkKl23df30ZGunrnNmUcpvB/tY7q0jPyZACh4u0zgcDKAURgcZgDdJCfSub1blBNmf6Ye
	2sc/RnS11ATYBdxLh4TOGHrIUM868ob5a1q6cLyIoCxxUqwRzg3HVOyqHUfIDBNgC955YJewdlyOP
	VUcjGVLAyzhCUnLHWphUkyZmWKmwZrAiNhydfaGiX5Yiakntm82WcDWO+upyCLZ9SU2k3ajGLNyec
	oI4TO6mg==;
Received: from oss by baldur.buserror.net with local (Exim 4.96)
	(envelope-from <oss@buserror.net>)
	id 1thDxm-00C5Xt-1r;
	Sun, 09 Feb 2025 14:31:35 -0600
Date: Sun, 9 Feb 2025 14:31:34 -0600
From: Crystal Wood <oss@buserror.net>
To: j.ne@posteo.net
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org, Li Yang <leoyang.li@nxp.com>,
	John Ogness <john.ogness@linutronix.de>
Message-ID: <Z6kQpuQf5m-bXTyt@buserror.net>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: j.ne@posteo.net, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, krzk@kernel.org, imx@lists.linux.dev, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dlemoal@kernel.org, cassel@kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net, lee@kernel.org, vkoul@kernel.org, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com, j.neuschaefer@gmx.net, wim@linux-watchdog.org, linux@roeck-us.net, broonie@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, linux-pci@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, leoyang.li@nxp.com, john.ogness@linutronix.de
X-SA-Exim-Mail-From: oss@buserror.net
Subject: Re: [PATCH v2 09/12] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_124957_241521_0E392E89 
X-CRM114-Status: GOOD (  33.65  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Feb 07, 2025 at 10:30:26PM +0100, J. Neusch=E4fer via B4 Relay wrot=
e:
> From: "J. Neusch=E4fer" <j.ne@posteo.net>
> =

> Convert the Freescale localbus controller bindings from text form to
> YAML. The updated list of compatible strings reflects current usage
> in arch/powerpc/boot/dts/, except that many existing device trees
> erroneously specify "simple-bus" in addition to fsl,*elbc.
> =

> Changes compared to the txt version:
>  - removed the board-control (fsl,mpc8272ads-bcsr) node because it only
>    appears in this example and nowhere else
>  - added a new example with NAND flash
>  - updated list of compatible strings
> =

> Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>
> ---
> =

> V2:
> - fix order of properties in examples, according to dts coding style
> - move to Documentation/devicetree/bindings/memory-controllers
> - clarify the commit message a tiny bit
> - remove unnecessary multiline markers (|)
> - define address format in patternProperties
> - trim subject line (remove "binding")
> - remove use of "simple-bus", because it's technically incorrect

While I admit I haven't been following recent developments in this area,
as someone who was involved when "simple-bus" was created (and was on the
ePAPR committee that standardized it) I'm surprised to hear simple-bus
being called "erroneous" or "technically incorrect" here.

For non-NAND devices this bus generally meets the definition of "an
internal I/O bus that cannot be probed for devices" where "devices on the
bus can be accessed directly without additional configuration
required".  NAND flash is an exception, but those devices have
compatibles that are specific to the bus controller.

The fact that the address encoding is non-linear is irrelevant; the
addresses can still be translated using the standard "ranges" mechanism. =

This seems to be a disconnect between the schema verification and the way
the compatible has previously been defined and used.

And as a practical matter, unless I'm missing something (which I might be
since I haven't been in devicetree-land for nearly a decade), Linux is
relying on simple-bus to probe these devices.  There is a driver that
binds to the bus itself but that is just for error interrupts and NAND.

You'd probably need something like commit 3e25f800afb82bd9e5f8 ("memory:
fsl_ifc: populate child devices without relying on simple-bus") and the =

subsequent fix in dd8adc713b1656 ("memory: fsl_ifc: populate child
nodes of buses and mfd devices")...

I'm curious what the reasoning was for removing simple-bus from IFC.  It
seems that the schema verification also played a role in that:
https://www.spinics.net/lists/devicetree/msg220418.html

...but there's also the comment in 985ede63a045eabf3f9d ("dt-bindings:
memory: fsl: convert ifc binding to yaml schema") that "this will help to
enforce the correct probe order between parent device and child devices",
but was that really not already guaranteed by the parent/child
relationship (and again, it should only really matter for NAND except for
the possibility of missing error reports during early boot)?

> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,mpc8313-elbc
> +              - fsl,mpc8315-elbc
> +              - fsl,mpc8377-elbc
> +              - fsl,mpc8378-elbc
> +              - fsl,mpc8379-elbc
> +              - fsl,mpc8536-elbc
> +              - fsl,mpc8569-elbc
> +              - fsl,mpc8572-elbc
> +              - fsl,p1020-elbc
> +              - fsl,p1021-elbc
> +              - fsl,p1023-elbc
> +              - fsl,p2020-elbc
> +              - fsl,p2041-elbc
> +              - fsl,p3041-elbc
> +              - fsl,p4080-elbc
> +              - fsl,p5020-elbc
> +              - fsl,p5040-elbc
> +          - const: fsl,elbc

Is it really necessary to list every single chip?

And then it would need to be updated when new ones came out?  I know this
particular line of chips is not going to see any new members at this
point, but as far as the general approach goes...

Does the schema validation complain if it sees an extra compatible it
doesn't recognize?  If so that's obnoxious.

> +examples:
> +  - |
> +    localbus@f0010100 {
> +        compatible =3D "fsl,mpc8272-localbus",
> +                     "fsl,pq2-localbus";
> +        reg =3D <0xf0010100 0x40>;
> +        ranges =3D <0x0 0x0 0xfe000000 0x02000000
> +                  0x1 0x0 0xf4500000 0x00008000
> +                  0x2 0x0 0xfd810000 0x00010000>;
> +        #address-cells =3D <2>;
> +        #size-cells =3D <1>;
> +
> +        flash@0,0 {
> +            compatible =3D "jedec-flash";
> +            reg =3D <0x0 0x0 0x2000000>;
> +            bank-width =3D <4>;
> +            device-width =3D <1>;
> +        };
> +
> +        simple-periph@2,0 {
> +            compatible =3D "fsl,elbc-gpcm-uio";
> +            reg =3D <0x2 0x0 0x10000>;
> +            elbc-gpcm-br =3D <0xfd810800>;
> +            elbc-gpcm-or =3D <0xffff09f7>;
> +        };

I know this isn't new, but... since we're using this as an example,
where is the documentation for this fsl,elbc-gpcm-uio and
elbc-gpcm-br/or?  What exactly is a simple-periph?

There are no in-tree device trees that use this either.  The bcsr
node was actually a much more normal example, despite that particular
platform having been removed.  There are other bcsr nodes that still
exist that could be used instead.

-Crystal

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

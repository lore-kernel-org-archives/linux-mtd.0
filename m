Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35F7C0219E
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 21:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wN9tm3rZK5L6e/7HPv7azV+wgVa1MUNrUxhuNTpnIZ0=; b=RkCpxm9hQ0zBLD
	aIiqz206UL+M9PqkYnXvP44qlQuW5ZY4C/ljVPVJfHtHzOS5s3PhajDHHwWN+epoKIkx1KfaSU6rM
	5hij1xx/6JgTs1D3p//R/3QMnO8MDBD7y+QkNca1SkyHzp5ZsTGyED4Eru0KZIURRIlgUTEihaLIE
	PcneJUWjKXuvrgqEGMiKSqa70stWn6tG+j0yVBqQNfMk2wIMv4mzStHaJrCwbJ1/Me3XNfQO5HmZN
	Poq4eaJx47rvHcAkqrkyhG0AVh0q8b44MQzOjzLkI+1CCVrU1St2Z9+0dhhsKHSxIESLfBELOi/w2
	1uMr/xaswj2Vg9I07XXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbic-00000001ZQn-26d9;
	Mon, 10 Feb 2025 21:53:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbiZ-00000001ZQK-1obo
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 21:53:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 69DE9A41A0C;
	Mon, 10 Feb 2025 21:51:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FBCC4CED1;
	Mon, 10 Feb 2025 21:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739224405;
	bh=1xp9i23qLHopM7Es6GWfv9JVXjG6ubbsAUbJbN9kf34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NGcZXPMM/lK6UWM10B0N7PXv1VH61bn282fDCJTlPl1oAnx1M4a7L4gil8TfoFjsQ
	 iVfcXcyQtxu0uYmeY1b7SYwB+M4sNZA503rNTLJu8v4CS96dewxQfEwpGoxonNE1UD
	 oHexGvB6qDhY4uMQdSN2oSqoSJDEjKyxe/81ZFw57xUGZzbjaP+f27Ra/fasNu6OBb
	 WM28ie1HwprSTWcdnAgLoyl2lMvOYLFB2elGFwtEXUHNIZWCqXRj1ljrMziS8e1ANG
	 GZfkZqxF80cbxhl1M24mvpPioI6iktw7xFRqhgaZ6WZxkC8UdK2gEFDtGIp+74767j
	 ZTsZsRWmZENHA==
Date: Mon, 10 Feb 2025 15:53:24 -0600
From: Rob Herring <robh@kernel.org>
To: Crystal Wood <oss@buserror.net>
Cc: j.ne@posteo.net, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
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
Subject: Re: [PATCH v2 09/12] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
Message-ID: <20250210215324.GA1040564-robh@kernel.org>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
 <Z6kQpuQf5m-bXTyt@buserror.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z6kQpuQf5m-bXTyt@buserror.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_135327_602628_E3174772 
X-CRM114-Status: GOOD (  42.56  )
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

On Sun, Feb 09, 2025 at 02:31:34PM -0600, Crystal Wood wrote:
> On Fri, Feb 07, 2025 at 10:30:26PM +0100, J. Neusch=E4fer via B4 Relay wr=
ote:
> > From: "J. Neusch=E4fer" <j.ne@posteo.net>
> > =

> > Convert the Freescale localbus controller bindings from text form to
> > YAML. The updated list of compatible strings reflects current usage
> > in arch/powerpc/boot/dts/, except that many existing device trees
> > erroneously specify "simple-bus" in addition to fsl,*elbc.
> > =

> > Changes compared to the txt version:
> >  - removed the board-control (fsl,mpc8272ads-bcsr) node because it only
> >    appears in this example and nowhere else
> >  - added a new example with NAND flash
> >  - updated list of compatible strings
> > =

> > Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>
> > ---
> > =

> > V2:
> > - fix order of properties in examples, according to dts coding style
> > - move to Documentation/devicetree/bindings/memory-controllers
> > - clarify the commit message a tiny bit
> > - remove unnecessary multiline markers (|)
> > - define address format in patternProperties
> > - trim subject line (remove "binding")
> > - remove use of "simple-bus", because it's technically incorrect
> =

> While I admit I haven't been following recent developments in this area,
> as someone who was involved when "simple-bus" was created (and was on the
> ePAPR committee that standardized it) I'm surprised to hear simple-bus
> being called "erroneous" or "technically incorrect" here.

Erroneous because the binding did not say "simple-bus" was used. Not =

uncommon with the old .txt bindings.

Generally, if a bus has control registers or resources like clocks, then =

we tend not to call them 'simple-bus'. And '"specific-bus", =

"simple-bus"' gives some problems around what driver if any do you =

bind to. =


If you have chip selects, then you have config registers for those. =

Not really "simple" if you ask me. That being said, you could keep =

'simple-bus' here. I would tend to err on making the schema match the =

actual .dts rather than updating the .dts files on older platforms like =

these.

> For non-NAND devices this bus generally meets the definition of "an
> internal I/O bus that cannot be probed for devices" where "devices on the
> bus can be accessed directly without additional configuration
> required".  NAND flash is an exception, but those devices have
> compatibles that are specific to the bus controller.

NAND bindings have evolved quite a bit if you haven't been paying =

attention.

> The fact that the address encoding is non-linear is irrelevant; the
> addresses can still be translated using the standard "ranges" mechanism. =

> This seems to be a disconnect between the schema verification and the way
> the compatible has previously been defined and used.
> =

> And as a practical matter, unless I'm missing something (which I might be
> since I haven't been in devicetree-land for nearly a decade), Linux is
> relying on simple-bus to probe these devices.  There is a driver that
> binds to the bus itself but that is just for error interrupts and NAND.
> =

> You'd probably need something like commit 3e25f800afb82bd9e5f8 ("memory:
> fsl_ifc: populate child devices without relying on simple-bus") and the =

> subsequent fix in dd8adc713b1656 ("memory: fsl_ifc: populate child
> nodes of buses and mfd devices")...
> =

> I'm curious what the reasoning was for removing simple-bus from IFC.  It
> seems that the schema verification also played a role in that:
> https://www.spinics.net/lists/devicetree/msg220418.html

If a kernel change is needed to support changed .dts files, then we =

shouldn't be doing that here (being mature platforms). That would mean =

new DTB will not work with existing kernels.

> =

> ...but there's also the comment in 985ede63a045eabf3f9d ("dt-bindings:
> memory: fsl: convert ifc binding to yaml schema") that "this will help to
> enforce the correct probe order between parent device and child devices",
> but was that really not already guaranteed by the parent/child
> relationship (and again, it should only really matter for NAND except for
> the possibility of missing error reports during early boot)?
> =

> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - fsl,mpc8313-elbc
> > +              - fsl,mpc8315-elbc
> > +              - fsl,mpc8377-elbc
> > +              - fsl,mpc8378-elbc
> > +              - fsl,mpc8379-elbc
> > +              - fsl,mpc8536-elbc
> > +              - fsl,mpc8569-elbc
> > +              - fsl,mpc8572-elbc
> > +              - fsl,p1020-elbc
> > +              - fsl,p1021-elbc
> > +              - fsl,p1023-elbc
> > +              - fsl,p2020-elbc
> > +              - fsl,p2041-elbc
> > +              - fsl,p3041-elbc
> > +              - fsl,p4080-elbc
> > +              - fsl,p5020-elbc
> > +              - fsl,p5040-elbc
> > +          - const: fsl,elbc
> =

> Is it really necessary to list every single chip?

Yes. If they exist, they have to be documented.

> =

> And then it would need to be updated when new ones came out?  I know this
> particular line of chips is not going to see any new members at this
> point, but as far as the general approach goes...
> =

> Does the schema validation complain if it sees an extra compatible it
> doesn't recognize?  If so that's obnoxious.

Yes.

More annoying is having to boot and debug typos:

compatible =3D "foo,bar", "simplebus";

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

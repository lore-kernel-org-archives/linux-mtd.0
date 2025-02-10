Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4DFC02198
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 21:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0db6xeOeKx/4363tnEKQO3f2XMEIVU2SlYceZmxngE=; b=vnBmlt4dFVnWtU
	hrOBevuGD4oCm8JfHkEre9BvfczJbjCYCcdDOlhEX4xijavUE+Xj/rNvodZZsNLINj9TBhNEvfkL2
	DWsnidDugwtMbqgB6j6T7L1t41EOThGuDDGxz4wrOc8e4TS92LKA92uChhSoOwFIoW8P7ZnTBTzwx
	CJAoKH9kOnssUq4XuqD2D+GSI1PI5H3+NaFtNdmYK0rV/hZs6G6xIaSJBWWAMeCU7xxWqNe6vEbCY
	jBCSL45RSS1wL8HITmcZqt4yrJpHB1EAPp8x1U27etXFXmzE2eOthI+yK9dsHn5iAjqoZE+6l4B+d
	nhJERA1mi3pHZaKiwxqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbYD-00000001Y0a-2QBu;
	Mon, 10 Feb 2025 21:42:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbHA-00000001Tx4-24Nq
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 21:25:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12C99A4198C;
	Mon, 10 Feb 2025 21:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07006C4CED1;
	Mon, 10 Feb 2025 21:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739222707;
	bh=odzw75cV5CCw5F2vlG3P/t5VL3psVGoWe8Jb/yZ+oYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=okX4G/08PMaMILx+F7JidAMdoMWndseWORO9ude8E6aWFIxh17YXQ46LJnk2B5eaf
	 CsmusmqxJGdFmvFxiBt3uPj0Rk3r2oisfAITv+KHRCfLBjiL6BwomL+sTzmqCqwURA
	 l9TTcqCPGmkGodVb/N007KnsDnN5leSYWOswBK3NQ1SNmqKJnMiVqugPnYdUdoYpre
	 IF+Kyml+/75V34sBLta5+UFzTQDIfwZISfv9DJLnHSk6goxZ+SweEGrJsKADOs18/x
	 KSzQ+SLbbjMfXB81ZQ8UBYbOveDQExy9USZXdFkjmtEk9ORBlQqeTEwDSuzPL6iBCk
	 hMxOmsDQ+zv5A==
Date: Mon, 10 Feb 2025 15:25:06 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
	Scott Wood <oss@buserror.net>,
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
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 06/12] dt-bindings: pci: Convert fsl,mpc83xx-pcie to
 YAML
Message-ID: <20250210212506.GA1036627-robh@kernel.org>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-6-8137b0c42526@posteo.net>
 <Z6fxo4j5a6ro0f1w@probook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z6fxo4j5a6ro0f1w@probook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_132508_678759_F8B5D72A 
X-CRM114-Status: GOOD (  20.25  )
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

On Sun, Feb 09, 2025 at 12:06:59AM +0000, J. Neusch=E4fer wrote:
> On Fri, Feb 07, 2025 at 10:30:23PM +0100, J. Neusch=E4fer via B4 Relay wr=
ote:
> > From: "J. Neusch=E4fer" <j.ne@posteo.net>
> > =

> > Formalise the binding for the PCI controllers in the Freescale MPC8xxx
> > chip family. Information about PCI-X-specific properties was taken from
> > fsl,pci.txt. The examples were taken from mpc8315erdb.dts and
> > xpedite5200_xmon.dts.
> > =

> > Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>
> > ---
> > =

> > V2:
> > - merge fsl,pci.txt into fsl,mpc8xxx-pci.yaml
> > - regroup compatible strings, list single-item values in one enum
> > - trim subject line (remove "binding")
> > - fix property order to comply with dts coding style
> > ---
> >  .../devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml   | 115 +++++++++++++=
++++++++
> >  Documentation/devicetree/bindings/pci/fsl,pci.txt  |  27 -----
> >  2 files changed, 115 insertions(+), 27 deletions(-)
> > =

> > diff --git a/Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml=
 b/Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..57c5503cec47e6e90ed2b09=
835bfad10309db927
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml
> > @@ -0,0 +1,115 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale MPC83xx PCI/PCI-X/PCIe controllers
> > +
> > +description: |
> > +  Binding for the PCI/PCI-X/PCIe host bridges on MPC8xxx SoCs.
> > +  See also: Documentation/devicetree/bindings/pci/fsl,pci.txt
> =

> This is obviously a bit wrong; I ended up putting the information from
> fsl,pci.txt entirely under the fsl,pci-agent-force-enum property, but
> forgot to remove the reference to the old txt file.

Looks fine other than that.

Rob


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

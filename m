Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAC1C0219B
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Feb 2025 21:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:
	References:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RjTKA5MrsO6jhunyKFHvKuXV9LfKDe2MCV3R69ceqYs=; b=eitPYLjbhZlzL6
	YQdJOFGnHZDAjyevtl5sllbIoqVvLoHS7SBjSJCB+eONr+Rje5aFSjBF1YDjk5CMVfpM2kYFHYiC6
	qlkI4UzH5TyRimrTBHajgYi8m2qJBpW67R6joop+eExyLOju7y/wjoOFBHdQ7Ccnk8mf+p2W02qT1
	7nVd3tIqtGsCFPjBGnB+1whajON47WLGNYF8o2sV74LTPd2r4+/Azx/IkU1u/M0UwO2HsiMTSRUUg
	RgT2CW6VL6wUFuZ+T/yx0yDqOrzR/NUkyFW3Q7ILpe/Zvw8GwFMUe5aZ49MayO95sDD4zv2+rXrnb
	wpTcD2ps+EhJXxWHzVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thEQp-0000000FZ3A-26wG;
	Sun, 09 Feb 2025 21:01:35 +0000
Received: from baldur.buserror.net ([165.227.176.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thEQn-0000000FZ2a-0qIf
	for linux-mtd@lists.infradead.org;
	Sun, 09 Feb 2025 21:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=buserror.net; s=rsa_sel; h=Subject:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Cc:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MuELZahnfjB2zfNBXkn/7vS+YWEIHeJmEyTF3bHn8yY=; b=JwerkDeFpUYmUtvgiyfDWFRcyc
	M1SayaRB+qccNqxuZLeR/Bh0Zi4doXvs2AuwQ4bXULgliRwmuL+46mVeaEmUJnjt20xSeByKQCeF7
	pqQnatSRU4+zfcORETcgPqMoDuz9Ijk4jbJsPiKiaLEQcbpIHWc/P0F4c/jFvX5d56ebaA3NJGjAd
	XSH27+KqmV7Z5IMLaNqwxgX15BzUCAKWCpbNvQyD4qc8VY5U6w9qaUHRzKdRGVNRg0Fih8GzX5jbP
	YQTGOo2FWDlTffHnVVvamHnt6obLmm/skiwsWgFKjykOnhriFwqciL6UJ9O4Wfc6dQ7QoO2ga6o7N
	QoWK9LuQ==;
Received: from oss by baldur.buserror.net with local (Exim 4.96)
	(envelope-from <oss@buserror.net>)
	id 1thEFY-00C5fM-1y;
	Sun, 09 Feb 2025 14:49:57 -0600
Date: Sun, 9 Feb 2025 14:49:56 -0600
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
Message-ID: <Z6kU9G4u3BbBJn5p@buserror.net>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
 <Z6kQpuQf5m-bXTyt@buserror.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z6kQpuQf5m-bXTyt@buserror.net>
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: j.ne@posteo.net, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, krzk@kernel.org, imx@lists.linux.dev, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dlemoal@kernel.org, cassel@kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net, lee@kernel.org, vkoul@kernel.org, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com, j.neuschaefer@gmx.net, wim@linux-watchdog.org, linux@roeck-us.net, broonie@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, linux-pci@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, leoyang.li@nxp.com, john.ogness@linutronix.de
X-SA-Exim-Mail-From: oss@buserror.net
Subject: Re: [PATCH v2 09/12] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_130133_237765_5BCA628C 
X-CRM114-Status: GOOD (  18.49  )
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

On Sun, Feb 09, 2025 at 02:31:35PM -0600, Crystal Wood wrote:
> On Fri, Feb 07, 2025 at 10:30:26PM +0100, J. Neusch=E4fer via B4 Relay wr=
ote:
> > +        simple-periph@2,0 {
> > +            compatible =3D "fsl,elbc-gpcm-uio";
> > +            reg =3D <0x2 0x0 0x10000>;
> > +            elbc-gpcm-br =3D <0xfd810800>;
> > +            elbc-gpcm-or =3D <0xffff09f7>;
> > +        };
> =

> I know this isn't new, but... since we're using this as an example,
> where is the documentation for this fsl,elbc-gpcm-uio and
> elbc-gpcm-br/or?  What exactly is a simple-periph?
> =

> There are no in-tree device trees that use this either.  The bcsr
> node was actually a much more normal example, despite that particular
> platform having been removed.  There are other bcsr nodes that still
> exist that could be used instead.

OK, I noticed patch 10 after I sent this :-P

Seems I didn't like it too much when it was new either:
https://lkml.org/lkml/2014/12/9/530

And it's still a bad example for how GPCM devices on this bus should
normally be represented.

-Crystal

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

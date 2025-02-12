Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F44C021A4
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2025 19:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryQ/VIG2DYTBeSjaIRmQyObjaguCRh70SOULexRgAwY=; b=eM8vdcMuB2XZt7
	X+Tuu/RKxVnNtBPo2OYJ+eB0Jm3pFZzXhyZBeDOr1QkyzYmVSPdkKIbn/NpSmau04EcsxYzTdU2ny
	FCRQFy9xFu1JJ2u4jFIgi4rbulZF5OZFRL9Bnwy8b/EbpsRi4jM2LpClU2y15wGtTRytzMqK5JSKQ
	lpaN/rDKJkn2376wgRH52oHIbnS6Z/RpvIHSaTxvzFOVFQi8Q0RzM7l3SdVjO5hYewPgtVv241/lb
	Uw2xkNuXkxNxPnbMd2HyI2AHd1wtt0HM5RrEJvtlXxFl/0EPwU1xchgL0By7KCPVb7WB2M3AuvkxR
	A4dLTB4E75s658HYjPRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIfD-00000008g6V-1AL1;
	Wed, 12 Feb 2025 19:44:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIfB-00000008g6A-0QqP
	for linux-mtd@lists.infradead.org;
	Wed, 12 Feb 2025 19:44:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E4B5DA419C9;
	Wed, 12 Feb 2025 19:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F4DC4CEDF;
	Wed, 12 Feb 2025 19:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739389488;
	bh=H2RGuJeh4p3PZLsKQKPNVcfG0Duy/0Y8WKyJ2Dp59WE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oj8s8rQeyXI3HiYI0OHJHEumwjJXAFZetGXjJbiY2MBZzopmcHcKUK4kieSry0099
	 qNx36t4mGK0OktWld9GOqZAbfj+DEYDz5hjoqokREJb1aTsdxd+D0cVUSAKj2jXwkb
	 3Ikh8NfPF3xHwGEocZ2HwUUIauob/u7P6UYBy23gs43d4HX61Yu4L6kDfSazoHUPX9
	 dknlKOu2PHYVpYSotcaWJoEHB3rHjT04kQpWWayQrdoJJH64ADn0YGdfCxkDeRfeU/
	 NPBkKJBcXimLXoqBff+yziV//iNuFWxTlue95EVOH+6rBchwDwEvGyXEivB6zAwq2j
	 5BkKP+eNC7jZg==
Date: Wed, 12 Feb 2025 13:44:46 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Guenter Roeck <linux@roeck-us.net>, linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
	linux-watchdog@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-spi@vger.kernel.org, Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>, imx@lists.linux.dev,
	linux-ide@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mtd@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	dmaengine@vger.kernel.org, Scott Wood <oss@buserror.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Niklas Cassel <cassel@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Richard Weinberger <richard@nod.at>,
	Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v2 10/12] dt-bindings: memory-controllers: Add
 fsl,elbc-gpcm-uio
Message-ID: <173938948613.128569.16012047906715128997.robh@kernel.org>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-10-8137b0c42526@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250207-ppcyaml-v2-10-8137b0c42526@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_114449_206193_EF2F9A3E 
X-CRM114-Status: GOOD (  10.82  )
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


On Fri, 07 Feb 2025 22:30:27 +0100, J. Neusch=E4fer wrote:
> Formalize the binding already supported by the uio_fsl_elbc_gpcm.c
> driver.
> =

> Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>
> ---
> =

> V2:
> - split out from fsl,elbc patch
> - add description
> - remove "device_type" property
> - move to bindings/memory-controllers
> ---
>  .../memory-controllers/fsl,elbc-gpcm-uio.yaml      | 59 ++++++++++++++++=
++++++
>  1 file changed, 59 insertions(+)
> =


Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

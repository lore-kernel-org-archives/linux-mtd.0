Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114B8C02191
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2025 04:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JTPam0b5W1pYuEX5Krzd9bjor8mis/XfUUH46gAQOfw=; b=XkvODuGfXo2Pfo
	JXaqE/K1EFI62Udk/011V5NXk5I3O0jmzoNdnJfFEwxBxBlrHpyGhpgiE22m0LCsOBrNTKFeIcSwq
	rEsc32AhZH0zi6gS1RNzUn6ibE1PGrg8l9Rc88yc0kaPwLfE+v6LsB7oYWd8NcFccxBKvcdLzKd+C
	ZK9q7y157j55QcPGpaYp+PmFuUhkg+gPUFO7jIjqYOr9dWiNWYDoQQ97PCEpL0TQM8nM4PYR9D4yw
	8fvV9XM8+37ZyV6cgJ4g+DXF+Fsu4rWyRSDZFRx7keVVYlr0X5TbEqH3o+44AKKON35zE6qQLDKLy
	XUMHilSdC4UWJuKClKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcGwo-00000001dx4-1WLd;
	Mon, 27 Jan 2025 04:42:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcGwl-00000001dwX-2Fll
	for linux-mtd@lists.infradead.org;
	Mon, 27 Jan 2025 04:42:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C178B5C422A;
	Mon, 27 Jan 2025 04:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1E1C4CED2;
	Mon, 27 Jan 2025 04:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737952922;
	bh=7RQPPYx18JlZ50CfItwadjRZng2k8lf+GHrJCgW0IU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qrYmahB0F636L75RgPUrLxwR7KwywZjht6ZMLJWlp1dFhE7Jihu77/xMPP9kRdhpS
	 KHPAsLOQg2T3D/73CbIvksNqop9rM8onqD6VbxwZMVTaXn68kJfRnvoVgVmgbL+sx+
	 K6PY84jZ9c/YVC7vVjOSKnrLa2veVumMr2wasfmvGEE65fgjd/9YZ/qLhQaWhrPJX8
	 PS83Z4BeE7D2PMoZuYswAuZkAJtnNkhhReImAuPUwU30XHAlbwLMU2hJyvPBUehjk7
	 XAHMtm0Sn36T4yaaksKIikH1W83WXXS05LgjjPEYkntwQ6QjEM2l9YFbrfWVXRZp6d
	 llzr4d/cYd1Jg==
Date: Sun, 26 Jan 2025 22:42:01 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
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
Subject: Re: [PATCH 4/9] dt-bindings: mfd: Convert fsl,mcu-mpc8349emitx
 binding to YAML
Message-ID: <20250127044201.GC3106458-robh@kernel.org>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-4-50649f51c3dd@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250126-ppcyaml-v1-4-50649f51c3dd@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_204203_626751_ED3A033E 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

On Sun, Jan 26, 2025 at 07:58:59PM +0100, J. Neusch=E4fer wrote:
> Convert mcu-mpc8349emitx.txt to YAML and list the compatible strings
> currently in use.
> =

> Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>
> ---
>  .../bindings/mfd/fsl,mcu-mpc8349emitx.yaml         | 53 ++++++++++++++++=
++++++
>  .../bindings/powerpc/fsl/mcu-mpc8349emitx.txt      | 17 -------
>  2 files changed, 53 insertions(+), 17 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

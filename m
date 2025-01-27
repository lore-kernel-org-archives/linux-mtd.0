Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51213C0218C
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2025 04:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7CZ9TI+pyssiBbLVbyVcrPDAjbmjc//e+bRIi0uB/Q=; b=B+7+6oeLZHregG
	BMeO2JBhsoWLsltTT5DiSrrl8ylRc18EN9Gv+bJr3Z0jrxyGgdj08p0YLzGNGshZoRIXfy9gHVDHA
	I98dHqoGeOqVpti1XZ7/GHDfLk3HS6XSfAa+MKoNE6V4aRNrxuu17he9j5Bpoo2X/w2hjbj3QLREr
	uE2LN/fhdTy93ZQ1ofzv1Wp/HZ4E8W1YmmP9AbvkIu4IN28MlMvsYeTb+/+kvReQRAmPy2/WoO6kA
	VH3/87jk8/ndj0d58rthd1Et3LsCqfdmqeKC/M1pLnbBfi1N0AUYRwCQK3R5lw4jVCSgAi92simR0
	Gc5Q12W6rQK1lx3rcNiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcGf9-00000001cjr-2bjL;
	Mon, 27 Jan 2025 04:23:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcGf7-00000001cjK-1En7
	for linux-mtd@lists.infradead.org;
	Mon, 27 Jan 2025 04:23:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D16D5C062D;
	Mon, 27 Jan 2025 04:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B73C4CED2;
	Mon, 27 Jan 2025 04:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737951828;
	bh=miZrlNghDbxyTZzrKu3L8ab88Zt9rpvC1n4KYw977rU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EcrPn4L2165qqoi43IdQ1t9rM+v8XNG69QGvAvJ3iSoflVUZeAXt69KcSbRo686Be
	 ZkILmYE9nHp+zy6B4DbBnuZE5k39PftQDd4SkMfrhpXXVZM8z1mxUnSg8Uv3eHZ9Ep
	 FQmu6JtSGaKqI8JKmU99H8KpzLOMkxDnYJ5HsMCA2sfHQJdWcaN+8lG/KspJQIS+hP
	 Y5JxKllSRH0zn13yviPft9eA8GiVP/vlYDeI1PaK3ReKqgfyY2wRvfOJAaES98tuBK
	 lEgCNpGrS2XcJOskwkSyowom86AbjkrNxyoNb1AcXeRpPaKW+HFKFyq15Uo9Yl0+QE
	 I6vuL2F2uj0zA==
Date: Sun, 26 Jan 2025 22:23:47 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: linux-spi@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Scott Wood <oss@buserror.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	Conor Dooley <conor+dt@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Michael Ellerman <mpe@ellerman.id.au>, linux-crypto@vger.kernel.org,
	Niklas Cassel <cassel@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	"David S. Miller" <davem@davemloft.net>, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mtd@lists.infradead.org, dmaengine@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>, linux-pci@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH 1/9] dt-bindings: powerpc: Add binding for Freescale/NXP
 MPC83xx SoCs
Message-ID: <173795182667.3090530.5101657106637409770.robh@kernel.org>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-1-50649f51c3dd@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250126-ppcyaml-v1-1-50649f51c3dd@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_202349_375691_394BC94E 
X-CRM114-Status: GOOD (  10.23  )
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


On Sun, 26 Jan 2025 19:58:56 +0100, J. Neusch=E4fer wrote:
> Add a new binding for MPC83xx platforms, describing the board compatible
> strings used in currently existing device trees.
> =

> Note that the SoC bus is called immr@... in many existing devicetrees,
> but this contradicts the simple-bus binding.
> =

> Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>
> ---
>  .../bindings/powerpc/fsl/fsl,mpc83xx.yaml          | 67 ++++++++++++++++=
++++++
>  1 file changed, 67 insertions(+)
> =


Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

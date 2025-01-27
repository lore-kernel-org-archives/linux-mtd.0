Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D4AC02190
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2025 04:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e1+C5z3EJlQ31YjqQ252dtrNTQwSuVA9RKAiZ1LH7uE=; b=Tznqt3dYv2GJq7
	Vy36RBKX7hhXxYoH9KkVINNO/vmgctOr6RSve8059D6fwPGnjqIZC4V7FI+2BITc8Z4VoJ7GfXGle
	+qg7Cb5Thu9H+UD7kEwLlKLHCyW5V72aT83HLSJ193QqlC7mz2ZP808n/B+GTcn6UinZ2g7eFeUhw
	lvJivbYievmkwlSneTR79GGibWJb+lrn2RyvIBmzIhzoFXNgp4rUIOZR0oXt8/UO+tf4dcjz9nm7C
	GprXWHl+CPGGqSKuu9zhYOz1O+vXJ4OYmTVui+XamrP2GYnO6tnlCfNW7pVmYPbOsM8YL2gc7DPZY
	qO84Gckz6DejDJDDK3UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcH5q-00000001ev5-1L4f;
	Mon, 27 Jan 2025 04:51:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcH5o-00000001euk-1SVd
	for linux-mtd@lists.infradead.org;
	Mon, 27 Jan 2025 04:51:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 442725C477D;
	Mon, 27 Jan 2025 04:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E852BC4CED2;
	Mon, 27 Jan 2025 04:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737953483;
	bh=MP5quvHBDN7k35e6RGGtxX0t8y8u7jhKsU/FGhI5zdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lew5dHJXknFjzOW36Rib15BHiM3vLvNHrw4+kpJxAGzdWQz5Wq6HPBohWme5nANCz
	 piXRw8aSDn7kVz6tulHNLkQpmPqa1Tn1vtMN1SOOFSAOFgh64D4rPUYtUkLT/zqiD7
	 2wgbPJIDprlCiTfrmpva/60u0FRYruucYIVbBsVj0cww4ClYUV86AvgSR4LOGsA6E0
	 4N10dQycFwXGFCk0nAbHFIldS80TvjVzflSoPBGNS3CQYVT5enq13GgmgfpZwMybHq
	 eKc/FPstif+ganbHJP2xQMSfBCYI/O3hXVhd08UdlbKZXcq7cz4Bnj3NvwDbQa80o4
	 yF3B4YlkIt9hw==
Date: Sun, 26 Jan 2025 22:51:22 -0600
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
Subject: Re: [PATCH 7/9] dt-bindings: watchdog: Convert mpc8xxx-wdt binding
 to YAML
Message-ID: <20250127045122.GA3127337-robh@kernel.org>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-7-50649f51c3dd@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250126-ppcyaml-v1-7-50649f51c3dd@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_205124_429560_6F532A2B 
X-CRM114-Status: UNSURE (   9.56  )
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

On Sun, Jan 26, 2025 at 07:59:02PM +0100, J. Neusch=E4fer wrote:
> Convert mpc83xx-wdt.txt to YAML to enable automatic schema validation.
> =

> Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>
> ---
>  .../devicetree/bindings/watchdog/mpc8xxx-wdt.txt   | 25 ---------
>  .../devicetree/bindings/watchdog/mpc8xxx-wdt.yaml  | 64 ++++++++++++++++=
++++++
>  2 files changed, 64 insertions(+), 25 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

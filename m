Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495F7C83F26
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jul 2025 16:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNm9/vJJ3+H6JIs0VrOilkJCn10auBLSC+hhAYI5tXM=; b=fKV8JS7JyQfHEA
	xOGi7+kNL//22OhLe1Z2XD2s4WahJu2WafYKQ3hICmO4KhycqBesfRXf8thleC6wgpYZqo/yMXP3+
	N0XK68wxb9dOXUDYKKolM1wspoWDJt7RYq4M8a0eUNf1ftNzQFfl9Aa6EiY0hnD69hTX64RLIOPD1
	SGCHu2Oq8mwrfSE2nDCkC7b2k/KIOr2gdYoHLoeMfL/JpPil+wwD1HMy84pdEvaAMfws1oHUZCg/k
	6xTajE/76lozgzg1QzsSunRt21zIHyg6tmgyFH+STVG972gSfwIsoBVZUNLwlr50AzOCNxyC8oO2V
	x3VzP2Iql35hismW/prg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtfy-00000000EB5-02dB;
	Mon, 21 Jul 2025 16:47:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uds3j-0000000029t-0wrP;
	Mon, 21 Jul 2025 15:04:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 795DF4592D;
	Mon, 21 Jul 2025 15:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7ADC4CEED;
	Mon, 21 Jul 2025 15:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753110246;
	bh=FLrgL/2CQHP/2rDn4k8Q9+fTGuPnmR1UdDZyhqyII30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DsNd9AKHEl+5WkV7edBAvBM4qUfQGgPFJ/0UEUsVYqkGNqOYXvpZHTqQ0xrOpYHbw
	 WMAFA8BP4vQxeWzIGwNtCBT3/VqQMvFIJ2XqTFKX12vGbfx8PFPUnTnonzso5vT9VM
	 Hmu+g5eCLqDXj4O8P4gj3OLbmhs/h0wx4BLpwErG/EBzWL9FA8XBxtVoemQg2PmSC1
	 dFazGm3Yn93j6sykZ6I+sJ6Qq4WGi6M1vsWn9Zn7lfrW7PlIRFsmqK+fTW83UcTcDn
	 dUL9vjL0rB92sheTqOMpWuBVC/T5RIUBG46TjUiOQmlSq+ucs86spaxg+txZmV2c5D
	 gFHHEAmmPB9Kg==
Date: Mon, 21 Jul 2025 10:04:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-spi@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>, sophgo@lists.linux.dev,
	Chen Wang <unicorn_wang@outlook.com>, linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Michael Walle <mwalle@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v4 1/4] spi: dt-bindings: spi-sg2044-nor: Change SOPHGO
 SG2042
Message-ID: <175311024481.634831.11395873009603964562.robh@kernel.org>
References: <20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com>
 <20250720-sfg-spifmc-v4-1-033188ad801e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250720-sfg-spifmc-v4-1-033188ad801e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_080407_287128_BD0C4F8B 
X-CRM114-Status: GOOD (  10.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On Sun, 20 Jul 2025 16:31:43 +0800, Zixian Zeng wrote:
> With further testing, directly using the spi-sg2044-nor driver on SG2042
> does not work. SG2042 is found to lack full compatibility with SG2044.
> SG2044 has OPT register and it's necessary to write but SG2042 does not.
> Due to other possible hardware detail differences, it is better
> to bind SG2042 independently.
> 
> Fixes: 8450f1e0d3d0 ("spi: dt-bindings: spi-sg2044-nor: Add SOPHGO SG2042")
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

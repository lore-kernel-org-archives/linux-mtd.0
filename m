Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05B6C83000
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jun 2025 07:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HTFEIzZOP8vTZHdRivecJHH1ERmo98INKf1zl2MXmvk=; b=YO+1hEA0BkqRyO
	GLBr0SZ7Oedlu0EW9w83EdodhMApJXrvBCgyBEoFFnN8IYXfqqprFMot6X/q6QNpxT/NcCrdxsrir
	DxEvLpiDkTQsJGdlHmBZAhtsLOWfxyVxm9QruvTLvFsfQA4+TnzJL2QENdPPZcoDmPfN4skKTwm/z
	dr0GPIFHrcUo89CXgcjzgAssV42w3cklCSO8LtOhPWeH7wouhcmyQQ8qcmMz47rrSasqAFy+MLGTa
	cepyGBS+WUYZol/j7TVr/BGm9DYgYtZVmPL5Zo95B34kD+dk+IGSiX1A7W2SCGtl5FqAYW4kwB3vX
	J+RZbi85zmizl9gbJfnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8lQ-00000001QZ1-246A;
	Mon, 30 Jun 2025 07:17:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8lN-00000001QXu-3ls2;
	Mon, 30 Jun 2025 07:17:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD84244F76;
	Mon, 30 Jun 2025 07:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E90C4CEE3;
	Mon, 30 Jun 2025 07:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751267832;
	bh=8LwWcL/hfZA2j32lefUf/CPEs9K2wl3Sf8cyvU/E/lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wz0GRQRdQNz5Yif1YOcTtRFUXi1c6JVSR0V2aLYHWbLenFhxyNnL2akbcAoHXNjqe
	 QyKC8Anw39HPGPdy1RteDRZZS9FdiWHwn1L/iV3wO7SoaCFksdmKkpQXsWY/XZuqRs
	 g+OwUb6xvSKSzVKb9PpPFd7rkEzN7S5VHEK4tEHvJm2b4Sel5X19rLn/VyZeE03gOB
	 BwmDIyTwptn00LersUVi4kBO/CqhtCw621lr5HMT4z2ZxXgCCNhN8gopaAY4t8r1W2
	 l+5WAsKZQ4ZVhimRZzsyyzJ3wmh9/OebkB/uxpxj9odU3esMhC3Re0hQ2P7xoYm9Xr
	 wTuOB0cC1LfTg==
Date: Mon, 30 Jun 2025 09:17:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Longbin Li <looong.bin@gmail.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/4] spi: dt-bindings: spi-sg2044-nor: Change SOPHGO
 SG2042
Message-ID: <20250630-ancient-quail-of-joy-effd60@krzk-bin>
References: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
 <20250629-sfg-spifmc-v3-1-28db1f27e999@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250629-sfg-spifmc-v3-1-28db1f27e999@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_001713_953974_3590D1BA 
X-CRM114-Status: UNSURE (   6.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Jun 29, 2025 at 04:23:10PM +0800, Zixian Zeng wrote:
> SG2042 is not fully compatiable with SG2044,

Typo, run spellcheck.

> So it is necessary to become independent const

No capital letters after ,. Anyway, explain why it is not fully
compatible.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

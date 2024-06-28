Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA514C2BBCA
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 06:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/L9dNBxuvNJdUJ7b9/yTctCxVYEE3TiWepCyq59CxDg=; b=od+SfddLCcyvaM
	iF8btcih16uH37IQgS+MvPOdrKOCoZfqvnRRrPIgWC8ZZyR2jnZ8pLWImBRmlLXzwaibnqtUwp61y
	bKdqgsIzRIQR8yMOHaH0rn7qa+bL0YG5u04lDHauZW0ZbQoSJm6bPJKY6StSdod+qr2omvPp8UtFn
	9d/sHCfASHHY2O5xWeRkKOvSQpNf3GaLvx/eNRxOt5z7ebINBaVTQMd8aYqYA5KLfgSQjhwkWBcee
	wIMqDRDh+ne2Od48V8a/0yq3sGz8XzZUNUMOFnSLuBOJfY2JME5oevUZ5S8EOkDgvyLCFq7wbCSQw
	zCj156e0JBC8d9uE3ovw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN5YR-0000000CpWD-0NI5;
	Fri, 28 Jun 2024 06:57:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN5YN-0000000CpVn-3zRh;
	Fri, 28 Jun 2024 06:57:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 29C9861DE3;
	Fri, 28 Jun 2024 06:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8CAC116B1;
	Fri, 28 Jun 2024 06:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719557869;
	bh=58lZCQAq4UI2kPsnIOyCJhEWm6AHR55RqFIhoOvy+cA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zp6CluURowv+K0o/6F/MgxegIwLdBw2CY+SGJlzU3KpAFthCGzF5BdRqDhOX9fqA4
	 6t4b9L4J09XsfQ9CJ+lFuJpKnCdsOjuvXVwRyHnP01vP9BLlw5o6QxJBiFMolGBdOV
	 slZCTHTdDEmylt+etBWz6a3fIBVZBAWbN6PHcQjAC2NlCpNeIJISJn8bx3tparFCKS
	 1hQ/eZI6WuJS5OlEtQb/0au/AZDl+wqO3YNyssROZqexkI3jDED6pT5dn6x3M/6I0A
	 zuf07R+KZNWcUj3g8IyIPslcD3Fc30WwNBShmdFFG43vXx8MdIH+vY4RpRt8ZS5+jK
	 dciT+YC/UsdFw==
Date: Fri, 28 Jun 2024 12:27:45 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rahul Tanwar <rtanwar@maxlinear.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: intel,lgm: drop inactive maintainers from
 intel
Message-ID: <Zn5e6fPR5UkbPhdQ@matsya>
References: <20240626101809.25227-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240626101809.25227-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_235752_087729_F3CABE94 
X-CRM114-Status: GOOD (  11.52  )
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

On 26-06-24, 12:18, Krzysztof Kozlowski wrote:
> Emails to chuanhua.lei@intel.com, mallikarjunax.reddy@intel.com,
> yixin.zhu@intel.com and vadivel.muruganx.ramuthevar@linux.intel.com
> bounce with the same message:
> 
>   Your message wasn't delivered to Yixin.zhu@intel.com because the
>   address couldn't be found or is unable to receive email.
> 
> The Intel LGM SoC was apparently part of Home Gateway division which was
> acquired by Maxlinear, so switch maintenance of affected bindings to the
> only known non-bouncing Maxlinear address: Rahul Tanwar.
> 
> I do not know if Rahul Tanwar or Maxlinear want to maintain the
> bindings, so regardless of this change we should consider bindings
> abandoned and probably drop soon.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/intel,cgu-lgm.yaml    | 2 +-
>  Documentation/devicetree/bindings/dma/intel,ldma.yaml         | 3 +--

Acked-by: Vinod Koul <vkoul@kernel.org>

>  Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml  | 2 +-
>  Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml | 2 +-
>  Documentation/devicetree/bindings/phy/intel,lgm-usb-phy.yaml  | 2 +-

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

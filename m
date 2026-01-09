Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA870D167ED
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 09:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/0MX9F/ePdDttbCpTWr09JP9ug0c3EYKniCMJ17OCqQ=; b=uHl4xa6O0TPwVa
	uMf4MtZkBgT9dHDj9JXXyIHfsP0C8Xw8JIP75AEOg0W5zYK9ku5Z0oUyCPXKM+gJpBCzaRgzokQ9H
	xAyjgW400EwBap0YwGqn7RKDAYeuBcC6X0gI2upRf7wuH/ILw7A67gfg125YPkasX6f4y+HDnu+kq
	HEQP6TY3wIvn5qx6GB2hAzg2dhh4zKdJHXwQ3v2yjOth7SAn64R3fhbNhnLlTWnIxA54DNaFnkhx7
	7MuZzADxumzsMWTn0mCVmctXsrLVbzRKeP6AJSzw944ISoiprGU967oWPA9BwUBbuvPvikbaVCWnd
	ti4Rpa6PTivU3WET/O6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8vK-000000022FG-04wc;
	Fri, 09 Jan 2026 09:36:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8vI-000000022F1-3ss9
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 09:36:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7930560163;
	Fri,  9 Jan 2026 09:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E26C4CEF1;
	Fri,  9 Jan 2026 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951406;
	bh=KbbH+ZwfSvrSqtK4kL/K3r5o8gMgqXyODhycXl6OaeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SfiCrGxLuACvgGefuyzVhDRM0+w9dazE12b+FryR6C9q/i/gAMWjXRNuFqvjtujO3
	 6vqWFwH4wemaFz/c9Pm+sh+H9jsD8LGSO7ikBibgfl54gw+k23VBfmygzfaqe2JmdY
	 W+7bHN1JMxRHMnD+0tEm9pSJ/4+TWmbPFKzza3xo9ivBl71UtSO46Z7BbimDWVEqvT
	 jXwnNPrv+3MYuOi/1lhk3l/b8OvPnJpWSb/PIPCywJWlzYKEE1fQvGjCIZj53/CU5H
	 TUqvvTm/q09ld8Y63ix04g0ZpUnGtxYOG0OaZ/5JI5wE1WM/EDaAJYJqzjEJUkbt+d
	 clF5/EDwnXelg==
Date: Fri, 9 Jan 2026 10:36:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Simon Glass <sjg@chromium.org>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Roger Quadros <rogerq@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 07/10] dt-bindings: mtd: Ensure partition node properties
 are documented
Message-ID: <20260109-affable-poetic-albatross-ff7fcf@quoll>
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
 <20260108-dt-mtd-partitions-v1-7-124a53ce6279@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-dt-mtd-partitions-v1-7-124a53ce6279@kernel.org>
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

On Thu, Jan 08, 2026 at 11:53:16AM -0600, Rob Herring (Arm) wrote:
> Partition nodes without a compatible have no restrictions on additional
> properties. Fix this by ensuring 'unevaluatedProperties' is set when
> there's no compatible property. If there is a compatible property, then
> there should be a specific schema for it which will enforce
> 'unevaluatedProperties'.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mtd/mtd.yaml               |  8 ++------
>  .../devicetree/bindings/mtd/partitions/fixed-partitions.yaml |  2 +-
>  .../devicetree/bindings/mtd/partitions/partition.yaml        | 12 ++++++++++++
>  .../mtd/partitions/tplink,safeloader-partitions.yaml         |  2 +-
>  Documentation/devicetree/bindings/mtd/partitions/u-boot.yaml |  2 +-
>  Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml   |  2 +-
>  6 files changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
> index e56dba83f00a..5a2d06c96c0d 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
> @@ -36,12 +36,8 @@ properties:
>        - compatible
>  
>  patternProperties:
> -  "@[0-9a-f]+$":
> -    $ref: partitions/partition.yaml
> -    deprecated: true
> -
> -  "^partition@[0-9a-f]+":
> -    $ref: partitions/partition.yaml
> +  "(^partition)?@[0-9a-f]+$":
> +    $ref: /schemas/mtd/partitions/partition.yaml#/$defs/partition-node
>      deprecated: true

This makes partition@ deprecated. Looks unintended or needds commit msg
explanation.

>  
>    "^otp(-[0-9]+)?$":
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
> index 26bef777353d..4d79f786fcd5 100644
> --- a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
> +++ b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
> @@ -33,7 +33,7 @@ properties:

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

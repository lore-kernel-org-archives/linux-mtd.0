Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F11CD11BF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2024 15:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HrFp+SSIv3dlkiZWRU4cx52/idC05DqIBENCSW7//Dw=; b=hoROa0mcHiiyj+
	IycKQG97LEkc24/NoSF7n464zj0tC/a6J3Nvocm/WRNMw4ksMYxAkCaR+SCZELl/d+6car5hWyXKU
	brUHWxP70TO4/Aoy08VDRs+GUgHyBP3kqrKQEKR/ZgPsBl3A36CuzmSQWGf32OagGNV4IRSngqVbM
	lNobQCMrHi8j+KyZn9RIQ6DvO5q/TtgQxcxYTnkbStkoyqGM+0PzeN8UEd6Y4cDBoR5lTUu5LuQjT
	ZXgt/aG+4lhoMkZSQcj1U/N/58oqpFLOB+1LBeRDfPrAFe3m7xxIRWrDWK1Zc1C4M6S/2VqXfYrQv
	I9PSO+P4/cZa4PLARmnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmy3i-000000007wx-3ryR;
	Wed, 20 Mar 2024 15:40:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmy3g-000000007wJ-04fL;
	Wed, 20 Mar 2024 15:40:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 456F36100C;
	Wed, 20 Mar 2024 15:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF305C433F1;
	Wed, 20 Mar 2024 15:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710949251;
	bh=KlXhLA7jIC561PndfhSf5vnkReqlBqG0xxTFqREv5dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jY37uWiqccKwyj18FIwjJkrXWW35vH2u+7rWTyhP/OGKf7P6TEtT+696WF989/cmj
	 kbVLQ9v1N+g0OpW6EwZ4bD7ytJwkhuMXJ0MNfk+INVj/8KkzA8y0T6wSvenVT/UGn6
	 t//2ht6oFHVqHZufIv1ORUPpSqnMQsj+zztLBjkhbtVs4BFHWzOiHnz80RNUhOMMUL
	 odmRPmh5tSCWi35gd/3tNJdU+fxqUbLobDIppOAKWNYmrYEHLOsZiw/HpNNCvCzJo4
	 QqIhR3Qkuim8RBkGl7WcjqDv9ynfdfP4elOhpl0cslA00gTGdMZzFknKndW4vu3BHb
	 Z8Za8tp1lnVJA==
Date: Wed, 20 Mar 2024 10:40:48 -0500
From: Rob Herring <robh@kernel.org>
To: Manojkiran Eda <manojkiran.eda@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	patrick.rudolph@9elements.com, chiawei_wang@aspeedtech.com,
	ryan_chen@aspeedtech.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	conor+dt@kernel.org, vigneshr@ti.com, richard@nod.at,
	openbmc@lists.ozlabs.org, joel@jms.id.au,
	krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com,
	jk@codeconstruct.com.au
Subject: Re: [PATCH v2 4/4] dt-bindings: aspeed: Add eSPI controller
Message-ID: <20240320154048.GA1777957-robh@kernel.org>
References: <20240319093405.39833-1-manojkiran.eda@gmail.com>
 <20240319093405.39833-5-manojkiran.eda@gmail.com>
 <bad5df79-e040-4868-9db6-701110894ea3@linaro.org>
 <a9faa9b4-9bf6-49b6-b7eb-f642e2d261c3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a9faa9b4-9bf6-49b6-b7eb-f642e2d261c3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_084052_403528_61BFE6F1 
X-CRM114-Status: GOOD (  16.00  )
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

On Wed, Mar 20, 2024 at 03:29:15PM +0530, Manojkiran Eda wrote:
>    On 19/03/24 3:26 pm, Krzysztof Kozlowski wrote:
> 
> On 19/03/2024 10:34, Manojkiran Eda wrote:
> 
> This commit adds the device tree bindings for aspeed eSPI
> controller.
> 
> Although aspeed eSPI hardware supports 4 different channels,
> this commit only adds the support for flash channel, the
> bindings for other channels could be upstreamed when the driver
> support for those are added.
> 
> Signed-off-by: Manojkiran Eda [1]<manojkiran.eda@gmail.com>
> ---
>  .../bindings/soc/aspeed/aspeed,espi.yaml      | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yam
> l
> 
> diff --git a/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml b/Doc
> umentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
> new file mode 100644
> index 000000000000..3d3ad528e3b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
> 
> Why Rob's comments got ignored?
> 
> This is not a soc component.
> 
>    I did not mean to ignore, i have few reasons listed below that provides
>    information on why i felt this belongs into soc.

Fix you email program to not send multi-part (txt plus html) emails. 
Plain text only on maillists.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

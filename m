Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F5EC44512
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jul 2026 06:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWOLDS2CWNPAepF8HT9cJZ2W6zMhXkMUll4mpgpjvX4=; b=HmQa2LNDVasFPw
	YjXBQ0Rs2C3XEpBSY7b2KxFMV3O+CRO2mcGOXP4AW39pAasxTGFiaoKK93e48Th63mkNPcxjAdV1n
	IBxminSRk/b8KGroMZRcZINzVlP0Gpr/C33/TvhAa7SgFTkBZpLTxUUjgUGb7jIX/6budK9bkO+/t
	kYo4rksdH/Sza+bvMexAacWdcJSMIUlF+S/ZAW8lhG6KzICGlzXCXue1Wd8Pe1nKN8xEJu7TqM0TT
	q6domOiZVMCoogA3BxqGystyX4qXs1PfIwQe3JMdq61DupNMZ6buqrZafKHMz4/+V69z4VKK55Apj
	IY09gG/Q/C5KDDYvO2Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlLOt-00000004nlv-3QO1;
	Sun, 19 Jul 2026 06:53:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlLOr-00000004nll-2rgJ
	for linux-mtd@lists.infradead.org;
	Sun, 19 Jul 2026 06:53:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E19540F1A;
	Sun, 19 Jul 2026 06:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C021F00A3E;
	Sun, 19 Jul 2026 06:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784444001;
	bh=H9bU0jaGp9KqUqIiVsAPXWevijefHkMwfYOWuKZZ/qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BFvUDkXZBui/cw+F7d16legvLReHOuiM77oYX2JJe4qZye9IrdJjSyUsIti1UdghQ
	 h9Qbk4lKb06Mw6ncUyz780q6Ovfet7KpZtUiKUKtDZDERoYoHf7wH6UI/4HX1SItcl
	 PZvM0Idbhn+1kmxCVpIYi93qH7aOt1ci3KXG12uJfuvS+N8frzCOc7/12CgJA/5uFF
	 XHpgxS2NFLJjjMaOVl6X+XwbEL8hTBfSNpyh2s0A3qsKFrMk2jbT5lXwNqmWyJ9Dyh
	 FF4RK98Bi6k+lTomQChZG1UpGK6/dm0qc6D94O3UgHc3CjfmlqnVfEcZklm8gXP4qV
	 RUi103cjNhpEw==
Date: Sun, 19 Jul 2026 08:53:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, praneeth@ti.com, u-kumar1@ti.com, a-dutta@ti.com, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 01/17] spi: dt-bindings: add
 spi-max-post-config-frequency-hz property
Message-ID: <20260719-camouflaged-unyielding-sawfish-b6fd09@quoll>
References: <20260717185116.2065505-1-s-k6@ti.com>
 <20260717185116.2065505-2-s-k6@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260717185116.2065505-2-s-k6@ti.com>
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

On Sat, Jul 18, 2026 at 12:21:00AM +0530, Santhosh Kumar K wrote:
> Add spi-max-post-config-frequency-hz, a generic property for SPI
> peripherals that operate at two distinct clock rates: a conservative
> rate always reachable without controller configuration, and a higher
> rate achievable only after controller-side configuration.
> 
> When both properties are present, spi-max-frequency gives the
> conservative pre-configuration rate and spi-max-post-config-frequency-hz
> gives the higher post-configuration target.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
> ---
>  .../devicetree/bindings/spi/spi-peripheral-props.yaml        | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> index 880a9f624566..12211f8c9f7d 100644
> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> @@ -45,6 +45,11 @@ properties:
>      description:
>        Maximum SPI clocking speed of the device in Hz.
>  
> +  spi-max-post-config-frequency-hz:
> +    description:
> +      Maximum SPI clock frequency in Hz achievable after controller-side
> +      configuration.

How did you implement my feedback?

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76704EB64D9
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jun 2023 06:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDs5pboqW6tPWFzKGXuWZPRbJPWWgrtXhvM6BxrqBrA=; b=D3rNOmT1/jSqEUaSuJX18pqOE+
	Id/EWeeGbMZOXThqERTxCy/Mj6hC86hphRUpFxTY/kiPXJ8NL0OPNIAG48r5YxQgxa16h2EmRL928
	qNxRgjBwY3HK0rXiyHnfZfO24rw7mqUYN6MXdbtWWI7MgiRJlE+Zow4FOVCk1l5f2WrDYmxC9fz1x
	31o7Ksde7xc7wbznjmaszZYk1QaMjpMeRHusi6Uwzt7fMlHbZjwC03OHs1rtP3PbkJwPCWtjS8rLb
	IVgUMxtIUTn8nBwCVx0UhMO+d+R7UttAlyAuS+rLr5ocY86asJ/KC/hUqAeEcyYIo88Giof4CjD3T
	ZvRPXbuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE1sH-00C43X-1J;
	Tue, 27 Jun 2023 06:08:25 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE1sD-00C3w1-0Y
	for linux-mtd@lists.infradead.org;
	Tue, 27 Jun 2023 06:08:23 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id CA9BFBF3;
	Tue, 27 Jun 2023 08:08:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1687846089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AZI7i8mJ6vzWRz8q5uNF1QNgSOG0ThKzt12UTgm9PcA=;
	b=L3mZn4f2JH8rxdmXJX1Bz1uoCvsHRZd943LAmn3EvSI0Ydsk7RPFzNom2Tcp/7NwvUUt4g
	qIV6Ri6QXBAe8hfdgdZD0D9L/mgBxCIAe2E0CZNYkfm9e3L/N3X+BHaZSCfNvv00fHNwPP
	hd7NAZdNQO4YLhif+8qul7M2no3blLa2IDU8M+b0Ri5vPdKgVdmL3cfqQ07x7ekrmFTj2F
	TPD5I/3rHyVaMq5u9b2zM/Vps3E8egvNoszEIQxnTylJ3liO1wiO9Kg80FMbUN41/xaGwk
	rnSQ815ESwq35W70Aqj1NIMy6dgqnKI0v63Kh8Gj2rjuJ21Fzh5CZef5C6DUMA==
MIME-Version: 1.0
Date: Tue, 27 Jun 2023 08:08:09 +0200
From: Michael Walle <michael@walle.cc>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 git@amd.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, amitrkcian2002@gmail.com, Amit Kumar Mahapatra
 <amit.kumar-mahapatra@amd.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: jedec, spi-nor: Add DT property
 to avoid setting SRWD bit in status register
In-Reply-To: <20230625100251.31589-2-amit.kumar-mahapatra@amd.com>
References: <20230625100251.31589-1-amit.kumar-mahapatra@amd.com>
 <20230625100251.31589-2-amit.kumar-mahapatra@amd.com>
Message-ID: <0e76360e43c411424e361911adbe1e0c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_230821_784241_E7E4D71D 
X-CRM114-Status: GOOD (  21.33  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2023-06-25 12:02, schrieb Amit Kumar Mahapatra:
> If the WP# signal of the flash device is either not connected or is 
> wrongly
> tied to GND (that includes internal pull-downs), and the software sets 
> the
> status register write disable (SRWD) bit in the status register then 
> the
> status register permanently becomes read-only. To avoid this added a 
> new
> boolean DT property "no-wp". If this property is set in the DT then the
> software avoids setting the SRWD during status register write 
> operation.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
> As the DT property name has changed so, removed Reviewed-by tag.
> @Cornor if possible, could you please review this updated patch.
> ---
>  .../devicetree/bindings/mtd/jedec,spi-nor.yaml    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml 
> b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 89959e5c47ba..97344969b02d 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -70,6 +70,21 @@ properties:
>        be used on such systems, to denote the absence of a reliable 
> reset
>        mechanism.
> 
> +  no-wp:
> +    type: boolean
> +    description:
> +      The status register write disable (SRWD) bit in status register, 
> combined
> +      with the WP# signal, provides hardware data protection for the 
> device. When
> +      the SRWD bit is set to 1, and the WP# signal is either driven 
> LOW or hard
> +      strapped to LOW, the status register nonvolatile bits become 
> read-only and
> +      the WRITE STATUS REGISTER operation will not execute. The only 
> way to exit
> +      this hardware-protected mode is to drive WP# HIGH. If the WP# 
> signal of the
> +      flash device is not connected or is wrongly tied to GND (that 
> includes internal
> +      pull-downs) then status register permanently becomes read-only 
> as the SRWD bit
> +      cannot be reset. This boolean flag can be used on such systems 
> to avoid setting
> +      the SRWD bit while writing the status register. WP# signal hard 
> strapped to GND
> +      can be a valid use case.
> +

Sounds good! Thank you.

Reviewed-by: Michael Walle <michael@walle.cc>

-michael


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

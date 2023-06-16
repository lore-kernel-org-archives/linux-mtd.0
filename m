Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123C1EB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jun 2023 09:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WF5igIytiGG0xnNYouxJLqJVw5C/fVD6ZnPm+shPO6w=; b=iqR8OK77+F6nMqfH8zHy/Th0Dt
	/TgWnoBhD1gaMz9OVHsacYzz7n3KDkuXXKDMIReKi1qq6THx6swmq4xy4ZS0nw6d+j7Lu2qJ9zqV8
	mUNUvBl5qXBigSh+9Aa/iN3br6sHFSQlkhV6nZ28+CZ9tCBNxS0Q86YUOeTwlxKZq7MT/ghL85bye
	XspuZZ+OjWgBh7D0CIHXVOcFVdlltTYrYv5rJjZf9kbJhKoD6wy/XDpjoNqg7CfncvcFTAterm04r
	3dK+8MwGG0TJ5xkopWlChie/lQF5R4cmMGxWIia/Fue7kZ/shu3lkfAA/bdXKoJsK3OtA+Clsh6px
	sBzsDH3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA67J-00HVrz-2h;
	Fri, 16 Jun 2023 09:51:41 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA67F-00HVoo-2r
	for linux-mtd@lists.infradead.org;
	Fri, 16 Jun 2023 09:51:40 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id E4FE21230;
	Fri, 16 Jun 2023 11:51:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1686909088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W59P54ZQm4yLfNN4lYHed/UxX8Xd4Uj8ugKkX1f9adA=;
	b=UdWowJ0ZfVpq05woisOR+GhHljah1MbXIyLobDSQb/sDahAnSmch4ntx11HZ4w/WCHL64R
	soewo4QkKX9RIGkFt6yaHydt4hAT1zyml8RtYcd1CjyrKKjDXF4dCRnV5u/8xKso5sZcoF
	BfaqGv4BjebsBMFHrcSwwteqV47H9TwsEKQ7yovH1HHtLlRucJy+x65pqho1D7CvIjP9lv
	AtEzQk0z0iuGvdCW7SroaaF7EgPnNwsVVsYdS0Wh6B/9F4lyP8MsdmVWT0B8BttS7ZNTHx
	w4bNoEOG1cD7c/TgJsHXhO6NDoniYqOupYpzCzysYeQK1CtPp896yoqmjrFISA==
MIME-Version: 1.0
Date: Fri, 16 Jun 2023 11:51:27 +0200
From: Michael Walle <michael@walle.cc>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 git@amd.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, amitrkcian2002@gmail.com
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: jedec, spi-nor: Add DT property
 to avoid setting SRWD bit in status register
In-Reply-To: <20230616085513.17632-2-amit.kumar-mahapatra@amd.com>
References: <20230616085513.17632-1-amit.kumar-mahapatra@amd.com>
 <20230616085513.17632-2-amit.kumar-mahapatra@amd.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <f1d065e98d7b0d115e6a2a562a2a5c68@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_025138_101228_B1D4073E 
X-CRM114-Status: GOOD (  25.44  )
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

Am 2023-06-16 10:55, schrieb Amit Kumar Mahapatra:
> If the WP signal of the flash device is not connected and the software 
> sets
> the status register write disable (SRWD) bit in the status register 
> then
> thestatus register permanently becomes read-only. To avoid this added a 
> new
> boolean DT property "broken-wp". If WP signal is not connected, then 
> this
> property should be set in the DT to avoid setting the SRWD during 
> status
> register write operation.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/mtd/jedec,spi-nor.yaml    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 89959e5c47ba..10a6df752f6f 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -70,6 +70,21 @@ properties:
>        be used on such systems, to denote the absence of a reliable 
> reset
>        mechanism.
> 
> +  broken-wp:
> +    type: boolean
> +    description:
> +      The status register write disable (SRWD) bit in status register, 
> combined
> +      with the WP signal, provides hardware data protection for the
> device. When
> +      the SRWD bit is set to 1, and the WP signal is either driven LOW 
> or hard
> +      strapped to LOW, the status register nonvolatile bits become
> read-only and
> +      the WRITE STATUS REGISTER operation will not execute. The only
> way to exit
> +      this hardware-protected mode is to drive WP HIGH. If the WP 
> signal of the
> +      flash device is not connected then status register permanently 
> becomes
> +      read-only as the SRWD bit cannot be reset. This boolean flag can 
> be used
> +      on systems in which WP signal is not connected, to avoid setting 
> the SRWD
> +      bit while writing the status register.

This is not true for all flashes, for example, Macronix flashes seem to 
have
an internal pull-up, so if the pin is unconnected H/W write protection 
is
disabled.

So maybe only mention that "if the pin is wrongly tied to GND (that 
includes
internal pull-downs) or it is left floating".

Same goes for your comment in the driver code. Sorry for nitpicking, but
I fear some misuse of this property to disable the locking of the status
register.

> If the WP signal is hard strapped
> +      to LOW then it is not broken as it can be a valid use case.
> +

I'm not sure it the bindings use negative notion of pins, because that
signal is usually called WP#.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

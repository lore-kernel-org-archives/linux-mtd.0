Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2943C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Nov 2022 04:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NpLqozPW7dOrHQEbiiNZr2u1nNOO0oK6fybcJUraABw=; b=f0kW6XCgqfL1cv
	kdIc3QXmJ3Ox3k7vy/pI7yYmcF+y4gmNeAjisoQML86n2Qb7mggU1QfOe8VqyiTtJtCMvIB1wG77F
	vihMBVUCxBH3l0FEtwrn/vfsbcPfoxva/1VofxSFNvlsAvj9dFo+KXmY2Z+1yNHdwLpEsh52P1Y/r
	Gmv44ga5tMmlgDjObUdq9P1gO9WUJ2jlsHfYVjcfmjkYDLqSNiOvDmNEiQoTEyOWg0hPs++e3GRk8
	c6iCkHdUf66zEqx3jcURnzaxhc4QFBG4scBZpPqFp/+u3W1d05HyoHEoN4njSuR7ad48nz7Qv0aP+
	GKQVq31gHkSfyORljIjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyQck-00CuLG-8W; Fri, 25 Nov 2022 04:47:38 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=formenos.hmeau.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyQbZ-00CtXQ-O7; Fri, 25 Nov 2022 04:46:27 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1oyQb6-000dw5-Q5; Fri, 25 Nov 2022 12:45:57 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 25 Nov 2022 12:45:56 +0800
Date: Fri, 25 Nov 2022 12:45:56 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: robh+dt@kernel.org, akpm@linux-foundation.org,
	krzysztof.kozlowski+dt@linaro.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
	broonie@kernel.org, qyousef@layalina.io, arnd@arndb.de,
	atishp@atishpatra.org, anup@brainfault.org, tkhai@ya.ru,
	quic_abhinavk@quicinc.com, vasily.averin@linux.dev,
	baolin.wang@linux.alibaba.com, colin.i.king@gmail.com,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
	pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
	richard@nod.at
Subject: Re: [PATCH] MAINTAINERS: Update email of Tudor Ambarus
Message-ID: <Y4BIhInFSg6F6nOV@gondor.apana.org.au>
References: <20221122125244.175295-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221122125244.175295-1-tudor.ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_204625_832791_FC731794 
X-CRM114-Status: GOOD (  10.22  )
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

On Tue, Nov 22, 2022 at 02:52:44PM +0200, Tudor Ambarus wrote:
> My professional email will change and the microchip one will bounce after
> mid-november of 2022.
> 
> Update the MAINTAINERS file, the YAML bindings, MODULE_AUTHOR entries and
> author mentions, and add an entry in the .mailmap file.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  .mailmap                                               |  1 +
>  .../bindings/crypto/atmel,at91sam9g46-aes.yaml         |  2 +-
>  .../bindings/crypto/atmel,at91sam9g46-sha.yaml         |  2 +-
>  .../bindings/crypto/atmel,at91sam9g46-tdes.yaml        |  2 +-
>  .../devicetree/bindings/spi/atmel,at91rm9200-spi.yaml  |  2 +-
>  .../devicetree/bindings/spi/atmel,quadspi.yaml         |  2 +-
>  MAINTAINERS                                            | 10 +++++-----
>  drivers/crypto/atmel-ecc.c                             |  4 ++--
>  drivers/crypto/atmel-i2c.c                             |  4 ++--
>  drivers/crypto/atmel-i2c.h                             |  2 +-
>  10 files changed, 16 insertions(+), 15 deletions(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

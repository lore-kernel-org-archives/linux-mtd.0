Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13740C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Nov 2022 13:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WoU5/PIa+E6milXMr0CdInXqYNzGiOyDYq04OO3Y82o=; b=UxESjx+hfuAVzK
	qjCHTSCfZTdfXC39eF37M7eOT4gScZ4qFoWGVOTFsUiS9Fbx342HWsTs6FybqxiOXLVa1JSN/Z5se
	o9yICXc1fGOwQJ0412d0rsL1w3B8n2/XN5P06JjVh1xCYDngEo+aPR98rvJyhUbn4u0H0xuwCJhJ9
	3cUViNnHDg8/h9VYL8XsYAVa49VzFq+Gv5++oO40dg+y3T6u17m8NxB23TL7276zwPGBQBUMYyQYE
	vGvJrGrAu8+tmsbSCbh/x8wtGjuAnk+1syVnldkGdflEq3PMuHhXKQLkiuMNxTdUQyQzmWD+lZOS/
	cFwgzX7vycubiuD+zw3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxT8P-009Zro-Rt; Tue, 22 Nov 2022 13:16:21 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxT8F-009ZpD-Gt; Tue, 22 Nov 2022 13:16:13 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id 8BF7D58045D;
	Tue, 22 Nov 2022 08:16:07 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 22 Nov 2022 08:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1669122967; x=1669130167; bh=Fsuy/mZZ5T
	5z+jQhn8xTVdY1LMGSEK1rG+fURdRPHdE=; b=WHL0dDUY9huUqeJ3XElkRvY99G
	5KKp34kqvZzwAXdz3qWSTP8dkduKL4X6BZrHOUjjKhHFrbnOafMSX40l9hgSvGYd
	llKjD8KuxUZ5LhSSdvGWRtY2Gnl4Egjxhnw7US/YqRHdhR/w9SCtA3p4WqeD6aH5
	qd37+5xOqS25Lbv7SM5hRwV1HCbUtrXMUJR55HsgtZWEkXEZg8Ph4IbmSnyFoYZ/
	OJQN2VQJETBIKGVKNzY2YutaJoXd6ze/IfpET6/cIPNPO3S4n2OKfphnRGHb0UL+
	X+d73WODat2vuPj8if2mWEGkOdbZM0JeHRjf9SSlw5mTA2Gd9BPmzw4OMTmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669122967; x=1669130167; bh=Fsuy/mZZ5T5z+jQhn8xTVdY1LMGS
	EK1rG+fURdRPHdE=; b=qHd2V94U8jhBOKm1F7zG+lP/0ILwVHOalPWyK84pceBd
	UChe3Mf4j27Hui5G+5GS29eMaylydiIUnLzfbXHH0I21p1BH+8dAuVHfI8suGZY0
	PgrRJKZb4aogD3REueoucsglMtfXJ/jT5OfK+2wwZo6U+ADoTNYirlm6Y8/NFUe0
	R0qt/VLUqmbvopkmPdgQJR5SMcFBbGGX3gdtbGg5IHZjYKyhxUXZDxOHnB/fE5+Z
	Lp+PYcph9ac+hcCx38TM75RZtbPrR9mWdv7ICcEfyuCTwBW6IqsiddfjmdTnm3E/
	w3iCi1e7ozKZUqqDPCl/jJi9iTtnR28ICXUrEyFjcg==
X-ME-Sender: <xms:lct8Y2KIz5BbdA7Y0eEPA5En7mn2GEt8jhrByQ2yONAtxwh01FB3Fw>
    <xme:lct8Y-I5MxsZRT8j4kyxa66PaWA8bZo1UDUarFGnwFhGlIRqB3GbWf0W-b6a65IfS
    2jI0XJkXWLQySxPhaM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheelgddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:lct8Y2sJieowFyuaIn7MFFzTsfhKZmpFGTW0srEMHdPs_irOCAEXzw>
    <xmx:lct8Y7aQVrgFCgyf3CmQdlDJJ2Iry5NEwXwRZZmmPhiafTvZFVsMdw>
    <xmx:lct8Y9bl6rpaXksVoY01AWgzzkjax4Tu3vysj6w-KHPP3DDLO44xbQ>
    <xmx:l8t8YxL9v1HssDbcgzDPEdxXDokY03uaja4qBZkPqf9YxCXxT44WGQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C95B5B60098; Tue, 22 Nov 2022 08:16:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <024e0a68-bb79-4e2e-84f8-f44afb759cdd@app.fastmail.com>
In-Reply-To: <20221122125244.175295-1-tudor.ambarus@microchip.com>
References: <20221122125244.175295-1-tudor.ambarus@microchip.com>
Date: Tue, 22 Nov 2022 14:15:45 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tudor Ambarus" <tudor.ambarus@microchip.com>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>
Cc: herbert@gondor.apana.org.au, krzysztof.kozlowski+dt@linaro.org,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@microchip.com>,
 "Mark Brown" <broonie@kernel.org>, qyousef@layalina.io,
 "Atish Patra" <atishp@atishpatra.org>, "Anup Patel" <anup@brainfault.org>,
 tkhai@ya.ru, quic_abhinavk@quicinc.com, vasily.averin@linux.dev,
 baolin.wang@linux.alibaba.com, colin.i.king@gmail.com,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, "Michael Walle" <michael@walle.cc>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>
Subject: Re: [PATCH] MAINTAINERS: Update email of Tudor Ambarus
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_051611_834702_FF9F26D2 
X-CRM114-Status: GOOD (  12.44  )
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

On Tue, Nov 22, 2022, at 13:52, Tudor Ambarus wrote:
> My professional email will change and the microchip one will bounce after
> mid-november of 2022.
>
> Update the MAINTAINERS file, the YAML bindings, MODULE_AUTHOR entries and
> author mentions, and add an entry in the .mailmap file.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

I can take this through the fixes branch of the SoC tree if that
works for everyone. Alternatively, I can take only the MAINTAINERS
and .mailmap bits and expect the other changes to get merged
by the devicetree and crypto maintainers for 6.2.

      Arnd

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
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

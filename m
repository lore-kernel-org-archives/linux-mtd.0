Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCFDC38142
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Jan 2023 14:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yV0JlLZAB5CA6qEranIvvXB8U8F67pX/kgjRGuu/5GE=; b=eMD+YfHtRgO0yN
	6iACYSOZOtU0sO9wo9G0l+Y1idjmfZGrURo0a9kh2ML8Zm6S5DQ2JibsgmPseFzjm/L4XaRaeGQvu
	3MZv9VdHWKdZx5dRADHiVx+IBb/f8aJqZl2JG2xczj38f9Ix6jsihi1KDGic9+p7D2tA3qjx5nfFu
	BBHD1zcWJoS78pq3g2MJHA9BjgDPA7U1jc/0r460xUEPha8DOU7AyFSKiN08q3UaaK3lNuxl4Trcq
	NfR2I3PtFuIOkhTFwpAQ47FdsQ7VyIielyHdB67w1hdt2LqMBMSXGkLZmXoZYai+BEjMY7WpE8D6J
	ev5jISGirsQnT0geIxiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJxwo-0000RX-GX; Mon, 23 Jan 2023 14:37:22 +0000
Received: from smtp-fw-33001.amazon.com ([207.171.190.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJxwl-0000QP-UN
	for linux-mtd@lists.infradead.org; Mon, 23 Jan 2023 14:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1674484640; x=1706020640;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version;
  bh=rxHa7fX5EGT6y96h4hm1HrsVopIqXKimYGpsM4vJx7o=;
  b=OQoP6mmNYPUFckHxcYd6tsGwFzNvfWi1nD1eOeAQ2SIG+97FoDK8mqN0
   HK51CatRD+ipM8CqnQxKC4GmsJXeYh7wsNaVjknRAVoT8c02MYdhjkdDd
   D14dna4t8Cy6a4Tpcnk4w4mSD6asKA3IzDwmw+jP5S994uYBmdHa1kVsE
   I=;
X-IronPort-AV: E=Sophos;i="5.97,239,1669075200"; 
   d="scan'208";a="257150820"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-iad-1d-m6i4x-153b24bc.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-33001.sea14.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 14:37:06 +0000
Received: from EX13MTAUEB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-iad-1d-m6i4x-153b24bc.us-east-1.amazon.com (Postfix) with ESMTPS id ECB10C23DE;
	Mon, 23 Jan 2023 14:37:02 +0000 (UTC)
Received: from EX13D26UEB003.ant.amazon.com (10.43.60.42) by
 EX13MTAUEB001.ant.amazon.com (10.43.60.129) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Mon, 23 Jan 2023 14:37:02 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D26UEB003.ant.amazon.com (10.43.60.42) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Mon, 23 Jan 2023 14:37:01 +0000
Received: from dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (10.15.11.255)
 by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1497.45 via Frontend Transport; Mon, 23 Jan 2023 14:37:01 +0000
Received: by dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (Postfix, from userid 23027615)
	id 3F2CD20D8B; Mon, 23 Jan 2023 15:37:00 +0100 (CET)
From: Pratyush Yadav <ptyadav@amazon.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
CC: <Takahiro.Kuwano@infineon.com>, <tkuw584924@gmail.com>,
	<linux-mtd@lists.infradead.org>, <pratyush@kernel.org>, <michael@walle.cc>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <Bacem.Daassi@infineon.com>,
	Dhruva Gole <d-gole@ti.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: spansion: Consider reserved bits in
 CFR5 register
References: <493d9a10-aaf3-70f6-36c3-9a2cf39f0759@linaro.org>
	<20230110164703.83413-1-tudor.ambarus@linaro.org>
Date: Mon, 23 Jan 2023 15:37:00 +0100
In-Reply-To: <20230110164703.83413-1-tudor.ambarus@linaro.org> (Tudor
	Ambarus's message of "Tue, 10 Jan 2023 18:47:02 +0200")
Message-ID: <mafs0v8kxb9mb.fsf_-_@amazon.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_063720_060739_DF1F0184 
X-CRM114-Status: GOOD (  19.02  )
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

+Cc Dhruva

Hi Tudor,

On Tue, Jan 10 2023, Tudor Ambarus wrote:

> CFR5[6] is reserved bit and must be always 1. Set it to comply with flash
> requirements. While fixing SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_{EN, DS}
> definition, stop using magic numbers and describe the missing bit fields
> in CFR5 register. This is useful for both readability and future possible
> addition of Octal STR mode support.
>
> Fixes: c3266af101f2 ("mtd: spi-nor: spansion: add support for Cypress Semper flash")
> Cc: stable@vger.kernel.org
> Reported-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/spi-nor/spansion.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index b621cdfd506f..07fe0f6fdfe3 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -21,8 +21,13 @@
>  #define SPINOR_REG_CYPRESS_CFR3V               0x00800004
>  #define SPINOR_REG_CYPRESS_CFR3V_PGSZ          BIT(4) /* Page size. */
>  #define SPINOR_REG_CYPRESS_CFR5V               0x00800006
> -#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN    0x3
> -#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS    0
> +#define SPINOR_REG_CYPRESS_CFR5_BIT6           BIT(6)

Perhaps comment here that this bit is reserved. Otherwise it is not
obvious what this does and why we are setting it without going through
git-blame. No need for a re-roll, I think it is fine if you add this
when applying.

> +#define SPINOR_REG_CYPRESS_CFR5_DDR            BIT(1)
> +#define SPINOR_REG_CYPRESS_CFR5_OPI            BIT(0)
> +#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN                            \
> +       (SPINOR_REG_CYPRESS_CFR5_BIT6 | SPINOR_REG_CYPRESS_CFR5_DDR |   \
> +        SPINOR_REG_CYPRESS_CFR5_OPI)
> +#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS    SPINOR_REG_CYPRESS_CFR5_BIT6

I would say don't fix what isn't broken. But if you do, test it. Do you
or Takahiro have a Cypress S28* flash to test this change on? If no,
then perhaps Dhruva can help here since TI uses this flash on a bunch of
their boards?

The change looks fine to me with the above comment added, I just would
like someone to test it once.

Reviewed-by: Pratyush Yadav <ptyadav@amazon.de>

>  #define SPINOR_OP_CYPRESS_RD_FAST              0xee
>
>  /* Cypress SPI NOR flash operations. */
> --
> 2.34.1
>
>

-- 
Regards,
Pratyush Yadav



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

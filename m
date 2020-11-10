Return-Path: <SRS0=eCmO=EQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C938BC388F7
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 12:59:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4774020679
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 12:59:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="INoWXmqJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="o0maWUH0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4774020679
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cq0V6FrFgoQ90xQ3e+hRaAvowDaSEHOY+GcqZBD6q1E=; b=INoWXmqJEnPBFeIkajIuUMY0t
	wUD5gQr+Pj8fnk+ZN3Dsv4LMWT5zJ/6XF31ikYyB8Ymf9VB83SUu4Xyb8VsJ9pVpqUGVWHtCSdGj5
	FydaRUoNE7u/kXak4WzJDk/V8Xh+VFXoxnhpxi9cla1hzgr4svtE0TTBINO5bjdEbB9ooaoZEPtmP
	DhJCJ4pORaLSFy8qbvNOlcI/k78x4aAlDU36aOqAQmU65J3irUlTBW5R3I1kWSiM+DIzM+c7caMDJ
	K9jt7iXhGIXzjzys0mWvjwTkDC1y0TCpEKDseoq0UtG3yqyGAxuTuDOvcwsTasyAgB9Pk7zGBumUd
	OHq98/vJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcTEF-0001Nx-Q9; Tue, 10 Nov 2020 12:58:31 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcTEC-0001Mz-T4
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2020 12:58:29 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AACwLYH048316;
 Tue, 10 Nov 2020 06:58:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605013101;
 bh=uXVTrgsRm6xY9WiAoZBFXURTjX9qcI5PcYnV6mMJCcs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=o0maWUH0jBdrqWzHt8J4HSOq5DApwIzALpFxAaUT2fjXekW29+rcGT433zXQV9XRR
 OQsOr+LqNcipxlFQM+i1b7Ma+dfGHYWWnxKcUPxskmBJJxGCigXkOaqh7aT+D/45Tt
 y0CTAqzwyg3/DxvIM63BVViXQJN9X81VFxj1LR6s=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AACwLRt034302
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 06:58:21 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 10
 Nov 2020 06:58:20 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 10 Nov 2020 06:58:20 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AACwHnW123876;
 Tue, 10 Nov 2020 06:58:18 -0600
Subject: Re: [PATCH] mtd: spi-nor: winbond: Add support for w25m512jw
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>
References: <20201016115549.31369-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <849bf80d-4081-1b90-9490-702e8a0b5a12@ti.com>
Date: Tue, 10 Nov 2020 18:28:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201016115549.31369-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_075829_103126_50EF7369 
X-CRM114-Status: GOOD (  18.24  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Prabhakar <prabhakar.csengg@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/16/20 5:25 PM, Lad Prabhakar wrote:
> This chip is (nearly) identical to the Winbond w25m512jv which is
> already supported by Linux. Compared to the w25m512jv, the 'jw'
> has a different JEDEC ID.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

I believe this was tested on a real HW? Including Quad mode?

> ---
>  drivers/mtd/spi-nor/winbond.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 6dcde15fb1aa..b5dfc09fef30 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -88,6 +88,8 @@ static const struct flash_info winbond_parts[] = {
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
>  			    SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
> +	{ "w25m512jw", INFO(0xef6119, 0, 64 * 1024, 1024,
> +			    SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
>  };
>  
>  /**
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

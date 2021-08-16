Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8923FC4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 19:18:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4499760E09
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 19:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4499760E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WzMfrmvQPLMfD3nA9nyNANNFNivvUo1GVEQv3hqew2U=; b=T+T85kqOajx6VN
	w19e15q+lk+/RuucdFVdEOeUQv8oOEhEa5lVzNwXaQvRjxZ+U5XZoZVsAkSG8URRYBqdE78bevTsk
	B+HGt74UNBm49NgJ2c2qd3Z4jrYfnxztmT32wCkmEB1QR68s8xrxEQLcULoyqP4/SeYLF+CClVhp7
	nUWA1NcQ4Cj4MEBOgYCBgDY/ss1Y7eodCVgePJhpH4Sxok7U3lNuZTx61yjEbI1m3OSQF+Xrd4Lct
	h+OPK/Ef5JdGlVLQ/0Bju3T5wg3EV+oOZoMuWRtGsVMwR+O+8tUJpvUcZUFtP6Co4lxCB3Q+PzNuX
	XXzUJlQ0mVm6qPNu4b2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFi7l-0006Er-Jl; Mon, 16 Aug 2021 19:18:17 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFi7g-0006EN-0z; Mon, 16 Aug 2021 19:18:15 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17GJHmaS105837;
 Mon, 16 Aug 2021 14:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629141468;
 bh=kG7gE7eGu/09QYfI+qstN7B9hMy8jesfFcFodSsslrc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=LUs4mlPZErwLgnIJotoMIgjwkufpY+prqkf2p7kfAWsgwZ+gkZ2kntBJNyDTZmPf8
 b+0NIqGssjcPajSsgsSY/qjAXQ2X+XYm0LWKr+CHq91Kr6HEzqT636HeDZMUG2TpGJ
 2FaqeIDkrSqU2h8/FFsW+Zh9m0gEZ/+Ah7sM6bjM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17GJHmOS095899
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Aug 2021 14:17:48 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 16
 Aug 2021 14:17:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 16 Aug 2021 14:17:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17GJHl2S005893;
 Mon, 16 Aug 2021 14:17:47 -0500
Date: Tue, 17 Aug 2021 00:47:46 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 11/35] mtd: spi-nor: winbond: Use manufacturer
 late_init() for OTP ops
Message-ID: <20210816191744.k6ufbgrrwh6whhnc@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-12-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-12-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_121812_194700_E2A35F88 
X-CRM114-Status: GOOD (  22.18  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 27/07/21 07:51AM, Tudor Ambarus wrote:
> OTP info is not yet discoverable via SFDP, use late_init() to init
> the OTP ops.

What do you mean by the "yet"? Does it mean that OTP info is planned to 
be added to the next SFDP version? Or does it mean that it is possible 
to discover it via SFDP but we just don't support it yet?

If it is neither and it just means "SFDP does not mention OTP at all", 
like it is for locking, then you should just drop the "yet". I know this 
is very nitpicky but it just caught my eye.

> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/winbond.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 96573f61caf5..6be45d2291c6 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -147,17 +147,22 @@ static const struct spi_nor_otp_ops winbond_otp_ops = {
>  static void winbond_default_init(struct spi_nor *nor)
>  {
>  	nor->params->set_4byte_addr_mode = winbond_set_4byte_addr_mode;

Why not move this to late_init() as well?

> -	if (nor->params->otp.org->n_regions)
> -		nor->params->otp.ops = &winbond_otp_ops;
>  }
>  
>  static const struct spi_nor_fixups winbond_fixups = {
>  	.default_init = winbond_default_init,
>  };
>  
> +static void winbond_late_init(struct spi_nor *nor)
> +{
> +	if (nor->params->otp.org->n_regions)
> +		nor->params->otp.ops = &winbond_otp_ops;
> +}
> +
>  const struct spi_nor_manufacturer spi_nor_winbond = {
>  	.name = "winbond",
>  	.parts = winbond_parts,
>  	.nparts = ARRAY_SIZE(winbond_parts),
>  	.fixups = &winbond_fixups,
> +	.late_init = winbond_late_init,
>  };
> -- 
> 2.25.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

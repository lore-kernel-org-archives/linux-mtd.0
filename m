Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0553C4363D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 11:28:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63DA620717
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 11:28:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LAeOgiuR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KqNMyH/T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63DA620717
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VP/J9YAiE1xmB9X/MxzudDW3IKpPKLnUXJri/KXbTqA=; b=LAeOgiuRcfW4B9WkKT2CuheL6
	UluMsf+gSkhTk87Bwv/EgyCIshhHKF9v867cNXchgAFGTKaZfre9M3EIgfXj3HEWYfug0nHaBJiVK
	ofWH79LDS8dNs4NTW6uuPh1VLg47YGqAjsBtKeKCuycF6L/S8rMaMf9ZKB4Fslhp4KJAdprGEm7SQ
	oIsPqiRxDPINF8ibN31Ue/M4je3pQlcE18X969uZtpNmIpvfhWatEorI+Yl4qeAPMefDd/cpEdQIt
	V1esXYufJqh6F929hhgkO0ygtBYF/ENMwqrRFarBdYHnbXeubCulCZrUMnB9yJxn70+9dTamKyvUa
	oXKAIlxbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLltE-0003e5-Oe; Fri, 25 Sep 2020 11:27:48 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLltB-0003ac-6y
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2020 11:27:46 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08PBRZa1072742;
 Fri, 25 Sep 2020 06:27:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601033255;
 bh=EcrVhMqmWzfcEKwR8uHmPN0ZHL5ElCCD0dmA86rC5RM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=KqNMyH/TArPmxaVOEN21GUzUoA/WhaIpDaqkf58+hR1fXpWbVSGfyyN1nR+C/7WNd
 Nh03W4qa4zU0TR7QyZ3966VidxCLCOXrDb4j6iYY4SqYe9qE0R/p/nekGnb7t6uaoK
 3cBgKNi1SLxicjulXsrp8TXrWFI8X4oEXtzSlUp0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08PBRZs4056153
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Sep 2020 06:27:35 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 25
 Sep 2020 06:27:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 25 Sep 2020 06:27:35 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08PBRWGR072022;
 Fri, 25 Sep 2020 06:27:33 -0500
Subject: Re: [PATCH] mtd: spi-nor: macronix: Add SECT_4K to mx25l12805d
To: Robert Marko <robert.marko@sartura.hr>, <tudor.ambarus@microchip.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20200915100623.708736-1-robert.marko@sartura.hr>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <6693ac3b-bf07-4a02-caca-5285dabdbb14@ti.com>
Date: Fri, 25 Sep 2020 16:57:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200915100623.708736-1-robert.marko@sartura.hr>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_072745_401987_B1802B49 
X-CRM114-Status: GOOD (  17.71  )
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
Cc: Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 9/15/20 3:36 PM, Robert Marko wrote:
> According to the mx25l12805d datasheet it supports using 4K or 64K sectors.
> So lets add the SECT_4K to enable 4K sector usage.
> 
> Datasheet: https://www.mxic.com.tw/Lists/Datasheet/Attachments/7321/MX25L12805D,%203V,%20128Mb,%20v1.2.pdf

Have you tested this feature on a real HW?

> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> ---
>  drivers/mtd/spi-nor/macronix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index f97f3d127575..9203abaac229 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -50,7 +50,7 @@ static const struct flash_info macronix_parts[] = {
>  	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
>  	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
>  	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
> -	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
> +	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K) },
>  	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>  	{ "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
>  			      SECT_4K | SPI_NOR_DUAL_READ |
> 

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1941FC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 14:21:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8090651CC
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 14:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8090651CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nl0Vz4yb/NeTOJMzUmkoedt1wOrQKtcYv2WnwswzwTg=; b=m0iA813yPaDstdywCBEMtFBqR
	mvG6TfithXxMQWIAI/vRFcoNHDsE4ImIe7NOiL6DSiyCjByZEAq+uyj+rjEEkg5kFJppWYs4ahIi1
	7gASwK+5cPlfydCMXSQhwvpu/pGdJaGISXuCDziAiUQ9h2Dg8b7f7OYXu8mQKNitqu/r4UJW5cbsV
	gPl0BY0kBsNruSEBuBlXYzHgleLH0wgoflaeSAd372XNi6W3StcD7auIIgXqEr6/AzrXV1Q1MrWHv
	Hfx3cMr5vJVcxQi6Guu+DNMN6sWqm59wLCyKT0Vu4ogsPjPWCPhvXo689Hlpx95TrKpfYXJwiJFEm
	0hRKMDlWQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJGkL-000BeW-52; Mon, 08 Mar 2021 14:20:33 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJGkC-000Bb3-Uo
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 14:20:29 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 128EKGM1096764;
 Mon, 8 Mar 2021 08:20:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615213216;
 bh=o4xwLU0m3JYT8XQh8oDQlP2j3EwelroDUNtQ4HGcQoA=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=AIfyvQSuOi5ZxyMXIXbVVavpBZxxFkElrIjUJwxGk36gpablUMOHsu083zqldQjRS
 UPdfzpblHZhnUDFBGnfabhOr5OIZiZTKI0ET+eZFqKPMfxHlGAASJ9VQl96B/IPOOE
 M/+QQ3F0i6bEb9UC12opibwqSDqRb7OdoDRrV7i0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 128EKFIv113150
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Mar 2021 08:20:15 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Mar
 2021 08:20:15 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Mar 2021 08:20:15 -0600
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 128EKDtO120505;
 Mon, 8 Mar 2021 08:20:13 -0600
Subject: Re: [PATCH 1/2] mtd: spi-nor: add block protection flags to macronix
To: David Bauer <mail@david-bauer.net>, <tudor.ambarus@microchip.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
References: <20210303094833.139221-1-mail@david-bauer.net>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <9eb05563-70b4-1653-d818-6a039f1c53ff@ti.com>
Date: Mon, 8 Mar 2021 19:50:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210303094833.139221-1-mail@david-bauer.net>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_142027_282058_EB315585 
X-CRM114-Status: GOOD (  18.29  )
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



On 3/3/21 3:18 PM, David Bauer wrote:
> Macronix flash chips support block protection by using BP bits in the
> read status register. Add the corresponding flag to indicate block
> protection support.
> 
> Otherwise, locked blocks are not unlocked when requested.
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>
> ---
>  drivers/mtd/spi-nor/macronix.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 9203abaac229..2d39dd32a64e 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -94,6 +94,7 @@ static const struct flash_info macronix_parts[] = {
>  
>  static void macronix_default_init(struct spi_nor *nor)
>  {
> +	nor->flags |= SNOR_F_HAS_LOCK;

We need to take into account the state of TB bit (Config Reg bit3). This
is an OTP bit and driver should not ideally change it but should
consider the state of the bit.

Without looking at TB bit, current locking implementation would be
incomplete.


>  	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
>  	nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode;
>  }
> 

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

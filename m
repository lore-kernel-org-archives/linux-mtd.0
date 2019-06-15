Return-Path: <SRS0=lAOP=UO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259FBC31E50
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jun 2019 14:52:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D29262133D
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jun 2019 14:52:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NmBzZMKc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sQdnoqNA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D29262133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nSZE6d1GnuJJbOBqAoj2k6ow2JC7lNtB4Kjxpi8+Lc=; b=NmBzZMKcER5RF8
	+zmN81nsxSC1RCKZTx2nUfXDaRKckbTrgzHyeuoD+n8M18jJ/YGmE3d6WnYkL0sXK91IxP3stSA+F
	mnUOd7cWTUw+D+8WCiH7pHBZIrQwBfn//mQd/Vv99FfPfy/5Yy9/NrMu54zDX3COfu6WJaE5Sx3Ye
	iHYfEv7NA8/usk74NV/Rg3D5OF8l8ANBQxXq7lTj7udHptJ+wMd76UZC4TA78AZBj2rL4wPfN6ZWq
	iK4Vza5yRAMo1vzLtA8nsAKPBkTeM9ZYu3KOMM75EBl2sGgVXxbGo0xlo0FT0/ZOkuOPoJHjxmwVA
	1KYXrZl730mZpBInzNhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcA2i-0000wJ-Tc; Sat, 15 Jun 2019 14:52:32 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcA2e-0000vv-Ty
 for linux-mtd@lists.infradead.org; Sat, 15 Jun 2019 14:52:30 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5FEqKvw000385;
 Sat, 15 Jun 2019 09:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1560610340;
 bh=wnBRDIOrJxvQ1oK3NOEGdmzkbFy8CDQ6fXTtOeNUhFw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=sQdnoqNAYvdaX1vMX0CWXV0l3IM5dxJf2Sj6c/6+lHuwVAvIMnZB+P7bG4IArb49h
 6nFxonenqvzJwbXKCTSZMb8T1saBrBp3hCaogtlzmwnoUNlT2LIz7N8X0fSPezc5nn
 Jr3Foanodk7CYPbvy0kk/BWDsvAUpAmPJNpuHZFg=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5FEqKuH110329
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 15 Jun 2019 09:52:20 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sat, 15
 Jun 2019 09:52:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sat, 15 Jun 2019 09:52:20 -0500
Received: from [10.250.133.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5FEqIkD110670;
 Sat, 15 Jun 2019 09:52:19 -0500
Subject: Re: [PATCH v6 07/11] mtd: cfi_cmdset_0002: Remove retry goto
 statement from do_write_oneword()
To: Tokunori Ikegami <ikegami.t@gmail.com>
References: <20190526153904.28871-1-ikegami.t@gmail.com>
 <20190526153904.28871-8-ikegami.t@gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <3634dfde-5f2c-d021-daa3-00e4eee62ac9@ti.com>
Date: Sat, 15 Jun 2019 20:22:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190526153904.28871-8-ikegami.t@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190615_075229_094203_AD3D557E 
X-CRM114-Status: GOOD (  17.98  )
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
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Fabio Bettoni <fbettoni@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 26-May-19 9:09 PM, Tokunori Ikegami wrote:
> This is just to refactor the function by removing the goto statement.
> Change to use the for loop instead of the goto statement.
> 

This "retry: ... goto retry;" construct is consistently used across the
file. Using goto to implement retry loops is common in kernel. Unless
there is a better reason, lets not do this change.

Regards
Vignesh

> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
> Cc: Fabio Bettoni <fbettoni@gmail.com>
> Co: Hauke Mehrtens <hauke@hauke-m.de>
> Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: linux-mtd@lists.infradead.org
> ---
> Changes since v5:
> - Rebased on top of Liu Jian's fixes in master.
> - Change the email address of Tokunori Ikegami to ikegami.t@gmail.com.
> 
> Changes since v4:
> - None.
> 
> Changes since v3:
> - Rebased.
> - Change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.
> 
> Changes since v2:
> - None.
> 
> Changes since v1:
> - Add the patch.
> 
>  drivers/mtd/chips/cfi_cmdset_0002.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 597b0f18269f..7784be8246cb 100755
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1684,17 +1684,15 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
>  	ENABLE_VPP(map);
>  	xip_disable(map, chip, adr);
>  
> - retry:
> -	ret = do_write_oneword_once(map, chip, adr, datum, mode, cfi);
> -	if (ret) {
> +	for (retry_cnt = 0; retry_cnt < MAX_RETRIES; retry_cnt++) {
> +		ret = do_write_oneword_once(map, chip, adr, datum, mode, cfi);
> +		if (!ret)
> +			break;
> +
>  		/* reset on all failures. */
>  		map_write(map, CMD(0xF0), chip->start);
> -		/* FIXME - should have reset delay before continuing */
>  
> -		if (++retry_cnt <= MAX_RETRIES) {
> -			ret = 0;
> -			goto retry;
> -		}
> +		/* FIXME - should have reset delay before continuing */
>  	}
>  	xip_enable(map, chip, adr);
>  
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

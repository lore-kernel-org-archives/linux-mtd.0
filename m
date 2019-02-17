Return-Path: <SRS0=8j8Y=QY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D5BC43381
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Feb 2019 05:27:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34E2C2196F
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Feb 2019 05:27:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rcaX3BK8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JJHJ/eai"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34E2C2196F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/LXJ7ZVDtBAiUyy18LQm19EW8MdduVTL+P2D0y+EFJo=; b=rcaX3BK8WGAaPi
	Du6EgojO5iCEDB3O7IYx55IltASPco5eZ/TqlNMGZuco7HSE809ARkzACOvOBkJJ1QJCWcy/+xGhb
	8rycwAWmQ0K62ArNQg7zP1GP4sz3pgoZwYjMOgjvOOk1eOFbrOXw3bfPtIHEIkrIqn0/myP6ZiDWE
	J+fn06HiqD0wCv8T5NQEA7wgBz8U893YSPJjILkCugiJ+LozVmtoUcPyyG1/5SevjzQR/5YN/9RZU
	pzzkHvgGfHn61VjRLFyf854GD3bBmJhruPc3qw8fb8Z8ILpnZucec/jdPzAMTMu76HJOtL2ZrBaus
	oBqGTdKwkelzDH7TPydQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvEzQ-0002ip-RX; Sun, 17 Feb 2019 05:27:44 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvEzM-0002iW-3b
 for linux-mtd@lists.infradead.org; Sun, 17 Feb 2019 05:27:43 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1H5RDL9017841;
 Sat, 16 Feb 2019 23:27:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1550381233;
 bh=jPdOyqCtXto4hf4Nau6QZBIUaTbTctCryP+X1R5Mq1U=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=JJHJ/eaiZPMuaAf4r5SHSVqJhfrOyyyaHA7OcvPAUNvlr80ZbY2mfQjx+cnu2p2LX
 c46wmyrw+uvR0dn1FiYedn8oLooYHbkYjY78HE7BoTEMBY+1xFhfEF8SvymEqVThco
 N3UOSs0d5gH20wrZZPwYhg7TOpYEgAW4q3YoR9Xs=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1H5RD0p110974
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 16 Feb 2019 23:27:13 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Sat, 16
 Feb 2019 23:27:13 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Sat, 16 Feb 2019 23:27:13 -0600
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1H5R9bX014543;
 Sat, 16 Feb 2019 23:27:10 -0600
Subject: Re: [PATCH][next] mtd: spi-nor: cadence-quadspi: fix spelling
 mistake: "Couldnt't" -> "Couldn't"
To: Colin King <colin.king@canonical.com>, Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, David
 Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <20190215151547.17532-1-colin.king@canonical.com>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <6eb58a44-fba9-3beb-f36a-00242e6b7e29@ti.com>
Date: Sun, 17 Feb 2019 10:58:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190215151547.17532-1-colin.king@canonical.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190216_212742_029176_5CBBF714 
X-CRM114-Status: GOOD (  20.54  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 15/02/19 8:45 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 56512c0368f9..792628750eec 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -1249,7 +1249,7 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>  
>  	ddata = of_device_get_match_data(dev);
>  	if (!ddata) {
> -		dev_err(dev, "Couldnt't find driver data\n");
> +		dev_err(dev, "Couldn't find driver data\n");
>  		return -EINVAL;
>  	}
>  	hwcaps.mask = ddata->hwcaps_mask;
> 

Oops, my bad.. Thanks for fixing this!


-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

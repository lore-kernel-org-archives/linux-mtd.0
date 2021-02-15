Return-Path: <SRS0=LIjS=HR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C20C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 15:15:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFCA4600CF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 15:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFCA4600CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FdgcACXuitCVsUbEU5VV209YBeCOPNlTkix99U3I1uc=; b=kToOY0AAOt621syAZgdGUUmyM
	D4DMf16NihUM8MW5lE2jKTqEBr217H2hRhIVBmiJ5sUEKwzQH3eU9J5QgHg7zuO3TKDuCZlaloY0+
	BpHqFD5ZYfA7MastLBVdQw9QfilA8EwgGbrzbh5E8o008r+myEgqL5OTzA/Eq/PLXT9t7OkBjhGSE
	xV9QLecBgCBzOGMJwESSU2zDL2UU23Gr7ALHgMoZjAl1aKxHAhSYl2GiEYviPq4L6jbqO/A/xGHBU
	H3g/psAuDhILgXWo26QXfApRqI8aL0sCBgGG3rVQzwhB9MDLg2XnmboN5aaJSKEFyOYR5Adluk8a0
	Rz/zcaT+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBfa4-00087p-As; Mon, 15 Feb 2021 15:14:32 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBfa0-00086V-UG
 for linux-mtd@lists.infradead.org; Mon, 15 Feb 2021 15:14:29 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11FFEI1Q097085;
 Mon, 15 Feb 2021 09:14:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1613402058;
 bh=sAjhMQukniTDz7/55gYg+80QFN69a2eXbXOPEhJIJKA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ByQHz2dch4NtMEwEIPzLXhe0bJd+pOIf2Qbj1v3T0wmFo0GjKvcn4AapHVppPRPJB
 SZ+bC8Cfa930a2BYO7aZypP0Qj6rFRalg/I5kLDFti4jbOnSTndjxu3yRgqbCCGBOZ
 N14liJ8rmSILIoCEAJltUq2bc/JCQNOkblYvxMQc=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11FFEI92060419
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Feb 2021 09:14:18 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 15
 Feb 2021 09:14:18 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 15 Feb 2021 09:14:18 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11FFEHR3054258;
 Mon, 15 Feb 2021 09:14:17 -0600
Date: Mon, 15 Feb 2021 20:44:16 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: Re: [PATCH] mtd: spi-nor: sfdp: Fix out of bound array access
Message-ID: <20210215151414.6542yhluvx3yvbia@ti.com>
References: <20210212154717.362233-1-mbriand@witekio.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210212154717.362233-1-mbriand@witekio.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_101429_154615_F7E48BE7 
X-CRM114-Status: GOOD (  19.82  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/02/21 04:47PM, Mathieu Dubois-Briand wrote:
> Fix array index: explicitly use the array length to access the last
> element, instead of an incorrectly set iteration variable.
> 
> It seems this code was correct before following commit, were the
> iteration counter is reused, leading to a value that may be out of
> bound.
> Fixes: dc92843159a7 ("mtd: spi-nor: fix erase_type array to indicate
> current map conf")
> 
> Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 6ee7719e5903..11cc5d19e286 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -881,7 +881,7 @@ spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
>  		if (!(regions_erase_type & BIT(erase[i].idx)))
>  			spi_nor_set_erase_type(&erase[i], 0, 0xFF);
>  
> -	spi_nor_region_mark_end(&region[i - 1]);
> +	spi_nor_region_mark_end(&region[region_count - 1]);

I'm not too familiar with the non-uniform erase code but this looks good 
at first look. Small nitpick: move this line just after the above for 
loop that initializes this array.

>  
>  	return 0;
>  }
> -- 
> 2.25.1
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

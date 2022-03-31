Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE6EC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Mar 2022 19:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mUqz6aSakbIq1TaQ52tuYT1hCQusI9+a9DApf5s2U6Y=; b=xiyBQcBVaFsXOf
	TC0KIDRK4HE4cimvv7N44d4S4emnhxwcAssXPChAPS9YHAnoEI4rO/flzpshToON2QPlRqabyWeGp
	jnGqmGIV94r1WC/u8oqfNAVTdW1UU8sGdMVjFpb4UoFo06y/ApWrmdOlTSFr9V2AJayCOIujSw9aP
	6Vl1CZwweRL+uNwcWTXlXGO9OmZkucBKGJsMgEMGBDQzzqMFj5aFn1QREsCFAIXysNclZb72tL5v1
	fXKnK0dn/SKpiwCHae6S1lSl62gFNQ+78K4Q+ICdI9zjtrS7C4CsgnP/hmSazdPutPQiLxQ5AJtTt
	kNzthunurCp+raTjxfmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na05k-003LKM-4R; Thu, 31 Mar 2022 19:04:20 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na05h-003LHa-BK
 for linux-mtd@lists.infradead.org; Thu, 31 Mar 2022 19:04:19 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22VJ43vQ052621;
 Thu, 31 Mar 2022 14:04:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1648753443;
 bh=+hpF99iyhgx9s0BuD1Wq5B4/4uDMpeBTQsdIdUEE4kw=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=k1J6EQ50PcU6vL9yQfcQhkBZdSo4gVUwsNjxnmjDNfJWsQjOSxxFBPDQurmYJtCsY
 0DWBXQF6lkgRXelDczKoheFUVZu4wShsapT5v4Qz+emadhb6gMPTLeQxXkyzZhkzwt
 DCnsbaaUkOb5U4RsLDlkQ5OmHCMtW8yDZN0ig/0Y=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22VJ43KC093434
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 31 Mar 2022 14:04:03 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 31
 Mar 2022 14:04:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 31 Mar 2022 14:04:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22VJ422p126927;
 Thu, 31 Mar 2022 14:04:03 -0500
Date: Fri, 1 Apr 2022 00:34:02 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Nathan Rossi <nathan@nathanrossi.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Nathan
 Rossi <nathan.rossi@digi.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: core: Fix 16bit write sr_and_check status
 check
Message-ID: <20220331190402.d3fymx3msnzyycef@ti.com>
References: <20220324070004.225738-1-nathan@nathanrossi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220324070004.225738-1-nathan@nathanrossi.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_120417_502860_AB08C0AA 
X-CRM114-Status: GOOD (  22.78  )
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

Hi Nathan,

On 24/03/22 07:00AM, Nathan Rossi wrote:
> From: Nathan Rossi <nathan.rossi@digi.com>
> 
> The spi_nor_write_16bit_sr_and_check function description describes that
> the function compares the value of the status and config registers after
> the write. However the function does not implement the status register
> compare only the config register check.
> 
> This causes the function to differ in behaviour to the equivalent
> spi_nor_write_sr1_and_check for non-16bit writes to the status register.
> This is important as other functions rely on the return code of
> spi_nor_write_sr_and_check. For example spi_nor_sr_unlock returns the
> result directly, which is returned to userspace such that failing to
> unlock the spi-nor device was resulting in a return code of 0 instead of
> the expected non-zero indicating the failure.
> 
> Signed-off-by: Nathan Rossi <nathan.rossi@digi.com>
> ---
>  drivers/mtd/spi-nor/core.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 04ea180118..d75d4f8a45 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1007,6 +1007,15 @@ static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
>  	if (ret)
>  		return ret;
>  
> +	ret = spi_nor_read_sr(nor, sr_cr);
> +	if (ret)
> +		return ret;
> +
> +	if (sr1 != sr_cr[0]) {
> +		dev_dbg(nor->dev, "SR: read back test failed\n");
> +		return -EIO;
> +	}
> +
>  	if (nor->flags & SNOR_F_NO_READ_CR)
>  		return 0;

This patch seems exactly like [0]. I will pick that one if it applies on 
the current tree since it already has one Reviewed-by.

[0] https://lore.kernel.org/linux-mtd/20220126073227.3401275-1-chentsung@chromium.org/

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

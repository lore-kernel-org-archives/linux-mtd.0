Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B38C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 05:22:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F8B520989
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 05:22:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hqcn0Iwu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="giMzL9Vr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F8B520989
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZyjQeFo9wbhE5uxxe+xCDtBTe5Sn92NzAkhQ6cAKObg=; b=hqcn0Iwuz4/mBN
	ZD0hEJ0l2riprHnAE2T6DDsbFIK9bcTkHwxgbnyjyrBzcbrlVJVoBGHOvtC5MgAUJs1F/g/oNWYP+
	nm7v6oPC1IQT8A+Fqs9EMSIMK5NYxtgoOx0EM1J+KC7gee8D5D0Qsivn17hrzJtbtfn/zFSb2OMco
	6lA5LrPQHPtgVcan5OhbwI2GyhAgpUNNYv83Z8dDlGoGErLZ2t7cxd9IDWbOEMHWQnd1xZdfsqkXB
	etz8X4pQBPhEEqke/T4r1pICIUY+n6TdNCPTWjfL4kVF4LoCvTA4Sjd62t3Fh+rniuy8SH4FWoFtR
	VSTGAP+nfoW8Nz8APNIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h67CK-0002No-FH; Tue, 19 Mar 2019 05:22:00 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h67CG-0002N6-OF
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 05:21:58 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2J5LN5p026746;
 Tue, 19 Mar 2019 00:21:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1552972883;
 bh=Bpl/Fv73gU5NRDM5ZU/uZIdXbp+7aObdaoG12KrtD7o=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=giMzL9Vrv/Wn7hJMPr+jM6U560o14WKxzJWwSKE8hVVfJB+VeUIXr6Bt9GFlLV1ls
 GaGfVXO9+vqE+/d/ccz03/RIm3pFiIsX8hoF3HcKlHUZneKys+gqkyZWECfQk33fq5
 AROVSWa6OR+xmpo5+CkUnzhNiYL8CQlcxJJQ3TiM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2J5LN4T106964
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 Mar 2019 00:21:23 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 19
 Mar 2019 00:21:22 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend Transport;
 Tue, 19 Mar 2019 00:21:22 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2J5LHks023380;
 Tue, 19 Mar 2019 00:21:18 -0500
Subject: Re: [PATCH v2] mtd: spi-nor: Return error when nor->addr_width does
 not match the device size
To: Liu Xiang <liu.xiang6@zte.com.cn>, <bbrezillon@kernel.org>
References: <1552484753-3393-1-git-send-email-liu.xiang6@zte.com.cn>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <823dcd3f-8b9f-15c5-a072-06625120766e@ti.com>
Date: Tue, 19 Mar 2019 10:52:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <1552484753-3393-1-git-send-email-liu.xiang6@zte.com.cn>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_222156_891206_3FE0F43D 
X-CRM114-Status: GOOD (  21.83  )
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
Cc: richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, liuxiang_1999@126.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 13/03/19 7:15 PM, Liu Xiang wrote:
> In some is25lp256, the DWORD1 of JEDEC Basic Flash Parameter Header
> is 0xfff920e5. So the DWORD1[18:17] Address Bytes bits are 0b00,
> means that 3-Byte only addressing. But the device size is larger
> than 16MB, nor->addr_width must be 4 to access the whole address.
> An error should be returned when nor->addr_width does not match
> the device size in spi_nor_parse_bfpt(). Then it can go back to
> use spi_nor_ids[] for setting the right addr_width.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 6e13bbd..63933c7 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2811,6 +2811,14 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	}
>  	params->size >>= 3; /* Convert to bytes. */
>  
> +	/*
> +	 * If the device exceeds 16MiB, addr_width must be 4.
> +	 * addr_width == 3 means the Address Bytes we are
> +	 * reading from BFPT is wrong.
> +	 */

JESD216 standard does not mandate flash devices >16MiB to always support
4 byte addressing opcode. So, its okay for flash vendor to support
>16MiB flash with 3 byte addressing and Bank/extended address register.

> +	if (params->size > 0x1000000 && nor->addr_width == 3)
> +		return -EINVAL;
> +

Assuming only DWORD1[18:17] bits are wrong, then returning from here
would mean we miss parsing Sector Erase settings, Quad Enable
Requirements etc from BFPT which is kind of bad.
I suggest to move the fix to[1], addr_width indicated in flash_info
struct of the device can take precedence over SFDP.

[1]https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/spi-nor.c#L4106


>  	/* Fast Read settings. */
>  	for (i = 0; i < ARRAY_SIZE(sfdp_bfpt_reads); i++) {
>  		const struct sfdp_bfpt_read *rd = &sfdp_bfpt_reads[i];
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

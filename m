Return-Path: <SRS0=nVbp=KU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6391EC2B9F8
	for <linux-mtd@archiver.kernel.org>; Tue, 25 May 2021 19:36:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30A7B613F9
	for <linux-mtd@archiver.kernel.org>; Tue, 25 May 2021 19:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30A7B613F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RFQZd5BGLIg6KmUVpRK4KT27e+Sz32hbGDY9zuZDP6Q=; b=r7YZ+UHDkWEkjz
	5zpUoaf3DVZyLJ60HleSHn238wCnZuin8pWGXQKljz8rM8EfDRAJgIqJ1X3E2e3+QrA5suO0CqDRP
	umxdKQE45xVWHiujrt3Evy0UO6c3h8am1FDaU+Tpf6Zzjt/0zssSmwA6sEliN7aS/b5OzUj7+G70B
	y7rPdtozOYO0XwZ8d16GSxhq0A/D4qr1zdVJS1wHSf3lyHt4sfEPiJF3u4X9j/FeAi+4R8ULD98Ni
	fGm+KVwLW2zfuUmwH1rbJXi6SnQbbg68YNi01hFK5377QdMxgr1UKmuMlJE4oTNaUIeZFGlCz7jgx
	Lo8DZmwbflwBt+nrn1HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llcpk-007mAN-0C; Tue, 25 May 2021 19:35:20 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llcnz-007lIo-N1
 for linux-mtd@lists.infradead.org; Tue, 25 May 2021 19:33:33 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14PJXRHf044419;
 Tue, 25 May 2021 14:33:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1621971207;
 bh=EihITSZ+agD5NRPVu+oqyk24Asa0tc2ILpQ40bXNrcA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=kPxYpFZDUB8EPq/lPR3srxivyHfOM89VrLNj/S16j70XPmtRp56HlmI+12Q/TxME9
 +t2RuOY2of1TIbjvR0DQ04abHj7AcBfm4VBEh5o8MbdRJtpgF9PXLhUKqdljJIqqAO
 QiqA8YikYp/sKpO7IhyOH64mZNiF2WoJ0QFJ+CYI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14PJXRPK059214
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 25 May 2021 14:33:27 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 25
 May 2021 14:33:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 25 May 2021 14:33:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14PJXQ7a023176;
 Tue, 25 May 2021 14:33:27 -0500
Date: Wed, 26 May 2021 01:03:26 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v4 3/4] mtd: spi-nor: otp: return -EROFS if region is
 read-only
Message-ID: <20210525193323.xdvbq3tab6oxk6yh@ti.com>
References: <20210521194034.15249-1-michael@walle.cc>
 <20210521194034.15249-4-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210521194034.15249-4-michael@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_123331_879540_D83D1681 
X-CRM114-Status: GOOD (  33.58  )
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

On 21/05/21 09:40PM, Michael Walle wrote:
> SPI NOR flashes will just ignore program commands if the OTP region is
> locked. Thus, a user might not notice that the intended write didn't end
> up in the flash. Return -EROFS to the user in this case. From what I can
> tell, chips/cfi_cmdset_0001.c also return this error code.
> 
> One could optimize spi_nor_mtd_otp_range_is_locked() to read the status
> register only once and not for every OTP region, but for that we would
> need some more invasive changes. Given that this is
> one-time-programmable memory and the normal access mode is reading, we
> just live with the small overhead.

Ok.

> 
> Fixes: 069089acf88b ("mtd: spi-nor: add OTP support")
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/otp.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> index 3898ed67ba1c..b87f96593c13 100644
> --- a/drivers/mtd/spi-nor/otp.c
> +++ b/drivers/mtd/spi-nor/otp.c
> @@ -249,6 +249,31 @@ static int spi_nor_mtd_otp_info(struct mtd_info *mtd, size_t len,
>  	return ret;
>  }
>  
> +static int spi_nor_mtd_otp_range_is_locked(struct spi_nor *nor, loff_t ofs,
> +					   size_t len)
> +{
> +	const struct spi_nor_otp_ops *ops = nor->params->otp.ops;
> +	unsigned int region;
> +	int locked;
> +
> +	if (!len)
> +		return 0;

I was inclined to say that the loop conditional below would take care of 
this but it can cause an underflow when ofs and len are both 0.

> +
> +	/*
> +	 * If any of the affected OTP regions are locked the entire range is
> +	 * considered locked.
> +	 */
> +	for (region = spi_nor_otp_offset_to_region(nor, ofs);
> +	     region <= spi_nor_otp_offset_to_region(nor, ofs + len - 1);
> +	     region++) {
> +		locked = ops->is_locked(nor, region);
> +		if (locked)
> +			return locked;
> +	}

Ok.

> +
> +	return 0;
> +}
> +
>  static int spi_nor_mtd_otp_read_write(struct mtd_info *mtd, loff_t ofs,
>  				      size_t total_len, size_t *retlen,
>  				      const u8 *buf, bool is_write)
> @@ -271,6 +296,16 @@ static int spi_nor_mtd_otp_read_write(struct mtd_info *mtd, loff_t ofs,
>  	/* don't access beyond the end */
>  	total_len = min_t(size_t, total_len, spi_nor_otp_size(nor) - ofs);
>  
> +	if (is_write) {
> +		ret = spi_nor_mtd_otp_range_is_locked(nor, ofs, total_len);
> +		if (ret < 0) {
> +			goto out;
> +		} else if (ret) {
> +			ret = -EROFS;

I wonder if we should have a dev_info() or dev_err() here. I think this 
warrants a dev_dbg() at least.

> +			goto out;
> +		}

So it returns -errno when the check for is_locked() fails and 1 or 0 
when it is locked or not. Ok.

It would be nice if you add a dev_dbg or dev_err() or dev_info() above. 
Nonetheless,

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

> +	}
> +
>  	*retlen = 0;
>  	while (total_len) {
>  		/*

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

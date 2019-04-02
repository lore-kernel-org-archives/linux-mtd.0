Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568BEC4360F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 06:35:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2704F2070B
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 06:35:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oPWbBIhr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="i+07IQiG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2704F2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYokMDdxd2ivo2UBe2YzbdWTrgE6ia7W2DrI6uRKtZU=; b=oPWbBIhrYHI7fD
	ojv46yXP1XqHpg+SVBo78U6BNqgl2ePH102S5jKabPuenM+U6nZVDoJN7R+yMKHQRdOp67d7MpeoM
	vvfXIgRhqNf0onmV6HOGSqaa0QCkGPh9j80JTcHlMKaUmsmJaRT+t+KjqoOiv4A4FyJjIoW/wS3+2
	leFuKpBvyFBf+KtJp6MtaWrmcEMenV56QNboZwkA7rsj5HmWfrU0MI1l6UzNh0O+3KVVRrjETF5Q4
	diHz9QPi4BUe5hliAylcR7pmXoWLmNGrnCtYHFx/kOpm24Pgewfk7hTP9GQ1Khl/RpQc/6XU5MYm8
	kXOzYvrPWN8VlM+YtKXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBD1R-0004WR-Ek; Tue, 02 Apr 2019 06:35:49 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBD1O-0004W2-2X
 for linux-mtd@lists.infradead.org; Tue, 02 Apr 2019 06:35:48 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x326ZfNl043826;
 Tue, 2 Apr 2019 01:35:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1554186941;
 bh=HTjMvbYhszDsh9wAemiBc4VWJwjGHUCoqh5TnYUrZWY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=i+07IQiGDG8M3y9IV9pnKewA7I/32MTVyC1vscCLlVsBwF2wCXOUcIwpKZq/ILDtL
 yvpwGRTRa/Ka69WogUKKUNq96rTksdGavXnef1FsiiWPJ3Jy7pEcO7xGzWY9boe2o5
 aq75OsR+9fb2cyefoBfoKwN4cLdjTVVl8D5URum4=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x326Zfew082278
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 2 Apr 2019 01:35:41 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Apr
 2019 01:35:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Apr 2019 01:35:40 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x326ZbKi054265;
 Tue, 2 Apr 2019 01:35:38 -0500
Subject: Re: [PATCH 1/3] mtd: devices: m25p80: Simplify m25p80_read()
To: Andrey Smirnov <andrew.smirnov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20190401044938.31237-1-andrew.smirnov@gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <72cf37d0-e0b8-a02c-1626-46f342cc72bd@ti.com>
Date: Tue, 2 Apr 2019 12:06:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190401044938.31237-1-andrew.smirnov@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_233546_741514_C4E72434 
X-CRM114-Status: GOOD (  20.49  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org,
 Chris Healy <cphealy@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 01/04/19 10:19 AM, Andrey Smirnov wrote:
> Spi_nor_read() already has an appropriate loop around .read() callback
> to handle the case when not all of the data requested was written in a
> signle ->read() call. Drop extra code doing the same thing in
> m25p80_read().
> 

Thanks for the patch series! But we are in the process of completely
moving m25p80.c into spi-nor.c which should take care of this series.
See[1][2], I plan to post the next version shortly. Let me know if
something is missing.

[1] https://patchwork.ozlabs.org/patch/982925/
[2] https://patchwork.ozlabs.org/patch/982922/

Regards
Vignesh

> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Boris Brezillon <boris.brezillon@bootlin.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/mtd/devices/m25p80.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 651bab6d4e31..114f8ccea85b 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -125,7 +125,6 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>  				   SPI_MEM_OP_ADDR(nor->addr_width, from, 1),
>  				   SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
>  				   SPI_MEM_OP_DATA_IN(len, buf, 1));
> -	size_t remaining = len;
>  	int ret;
>  
>  	/* get transfer protocols. */
> @@ -137,22 +136,15 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>  	/* convert the dummy cycles to the number of bytes */
>  	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
>  
> -	while (remaining) {
> -		op.data.nbytes = remaining < UINT_MAX ? remaining : UINT_MAX;
> -		ret = spi_mem_adjust_op_size(flash->spimem, &op);
> -		if (ret)
> -			return ret;
> -
> -		ret = spi_mem_exec_op(flash->spimem, &op);
> -		if (ret)
> -			return ret;
> +	ret = spi_mem_adjust_op_size(flash->spimem, &op);
> +	if (ret)
> +		return ret;
>  
> -		op.addr.val += op.data.nbytes;
> -		remaining -= op.data.nbytes;
> -		op.data.buf.in += op.data.nbytes;
> -	}
> +	ret = spi_mem_exec_op(flash->spimem, &op);
> +	if (ret)
> +		return ret;
>  
> -	return len;
> +	return op.data.nbytes;
>  }
>  
>  /*
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

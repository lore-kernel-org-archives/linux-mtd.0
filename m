Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B854C3F2CD
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 18:28:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 538A42051A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 18:28:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bakGbxHl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="U+AY7jCP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 538A42051A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dv7mvxPCixlhwcCfEU6oMHG6b68iOt6gDIb7ShD6r10=; b=bakGbxHlyqEGbJzz0Oyjz7pN3
	WIKw3j+b1m2F4sccq4xPq3joP0sY3J6ra/PtagEALoVIpi6qvwPFqFlD34tfCQNZuOFykCU0Wcug/
	KS4SmFNRpsAzdpZSR9sAsnW/Eojva2O4JN/DLc0dSJiGuzRVk+Ma3kd00GVtTzDCoSiZKKCaFU+NH
	GueycHDYtpZ3p/G4pji5rqoViAu0GCRcv3L2G2cgdj4XNwGb8JZwMynBmd9uZhjYAkfuz8jn8sDds
	REJhu3DQK0aI/I2wq2CnCyk5A+oVZkP4mOeTlOTeryW8SV2/upYVx3E1JsJxcgIQNxtDRvGRPDJ5c
	kJbJHLl0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGRoB-0008OU-58; Mon, 23 Mar 2020 18:28:19 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGRo7-0008OA-N4
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 18:28:17 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 210562304C;
 Mon, 23 Mar 2020 19:28:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1584988094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iZMNvNo7AAxy+0Lm4HY1WA7ajxVnmfoea9eOnJrPFJg=;
 b=U+AY7jCPxhl9X0f95o7I+tdbF17anQ9Zj/hBsfBJt//ElaMzjIHx0JL4WE9Bs9sJBQTCQ8
 Y9t7H4zttmCthAaRhMQTcZVffvd6/G9OyKeA0s78+SMmlyT9RDxr9Oj1xHh3B4baOXcWQ1
 V8dhErhyKBFm/gdFe13iK8DCC+8l448=
MIME-Version: 1.0
Date: Mon, 23 Mar 2020 19:28:14 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v3 2/5] mtd: spi-nor: Set all BP bits to one when lock_len
 == mtd->size
In-Reply-To: <20200323092430.1466234-3-tudor.ambarus@microchip.com>
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
 <20200323092430.1466234-3-tudor.ambarus@microchip.com>
Message-ID: <7ffdd5afa3682f45b0d8f770b5a85557@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.10
X-Spamd-Bar: /
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 210562304C
X-Spamd-Result: default: False [-0.10 / 15.00]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; TO_DN_NONE(0.00)[];
 DKIM_SIGNED(0.00)[]; NEURAL_HAM(-0.00)[-0.772];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_112815_906524_9CAF7B75 
X-CRM114-Status: GOOD (  15.82  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, js07.lee@samsung.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2020-03-23 10:24, schrieb Tudor.Ambarus@microchip.com:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> When there are more BP settings than needed for defining the protected
> areas of the flash memory, most flashes will define the remaining
> settings as "protect all", i.e. the equivalent of having all the BP 
> bits
> set to one. But there are flashes where the in-between BP values
> are undefined (not mentioned), and only the "all bits set" is 
> protecting
> the entire memory. One such example is w25q80, where BP[2:0]=0b101 and
> 0b110 are not defined.
> 
> Set all the BP bits to one when lock_len == mtd->size, to treat this
> special case.
> 
> Suggested-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Michael Walle <michael@walle.cc>

> ---
>  drivers/mtd/spi-nor/core.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 36660068bc04..3788a95c0a47 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1660,13 +1660,19 @@ static int spi_nor_sr_lock(struct spi_nor
> *nor, loff_t ofs, uint64_t len)
>  	 *
>  	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len)) + 1
>  	 */
> -	pow = ilog2(mtd->size) - ilog2(lock_len) + 1;
> -	val = mask - (pow << SR_BP_SHIFT);
> -	if (val & ~mask)
> -		return -EINVAL;
> -	/* Don't "lock" with no region! */
> -	if (!(val & mask))
> -		return -EINVAL;
> +	if (lock_len == mtd->size) {
> +		val = mask;
> +	} else {
> +		pow = ilog2(mtd->size) - ilog2(lock_len) + 1;
> +		val = mask - (pow << SR_BP_SHIFT);
> +
> +		if (val & ~mask)
> +			return -EINVAL;
> +
> +		/* Don't "lock" with no region! */
> +		if (!(val & mask))
> +			return -EINVAL;
> +	}
> 
>  	status_new = (status_old & ~mask & ~tb_mask) | val;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

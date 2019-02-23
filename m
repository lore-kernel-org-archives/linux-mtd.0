Return-Path: <SRS0=gLK6=Q6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE6AC43381
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Feb 2019 18:41:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F31A5206B6
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Feb 2019 18:41:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lu5Z/FEq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="qQGPVSJS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F31A5206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QlzGvZbZa2aL1pIEMLDJWLMIM6dEtwK9ZXQ6HW3ZbhE=; b=lu5Z/FEqgOOadz
	P9iLS62UzOJ+ePiVmt6ShrQRUsaOewZrvg4uPvamnMzbP5RS9qwVhoZiVQMtj0G85w11ltxgHZ0Wo
	FbNq5tRtnNxPhtLP4bKuNNej4Jp/Q8XT7wfFjgxN+TN/ytXHKQnTDGLNUzxUN/CMXpovjQWJXC6ib
	MHxQap8Kp7h2zZfd817WG8vV2fnxx+UvESpgoBKFFgQCGAIksJcA3DMDEu4sLSPuvOiSq+uq8o1Oh
	CCZGrJpOUZD/ykEaE3e3iyiwUVzNN/T6McA+h9LMFdc5SXm71xdGQQ3IbYBTsn1RdC+MY6K3MhCdu
	8kZslHqZtIrBG/XQzMVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxcEg-0006W5-RM; Sat, 23 Feb 2019 18:41:18 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxcEZ-0006VT-O3
 for linux-mtd@lists.infradead.org; Sat, 23 Feb 2019 18:41:13 +0000
Received: by mail-lf1-x143.google.com with SMTP id p1so4041724lfk.9
 for <linux-mtd@lists.infradead.org>; Sat, 23 Feb 2019 10:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ea/okYVZ+pasABhX8qlXJFmI0/ViCB5RXJYFQ4QKyQ8=;
 b=qQGPVSJSAqfeONRBIzytK56ICZobRATlVn/Z70qyMbVmnHMHcFRrlNDpEVqd8FfjhY
 h4PVvKAHyh02k0MWtdLTPFhtuoBdEuIpqIXw/h3RAbilRCrDGlGRIKoPar9x+wVcmdVL
 GD+LGagfNggkbnBBYPXR4l4w/mz5vL1zLSinEKhhU5Tl2VQhxHGg5dwp8SQUmt7Smibg
 6l/2IDM4l9ySYAuwXwrVykMfiK90IasXjTQKR44kRybD6uM5hOzoljFMeWq/VBzAWllb
 2Slid1UcuvRm5+oSVxEUv+Bi1uwR1qJ1B54Q1UwEz789W8Ao8nd88sVM3yaFa0V8niSf
 Tpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Ea/okYVZ+pasABhX8qlXJFmI0/ViCB5RXJYFQ4QKyQ8=;
 b=qOk7DIV3fO+pUB9G3hVyaorMhzC8TQO8TXbmnJF14seJnGWQ6TXLv4j4HmtTemr4Oc
 fDDImgEQpd1cJzfr3fkGFOcn4cTa7ZbO9T+sH9K5Jtdv9UMS6i7RYUfqloexvKFTXnKU
 QB6DjiQWAXCtgshI/kgOCphvQ4u8X4FBgiShCQgzKhoaHu1uyjYIXRH3yZH50SgUwgkZ
 LyAnwodLt6WUVyJOo8Xucbio5ebaE3aI0BxKV8kPTKravm1hzlKLnBII//TCgwG1KKBo
 mYUbqjngucc76DUSnNWjxVwRMPMQM21EQLTcoZtxy473DTtf0lMsTE6uaJMP7kmMo2p0
 a3cw==
X-Gm-Message-State: AHQUAuaLV0okBSwGgSE0mFwEoDvLWk4vP9s7UHq4SlzPhBYVUkK7+5FQ
 ah0Xvmr2hvZ6hDhuXxJERl89LA==
X-Google-Smtp-Source: AHgI3IaELFgS5vpZOQEaG3bhJ60/Qh+HmZ1kowr62TOQHsatYS7tqQJuzb1RFhRs/JSJvRD7NliWDA==
X-Received: by 2002:ac2:5183:: with SMTP id u3mr6012140lfi.153.1550947269078; 
 Sat, 23 Feb 2019 10:41:09 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.83.184])
 by smtp.gmail.com with ESMTPSA id c27sm1524924lfh.76.2019.02.23.10.41.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 23 Feb 2019 10:41:08 -0800 (PST)
Subject: Re: [RFC PATCH 1/5] mtd: cfi_cmdset_0002: Add support for polling
 status register
To: "Vignesh R (by way of Boris Brezillon <bbrezillon@kernel.org>)"
 <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
References: <20190219063607.29949-1-vigneshr@ti.com>
 <20190219063607.29949-2-vigneshr@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <4fb5aac2-d421-c7df-ab1c-9a9290f068e3@cogentembedded.com>
Date: Sat, 23 Feb 2019 21:41:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190219063607.29949-2-vigneshr@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190223_104111_970303_0529CE26 
X-CRM114-Status: GOOD (  25.71  )
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 tudor.ambarus@microchip.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 02/19/2019 09:36 AM, Vignesh R (by way of Boris Brezillon <bbrezillon@kernel.org>) wrote:

> HyperFlash devices are compliant with CFI AMD/Fujitsu Extended Command
> Set(0x0002) for flash operations, therefore drivers/mtd/chips/cfi_cmdset_0002.c
> can be use as is. But these devices do not support DQ polling method of
> determining chip ready/good status. These flashes provide Status
> Register whose bits can be polled to know status of flash operation.
> 
> Cypress HyperFlash datasheet here[1], talks about CFI Amd/Fujitsu
> Extended Query version 1.5. Bit 0 of "Software Features supported" field
> of CFI Primary Vendor-Specific Extended Query table indicates
> presence/absence of status register and Bit 1 indicates whether or not
> DQ polling is supported. Using these bits, its possible to determine
> whether flash supports DQ polling or need to use Status Register.
> 
> Add support for polling status register to know device ready/status of
> erase/write operations when DQ polling is not supported.
> 
> [1] https://www.cypress.com/file/213346/download
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> ---
> 
> Note: PRI extended query table size is bigger on 1.5 than on older
> revision. Not sure if this causes problems on older rev. because of
> reading beyond current size.
> 
>  drivers/mtd/chips/cfi_cmdset_0002.c | 50 +++++++++++++++++++++++++++++
>  include/linux/mtd/cfi.h             |  5 +++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 72428b6bfc47..7a4ef0237750 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
[...]
> @@ -97,6 +105,18 @@ static struct mtd_chip_driver cfi_amdstd_chipdrv = {
>  	.module		= THIS_MODULE
>  };
>  
> +/*
> + * Use status register to poll for Erase/write completion when DQ is not
> + * supported. This is indicated by Bit[1:0] of SoftwareFeatures field in
> + * CFI Primary Vendor-Specific Extended Query table 1.5
> + */
> +static int cfi_use_status_reg(struct cfi_private *cfi)
> +{
> +	struct cfi_pri_amdstd *extp = cfi->cmdset_priv;
> +
> +	return (extp->MinorVersion >= '5') &&
> +		((extp->SoftwareFeatures & 0x11) == 1);

   Parens not necessary here.

[...]
> @@ -744,8 +764,21 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
>   */
>  static int __xipram chip_ready(struct map_info *map, unsigned long addr)
>  {
> +	struct cfi_private *cfi = map->fldrv_priv;
>  	map_word d, t;
>  
> +	if (cfi_use_status_reg(cfi)) {
> +		/*
> +		 * For chips that support status register, check device
> +		 * ready bit
> +		 */
> +		cfi_send_gen_cmd(0x70, cfi->addr_unlock1, 0, map, cfi,
> +				 cfi->device_type, NULL);
> +		d = map_read(map, addr);
> +
> +		return (d.x[0] & CFI_SR_DRB);

   Again, parens not needed.

[...]

   Other than that, looks good.

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

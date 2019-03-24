Return-Path: <SRS0=La3s=R3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B07DC43381
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Mar 2019 16:23:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA2A92148D
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Mar 2019 16:23:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VEGhmVs1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Uioip74/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA2A92148D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6kDPUOaXDqtuqXP+ughULP8B12lh7t3gQqh0MOgqnM=; b=VEGhmVs1ovvqmL
	9SXfJEF/FVokgdQ9MhNvMYsZ+JRUVB2JYDtY2gdIbxC8/TvAxYtAXinSId5SzkmRleEKBU9uYEFGr
	K/ggHnpb7bJVdcnEObC5zZYi55381vG8uNskLy3yDByVasjxHciHll8y33qJH2egcwUOl2xmZPE5c
	Ni6VQMRpygEokXgcArbvQ4bZZ3U+xz38g/gNp3ElVy1MzDf8oqdxU2ABoQYLefQVoUFqwXxKlAema
	Ga1f66+xmrMPJvrEqX82xJQn7E3LWArHGdZQDisQlPQK+nI0ikVsrC048heyhMtoGY3eQ93C3Ouo7
	UqO7kCAjDrKWf4SvfPsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h85uE-0000yu-Um; Sun, 24 Mar 2019 16:23:30 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h85uB-0000yD-R3
 for linux-mtd@lists.infradead.org; Sun, 24 Mar 2019 16:23:29 +0000
Received: by mail-lj1-x244.google.com with SMTP id l7so5733131ljg.6
 for <linux-mtd@lists.infradead.org>; Sun, 24 Mar 2019 09:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5Pg6TyKqOEBJ5p2F+vVjKYJQKTqyJO6B+2xoYuenJv4=;
 b=Uioip74/Cvek/C88/GJF9rB6Ct7bPJU7UacdoAMAvEjYXV3X278WXaUoaOoHjJWzbW
 P/QJBKhNokIkciz2/sO9lLL8iQNwzQv4Ep+ETMgzK94Nhnbf2FAtW+fVKqeJX1Ndt27q
 lVOX6GWL3p/3k2U5+fGWQH9327Z9lQhdqWnF5RXOyU9aAcI1cFCh4YgEcB8bqKYUWbn7
 iYrqDm25Iu/AfZDZ4ed5+fb4Ibztylwal1usi+3RBbxFpntBZq0sSu7YVFlGEZMl7KNQ
 VaY2XZ6cItH29TY5hWKV3SkvufipS0ZPMEkC70T2qx+GNzuXaUIEY9QyEpA74FWjjVQl
 uxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5Pg6TyKqOEBJ5p2F+vVjKYJQKTqyJO6B+2xoYuenJv4=;
 b=arHD5uUXTGtB+FxPI6gp6PH/1CJMq0PS9Ml7PpDgbjVtFRHtfNBT8IET00YEuPhFBq
 qLk7M2VmEUVCC+y1HSAaT7LfyeaZj/aE9nxOzAVAjo+PttQLofcvrfyaV3Ioh6aAucvT
 QKnJA3KZhCfnDSdWDdfLvZfX+/mbcDJIuJb0Q1/7+T7MlTJm9zxDL1TDaWkCReldZ2wE
 2FLGZiFpcGa/11nIeV+Li0v+9eJoaKUaMQJqqe/JdDNnN9qiBie2Cthrql/o88KGeTeT
 a3o6wGoSA+t2L548GHJS9dqfZZZ5DuQdqX9JtaQf3MnOCXQa/S9yEcDQzYlymqnYAmJs
 wteA==
X-Gm-Message-State: APjAAAVqJBtXA5p0MZh93+n07zVamL7Gm814jhg3HnBJY0s0xrS7l6UP
 V47v9eh/2B+FB5FUEO3iAH4Y4A==
X-Google-Smtp-Source: APXvYqx65heiScyKG8alJoDaHCi5DRZy7K7C5cZitdgwR6mOF6H8fyfI0Nk8MZQsTUtPObWBZwf6cA==
X-Received: by 2002:a2e:9a02:: with SMTP id o2mr1698779lji.179.1553444605756; 
 Sun, 24 Mar 2019 09:23:25 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.80.147])
 by smtp.gmail.com with ESMTPSA id h68sm2881577lfg.77.2019.03.24.09.23.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 Mar 2019 09:23:24 -0700 (PDT)
Subject: Re: [RFC PATCH v2 1/5] mtd: cfi_cmdset_0002: Add support for polling
 status register
To: Vignesh Raghavendra <vigneshr@ti.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
References: <20190321174548.9288-1-vigneshr@ti.com>
 <20190321174548.9288-2-vigneshr@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <597bbe8e-65d3-40c6-5d15-544e962be7c3@cogentembedded.com>
Date: Sun, 24 Mar 2019 19:23:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190321174548.9288-2-vigneshr@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_092327_881191_CBE5786C 
X-CRM114-Status: GOOD (  22.31  )
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
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 03/21/2019 08:45 PM, Vignesh Raghavendra wrote:

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

   We need?

> Add support for polling status register to know device ready/status of
> erase/write operations when DQ polling is not supported.
> 
> [1] https://www.cypress.com/file/213346/download
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 50 +++++++++++++++++++++++++++++
>  include/linux/mtd/cfi.h             |  5 +++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 72428b6bfc47..29987d8e6c6e 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
[...]
> diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
> index cbf77168658c..92ac82ac2329 100644
> --- a/include/linux/mtd/cfi.h
> +++ b/include/linux/mtd/cfi.h
> @@ -233,6 +233,11 @@ struct cfi_pri_amdstd {
>  	uint8_t  VppMin;
>  	uint8_t  VppMax;
>  	uint8_t  TopBottom;
> +	/* Below field are added from version 1.5 */

   The below fields are.

> +	uint8_t  ProgramSuspend;
> +	uint8_t  UnlockBypass;
> +	uint8_t  SecureSiliconSector;
> +	uint8_t  SoftwareFeatures;
>  } __packed;
>  
>  /* Vendor-Specific PRI for Atmel chips (command set 0x0002) */
> 

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

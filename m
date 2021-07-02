Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C993AC11F6A
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 13:50:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97FED61427
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 13:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97FED61427
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRmTHgo4IBP+5MD3RczM6KjscJD60YcD95oHnX3EhYA=; b=cImIh7/tKdQsHPjAIFEQULyDD2
	Tm4yiuvfxhyz7nRj6W5tPAE9nEdllQRXMSWj9i5VuwbLJbPWmPS6G0P9PqV9wl/bR1fxMahss206n
	qSSSnlRnw/0ScETz6HtB5YeeTNQ52sYIzQgXimkeH9R9ILkqVT9VMOvBVOZDN/0Zx4Kq0PcARW3E+
	e8Jget+Rq+stzVJP0pmLP1pYuhmcTcBpkS8KpnGZ9ypvwNcMN3OgD7Uqa/bJ+MlmMKNPyRiVH9WGI
	b1Yono+draswRPxYVHj+pbvNpG+6b1ttaB+QbaKbTiQOi5okj3VHfDg1X9pKMqEKanN2iQJy8LGMT
	h2PcIJMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzJYQ-003Bw5-Kp; Fri, 02 Jul 2021 13:50:02 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzJYM-003Bu0-Pk
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 13:50:00 +0000
Received: by mail-ot1-x333.google.com with SMTP id
 o13-20020a9d404d0000b0290466630039caso10098329oti.6
 for <linux-mtd@lists.infradead.org>; Fri, 02 Jul 2021 06:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sf+47FeenC6Af/THMjfU7F81ryPIXzGxGeo21oTLq8c=;
 b=erPmEqpCgyyri/aP6brggV8Wq05GXYAaO+zdSTY4wHzW5SpDWW0V5j243M+Bauho83
 f45D4vf9VWC3nX9Vra5z1CIqZgegvN2X2K+MVXh68QXdxODIoRkR+9roDe7L1eEqiyV6
 HNSU06dzDWoDBT8Uu5QALw/bsiDBinlMaNjeOBwcTN90/rtyfB/UyuC/13y8NU/Py94V
 2+2MkMi9i0Q1lCYKUBQbByRvEofdsL4G+WeDN3Lxe+ILon15kLAX+064XerNkRseB8Mh
 +A06Ia5NXZ7qyGtQdbOOFSsRLefo7ksXWGzppFtRd6NdzHsl0ikAdp3Q5LFGx+TMOJgW
 rAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sf+47FeenC6Af/THMjfU7F81ryPIXzGxGeo21oTLq8c=;
 b=Nak5kCINgldA9hevvT8VWm2t0C3LgwxswjFRZfiz79o03YN9MeLsWA/jh2/Knljdw9
 9cPmXAhvxhsx7UlJUnJZO3lpa3Hi4ouDRgqswSlDDH62Rd3CwOWbRU7F83dqF+MP+mZb
 ACkfdjGBLEO0/lMo7hqlj25kRcU3qXV0DT/VbCoaqsMX6r1TbmEh6c69sNz2JmQ5f5Sn
 Mf6bT6T4gq0xPFo0Ibmilybz3rRXFWnaZK7yOclvlPguVDuIyPUPj2Zz2praml6gbufw
 KfGdGkuDqzcHlhVuivNNWw+oCuFX9/oHMm0B3FCDaJndw5FHh5S9Df1OqTuU8uIkqJ6H
 NZUw==
X-Gm-Message-State: AOAM532W2xjh+WJqKQOl7gOoB3UiICJN47t30pzqKFbzueb4PsFmJusq
 j1Gvuk3KJB8uYctvaJGXOBQ=
X-Google-Smtp-Source: ABdhPJw8k0snlPIWk3Ku+sn2JYZNhLoB+HtR5ZnMeBbs2JYMRAL1C4CjKfNLtWxySznd0TgWtIpzng==
X-Received: by 2002:a9d:6545:: with SMTP id q5mr4740223otl.268.1625233797617; 
 Fri, 02 Jul 2021 06:49:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h3sm625963oti.34.2021.07.02.06.49.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 06:49:57 -0700 (PDT)
Subject: Re: [PATCH] mtd: core: handle flashes without OTP gracefully
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20210702093841.32307-1-michael@walle.cc>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <499cf369-c98a-ac48-dfe6-6903314e9606@roeck-us.net>
Date: Fri, 2 Jul 2021 06:49:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702093841.32307-1-michael@walle.cc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_064958_886402_10E32351 
X-CRM114-Status: GOOD (  22.81  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 7/2/21 2:38 AM, Michael Walle wrote:
> There are flash drivers which registers the OTP callbacks although the
> flash doesn't support OTP regions and return -ENODATA for these
> callbacks if there is no OTP. If this happens, the probe of the whole
> flash will fail. Fix it by handling the ENODATA return code and skip
> the OTP region nvmem setup.
> 
> Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Michael Walle <michael@walle.cc>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/mtd/mtdcore.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index b5ccd3037788..6881d1423dd6 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -880,7 +880,10 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
>   
>   	if (mtd->_get_user_prot_info && mtd->_read_user_prot_reg) {
>   		size = mtd_otp_size(mtd, true);
> -		if (size < 0)
> +		/* ENODATA means there is no OTP region */
> +		if (size == -ENODATA)
> +			size = 0;
> +		else if (size < 0)
>   			return size;
>   
>   		if (size > 0) {
> @@ -896,7 +899,10 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
>   
>   	if (mtd->_get_fact_prot_info && mtd->_read_fact_prot_reg) {
>   		size = mtd_otp_size(mtd, false);
> -		if (size < 0) {
> +		/* ENODATA means there is no OTP region */
> +		if (size == -ENODATA) {
> +			size = 0;
> +		} else if (size < 0) {
>   			err = size;
>   			goto err;
>   		}
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

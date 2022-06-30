Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13660C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jun 2022 08:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2w70h4tEjBTKRK28SXeDWQMsrStO/u3qNEWc4N8Ex4U=; b=tvVBM8+y6c4Jdv
	uscvTaMGYxAtWIJHW9o5KZjge6YiDkrfP95BLmsuqeXwn/G3TmLESwgXiXKU21dldDtYM8z/3Kpf9
	qCzPK7PzOKgPBYPocYRFfLhvsBIZKKXxmzxoAi5HOYNc7KGfrf9XI3+IN8e5qbj6t1AEcOaNqLIZf
	6FkSILpMDV9cK9Cgk4qP8RI80k6MXSffvJ+S+LzGjIxI5u0Vi0b3zZ/p+S14Aiv8R/XsHrXDvELyH
	bJrjbU0q8NCUM3I3hXzpaZHBCA48aXXFMcfwUce4oR/3PFGcOj1aXhFXgfh7tOt+qN2IHnOCeSaJH
	N4MSnWzuLJJuBEE/WOKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6ppG-00G6Ux-Cz; Thu, 30 Jun 2022 08:47:02 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6ppD-00G6TG-Dm
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2022 08:47:01 +0000
Received: by mail-ej1-x62f.google.com with SMTP id lw20so37638014ejb.4
        for <linux-mtd@lists.infradead.org>; Thu, 30 Jun 2022 01:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ijUWiZS99qlF/8rRWRrspTyoZo9W1oBwhdsM2NPK7es=;
        b=LSQDYNqaVAhiuyHrnxLSnNa4KYDv5v3ZdaOXu5gMU1DNOz4x+YfG+VbjZ3A2gl6eCZ
         L11gg0aPuodv4gHEIQZvv3w7UoafvFp6QSMCORZOtk7LrTMXRgd4SVEOEyhEZGy/K+N5
         UZl3y/Q5imBi7T/+mmSKMxsAc6rGkfi9cr/GMX0htQFoC3J+GglHPNgqtaHaKYDlR0Jd
         /wphyRmcQdqDgvehLCcuADzaIjxjTvPL6CA6lxIli1waynFegdrl7RFXasXziwn+ObtA
         pa6ahDmX1+PUTGkwA1bOn8GKu6RQZ8ySt3LcCn80K5U/jGZqsgQShDYkkfrrF++6AwhR
         JVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ijUWiZS99qlF/8rRWRrspTyoZo9W1oBwhdsM2NPK7es=;
        b=uK2y0JJNH6BlvTQpLyu+U7rBOFqnQ+hmCyqZWj66620GSr3T0tCzkDcmcW7E4VLvb4
         MdM40Ci22ZX0h2h0WuODmIZ9kCgVDPdDPj9xRzZ1XGvKpkB5pFZNOOElnb6jG5ebbAf3
         ryQh+7JDH360tAzkBGtOcMsd4rawq8WJNqTZ45pf4jozJtu9w/fxelvsaGy2qM46/Zh7
         gowNwRk4xhLzLqC2Grhc2mRhPalm6Xpvk1BUGZxvRvRJbMY5kHBi1mMR9LpMa3dNWgJT
         aZFdb3ysXem/eWmQoOBwe9vVdH3foB83j6KPaHTBgppgnoQ5FZbqOPASjszVA8Y+8xyV
         Kj9Q==
X-Gm-Message-State: AJIora9I75DTsmFLmQ8S3eN3yyG+/McosdWOtNVIxIbjKEEZX/mSuPII
	E4phw+beGV84L2q32IznMCThgw==
X-Google-Smtp-Source: AGRyM1snFeJioxa+M3t6BLa7YLUALZZi9c8Py51mZRv9MEGq2s62WIPMl6nK5TS4PB5kSwACpnzQew==
X-Received: by 2002:a17:907:6e1e:b0:726:be5e:7130 with SMTP id sd30-20020a1709076e1e00b00726be5e7130mr7902698ejc.381.1656578812745;
        Thu, 30 Jun 2022 01:46:52 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id hx23-20020a170906847700b00722e84c3d44sm8711679ejc.118.2022.06.30.01.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 01:46:52 -0700 (PDT)
Message-ID: <2df6673b-6f8d-19c2-90ca-342e3ba72040@linaro.org>
Date: Thu, 30 Jun 2022 10:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/7] memory: renesas-rpc-if: Pass device instead of rpcif
 to rpcif_*()
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1656341824.git.geert+renesas@glider.be>
 <e313b7f9a856fd8546aabb20d44d10e3af6676c6.1656341824.git.geert+renesas@glider.be>
 <20220630092552.68a8b3ff@xps-13>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220630092552.68a8b3ff@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_014659_525484_C672CF3E 
X-CRM114-Status: GOOD (  20.17  )
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

On 30/06/2022 09:25, Miquel Raynal wrote:
> Hi Krzysztof,
> 
> geert+renesas@glider.be wrote on Mon, 27 Jun 2022 17:31:13 +0200:
> 
>> Most rpcif_*() API functions do not need access to any other fields in
>> the rpcif structure than the device pointer.  Simplify dependencies by
>> passing the device pointer instead.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>  drivers/memory/renesas-rpc-if.c | 32 ++++++++++++++++----------------
>>  drivers/mtd/hyperbus/rpc-if.c   | 18 +++++++++---------
> 
> [...]
> 
>> diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
>> index d00d302434030b20..41734e337ac00e40 100644
>> --- a/drivers/mtd/hyperbus/rpc-if.c
>> +++ b/drivers/mtd/hyperbus/rpc-if.c
>> @@ -56,7 +56,7 @@ static void rpcif_hb_prepare_read(struct rpcif *rpc, void *to,
>>  	op.data.nbytes = len;
>>  	op.data.buf.in = to;
>>  
>> -	rpcif_prepare(rpc, &op, NULL, NULL);
>> +	rpcif_prepare(rpc->dev, &op, NULL, NULL);
>>  }
>>  
>>  static void rpcif_hb_prepare_write(struct rpcif *rpc, unsigned long to,
>> @@ -70,7 +70,7 @@ static void rpcif_hb_prepare_write(struct rpcif *rpc, unsigned long to,
>>  	op.data.nbytes = len;
>>  	op.data.buf.out = from;
>>  
>> -	rpcif_prepare(rpc, &op, NULL, NULL);
>> +	rpcif_prepare(rpc->dev, &op, NULL, NULL);
>>  }
>>  
>>  static u16 rpcif_hb_read16(struct hyperbus_device *hbdev, unsigned long addr)
>> @@ -81,7 +81,7 @@ static u16 rpcif_hb_read16(struct hyperbus_device *hbdev, unsigned long addr)
>>  
>>  	rpcif_hb_prepare_read(&hyperbus->rpc, &data, addr, 2);
>>  
>> -	rpcif_manual_xfer(&hyperbus->rpc);
>> +	rpcif_manual_xfer(hyperbus->rpc.dev);
>>  
>>  	return data.x[0];
>>  }
>> @@ -94,7 +94,7 @@ static void rpcif_hb_write16(struct hyperbus_device *hbdev, unsigned long addr,
>>  
>>  	rpcif_hb_prepare_write(&hyperbus->rpc, addr, &data, 2);
>>  
>> -	rpcif_manual_xfer(&hyperbus->rpc);
>> +	rpcif_manual_xfer(hyperbus->rpc.dev);
>>  }
>>  
>>  static void rpcif_hb_copy_from(struct hyperbus_device *hbdev, void *to,
>> @@ -105,7 +105,7 @@ static void rpcif_hb_copy_from(struct hyperbus_device *hbdev, void *to,
>>  
>>  	rpcif_hb_prepare_read(&hyperbus->rpc, to, from, len);
>>  
>> -	rpcif_dirmap_read(&hyperbus->rpc, from, len, to);
>> +	rpcif_dirmap_read(hyperbus->rpc.dev, from, len, to);
>>  }
>>  
>>  static const struct hyperbus_ops rpcif_hb_ops = {
>> @@ -130,9 +130,9 @@ static int rpcif_hb_probe(struct platform_device *pdev)
>>  
>>  	platform_set_drvdata(pdev, hyperbus);
>>  
>> -	rpcif_enable_rpm(&hyperbus->rpc);
>> +	rpcif_enable_rpm(hyperbus->rpc.dev);
>>  
>> -	error = rpcif_hw_init(&hyperbus->rpc, true);
>> +	error = rpcif_hw_init(hyperbus->rpc.dev, true);
>>  	if (error)
>>  		goto out_disable_rpm;
>>  
>> @@ -150,7 +150,7 @@ static int rpcif_hb_probe(struct platform_device *pdev)
>>  	return 0;
>>  
>>  out_disable_rpm:
>> -	rpcif_disable_rpm(&hyperbus->rpc);
>> +	rpcif_disable_rpm(hyperbus->rpc.dev);
>>  	return error;
>>  }
> 
> This will only apply on top of mtd/next, because that
> rpcif_disable_rpm() balance call was very recently contributed by Geert:
> https://lore.kernel.org/linux-mtd/f3070e1af480cb252ae183d479a593dbbf947685.1655457790.git.geert+renesas@glider.be/
> 
> So we need to first share an immutable tag on the current mtd/next
> branch. Richard, that is my vacation gift for you :)

I don't want entire mtd/next. I could take Renesas hyperbus specific
commits. Another solution is me to rebase on some rcX, if that commit
was sent as fix for current cycle.
The third option is to simply resolve a conflict - which should looks
pretty easy and compile-testable. In that case the commit should be
rebased on my v5.19-rc1.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

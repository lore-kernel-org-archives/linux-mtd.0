Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E5EC636D4
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Jan 2023 15:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/KVAjp6Dmf3XCoWXmStqROZ2UAaUzSgO/UdFXzJ3Tg=; b=I8gqMeiBhjlsLX
	bZLO1PqOJaFuRV3LB7A9G84EOBXaoU6VEosV0pASKMLKF7fBeNBpD7tA442QSAJXgpQA6fZenvRMs
	DGHxZgwVMFR7auBi2dR1O/UZYsJ1L/MCBVx/Q3sLt53bipQuGqnC/gR/hkgNtpgjMHR66E0f1kqz5
	P5e8uHeGkGXj0gEIf3BhkPw83m7EbQq7gfBuPlSy/U04/cYH9W7y5pMzFr2Fxd5yHBY5Y7o+yU2R1
	kt9nv+5CJcJuv6q0RVypHpI9jsIEPVBAecdH2M//ip8IpyL1QOIJfzkvBPxFw2Ot2LcqQfo1iNSlw
	5zZr7Sn9sZpKLkHwE3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMsBv-008PIN-Dy; Tue, 31 Jan 2023 15:04:59 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMsBr-008PEv-QU
	for linux-mtd@lists.infradead.org; Tue, 31 Jan 2023 15:04:57 +0000
Received: by mail-wm1-x332.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so5270751wms.1
        for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2023 07:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g4jYHU6rVcOlKOTfAngIOmChKtxtK0j1pwyPTw3jOAE=;
        b=JzZ/3ow856Jb4SczdwpPYh2c/FPq/QLk1jGgWE079Sb0wbwfAnDxsjbdFtl9AhLjlH
         rlwPOIvFzB7wCgXAaVXcvYThgB14shRl61LiExNRt/5wGkv1dn2kbhVY7IcwMv3Iy3Gt
         NOMA3KQqlkHTo/3B2u1MNoXaw/Ce5VyXTa6OlnkwkUmeQfp1XVDqCUQ1TvNJW0hDEZBh
         bdNLH2jBO7dWfSTFcixxluPwfLZwEBAAM8DGLWw8VX6/6BFIA+H8O3I80jE6s1N2i4FF
         kZb66edVs3c7PUFf4i2JVKJCED6skYUtebbftKZOnxbRDrhlJjE5oJYWKACHU9arzCdJ
         vQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g4jYHU6rVcOlKOTfAngIOmChKtxtK0j1pwyPTw3jOAE=;
        b=UgaIPAbvYBd8GkrXJI9rESG1L8qyQkVzslWVkKfd6lQE3eRI31vZZmtcB/cEgkue9/
         qLJsc0h5J3ZMBoB5QtbZ7TMwtwU7S36gmAIxKV/tXxlgoLemwuGf2mHtKNgZDIy61m2M
         udgn6MGwxVooe7nxyyh3ONS3y7UBrKazQd5aDvwBcuS3rQL+j7LYGcG0gY1MGjgvNFlu
         EznRGQ02N/7xfnT+Saett/ZOqAIdM1UoeFIFXH/l4aggB+cZqdIsMI1HKqzwovw1/fSm
         ktF1LClcgltoFkU3a6aI0vW/zCt5jLLgtJbhimV6qwhEoWudQH98Z/fZZY4p6HpHDD7U
         UYeA==
X-Gm-Message-State: AFqh2krx/RCPfIphKFfhr8vnF9fR32abiYngsduy1tYoEiJESzPzUQ4C
	abVntYD2hZ4ZadvgrD1uYXNilw==
X-Google-Smtp-Source: AMrXdXv0TfWIX/uWXu6EMlwgY3P+BrX75PnrIMz7EedMt83YGz5qrTvOz1OAaJ4T+ZV8TNv2jdsAzQ==
X-Received: by 2002:a05:600c:c07:b0:3da:ff60:f5c9 with SMTP id fm7-20020a05600c0c0700b003daff60f5c9mr53205550wmb.40.1675177491390;
        Tue, 31 Jan 2023 07:04:51 -0800 (PST)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id o3-20020a05600c4fc300b003db1d9553e7sm23169371wmq.32.2023.01.31.07.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 07:04:50 -0800 (PST)
Message-ID: <bbf61b7a-5de7-2ef7-1528-e5eda118183b@baylibre.com>
Date: Tue, 31 Jan 2023 16:04:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] mtd: spi_nor: Fixes out of bound shift
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, "khilman@baylibre.com" <khilman@baylibre.com>
References: <20230126142612.1518046-1-lrannou@baylibre.com>
 <27e7476a179b68d7b4501ffdd368bad5@walle.cc>
From: Louis Rannou <lrannou@baylibre.com>
In-Reply-To: <27e7476a179b68d7b4501ffdd368bad5@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_070456_068825_7A73B362 
X-CRM114-Status: GOOD (  13.03  )
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

Hello,

On 31/01/2023 09:17, Michael Walle wrote:
> Hi,
> 
> Am 2023-01-26 15:26, schrieb lrannou@baylibre.com:
>> From: Louis Rannou <lrannou@baylibre.com>
>>
>> spi_nor_set_erase_type is called twice in sfdp.c with a null size. The
>> return from ffs is 0 as well and the shift size becomes (2^32 - 1) 
>> which is
>> out of bound when applied to the << operator.
>>
>> This considers as illegal a call to this function with null size. It
>> creates a replacement spi_nor_mask_erase_type for explicit calls to mask
>> the erase type.
>>
>> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
> 
> There is also this thread with a pending patch:
> https://lore.kernel.org/r/20211106075616.95401-1-tudor.ambarus@microchip.com/

Indeed, I did not see that.

My patch also misses the core.h update. Let's see if we get news from 
this pending patch. And then perhaps we'll see if I push a v2.

Regards,
Louis

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

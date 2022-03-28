Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FBDC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Mar 2022 15:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuAx9tJ53b+/y+ANaV+FA3v7RXTkCrSMQcKhfpoj5U8=; b=4xcrxIgSxdkJLP
	1vw+A52phgttI6SDWw6AQBhwHdFHdisQd7YgO0mJCiIbc0jiSg6uhhu2CWYvDG5sFy9flom0+qSjY
	bc24aaRkIvIXI9HzvP5UpRNhXBQabfWW9Xe2fxh855TEGnEKedflFJ3dTVd950RgymaWb83R4uBqP
	mZu8mGpxoFTeRG3arqh5q8+ZsT2OAGWy3ijvc66ezraEdh2BpGQPZRSRaiYQSWZWkAYbDE5J4QuQF
	0WqBsgL7KRoJf6TTkLOinwI5bycl2W8/bC/oPXmDfwlro5lgmMAfaY2fjIb62byd087QF1mwcMmCq
	Q1Km0m1cnRn7JaXsTRbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYrKs-009NPV-7V; Mon, 28 Mar 2022 15:31:14 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYrKp-009NOD-Cj
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2022 15:31:12 +0000
Received: by mail-pf1-x42b.google.com with SMTP id u22so12955377pfg.6
 for <linux-mtd@lists.infradead.org>; Mon, 28 Mar 2022 08:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IPFzIjgbZDtA5zvK2Bb6ObyLkIWss8RT/ZsHLBaqe60=;
 b=ViZ/ZJg9u1lfcWG0XtsZfG6oeG/okx0iuiRucQ9SZapGw9pN8SeCXqoq8vUwqM5lux
 tFMfldFoe3jIk1oDULHBI5bi6cr/IQIdvWRJHtKjQ/psxC7/znfC0CngLcKTBBjPf5eR
 I6li+wAh7rikC3K4gJdkJfRLI1/IoX3dF6sgEm4JSIFIslIB9srSgiOqs/xFO1gV+FGH
 uCzemgTPaRxCLNu+tAZey3p8Erv2L2wp7TPkqG7Y710P380TGab5xxhgITjGzjK3A8qN
 Oj3TWqJX63wf6oeEBLH+Te9QE50j44ry7UmQEq5Ro5dVen8+xmnhDYQprsgiFPoX8ih2
 wDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IPFzIjgbZDtA5zvK2Bb6ObyLkIWss8RT/ZsHLBaqe60=;
 b=xuIO5c8j1Q/H2p5VMRcUHQel/1j8YUzbWWIHiYxJYJtei+S03rjs85wBEfr6La2hQ9
 //HscF4n+8gS7rh/t8QeEE3Lg7M1iUsi7QTkpU6EO4vS74LWYlDRiRfzYwNbeImOoD44
 WdOAdDbifKYQZJTqRKB4oo+zSaLkxUj1Z01peSW2bGTyKIQBtZVhVnYuc12XfelTnIMJ
 Qd6jT5VnM9Cl23Xo39QPAatMtEZDbSz7H/EEIvDf5VsHCVzujWVCbGNF+CYmAtxP69iA
 dGb0qSl7f9YFsapIEtjeSlm6zSg9RTGC5A6gxJVvOzu4c2kTVj+bzaXEXOhOhLfEmhox
 o2DQ==
X-Gm-Message-State: AOAM533VAkNhABLVXuDxGIahz9LBkcIX+lfc6+mgQ3a3Yk9uGsRfMSyT
 N2/lBDOnOiwZrD39+spmvndRfnoYyvF5Ow==
X-Google-Smtp-Source: ABdhPJxwDKw25veifk3+CNVyrtsZV2T0QhMljfZp8fVPUPWRrq1TDk0nFmklxNbZFHgjsQR/mOgFEw==
X-Received: by 2002:a63:2a97:0:b0:398:6e01:d565 with SMTP id
 q145-20020a632a97000000b003986e01d565mr1007643pgq.119.1648481470375; 
 Mon, 28 Mar 2022 08:31:10 -0700 (PDT)
Received: from ?IPV6:240b:10:2720:5500:1b5:6130:7e8a:99b6?
 ([240b:10:2720:5500:1b5:6130:7e8a:99b6])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16241406pfu.56.2022.03.28.08.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 08:31:09 -0700 (PDT)
Message-ID: <01be7616-a610-db18-124d-865ef1d4e61c@gmail.com>
Date: Tue, 29 Mar 2022 00:31:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v7 0/4] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Content-Language: en-US
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20220323170458.5608-1-ikegami.t@gmail.com>
 <c807ca8c-3065-cdec-8e2b-5d5a77529c69@pengutronix.de>
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <c807ca8c-3065-cdec-8e2b-5d5a77529c69@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_083111_479544_A0A4BC66 
X-CRM114-Status: GOOD (  13.57  )
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

Hi Ahmad-san,

On 2022/03/28 19:50, Ahmad Fatoum wrote:
> Hello Tokunori-san,
>
> On 23.03.22 18:04, Tokunori Ikegami wrote:
>> Since commit dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to
>> check correct value") buffered writes fail on S29GL064N. This is
>> because, on S29GL064N, reads return 0xFF at the end of DQ polling for
>> write completion, where as, chip_good() check expects actual data
>> written to the last location to be returned post DQ polling completion.
>> Fix is to revert to using chip_good() for S29GL064N which only checks
>> for DQ lines to settle down to determine write completion.
>>
>> Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
>> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
>> Cc: stable@vger.kernel.org
>> Link: https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/
> For this series,
>
> Tested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Thank you for your support.
>
> Thanks a lot for taking care of this. Could you keep me Cc'd
> on future revisions? Convention is via a Reported-by tag
> in the regression fix.

Sorry for this. Yes I will do cc on next time and also consider to add 
the Reported-by tag also.

Regards,
Ikegami

>
> Cheers,
> Ahmad
>
>
>> Tokunori Ikegami (4):
>>    mtd: cfi_cmdset_0002: Move and rename
>>      chip_check/chip_ready/chip_good_for_write
>>    mtd: cfi_cmdset_0002: Use chip_ready() for write on S29GL064N
>>    mtd: cfi_cmdset_0002: Add S29GL064N ID definition
>>    mtd: cfi_cmdset_0002: Rename chip_ready variables
>>
>>   drivers/mtd/chips/cfi_cmdset_0002.c | 112 ++++++++++++++--------------
>>   include/linux/mtd/cfi.h             |   1 +
>>   2 files changed, 55 insertions(+), 58 deletions(-)
>>
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

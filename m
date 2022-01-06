Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BE1C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jan 2022 17:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gDeSpBwOBcgksQ69PI35jFxYylBvhfTBXl4t9cfc9rs=; b=paGZLOoFpLPrD0
	/cO1csxjl5AoB0hf+dFNoM5zF4/cH0ZcndCezoA2u5tqUTqC3dwCUGpCaRuCqLVbDRBm68wz9VNrp
	i8351EDv4rpxuCWKpc1gC3Nhceh/zky4WwYKqC6GR2TjoeAdFhyZ+Rd2bFJ+lEWqEnl9dVutiogBX
	H9xWOAamZaStBxF/AYCj3f5RbQThmkzRzwvwScTCCVzIGtP/UWu5V2ncR0+RMhSpfNm0kBzGAuDYj
	ATA0FCe10pguXXppKgZJGWxjQ2IHqIr8p2i44j3zX3JxJ88WsJxoQzZ/fuq/sWZCyhekIY36jE9ci
	H4RlmhRz/vshbALZDaaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5WT2-000nSX-3J; Thu, 06 Jan 2022 17:22:24 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5WSz-000nRD-5Q
 for linux-mtd@lists.infradead.org; Thu, 06 Jan 2022 17:22:22 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 2-20020a05600c02c200b003470f96e778so1352620wmn.5
 for <linux-mtd@lists.infradead.org>; Thu, 06 Jan 2022 09:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OESxuxOPQ9N0Y5m/wvnZiwker1H5kNKlxxV6vdBK7b8=;
 b=EAjQaRanzOIH/yxM8yb5H8X1SX8vm+zuKMYxwwAgwZx1hyFk+3f0PWM7KvaaeW21AA
 gYaYH2IXqh2BwtKSeVldKPY5EwA4Gjnk2zylL6hj0pwfpg1ajoFx3m4jiA9uvRldFbf6
 avqK3xdqvJNxTyLnn0cIleSW82WNtYOHz0bI0tb1DH0UU+aswltDkw5vUvbVzpgZjnzI
 TXVl/+iP19p4Wo+Nu9MaWxiYf81SUMtg/IMPTNRYQliTBUIiGVr9oVsk/eop0/BLjAb+
 36zG+7Q14T83jh06R31C6CjTOb2h1CyNdu435q1YgkBKVICE1sBMOkk8G5Sbtl1C+pFW
 66/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OESxuxOPQ9N0Y5m/wvnZiwker1H5kNKlxxV6vdBK7b8=;
 b=B0fU3F7gpdkvazDSmwpgP1G6eI10SbOftv7QQd1VIXso16g3EXLwhKBISOFA20/wGL
 CUDgcbVZpHqorQLhyrpD+WCDM2X4vMO4BfKjEwVMhFN44PRQ3emTcg2TUneIfxp5ydU0
 qP4Kv9gAwihm3TbWxrVsDdoXkLwP705g9n+La5ET9hR00ZjZSckdG/nDzqtthQEBARJF
 muP19Pwn6ycnlrGU0GltGvhr4N2zPvP7VfvvAJElIbmDOAvbukQIPQ5XJDDkJFpE4mwW
 r2cJ+aHUGLD5n7FYV+Ta5v8ZgW587rlrxl4rZLpw9zid0cud20QaZuGPfWagPZj/NxrP
 AQ7Q==
X-Gm-Message-State: AOAM533tP7bD2OobuD8AlO6WpY2xEDfmm8XYhd4SVe2RPLqchXiNf65p
 7APY9+HsbMknAj6x/BUmd+DB3w==
X-Google-Smtp-Source: ABdhPJwgw6xq9LNRrVTKmxbfYVyJW7X5FNtSTuOXv28V60cAAk4ifsk4fqTC/QbiKG8pdvGNzTzUKw==
X-Received: by 2002:a1c:f20e:: with SMTP id s14mr7693939wmc.186.1641489738072; 
 Thu, 06 Jan 2022 09:22:18 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 m10sm2261730wms.25.2022.01.06.09.22.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 09:22:17 -0800 (PST)
Message-ID: <edcd752d-37a5-2004-3508-01efcfa571ba@linaro.org>
Date: Thu, 6 Jan 2022 17:24:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v2 1/2] mtd: rawnand: qcom: Fix clock sequencing in
 qcom_nandc_probe()
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, architt@codeaurora.org, bbrezillon@kernel.org,
 absahu@codeaurora.org, baruch@tkos.co.il,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20220103030316.58301-1-bryan.odonoghue@linaro.org>
 <20220103030316.58301-2-bryan.odonoghue@linaro.org>
 <20220103055152.GA3581@thinkpad>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20220103055152.GA3581@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_092221_242538_8140959D 
X-CRM114-Status: GOOD (  14.75  )
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

On 03/01/2022 05:51, Manivannan Sadhasivam wrote:
> On Mon, Jan 03, 2022 at 03:03:15AM +0000, Bryan O'Donoghue wrote:
>> Interacting with a NAND chip on an IPQ6018 I found that the qcomsmem NAND
>> partition parser was returning -EPROBE_DEFER waiting for the main smem
>> driver to load.
>>
>> This caused the board to reset. Playing about with the probe() function
>> shows that the problem lies in the core clock being switched off before the
>> nandc_unalloc() routine has completed.
>>
>> If we look at how qcom_nandc_remove() tears down allocated resources we see
>> the expected order is
>>
>> qcom_nandc_unalloc(nandc);
>>
>> clk_disable_unprepare(nandc->aon_clk);
>> clk_disable_unprepare(nandc->core_clk);
>>
>> dma_unmap_resource(&pdev->dev, nandc->base_dma, resource_size(res),
>> 		   DMA_BIDIRECTIONAL, 0);
>>
>> Tweaking probe() to both bring up and tear-down in that order removes the
>> reset if we end up deferring elsewhere.
>>
>> Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> 
> Can you please CC stable list for backporting?
> 
> Thanks,
> Mani
> 

NP.

+ cc stable

FWIW I believe Greg's scripts will pick up on Fixes: tags automatically

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

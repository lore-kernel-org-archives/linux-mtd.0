Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E24C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jan 2022 18:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Pz1NiZDlQU31BzNURER6vEAJT51+qGx7v/DGhnq3TU=; b=YtCCBGTUNYbDDN
	lF0sCcnLx9eUsJgjxz9g1aVpDqc1ljw4Wjl+Q/5Fx0Us9nGlKfhxjPHpowRkYiLNIroTZ3fPvynvr
	5GM9uh9Z3jk1K+x3mv+lf0nG/M4QVAbT9hfJ+gkz9hAEgFOPA3NA7CxEuJrBLbpIM9lOicVLEVRjj
	6F4k4bKQAMhaVhc7e92q0ItL5JyniJ7neDiHR8HivoES7Kr7p8AnS3GD77Qhmg1QuLGXQtbEYS6B6
	1YGiGGpu4rmo4Kg3QkMeeet2tj2Xhkj82l4lQNH4wX160KUx6+2y+rcmwNYm9waJyXsktFNkK1wIq
	tp8DicC2/SQDSkeYTFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5X3o-000uWe-MV; Thu, 06 Jan 2022 18:00:24 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5X3l-000uVk-Rn
 for linux-mtd@lists.infradead.org; Thu, 06 Jan 2022 18:00:23 +0000
Received: by mail-wr1-x42c.google.com with SMTP id o3so6333628wrh.10
 for <linux-mtd@lists.infradead.org>; Thu, 06 Jan 2022 10:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EantZKntQcyCaBAX6MUZbLwTgreUhKCVjAV2mbTHCy0=;
 b=Cy9KwmjSk1kTuSIJM32qD5tWEPx39OYjEseTKLMOIyWtD1epX1uKogRRhdxTRbgQPp
 uJjNfzc3py1UeP3TfQeU9HXmMKPSE2YfP8cicLkW8XoB8QOghmCu/CzV5MTFSb/8ViRL
 7qf4Y6QRtQ0sC5UqqostWVZcf3i15LtHCgjyPj1WOgs8o1BbeCSsp1Jilbf7Ma8MpUjG
 NHqkFwV8IGt4eqEVBm5r26lASJM1N7A7Gf1eLwSIzVvEnt7j0LDSk8tsAL9Y5rM4SF20
 bAXMpKybku3qI0wrfK88hrnujijnc3XUz1YzV5RMhuLG8olWwmeQQScX4YTCyVYCHr4p
 LC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EantZKntQcyCaBAX6MUZbLwTgreUhKCVjAV2mbTHCy0=;
 b=QINY2ryAWpfQZaANm6Hh6tem9ZLXjdtYkcz2MxrkbIQQ+fq7hIDm/e0ASwH9zbrY/L
 vzZS0VxtKvlAiOBu8L7Ah+eu9G4psKxv1ruCHVbf62CRTUnS7x2AHPYeHoN9hT8pdqHA
 gurKNibyJYxcFA2ew56pwwkIT4B/S6jUJDvknhTKo4p+xd+tyrdHvUMatTeflE3JggLn
 s+fHbPqLvY3JF90eJ+Hevui4SWKNGGILOyxjT8LuzGe5dm+mBy0OvIiVVgOHx7fEqRwq
 JI2wbd8Owc6d5bvuA8C1uiWpVadcFaxiIEU7PwwVLdoUSI33Y5uZqUz3DtsycYoUo/oz
 +hMQ==
X-Gm-Message-State: AOAM532v+2tEATv4jE+YW7Z614nraV8Nr4jMMAjfjxzS5tPphqlvLHtW
 4rAKhNvCIphStAKf9TEdR0CrTQ==
X-Google-Smtp-Source: ABdhPJxCXbdR+6O/ldOIS0HKDjz+7yekArJpeIugf862bSIlJeEfRG/78DyY+PxxzodsqQP4B0HJKg==
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr52565981wrs.270.1641492019928; 
 Thu, 06 Jan 2022 10:00:19 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 c2sm3027218wri.50.2022.01.06.10.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 10:00:19 -0800 (PST)
Message-ID: <c0751352-3f92-0c5a-a15e-938dad5afab3@linaro.org>
Date: Thu, 6 Jan 2022 18:02:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v2 1/2] mtd: rawnand: qcom: Fix clock sequencing in
 qcom_nandc_probe()
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 architt@codeaurora.org, bbrezillon@kernel.org, absahu@codeaurora.org,
 baruch@tkos.co.il, "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20220103030316.58301-1-bryan.odonoghue@linaro.org>
 <20220103030316.58301-2-bryan.odonoghue@linaro.org>
 <20220103055152.GA3581@thinkpad>
 <edcd752d-37a5-2004-3508-01efcfa571ba@linaro.org>
 <Ydcqb5k8EcDqPJLD@kroah.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Ydcqb5k8EcDqPJLD@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_100021_965661_BC7135AF 
X-CRM114-Status: GOOD (  17.73  )
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

On 06/01/2022 17:44, Greg KH wrote:
> On Thu, Jan 06, 2022 at 05:24:27PM +0000, Bryan O'Donoghue wrote:
>> On 03/01/2022 05:51, Manivannan Sadhasivam wrote:
>>> On Mon, Jan 03, 2022 at 03:03:15AM +0000, Bryan O'Donoghue wrote:
>>>> Interacting with a NAND chip on an IPQ6018 I found that the qcomsmem NAND
>>>> partition parser was returning -EPROBE_DEFER waiting for the main smem
>>>> driver to load.
>>>>
>>>> This caused the board to reset. Playing about with the probe() function
>>>> shows that the problem lies in the core clock being switched off before the
>>>> nandc_unalloc() routine has completed.
>>>>
>>>> If we look at how qcom_nandc_remove() tears down allocated resources we see
>>>> the expected order is
>>>>
>>>> qcom_nandc_unalloc(nandc);
>>>>
>>>> clk_disable_unprepare(nandc->aon_clk);
>>>> clk_disable_unprepare(nandc->core_clk);
>>>>
>>>> dma_unmap_resource(&pdev->dev, nandc->base_dma, resource_size(res),
>>>> 		   DMA_BIDIRECTIONAL, 0);
>>>>
>>>> Tweaking probe() to both bring up and tear-down in that order removes the
>>>> reset if we end up deferring elsewhere.
>>>>
>>>> Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>
>>> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
>>>
>>> Can you please CC stable list for backporting?
>>>
>>> Thanks,
>>> Mani
>>>
>>
>> NP.
>>
>> + cc stable
>>
>> FWIW I believe Greg's scripts will pick up on Fixes: tags automatically
> 
> No, that is NOT the way to ensure that a patch will get picked up, that
> is a "this might eventually get there".
> 
> Please read:
>      https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> for how to do this properly.
> 
> thanks,
> 
> greg k-h
> 

Good to know

I've just been using Fixes: for the most part

Thanks

---
bod

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

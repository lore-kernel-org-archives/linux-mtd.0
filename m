Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE00C48BC3
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Feb 2024 11:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k/WH+zNUug6r7YCqag7ZQ54b9wEfTn+Bt8hU+e0D9ec=; b=xmsSK14goRpCtk
	/D434oJ0VOaT+RvehfxlLefxEnzsuObaS6w9SfjCKULxn1ofYHfk3aqExODDAkj6HFXAT4wiKmeVP
	b25YFTD03BCTk4oRvFyiF3/awfvdVQZKyuG0dfXpg2qbGiRlpcXtmwHNfpjG5Kg8SLJGzlMKrrTZb
	EGxrguUe0v1euwQDvgE9/d4zOQecEhXIcArz/aTdCn5EL88zGdGCc0WvNarXWaDMdssPhSABm0Mx3
	26/VUlkugv7qc8HkKXeyG1WfIZ7EylU6wa48ECGs43aHnxPhZ9ujnHzj+t1yh6nf1KWRE4rTF3b1U
	QBihJIhoXLVGQttCvWbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rckLy-00000000bwZ-2pBB;
	Wed, 21 Feb 2024 11:01:30 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rckLv-00000000buw-1eN2
	for linux-mtd@lists.infradead.org;
	Wed, 21 Feb 2024 11:01:29 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-563ed3d221aso8327482a12.0
        for <linux-mtd@lists.infradead.org>; Wed, 21 Feb 2024 03:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708513285; x=1709118085; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m2pkJbBBVU7OxhHun8X03GydiaahosMvy5Ph96bySx0=;
        b=un6wv1yZnWEjUuj2xdTI/QG0F9FaklQA6AZLMEWuDvMH5eq2aiWgayEsnOlkhiHTC0
         56UeWZ7ie51i2PWB+tPlQxS4XMqZ0IHc8ZJ32jzTLdg97azdVrBAFwNVZNeGXjJjqcPw
         hGO9szN7Yq5Z0f6dZjUqtGfLQcFfAfuHDP6ZMMjfNwEHjDXKA/ZA88ifrsSKEXPC9fGC
         Cx5QvplRUh7hyYvOAJ+t9FXqrkOZvm4Ler1kLqSGZ2xa0kzllbXrZhl3nes5DTGlVRq4
         mPnNSYOYGgcX7vHRd5gOViyR3Fs2b5lV9i8p8ropLM3eJ6mvzdyMcuhnEbnoypZvpOWP
         BOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708513285; x=1709118085;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m2pkJbBBVU7OxhHun8X03GydiaahosMvy5Ph96bySx0=;
        b=NOu4szHxNMhxrJr7DPo96yLsE3VmY3ZeylZOM7843M7m0FSBC1b3OtEXfRrT8+Br8+
         MTArCLENeXSL2UX8SUXTQEOKvNLUWiARWzdYmrXjJZBdrHsRWcWIi0hC0UV9/lcqX0vd
         6IXP++vY/DlhYBd7R86aGEmd84Q0vJLygggBo3pT/2ssjchSFA2XIh/ETaNiJNE1uEeM
         8kVEVRrB9B6taSo6gJu0w28pQKJdBS5tKzQEU3zi7nGXVuqQdjGhFuNZ/nsbQuukU+Af
         MeE4ZHHW/n7HSfJKgHmIDbgddjqaBv6oHIsBdl+VCJeIYrE/srQ43fvLx64bA9/Dd0YE
         WGpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxBBek+wOq0d9h5qQhYqSrg8X1BQE0Fdxgw6uyM0SMpa/r17G5j/BlpGi4HdVMSfBq9wtJ2J6CSqNsgGAJRnZeeYvJ5FAT+CW/3IgX7Q==
X-Gm-Message-State: AOJu0YzZkZQiokmP8xbmqRA/J+S7NaLJ2bo+ryxaWHRv1P16kzdnHw+6
	28aTRZ+n3vA5OveuQCEs3WFOmRMLSZevwCZa3BXQL4xcEG355LMY+yRqxzqKeZ57zxdg5MAaM3g
	W
X-Google-Smtp-Source: AGHT+IGKFQfxxh8f92W176IqOsPZLnlvo1236gn/NcK4osUoufn8tePgwwNQB8Vjdhu3+BPGeKco8w==
X-Received: by 2002:a05:6402:e8d:b0:561:ea0:e234 with SMTP id h13-20020a0564020e8d00b005610ea0e234mr20258262eda.16.1708513285522;
        Wed, 21 Feb 2024 03:01:25 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id i23-20020a05640200d700b005648745b23bsm2429714edu.90.2024.02.21.03.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 03:01:25 -0800 (PST)
Message-ID: <d9a49d77-32b1-45d1-b110-5e66155abad3@linaro.org>
Date: Wed, 21 Feb 2024 12:01:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add QPIC SPI NAND driver
Content-Language: en-US
To: Md Sadre Alam <quic_mdalam@quicinc.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, broonie@kernel.org,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, quic_srichara@quicinc.com,
 quic_varada@quicinc.com
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240219130412.GC3281@thinkpad>
 <3ad2909d-4ac3-fff3-739d-b12a3408fa0f@quicinc.com>
 <454a7e8d-70f5-4bf5-a3f1-bf9e42672c4c@linaro.org>
 <bfa0edb7-02fd-42dd-2235-0ea34f362515@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <bfa0edb7-02fd-42dd-2235-0ea34f362515@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_030127_471042_53A27D39 
X-CRM114-Status: GOOD (  14.43  )
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

On 21/02/2024 11:34, Md Sadre Alam wrote:
> 
> 
> On 2/20/2024 5:06 PM, Krzysztof Kozlowski wrote:
>> On 20/02/2024 12:32, Md Sadre Alam wrote:
>>>
>>>
>>> On 2/19/2024 6:34 PM, Manivannan Sadhasivam wrote:
>>>> On Thu, Feb 15, 2024 at 07:18:51PM +0530, Md Sadre Alam wrote:
>>>>> This series of patches will add initial supports
>>>>> for QPIC SPI NAND driver.
>>>>>
>>>>> Currently this driver support following commands
>>>>>
>>>>> -- RESET
>>>>> -- READ ID
>>>>> -- BLOCK ERASE
>>>>> -- PAGE READ
>>>>> -- PAGE WRITE
>>>>> -- GET FEATURE
>>>>> -- SET FEATURE
>>>>> -- BAD BLOCK CHECK
>>>>>
>>>>> This driver has been tested with dd command with read/write page
>>>>> with multiple file size 1MiB, 10MiB,40MiB etc.
>>>>> Also tested with "mtd" command like mtd erase, mtd write, mtd verify etc.
>>>>>
>>>>
>>>> This is not the first version isn't it? Where is the changelog describing what
>>>> has changed since then?
>>>
>>>     The earlier patch was the RFC for design review only.
>>
>> RFC is state of patch, not version. This is v2 then.
>>
>> These RFC postings are really becoming mess. Some people make multiple
>> RFCs and then post v1 hiding entire previous history... And why even
>> bother with calling it RFC?
> 
>   Sorry, I was not aware of this. Shall I post the next one as V3
>   and add references to the RFC patch and this patch in the cover
>   letter of V3?

Yes, like with every posting.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

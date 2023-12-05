Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250BEC4167B
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Dec 2023 07:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFoRYuiOM0FbVA2/Y4iCRmd4kfbQKqI028KhA5PTJSY=; b=olKyXtcbLW/jKV
	eyd8PuqzMMa2mICq7L3cwI7Xt/tHJTAwLKcKrlqybw/n/4hjjD1JeIhT+yyRRNtghxFrnSZD2afbz
	mhZzA1U1zZ5ClGEaI/oE+QagkZBw4pRPgowBDZAzH9VbWd9uUaVgUT5ANT9voMCxxAiOvJ2oZcL2C
	ixLUuDxfOT5QQ5yNVaEasIhhSn/t3IeEWq0XDJBG+fGiu6gY7chQXf+cRr/RIYe59NNmlyqF21LgQ
	5oX7hthJSprIjPwCfGDT5B7ytr9yColeLb7sx2hY7wWu5aNvarswVHCe/xp5p8ZW4gNMCvtpRxNMZ
	lNGKp6Rav8XzSK9Lxfeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAQ2Z-006X2P-1b;
	Tue, 05 Dec 2023 07:40:23 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAQ2X-006X0D-1V
	for linux-mtd@lists.infradead.org;
	Tue, 05 Dec 2023 07:40:22 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a18b0f69b33so960659566b.0
        for <linux-mtd@lists.infradead.org>; Mon, 04 Dec 2023 23:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701762011; x=1702366811; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Iwyea8aUEDEQH5QmcooZYGbCE7CHUUSFaCk91EVoU0=;
        b=T2cdDgofRGVQez1BCQgxi3jvLnZ3Jw3Tv00QVwdFPPE0mPhywum9R+enVixGQYjkHw
         bv3DCJZyTd8Yw7qETA5q6IGc4NVYVK43VM5Lcb8NPhc5XLvS2u6j6jSudrgDRjNzZbit
         XXGiiiT3j01qLn2GGspi8x/StJMUIF5AodItvTnv+kjV7Jl16nTAgof0/jHFMge9UOaX
         AHuBKif4KhuWeM8f78+/y/8c496FpmjQ+MFU6AjzX5iwVI4DRwlWdCFCKtt3l9809DTS
         WK/l2pkh/JOBLcH8X8MkFJDzqFFtBAs7me3et4gdzirssEMDLMBn20Qhc39IihGDENth
         mOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701762011; x=1702366811;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Iwyea8aUEDEQH5QmcooZYGbCE7CHUUSFaCk91EVoU0=;
        b=o5I2uPdTbpWREPSlo3xhxDiAetkQU1UpntxVlC/rOCdZkx1fwSkPmVSmsGkbojTPLt
         5WnTvH8nesnbc/a/Dkij8I0W+uN5teojjRqUf6wRKqHcKVaZWWaaNirHFQHg19+4+pNo
         r7kmZItToGYqn9oPJ6Qnrke7Ui0cw8jtqhdST6t6xC0yegNQY660jJ6ggzQOp3iAb6Ep
         pZSmWUpr+o3Ea3k6FtsGcFiW0y/kyNVzTMgHd5q0X2+XQby+n999/fVWwOhKoiX1K2nt
         e4LvyqQlU27uzUdknZfBrU27Y3oUu+56H3H/D/w9JT7euvXzn7uKTlnPKRvBZE8zi69A
         80/g==
X-Gm-Message-State: AOJu0Yw0nY44c5bt4hFCHFSt6FmWxKPnEkmofxHGOyyssDlTFSTldctV
	pu4v9CjEU/r6AYA/UmoaF70F3g==
X-Google-Smtp-Source: AGHT+IHUF7t5srLXEzU8HP5qZYHTfGV6V8zqdzDEo5EHilI1WeVqYFfNRg9FMdl/gfoCsaVgPu2RRQ==
X-Received: by 2002:a17:906:20d8:b0:a16:1b4a:a6fa with SMTP id c24-20020a17090620d800b00a161b4aa6famr671879ejc.8.1701762011447;
        Mon, 04 Dec 2023 23:40:11 -0800 (PST)
Received: from [192.168.0.174] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id h27-20020a1709062ddb00b00a1c522990ccsm453558eji.85.2023.12.04.23.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 23:40:11 -0800 (PST)
Message-ID: <d1b975e2-ba0f-43b9-af0a-f372fe42e5d5@linaro.org>
Date: Tue, 5 Dec 2023 09:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] mtd: spi-nor: introduce die erase
Content-Language: en-US
To: Fabio Estevam <festevam@denx.de>, michael@walle.cc
Cc: pratyush@kernel.org, linux-mtd@lists.infradead.org,
 takahiro.kuwano@infineon.com, bacem.daassi@infineon.com,
 linux-kernel@vger.kernel.org
References: <20231125123529.55686-1-tudor.ambarus@linaro.org>
 <d7ce98eb-c920-413f-bbe9-059077a9dda7@linaro.org>
 <6156a51f7eadc9594404bb0eacabe1a6@denx.de>
 <f9dc82f3-070a-42cd-a92d-83d031647867@linaro.org>
 <8de7595d8f4839187fdbbe7e139016bc@denx.de>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <8de7595d8f4839187fdbbe7e139016bc@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_234021_527712_D43CB760 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
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



On 04.12.2023 22:59, Fabio Estevam wrote:
> 
>> Thanks, will do. Would you please replicate the tests that I did in
>> patch 3/5 for mt25qu01q? You'll have to modify a bit the offsets for the
>> die and cross die tests.
> 
> 
> Here it goes.

Wonderful, thanks!

> 
> Can this series be applied now?

Yes. Michael, any objections?

Thanks,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

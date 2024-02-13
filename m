Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA7FC48260
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Feb 2024 13:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QdMJmhBzSsb9PbH2Yq5iUwgcyKY1nDG0Ws6c/ZJfrOo=; b=2qpixX2wqhQsX6
	tNaBHaSLS+d/r91bmfo3vOKjS+pFW+HW2M18ltwNP7m9utEqMP6RU6VWwTlW2Mp8SHS7d93W9ODb8
	p0j6Zk2RSo1VHU9DEH3KngtwWqH50SZyfVjWsRfjztdly09F6AYvLYZAS/pX/OeFjd7coesY30WKT
	P3aUu4iKov3/Pb9CrDtQbO9h2BLQZRdqO/0pqWycbUntS77Xb8txIW7B6C9bnNL/PYQTTybtUkebg
	pXwZO9ki4AYznaQrIzDKjmp2MIfM1sAm526qsTXffAfG+rJpau7tg9DuGrVk0VUHB+NGgyymXhUqk
	t25Hi61V4nZnGAN5I9bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZsuX-00000009MS0-1Fm5;
	Tue, 13 Feb 2024 13:33:21 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZsuU-00000009MRY-1saC
	for linux-mtd@lists.infradead.org;
	Tue, 13 Feb 2024 13:33:19 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3392b12dd21so2681660f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 13 Feb 2024 05:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707831195; x=1708435995; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OaD0B1TuLNeYNpMlA6iizr8UK6j9fkAx97a/7QghzcU=;
        b=kLK1+hVo0fpKM2ye3l6A1MVex5qT4O8HzDhanENCqxK3GVN+UlzojO0wYoxyrkLgSO
         sfpb+KUgcHG6ig3efdplnaDbxhxJy/6+B43mnh2xHPhWUlXAPF6XLQjQrK/Zm0a30u4/
         4PNYF3N4b71Q8JOXHCik7f2HNIW4TZvVLbqI512Ud2KoZ6+XkB3CZiDCysZPo0EIbAsO
         n/nfGMzisv5TPIkcoPkGBkNxCngQBxltw9yij4nJjLlV7cEZLJnb/qGUItv5yrL4WMEo
         wtcVXxRN4Wk33jpmFiSZheb8pda1NPUCauUHEd6l8NMxvXiziA8pMxXgl6/2GESL4mcf
         IGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707831195; x=1708435995;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OaD0B1TuLNeYNpMlA6iizr8UK6j9fkAx97a/7QghzcU=;
        b=cgLJwdEFeqEYV3zD4OjJoXfrbPWQUHiAEn/xUuCnVKvXh0h4evlnTRxCxMlrRG9G5U
         sg+tU+2Gzw/D2WGv3CICz+PE844ZxlHAiHeSsrYs5imrOWy4P0zG5mHN5cF9PnzJ6LBR
         n4NONmt1IFNGeKRZp3VqbhnLxnrEf41rdm2f+yWKPqMqImXRyRinQ9WxwXj5f4nRCzX5
         hLjLThn3CoficTvDZX7P7v4xp44fTfMYWmQzjeo1BpC9iM41FbN4r84/speJFzcjc5oa
         Cp3EYYbnpmvqhv6qh17u/m0Gvvq7o4RbRNaPqUvfKSVbdr9qh81jvs4l++Asnoxn8gw4
         Lzmw==
X-Gm-Message-State: AOJu0YzAjyXakawirvT7Ge1ATUWjqf2ih90ZOfacvBOoHIiMalstJoP6
	fBPsQVUqKl+tMODxG4Dk33qjIk7Oo6zc02OABMy8uzuTh8NiLh6G17WZQBLW1Lmg/0eyXqIdWd2
	3
X-Google-Smtp-Source: AGHT+IHf84yuxchXNd+daOoZKvcoUdxbsSzE2sC1WIC2WiFbCPCP1Jc4oNFQ0WYs9GkQaBZ4ckhwKw==
X-Received: by 2002:a05:6000:1182:b0:33c:e2d0:a9a2 with SMTP id g2-20020a056000118200b0033ce2d0a9a2mr318308wrx.18.1707831195090;
        Tue, 13 Feb 2024 05:33:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVWP0egO+6Qsein9lR2MZnxdm93iqghiryO5SosoaIxdRXjlBM+nu0fWgBvZq6SWht1fYQVyi/u8y8hYihS4+nOxVoPf1HcCFYHxlhcxYjzLYPzTi0pt+hpsYVIMKZ1YYLLn2GjzdriY/RDzPqfSUmcJD5151l+7bx79nrpjK6TZ8sl0HpdLmfLZkNpmJ9aD2p52o1MQVYdcj1Wnvn4Lfe5i/hnmNIY6UH1jduzv6LTiPwKOb5571pVxyeufSekwJbGFIcwnvyZlCfhz6bUnLNGK0YF3+hplPEbE8g5oF4wnjfBu0L4Tz3GO2aSFCkn9DImgl7ZwxIe7VQt/c7H3UUaQXTi3AZjyguK2FcHOuwPVtcaAW/ReBkuRE0=
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id bh2-20020a05600005c200b0033b7fb4d7dbsm6735150wrb.34.2024.02.13.05.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 05:33:14 -0800 (PST)
Message-ID: <681368b9-4c28-4611-a555-d7287a0eb209@linaro.org>
Date: Tue, 13 Feb 2024 14:33:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] memory: stm32-fmc2-ebi: add runtime PM support
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-8-christophe.kerello@foss.st.com>
 <7cb51fed-66fc-4ab1-be09-85a00d94514b@linaro.org>
 <ebd4b93a-80c5-4f22-974b-eb91e896e510@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ebd4b93a-80c5-4f22-974b-eb91e896e510@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_053318_687768_37EA5AC5 
X-CRM114-Status: UNSURE (   7.99  )
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

On 13/02/2024 14:31, Christophe Kerello wrote:
>>>   
>>> @@ -1381,6 +1382,7 @@ static int stm32_fmc2_ebi_probe(struct platform_device *pdev)
>>>   		return -ENOMEM;
>>>   
>>>   	ebi->dev = dev;
>>> +	platform_set_drvdata(pdev, ebi);
>>
>> Does not look related.
>>
> 
> With pm_runtime_resume_and_get API now called, 
> stm32_fmc2_ebi_runtime_resume needs ebi data to enable the clock. It
> means that the platform data has to be set before this call.
> 

Ah, OK.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

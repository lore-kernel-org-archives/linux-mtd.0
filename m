Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132FFC46CD2
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 07:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2taAiKPu9YsJazxx6pYzbacWokjfXPozfd8Y6i8HK5s=; b=eayYTdt71eYdFq
	d7awHwivjfUT70zaa2a99PJBq0hw8DaapgaQEBxCogjfcAZrcHJVh1mEtPSTtIOjJPmZwSBdwhYBg
	dA4GsWtB7QZE/jCqq2vVlghFBAIkuvsY6Ag5prKtj7krPENCCtYW5oIbFnJQV+uMidLl839lJj6Q/
	NCstNOWuppXgae43FOXQ2R344c90oCVp3evI/mCm93ZMMws33gLmoyA9M8CUgvVD2UVS6sD6upQb8
	VfZu/FoHUtA9xsJOiKb4D3KhII+XNwQIdkoVIrXZVus4D7TDYw+M7x/wgF2clUTtx2SHjRSWkFIEo
	nWsWo7Ph+xwCRoWr/QFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSXt4-001tNL-12;
	Wed, 24 Jan 2024 07:41:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSXt1-001tLX-0e
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jan 2024 07:41:28 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40ec6a251a6so2343605e9.0
        for <linux-mtd@lists.infradead.org>; Tue, 23 Jan 2024 23:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706082083; x=1706686883; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IlJEnsoVhz8ypWyq2cTLhQuGGzRcXAYbZfLDCwqrwKE=;
        b=Mvg6ivuQeL+kigi8RDqzS8GnDia49JvtvDJfh1Hl/VMiTS1HQtx4t3BsclTW2aV2Rs
         4y9wxfvhKi0mKILMjzSHJKk+ImClEJckKN1GSoUBFV/7ZeWf8JFLC8qymYrc7sfkS3Ma
         EHaWM9DNtvaBr5e4XULOo4xtov6wD/oVqnqpiJHELg4NUR2OBOxHPFOCzNOLcXwRzaeE
         YwF2MdmSZBmR3STzTtFnhNvvjv/0u5YZ8trG13aHJTHoTDvXz2kQYnLGtEU809DebC97
         MQxNGy+WQWLNStn0xWobjBWAgSg23TGgzQWQ1Xa3I+VqpJKYjVdzLgkSSOGARhRr0gBp
         UymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706082083; x=1706686883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IlJEnsoVhz8ypWyq2cTLhQuGGzRcXAYbZfLDCwqrwKE=;
        b=pz+WGciU2RYgU+RRCzr+0q/iJp1AKCWbCtmL8QWsGsk/SE8stbKpIAElPHLDDjAARc
         vQJApif8oOpXCBzh1YexSu191uDBQZZEJ7tMoA+nIpuaW1SC43a8/XdDjiy9tQDBxB9i
         b789/PBPYsVN3przZybCwKlDErNehwr3bAMTJ7VMXlS79QOm9PNpqNuzHI+8UppugexN
         lJpXR5HmcZLBP0ANqXN3oIYY0ZEF4KVQLhcypsHWSXvO8EE4r+eki03pyB7uKGscteGF
         rD3/JfbMDG6s6h+5i6chxIsoYgLa6MKHmhX7iduIdJA7nqXNYC6Bigv1phQeai3uVN1u
         Iyww==
X-Gm-Message-State: AOJu0YyW/cO/gKwakC4ld0cuf7ymQsubJ7ERF+cWrj/NHmWLrwtSj3Bh
	w2vCq1FkyKtUR+mC5wGpBJFEWKHqOMiWJPGp15ajvD4y3A8chtaW9CLEdyCmMQI=
X-Google-Smtp-Source: AGHT+IE752JELBVvNHG1jOcrJWWzkptZdamTYSA/qOTNHuSgoWFt0+MYXeAQP6sRRCtUwVAL8+sP6Q==
X-Received: by 2002:a05:600c:4f51:b0:40e:66a5:574 with SMTP id m17-20020a05600c4f5100b0040e66a50574mr798754wmq.120.1706082083350;
        Tue, 23 Jan 2024 23:41:23 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id m22-20020a05600c4f5600b0040ebf603a89sm3862013wmq.11.2024.01.23.23.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 23:41:22 -0800 (PST)
Message-ID: <e4b96eee-1782-49b4-bd67-e318ded4bd04@linaro.org>
Date: Wed, 24 Jan 2024 07:41:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtd: hyperbus: Introduce SFDP probe
Content-Language: en-US
To: Takahiro Kuwano <tkuw584924@gmail.com>, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1680663252.git.Takahiro.Kuwano@infineon.com>
 <480824dd0f9b1d549ffe08e7a6e2a93a88f6e13d.1680663252.git.Takahiro.Kuwano@infineon.com>
 <9cb99638-b43a-4f4d-b112-77f8d35f74f4@linaro.org>
 <11755c36-ace3-4836-9be9-343e0c73fe63@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <11755c36-ace3-4836-9be9-343e0c73fe63@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_234127_237836_18881C32 
X-CRM114-Status: GOOD (  11.26  )
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



On 1/24/24 07:26, Takahiro Kuwano wrote:
>>> +	 * This is the first time we're called. Set up the CFI stuff accordingly
>>> +	 * and return
>>> +	 */
>>> +	if (!cfi->numchips)
>>> +		return hyperbus_sfdp_chip_setup(map, cfi);
>> Ah, I need to study more. Would you please speed me up a little and tell
>> me more about the multi chip handling? Why is the probe called multiple
>> times?
>>
> For example, we can map 2x 1Gb(128MB) chips in single 256MB memory space.
> In this case, the probe is called twice. The first call is to set up CFI
> structure. The second call is to check if another chip really exists or not.

Do we have any hyperflash multi-chip devices upstreamed? If not, let's
remove the multi-chip logic and handle it when multi-chip is introduced.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADB6C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 08:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=KmWzgUWKidAWay
	1Mt3/QtVKEBW46gXwbFk1F7JtJwRyZgKS7b8bhhxizrIsENZh42CuS+me/bL28FvQspXZna4/WD75
	BvBbmLYUVNvqkVL4LrlQalk+nCDTCGqXYePbLjzL9dpvY7BRFtmV61dSc0oO7DV4YNR8oM7TqoPI4
	7McC1R5PzoMt7iJ7UqTIHDtMWTv2bpPzgz6csX0c+QxO/+SbPt99B7bc634TrUkTgz56pEOEg6b9i
	BROTrrOL3wx0KqdUKEvQJcmmQR+nr1uMrbx71oNDkEHuhZn54+Q8GR9NSSmmrkRhqJkkLrjxVLchl
	AVzxdHHYDBIda23RiOEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2RyM-00DT9e-0N;
	Mon, 13 Nov 2023 08:07:06 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2RyH-00DT9B-33
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 08:07:03 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-53e70b0a218so6303800a12.2
        for <linux-mtd@lists.infradead.org>; Mon, 13 Nov 2023 00:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1699862815; x=1700467615; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=btNlG3aF7RPGspn0Lp6b8q50CqztF/0yrx1IFbUFYr+4wDR1yUMzltDEO/UIkCqGIa
         avsLT7anxXj3bE20jXHiIfqke0VmbI2TeTkoRcpFKWh9dhRpJq5oVoRnkDwFpHmytI1R
         6XoHCwcqhy+JYI2sUKEDJI/YwT9oDZQIa8tgBEDewhR6VGkYVl4WLCUch+gmKSw0CY9e
         nrV3qyvTT3p7wFchW5dGZDIU4yoGtZoOOcjZqdHVQgDVu2yz66uCF/BTSMHDXeMzo6K8
         X/t8h7p4GE1oeFJQ5G154FhrOSMSfJ8BJ8Y8j9xpyHz/1WpumlYyynFTp2tjmTzQn5g5
         fOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699862815; x=1700467615;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=VkUwkDPOIFydEaEUXSLOUDVRYgWbwSZsYZWQ0zuKNU8VG+f/z9fIhFvRxRxCqkbWIe
         9qvyNxuBxyWZ6zgRQDNkoplVhm2BXvFUNyQESKaSZPIseAvWPRnW52aqEz+o5xRCug3k
         Xc0dBB24YXZyw5JAs8B4v6nKcL8uNYIXdtWm7/e4iBCjscgguRfPCcB8lX7r5/mnN15M
         SbpcJA5gvzF/zJNqnCmNAonQcx236yoxvsnoWdm0dhQrx13IlWP9KGtcM69IoHJJ6z5o
         J/sqVX+XBu16bS5HOntaeyS+/2P7gymRxo/0dQSIdIlbjCwMgQZJuIig5rgXTKoQ3F6v
         1nGw==
X-Gm-Message-State: AOJu0YwKgcneY4K2hEjN9KFRh/h+p9iLJ2uDTqQHZmMW1Gb5r9dLCVSi
	hXMmuyOt8BMHKXW37fJHApv2KZueUiONYTTBhulKXw==
X-Google-Smtp-Source: AGHT+IGJPoReWIIFNnpu4iW1Wo0dAVYsAO6mJCea02LDaVDCK9GasJAG1pQCbr/ecE5N+nm6yT6gow==
X-Received: by 2002:aa7:d659:0:b0:540:9b47:4f70 with SMTP id v25-20020aa7d659000000b005409b474f70mr4238510edr.26.1699862815416;
        Mon, 13 Nov 2023 00:06:55 -0800 (PST)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id y22-20020a056402135600b005402748cf29sm3342062edw.50.2023.11.13.00.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 00:06:55 -0800 (PST)
Message-ID: <21b620ea-3762-438b-a539-291fb9dbb18a@sigma-star.at>
Date: Mon, 13 Nov 2023 09:06:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd-utils: flash_erase: Add an option for JFFS2
 cleanmarker size
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20231107092357.26360-1-Takahiro.Kuwano@infineon.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Autocrypt: addr=david.oberhollenzer@sigma-star.at; keydata=
 xsBNBFZyf0YBCADHyKhABhxthCC9n48pvsuk5p3IEdYXMs8Apenh1N/Z4cViAz/d/nSCZ+FG
 FX/PSubEzq8AilZLejchAltaORCvA1Y6FgTlpcdJ6gHDfStDbJL/vk5N8aL7YNF7VfjTRntB
 tKbhKcrG05nbdNjIioAm04pt9rx5mV5KMbf22/FdZpOSSsC6/N7b/cFH9+fx8kwi4pNFuJwr
 BkWRuQ7rEtCoSpd22t+Vh9qA7kymW9gWY405258jnN65jBO7ElqU2CCuGRPg6uryAHV3RVCB
 9j9AE3HLacQReFtt5ylyydSQbaK4K9asnd7U2/C11vIuuciXCppX4bPap/pMnGpzw0UNABEB
 AAHNN0RhdmlkIE9iZXJob2xsZW56ZXIgPGRhdmlkLm9iZXJob2xsZW56ZXJAc2lnbWEtc3Rh
 ci5hdD7CwHcEEwEIACEFAlZyf0YCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQvOXc
 PHQaAtFuEAgArXOhaoaVvCMVCa5N25Q/+Q6K1wrVpPmkH89yhQqCmfM6f+2VM5MGFDPfaSJ3
 5fBDH0iwBQwlXIb7NSXWtzdXX9rMvJkJqv45TgeKtJApf/sRhmcN+clrwzP8oZQbxkP1YWzo
 Vwo4lOb3Kv7aY9yeCjqNbdJJ57NpvYOUrzrCpGkrDPBBQOvKF3wbq3oU/o3dT23NDeQ20jXg
 quJf/PCw6WCzRxqg58wH02MdMDQe8vByzVig2bM2e7DErtt+hPK/Dmdsqgns+Z+SrQcOvRa3
 GMAHAuHB0u2LhYO6NyaNCgzdgutorilYcq7FEKr8XqwOnfVmZdCW3qGKmLbn6qMEdM7ATQRW
 cn9GAQgAvugF8cFjv2Zs4BBb44SnxGawBySC1bMRas/MjA9EMHUAx/StcecQmxnl6BzEyGpr
 +TRnXIzcb5xI8SxitBDU5MLvwsHgNvpYp9fscd4kWP7oMir9ta3Q8SvT4OLbO4FZBGaURzGP
 ak8JmjMMtOoOBh4meOjz6GrJe9UIGxT94aB01w7YohfBANzK8xyk4ykKC5Op4XgaaMKOEQUa
 h7wajcojYSlvgOiXqEisMHlRDAW6sXL2sEM7TIpvYhy9txMLllpkYb0Pu1BvUpY/unsybWKA
 FyiTmeiY+nEveUvqX6Ef7BWdClBeCk2UaRvtcoLd22VxMlKTniHQcNMOXlRRawARAQABwsBf
 BBgBCAAJBQJWcn9GAhsMAAoJELzl3Dx0GgLRPtcH/jD6rn2+VIKgrHdt3ao3Abpu2fqYfwbI
 yPAtpXOddDptVq+0A/2arXT1Y8+jNSZpbAg8K+bLaEAcSUEjviKMpfI7ppTUBuGKrpgc5xsi
 UpKkJCb7oB1ZraIBNBPtPPVUhbwLie4uW/LVt+8rBKz3W9KEDOsT0ZCG/pW8Ld+EpDR9l0fm
 qoVHaw8PhLAtez+B7HS7Hv7iJPDtX85kFYpud8kIPENXVn9EjZudyMWgZb2LhYlcavNcszgR
 7In6ift5SNySojCOfAV0iKZb8QUXWktLleY8kQ8jltOsSRTuO4PDfzvtCQDixUw4tQ7WLwDT
 qyUpot0oG03vtSG4LIRCdxI=
In-Reply-To: <20231107092357.26360-1-Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_000702_292027_25F38320 
X-CRM114-Status: UNSURE (   4.08  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Applied to mtd-utils.git master.

Thanks,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB67C2BB3F
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Nov 2023 06:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQzWEGcvt8XHOA8/hmjQVM29zziPNE/ALN2EKB3uE+0=; b=itbID5YQRJEsb7
	iNgAShv1aCV38jYbYrBN86AGUk5TvkQzFnOv07YMUvalORI9+Djzecq/t4tZa9Rt4457PNwVU4nAE
	3prclzvexB4H8ToMC/9nAE7rIcp1cB1+DErxl+oFCZCfmQe3nScN/iZkT7zT9IPB4RnqvCmDCM6u3
	zffQmU8MHZe2bfq8zXUGEqxYBbUWOQZdMimj8CuAj7I8oRSz/gC3gERmOQOwUwU5JFJkjtWboGSAL
	+oAutuBy0v67PI9tddTxtR2Ys1uA89KeQ37lq4lmi8GDkp7/QQxASzDamXoxj8lGVFZdk2p/LjtTi
	X8lriX9XMzaa7mfVH7Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4y24-00BH1c-2V;
	Mon, 20 Nov 2023 06:45:21 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4y20-00BH0X-0d
	for linux-mtd@lists.infradead.org;
	Mon, 20 Nov 2023 06:45:17 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo5644969a12.3
        for <linux-mtd@lists.infradead.org>; Sun, 19 Nov 2023 22:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1700462712; x=1701067512; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5teAGkE02BEQqTOzepCPiM1sP5VO75Go9gPJiGEVbbg=;
        b=Wwt82PxVH9hSHRkQ1ZqXvT8VBq8SEt9nzdzvvN0ENhb3LV5ZEEQkiGbLQAwA1KUWbT
         Xk5Co5AWcNfecJenp6/fBU0QRlPpU+Cm2HCv7rKjhAP1t8wCT43anIOh3CdJVGoLW5E2
         +AYEYxhwmwHshBHhM5h7UQdMiKyp3Dp5Z9cUH/Iqr8JUZAK80EY4sChckoNx8vvz9Z6/
         99q0UUi1T12mzk0niMJMIWmWlboIotnBEZYQV9p9j2jBYat2n9w0mFd7Y1O8+FMClf3V
         6mWd6naeHvtB+ooGJ5K/Fqr8EkUF0FPNhU1cj8W4obb1uwS82qEg0k5Do+8oBVM/ssuH
         DN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700462712; x=1701067512;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5teAGkE02BEQqTOzepCPiM1sP5VO75Go9gPJiGEVbbg=;
        b=sn//RJ1eqJAOfmg0/irWLPQ2YuGrGOaB6PKef+ywFdMWgdgC9bit49kH6uHDIcdQUE
         XOa9cyHxCpl85xfK52uMukA2nWxGoNb9kC/WJPIyhn/G9f7RmS9JDoVnM3nb2cQlCV1s
         X/97NrqkfuaOjceAdbnWjV9QHHAyss8BIdZMaG/7JArEM8OFrPg4syeHauLD0IormZRe
         TtJ3AZlBVBsWs2x5werzcISM0E5ia7N9fqGXYd4mr6/76rHRX4zdTQoX+KuM5HLJoAiQ
         hXHprlicqEedqafzdET8qJHasu5LQ/Jsx6Mk31gMXnYd8pCnsCnHFPFXcKivjeqkLu5J
         z08g==
X-Gm-Message-State: AOJu0YxOHRvoo5GG5U69ClHedQWPmzz0dh2rGGlhQ+GJJrLGc++bG5ll
	lkWb9S0jIAO19LfzTqHxGNUts7/eOXQlHY5eJzSndw==
X-Google-Smtp-Source: AGHT+IGPeZmkxk/Bdf3OU5KsaQ8k7LGTDCiCXACrxTy1yygb9XhaQX9IXRKushvQLmGDl83MYOdCOw==
X-Received: by 2002:a17:906:51cf:b0:9be:1012:91a9 with SMTP id v15-20020a17090651cf00b009be101291a9mr3979399ejk.4.1700462712598;
        Sun, 19 Nov 2023 22:45:12 -0800 (PST)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id lz13-20020a170906fb0d00b009fcbb9162e9sm1428742ejb.174.2023.11.19.22.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Nov 2023 22:45:12 -0800 (PST)
Message-ID: <d7da4886-0dc2-4440-ba08-d7ae6c2c86bb@sigma-star.at>
Date: Mon, 20 Nov 2023 07:45:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mtd-utils 0/2] Add two new fields in ubiattach ioctl
To: Zhihao Cheng <chengzhihao1@huawei.com>, richard@nod.at,
 ext-adrian.hunter@nokia.com
Cc: linux-mtd@lists.infradead.org
References: <20231113094812.853529-1-chengzhihao1@huawei.com>
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
In-Reply-To: <20231113094812.853529-1-chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_224516_554283_361F76A8 
X-CRM114-Status: UNSURE (   4.23  )
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

applied to mtd-utils.git master.

Thanks,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

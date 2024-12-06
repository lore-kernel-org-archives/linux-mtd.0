Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A94E77173
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2024 13:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QPOF741YTlFdKa/yiQfmOPRfqBjNi2yHcqCZVNRoibU=; b=QSFmqnhC7J/RK9
	C8fK4X1PiBuYhBjzEMysjxSwFBvqJC1zzy9N+1cgSfs8ijv1pQrBizl2D1r37Yk9yi0UDGxgQOM+Y
	9Xxfck9T3gtlxTQhkgOPoNYMrrCTu/xtcYIGptdmy589sD2064ENs3y/8BEIVtG8THjK9fXNyJC/a
	zcpnA+x7el3vBK+WIUVLP0w6wgPyG8ORJXMdnrs7s1dyl1BCMipfuC01/Ub0OfQu5RtH8Dd7gpXc4
	kNQIsK2htCsDwKBwxDHBFQYIBheUXyvOqHzZpI5geszazmTYlDZyEljm5WG5u82WcixKAIjYWiTry
	PrKBADqYx+aHAHBXkgSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJYYs-00000001kAU-16qv;
	Fri, 06 Dec 2024 13:40:02 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJYYq-00000001k9t-15Io
	for linux-mtd@lists.infradead.org;
	Fri, 06 Dec 2024 13:40:01 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7fc8f0598cdso2527792a12.1
        for <linux-mtd@lists.infradead.org>; Fri, 06 Dec 2024 05:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733492399; x=1734097199; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ER7JJmOmUPd/I2ZlHtBkcgwQnCF/DLT8APTkKzWblmQ=;
        b=NZfU0SXh/gRA+zydPfh0DbtDLgfrX0E4uBWSrPaz/t7B8d8HhPG2ED13S+6YvYjGm1
         fwW4AKb3rZFuVWoacTbL9NTX7nPaB9/Mm9fyRGRq4AZKuSLF1pTrWTGFAuCwfNwrfISX
         mpSBeSn0CblvG6cN8maNzPt1vUBhYPEXl88nDHmJ1v0cMfJ9TTK6RS8rSuy4z2ooYepj
         0z5DGJ0lr3GQ8J8+Kaw5i33lUBwgn0fnjosg4ollGZdnkUNCTLy9JYMAJe2Jy0hP5F7i
         jzgmj1yZtLqqvcNFUNZ6X/ZiAh0sx8IIKOtCeJk76+dj9IcoMgpFAzaHjL14TUt+4EeH
         2vBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733492399; x=1734097199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ER7JJmOmUPd/I2ZlHtBkcgwQnCF/DLT8APTkKzWblmQ=;
        b=lQDaP5GmyBbvZqRVL569tmkoUU4UrP9Fy4kfTOQYp8Y07sAKhENy4u9vvhbiqDOOwo
         VNMvRyA6ekIU506SdUF7zjr7JVEcs6p4JKCO6VreV0VsX0BXFT+JMuykM4rKxrCXjEvP
         0Uwo3pBEOtKFJAA4P7F5j9XCCKLTlN7ZxxpgdbgsROq9d8Y2qq03cNVE6YbrdY2oV4Cd
         thLiwpcCsJtnP30nBUdbTE0opGZq0i7xzrfi7tFuPOX23cX/PY8577fkm8DluQB18fMv
         PtPSZdl+83zl54NicLEaL67BHKpqq9r1I/SHSF9qWXajVXUj+x+vjvZ9fs5smzQ5Rvrr
         7Eyg==
X-Forwarded-Encrypted: i=1; AJvYcCVL4YwOQEB2Im34nQ6EgRg5ttjea8yfWJL9hVvj//o+ScOEeqyEJqMp9UW8wKWfVf8YP4b6w6qkCtA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwOJ4kUkbxeiK5hUyg3Dj4Y3ohGFnQVSw6TfvmoQCS8W66xZtW0
	1bsJ85DsLqmR/DTTIvrSnDKG6QiZBVlh1dbbS+75lWzB/aazlRWJ0vhe53/1Rj0=
X-Gm-Gg: ASbGnctgr57RvxXNRRE6bYvH3kRNWu8FF0AoMBpzsC+bVzF5L+8S2sO91oJJ7Mhhx8D
	2eaFAR71I6JX3iCwv7DVD1JKU+J7gZlBUHyhTLJsBKdTT1tzbh3DMYm1oVHlhm51Z2xBuP5OmLd
	KFzsdhTLJqxw4ZLeASWSaUMnRKwh9c3NGA31tE9HL+OuLDMijqMLU/GroR9yMgFnFoD19gEfL66
	FtjFJjKRM4dyJE9UANaJoKdE3IV/48P9Kg0kJ8FIBqwZ4u+JuTyijQkhTTmW0G2w5/I26D9d8Bt
	h6y20sO6qKmYm6DMlrzbkoyTgRRMjw==
X-Google-Smtp-Source: AGHT+IHAqC6pwzZb0uMVNojTM1Ovqi1UcyQgaJ+e5eaqQjy91W5QwuZOGjBTODaSRvyeiLIjGXc42g==
X-Received: by 2002:a05:6a21:168d:b0:1e0:c166:18ba with SMTP id adf61e73a8af0-1e186c1dd91mr4318707637.12.1733492399444;
        Fri, 06 Dec 2024 05:39:59 -0800 (PST)
Received: from ?IPV6:2001:f70:39c0:3a00:75b0:95e4:30f9:a33f? ([2001:f70:39c0:3a00:75b0:95e4:30f9:a33f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156eb0f8sm3037665a12.37.2024.12.06.05.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 05:39:58 -0800 (PST)
Message-ID: <fbd8f562-da8c-48d6-9642-607c7481f02b@pf.is.s.u-tokyo.ac.jp>
Date: Fri, 6 Dec 2024 22:39:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: hyperbus: hbmc-am654: fix an OF node reference leak
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, tudor.ambarus@linaro.org, richard@nod.at,
 linux-mtd@lists.infradead.org
References: <20241206114740.781053-1-joe@pf.is.s.u-tokyo.ac.jp>
 <87cyi5q6rj.fsf@bootlin.com>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <87cyi5q6rj.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_054000_300091_B9C37581 
X-CRM114-Status: GOOD (  13.50  )
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

Hi Miquel,

Thank you for the review.

On 12/6/24 22:29, Miquel Raynal wrote:
> Hi Joe,
> 
> On 06/12/2024 at 20:47:40 +09, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp> wrote:
> 
>> In am654_hbmc_platform_driver, .remove() and the error path of .probe()
>> do not decrement the refcount of an OF node obtained by
>>    of_get_next_child(). Fix this by adding of_node_put() calls.
>>
>> Fixes: aca31ce96814 ("mtd: hyperbus: hbmc-am654: Fix direct mapping setup flash access")
>> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
>> ---
>>   drivers/mtd/hyperbus/hbmc-am654.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbmc-am654.c
>> index 217f4e69233f..3e206bb34287 100644
>> --- a/drivers/mtd/hyperbus/hbmc-am654.c
>> +++ b/drivers/mtd/hyperbus/hbmc-am654.c
>> @@ -174,18 +174,18 @@ static int am654_hbmc_probe(struct platform_device *pdev)
>>   	priv->hbdev.np = of_get_next_child(np, NULL);
>>   	ret = of_address_to_resource(priv->hbdev.np, 0, &res);
>>   	if (ret)
>> -		return ret;
>> +		goto put_node;
>>   
>>   	if (of_property_read_bool(dev->of_node, "mux-controls")) {
>>   		struct mux_control *control = devm_mux_control_get(dev, NULL);
>>   
>>   		if (IS_ERR(control))
>> -			return PTR_ERR(control);
>> +			goto put_node;
>>   
>>   		ret = mux_control_select(control, 1);
>>   		if (ret) {
>>   			dev_err(dev, "Failed to select HBMC mux\n");
>> -			return ret;
>> +			goto put_node;
>>   		}
>>   		priv->mux_ctrl = control;
>>   	}
>> @@ -193,7 +193,7 @@ static int am654_hbmc_probe(struct platform_device *pdev)
>>   	priv->hbdev.map.size = resource_size(&res);
>>   	priv->hbdev.map.virt = devm_ioremap_resource(dev, &res);
>>   	if (IS_ERR(priv->hbdev.map.virt))
>> -		return PTR_ERR(priv->hbdev.map.virt);
>> +		goto disable_mux;
> 
> This error path will return ret, whereas it should return
> PTR_ERR(priv->hbdev.map.virt).
> 
Yes, absolutely right. Fixed in the V2 patch.

Best,
Joe

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

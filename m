Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0927C48BEB
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Feb 2024 09:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNiFoI5i29LzTVuV6NkIwudEGS3XJyf8ms1zcIBMl18=; b=iUFhYXExrrxbSk
	pDbTsLLj6btrk0zhhzG01/GPdjeuJnFqieGeoJyen/Eg04cWRQORN63w2ZvNAgogWF/VPpMLf1N5C
	ZbsjffM+WT6Hb43UP4Kc/eWGeyu7jkQJblWOlpuYrdGg4jBNGB0Boe3CDp7X30Kq3oh4L6X/0CxWx
	iRFVuTrnWij0saF005Yxw3L90nvSZpsmdBGrhP4wIeaK5gAlW8hCFp9oxJJZgq6lQSS5qkVER8IUP
	U89tdF2rkeMziGTrmV1G62DUkiSgzleOs8L3rk184p7qduQ/ZQbmvmDUAz5pr8g2X07UUgu1iXXLq
	jdceGui9d8uZzXbh1Rgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5RF-00000004G97-3oV5;
	Thu, 22 Feb 2024 09:32:21 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5RC-00000004G6n-258y
	for linux-mtd@lists.infradead.org;
	Thu, 22 Feb 2024 09:32:20 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-563c403719cso8108873a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 22 Feb 2024 01:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708594335; x=1709199135; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XOqM3NsDuWKMQENhNm5+cil6xV61x6dYDLcx2FP7twQ=;
        b=nUNxjLWsrLmzxbfLNhaCY3/MVaO96Ina0jBFCdqtgTvqf0xoxnfpyVOZqWUE8faZgc
         9YpJvM54CAgEbaR6fcnkmuuW7mOCvQcwJirofsaaenSzRHreGeIxK12xcRSR5OkegEy0
         CMhtAqjNGxVv+iWm3osj4D+mJc2thC3FiE/Opi5DZdkIDOJqW5/eyq8oILrLUCfStDxG
         IVBzBq4yKNMnPA4Uw6jJEvMv/XAb/7VhC2pfeNByc28x4XXqCH4glbvjO42Q0D2LBZ4k
         we5MQ2fx2DyldH30jlRjRrLeMJorx63r1Y+6zyPtKoJYs3RIMUYhdl75bOxc4qDn0UgU
         WjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708594335; x=1709199135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XOqM3NsDuWKMQENhNm5+cil6xV61x6dYDLcx2FP7twQ=;
        b=sNBcLXM9MHooAeuEIvrZAwrfvZ6hFzLQ2wptWRC8MRa6FXP5Lu+U9zm5oYx0EUL4DE
         EgMCTDHH3C7JctKfityiStmvDwxRm+lNWcbdWOhvNaWOyE0pNq7c2lYCdDQxj4ZQGJEg
         dDNVvqVpZwtvFXiwfnyqG5ezmdQydFvc6YrDeUbMPZdBm8o1MIEM7a2kHN1Xd8jZQ7Wn
         HXQGNzSjTyNVPH5xTdqWVsVgWcRykmqSD76ArFDDzHWTLJGoMzTfnZLqid4XSrGv5kdC
         8i/DTszsYywvqV04PRwBafuZ8VovhUj3HRpI2v/O/yUDOkts3i5nxfbJ6pf8R57XDg6g
         IcaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7bNym8dxxaEWslsecW7LEs5KPQ90Xq6jhSHYJuDYsv8pgW4tWdXNUHvui9n3u6SWx3fAMZIIYa6PaZ6Hua69sgjBH98a4TjRzC7ab3Q==
X-Gm-Message-State: AOJu0Yy8RXZGQH9nPhRXAlp9VVRrPRdjKKUMF2Mv6ZDNVc3dj3v+QElC
	3l0o7PKvuRNeA7PQ+1lYD/uIQsP0i+BC7Z9wF1uRHdSon5wkylAjuTpSlNb/ndU=
X-Google-Smtp-Source: AGHT+IENrhhk/UuD9Uow/GPjukRT5yJvT9rnH/FfAXts5feTUta/DGa+0TovOKoVhCGhw9WaDjA8Yg==
X-Received: by 2002:a05:6402:797:b0:563:f854:1a57 with SMTP id d23-20020a056402079700b00563f8541a57mr12309566edy.40.1708594335069;
        Thu, 22 Feb 2024 01:32:15 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id fj21-20020a0564022b9500b00564da28dfe2sm1857570edb.19.2024.02.22.01.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 01:32:14 -0800 (PST)
Message-ID: <75a22482-0d2a-4e0c-86e8-3a8e71f2f403@linaro.org>
Date: Thu, 22 Feb 2024 09:32:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/9] Add octal DTR support for Macronix flash
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, pratyush@kernel.org, mwalle@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 broonie@kernel.org
Cc: leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_013218_747505_5329F641 
X-CRM114-Status: UNSURE (   5.01  )
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

Jaime,

You're so close to have these integrated, I see there are no major
comments for the patch set. Would you please address the comments and
re-submit?

I plan to do the PR next Monday.

ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

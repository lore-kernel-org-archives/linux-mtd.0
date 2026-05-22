Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B421CD5BAC
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 09:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Z1fz+RtIB13nRMIRXiq+mrnVkU32OuI44yxfNxXPmw=; b=wp7oq9esdiD+eN
	UWmR2pxZSGkQuqqn4B05sokxGg/SbR3URoVSm6XMgC7l78xGiZ9RZ010F8YHpvY3gZfGvQ4OcuCcf
	jJ0Kd8CF7oZbNEwnqpMPtxdmh4pxluIs1fIMYgWnNYjEDSG0DJZUH6UsII7JLgwCErkRywUq5jU4V
	jWvkM8gRnUjfABZYUhSfEsNQJhH0azwUkIMbGnsZ3v8Vzz4iBhlclppLtvjDZAiZdJgNLA+N46FDs
	2V19uHQVCvrv4lCIFcfj0UWEpxQL/0BpaHS9ZVPPVZyfZCniWUAZsbM+Cqojdb4JL0FTCTNW7YH38
	noOLLcb51cNBa5d9EFQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLrQ-0000000AHCY-36BS;
	Fri, 22 May 2026 09:08:04 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLrN-0000000AHBU-0Uug
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 09:08:02 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490426d72f7so5252065e9.3
        for <linux-mtd@lists.infradead.org>; Fri, 22 May 2026 02:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779440879; x=1780045679; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K2X1CEY3hqLVsjasNeGeSp1UXS0hl5ED+Udw9ATF5Z8=;
        b=IWaeS4Aon7EqC9OXG3Q1feRgFRnTo2L6/i+al7rMkoX25imLr3dWwxruEIk8wbsYIZ
         jFyXKXUGynhKkwUabSkim9utA50e2vAEb24914fAilggbnVInTlSaYJTIE1R21Lyv7EU
         wj0tm17hSE442441/wxNdovylRgAHGv0Lq2pUMtRKfFXstKY8vMfXjVWpgGz0UROktT8
         p5xM4nZMpdBvOoVX07+2adiTq/zrme9ldBcbiaInywUxk245x0LkWng+3mGXmf8vdaFL
         DTX0sKOydqJL4NTKiIZyPtnyngaTGC1FlUv9wpFqUPsl2Ma2ZawlZT1rdRkfFASX8ZsA
         GWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779440879; x=1780045679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2X1CEY3hqLVsjasNeGeSp1UXS0hl5ED+Udw9ATF5Z8=;
        b=Y1rqMW75KtkLfbahih5jSQ7FiUGOS2uh9VRUCm1sAS5cwkJK2RJimciB0D3HTTBQdN
         RXEISndPmmFnj7zlo1PXotHD39eblQ/p0Qo5Aq0b3lwt4zdDh0JL5RYRv2ZLjPgg5NCz
         XxNHxrrTKAYs9wV7AFE8SPRv4bYqb5tqADMbcThH4o8HE7FGyL6lBoerhQMhkgKwZC66
         W0uCnm0V8zaoosLQgYdn1y46f4pM+wIQcMVCSShC4ee2qb8+1ThnQHU4j5DXFV4Et6Xt
         C0UHH4wo8t/HpaezXHfUHmxwDn/RNvG7q/ebIau/WkmRZlGZVYwCEypDSafz2z5Flnvx
         kzyw==
X-Forwarded-Encrypted: i=1; AFNElJ/ej4cbNIZcM0CWXECbLKGRWjE7J8do50d0BUlz3JN5+KmY0Uap/zqw8xbKjochsZ017dEs4D1TLw8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9yzBVpVdOwqloOcd6DVgilc7nfvZpdLjeqHrBA0dvC85zbs94
	kT/759JPiL+DUQ2QmyAw/uaw2pBs15AIsHVHngkahTskxpPH7zhcalTyWXcwGz63WE8=
X-Gm-Gg: Acq92OEX8HmqzmDpuLAN6opTtxKdnxBH7GhE2fAnWBut6mEtwjAv0WOvCcV/5l7pK5j
	Xr/A21f7wZalyYPYCO8ZtdD7LHiLdxUi9kQTO4abkBW+J6F/5pmUstJjr9D47gDlymf/L5xSin3
	7cIcrqj6ilL+2DkuliOPMIVtbuwXtZ/CxcC7//f1c9Wbe7jUZofIIPxwrUfeuo/I3nEsHV+dvnE
	rkCFuUg5I7GbVk1+K/1ZT38dLW83WkKu/r7NbMJjM0mobWNaZKN878eIAhtLoUP6fdSDUgjw1aR
	uT5ypPHPWk44K9ma10+3xHjUHdAN73t3RrVt+GRZ5BULrrGvFeSVnlsk/4vHWJGiCWElOxMqrfv
	FPqc4gJkSkkqpnL2vzpmKvJ/BDGd6l1tjkgIpjijxBYekaEDoKmkHentJCYfC2x6xdaFUZiKKOg
	coTlBg87u8Ws+pyGN67ESN2lEDbk3wkTKeo0+8brvRMQ==
X-Received: by 2002:a05:600c:4fc9:b0:48a:93d2:60d2 with SMTP id 5b1f17b1804b1-4904225331amr33408155e9.0.1779440877028;
        Fri, 22 May 2026 02:07:57 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452765f5sm27791555e9.5.2026.05.22.02.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:07:56 -0700 (PDT)
Message-ID: <fd735de4-3758-4090-a073-53bf43c80af9@linaro.org>
Date: Fri, 22 May 2026 12:07:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/28] mtd: spi-nor: Enhance software protection
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, stable@kernel.org
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_020801_171946_0D4A75CC 
X-CRM114-Status: UNSURE (   4.40  )
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

Hi, Miquel,

Please consider sashiko's review feedback and let us know whether there's
going to be a v6 or this set is good as it is:
https://sashiko.dev/#/patchset/20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597%40bootlin.com

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

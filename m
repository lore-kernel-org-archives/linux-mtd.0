Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51F9CF3199
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2024 07:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEaLVW9maqFCjwzwx5Bb9ZdzhEEv55zRlgXt1WFSqMM=; b=nCtFQBJTLbG+wG
	Yuc1Lf6/MTultycd50R5R+jqW4//TgTX2NI8+loMtywwW2bgH6KCcj5SEmC+fW8x+XLi5C/NJLx+3
	byreU15fg6hvqQPXZcojHT3khf/2ibWyeMdHwzkt6v3d7Et/3CMtSWI+WChPAik9RZjdsYcqczcaG
	SgIYypqQ1rFmC0zH6TWRAj2vXa764C+zRYBnkIVybtMKihrVIn0CfxefgWTEqn+2zj6CsSsd1Qd13
	33omGdfUwToZ2URqhSc4yl1LR9xWQNoirHEMZ6bXVCvEvUunMOWIzZL+aQ9T4pnO8NKWTc4pqhv47
	cLYq4acYEtQgWdsO1wDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svtgJ-000000051Am-25Je;
	Wed, 02 Oct 2024 07:21:55 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svtgG-000000051AL-34Wh
	for linux-mtd@lists.infradead.org;
	Wed, 02 Oct 2024 07:21:53 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5369f1c7cb8so7815548e87.1
        for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2024 00:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727853711; x=1728458511; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mcxw+NXlbQYd2z3U+0QFvfVoViuw+WbPZb8OCyvpD9I=;
        b=YxHdOC3vuTdvKrNoMI15jK2txBYkOIXP3gFdQocp7bysStcPz6iH6/FtehzKVLMwva
         v5z299PFOHKydP6AZYPq04Y3czL0XWAqV24k6fpAerl/LgcS2X9rm0pX+6tZcaQ4KIY+
         aUABrsuH13+uT/tsM8UHX4cStPGG75Ph/4WzjkLGVlR4UhNzLtt/Sbs1Wco40f2AF5dA
         kLDAbYyEH3Dq+x5xf1r4UCN1sjrxTGo3jslTCeHdP67U42W2o3ubAHEWAo5HsO2Rs0Tc
         el6JCgws5xyzIgrAPf0v78TS3OGsmCHI1MUQhSGG9Oi/+A0dGtpeqQw38yxOKYXx8q/r
         WB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727853711; x=1728458511;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mcxw+NXlbQYd2z3U+0QFvfVoViuw+WbPZb8OCyvpD9I=;
        b=NRraaf1HZaa226i9ba/KtSM2KEoXg5hDa2LM9ztvpqt2DXhMFC/JwNrCUM9NxS2CUB
         Ezt3+fNB61nAByNflbjKTUsSmGURNy/qhZbTjNpkmPv1kCHUcH+9KY/u62RXHbdPWEi9
         Lj1vw+aaDn8hidRbI2m9ZT/n63sdmjFWjL/DZSkIgkxJfneyPN5K9J4NdfbipA5BBqL1
         NGDv9GpX1eZ33hNaN8gCAR/nJ7+ka/sq4DE9Y8dGCaZF+hoWAcyR0dfmqVuUt5OMP6Yf
         GbWo9ffg7fiUJBRcM+UqEqdWGT/1dWa4Ia/kCjgXxNbj0VdHsLm2Xu2TXpYDO1T+824w
         yYkw==
X-Forwarded-Encrypted: i=1; AJvYcCWMTQMXGxWwPhfpgzeNI4zhDlu2hBUUmnigsJleG8mVV2EeTL6KYkD0kNCdxOUEtMU6uQXXtYIZfIg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzEKTCLVpEpSFB2VpEQb6Iv96Sth1E+qVUdBaUVOFcZqet0rbcN
	AOEpgkMEHv0x8NZqo4XIEnmLyZeMDqGgwVlLumB1ruRfHIoBrASB6chuSm7OjGQ=
X-Google-Smtp-Source: AGHT+IGYEjiX3HVw4SMn5kvL8BZQqkqDYDjYG+HTGdx9kWlGvm0S8XCDXetAMEW+Me4ck+tpIzH8UQ==
X-Received: by 2002:a05:6512:3e26:b0:536:7a24:8e89 with SMTP id 2adb3069b0e04-539a07a636dmr891580e87.49.1727853710771;
        Wed, 02 Oct 2024 00:21:50 -0700 (PDT)
Received: from [10.11.12.174] ([82.76.204.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88248c672sm7431319a12.60.2024.10.02.00.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 00:21:50 -0700 (PDT)
Message-ID: <cc4e9ddd-1a36-4496-89da-347c0eed23da@linaro.org>
Date: Wed, 2 Oct 2024 10:21:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/6] mtd: spi-nor: core: Allow specifying the byte
 order in Octal DTR mode
To: AlvinZhou <alvinzhou.tw@gmail.com>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, broonie@kernel.org
Cc: chengminglin@mxic.com.tw, leoyu@mxic.com.tw,
 AlvinZhou <alvinzhou@mxic.com.tw>, JaimeLiao <jaimeliao@mxic.com.tw>
References: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
 <20240926141956.2386374-4-alvinzhou.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20240926141956.2386374-4-alvinzhou.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_002152_821410_86BC9E5A 
X-CRM114-Status: UNSURE (   7.69  )
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



On 26.09.2024 17:19, AlvinZhou wrote:
> +
> +	/* SWAP16 is only applicable when Octal DTR mode */

the comment is redundant, I can already see the condition in the if
below. No need to resend, I'll amend when applying. Looking good.

> +	if (proto == SNOR_PROTO_8_8_8_DTR && nor->flags & SNOR_F_SWAP16)
> +		op->data.swap16 = true;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

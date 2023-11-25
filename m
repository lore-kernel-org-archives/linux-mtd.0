Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39ADAC61DF4
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Nov 2023 12:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2/DRDpKhcItVq+M6zq65dWpTQofxYWp5aLHhNHJoFc=; b=wE3IkxvoGRpV6t
	gqDs6O7BUdqaPUG+ojyLBCwLBU7nprffU65/G6GFGIn0KWZSrs2rzLNd70vytySSWoXSUuCHyM6P4
	GKwgkBzw2kVZpoRXxW6cY00JFbjjWurcY1mjg3MzLMmwAjYP709XsOB1mu1+8Y97rchH1qdpETOWJ
	3AN06QNNDMpcdz/doH2r+xc6z5M5z5jZEQTrczVrYzdEhZDbKFgMYRDSu8SiSyT17dAZXAJAaVKi1
	2HLUlJyPPgII7n3h40xrqZpmy3Yg9VFWa7aCDl8P4rySlbbzRDOV3DP+1AxwWSKARAdpysNPV5TDZ
	1Y6zflXycugOs0/tTkTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6rv7-009FGb-1r;
	Sat, 25 Nov 2023 12:38:01 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6rv5-009FFu-0b
	for linux-mtd@lists.infradead.org;
	Sat, 25 Nov 2023 12:38:00 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a00f67f120aso376257766b.2
        for <linux-mtd@lists.infradead.org>; Sat, 25 Nov 2023 04:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700915876; x=1701520676; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SMZGUL4Fmisevm6QbqQLOWCdm9wztiPfJx/gfl7xa4A=;
        b=ndZ8Sd0CFhWYyrJYk7I7b9hYWpispxK4idbUxetkVdQdT84sS5D7Ana23KGJ/XRREv
         biVEVorWP9BibYT8199Rchny8/Y92mceZTbrcY/pnYleQ+FheI7MIPmWCKGEQxSooAaF
         VBvVNuoucajWQqhePjXuvXfQjTggBJSe+mkM1zdInqKuGBCCdxks1aNerygNVRHFIuRM
         HoNHxQw0X7eiyoTg3HlqBFEnAusO9ukXnZzhPcE5tt6EJi1S3nJG24l0ICW3JxnB8rmH
         dPsxArC/OcN+uVSrJi9/AqfoPBbY10BW2cAhRZRGMOYFP+ni/u7l5Ft5pMAg9pHsJAzy
         dLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700915876; x=1701520676;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SMZGUL4Fmisevm6QbqQLOWCdm9wztiPfJx/gfl7xa4A=;
        b=Cv8/brRZhTgNlHfw3EKpZnUbSXbtrfQLcYbMI6iL6nFG1SVim7e1ElwiBYv55FtBbG
         pcRqECkOBzkHM9aSzuktvUfFxbEg8lQlSk+2rO3JnIbfS/sBm0jO70q53gEXeXrDdq+/
         dCyvhJeGTG0AAgMk2z6wlmSRkW/6ag/EyfmiC47H43FKfIXBqAI4WIRyXyD2YJPymPEf
         y4YCMXev84wBuYbTf5Cc1YmAxbSUCCsiEpKEn4KQRh59cNP1j6xSQlF9tIOYy+LRmfNv
         dw0K7cPYUxZ2Usa6GIkIrq5aMCgjHRjXN7gPf3mS31qY9ONSZODZRmECqv32HPYXRhIS
         fqoQ==
X-Gm-Message-State: AOJu0YzKz/ycwWXQ2i4qPLzQpQJctjWX9eRciiY2GLg1QAcxJjhja73e
	XHt0fuDMSTpE/GbPe3189ZXfDQ==
X-Google-Smtp-Source: AGHT+IETP8hpOkLt+3JK4huabCOdXODMIVCAIfoxaZFwBxT1nO5GfSR1cy/c2Mm1k2C7Kx/zxkysBw==
X-Received: by 2002:a17:907:b9d3:b0:9fd:9616:c48e with SMTP id xa19-20020a170907b9d300b009fd9616c48emr4508401ejc.27.1700915875959;
        Sat, 25 Nov 2023 04:37:55 -0800 (PST)
Received: from [192.168.0.174] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id h18-20020a1709063b5200b009fdd2c6d042sm3468612ejf.148.2023.11.25.04.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 04:37:55 -0800 (PST)
Message-ID: <d7ce98eb-c920-413f-bbe9-059077a9dda7@linaro.org>
Date: Sat, 25 Nov 2023 14:37:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] mtd: spi-nor: introduce die erase
To: pratyush@kernel.org, michael@walle.cc, Fabio Estevam <festevam@denx.de>
Cc: linux-mtd@lists.infradead.org, takahiro.kuwano@infineon.com,
 bacem.daassi@infineon.com, linux-kernel@vger.kernel.org
References: <20231125123529.55686-1-tudor.ambarus@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20231125123529.55686-1-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_043759_233567_AE9EAA3A 
X-CRM114-Status: UNSURE (   3.48  )
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


I made a typo on Fabio's email address. Now added correctly.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

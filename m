Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5918C4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 13:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ZsyEV4PobTd0XxH4ox+iFtNFNFETTfKkWhZOqvLflE=; b=CYd0GMzmfFV0H9
	oMQFTxdlNsaJYOXcu0CSUheN7I+RCzUOMM1Mmv6Njs8oUNXWVosoW3xa9nkFwhAasQIwmpL5KA8Vo
	mQ9GAEgPislG1BHROOYtbG28TztCiTBhr7CgiIYdLkD6wFDah3ROHB0DuRFosoJU99lc5TQ+ZY/me
	0lVN9SETRuK4nO5lhI33TSiMUW9FsjrIikoXk+4TdkHWaX15TuQiYTdCJEbmbURPJtaVtma4nNIkw
	Ud+hp2kvVkAT9kPKrI3ekDyvM10qIZOsC2wtvldbLQP2MzknlDdEiIy+cWKNYb/WPuoAZZx/4JMdn
	IuXdgHsm68G4ITJgwURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHQq-0000000HS6Q-37nQ;
	Fri, 12 Apr 2024 13:59:08 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHQn-0000000HS5Z-3021
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 13:59:07 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-346f4266e59so692233f8f.3
        for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2024 06:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712930342; x=1713535142; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iRrlgRjpj1l5DgqhygqjMRC2WZ+61RQk+ceq2zPm6iw=;
        b=e37ML3gujJ9WWgTCw7M7RgIthY0z3FadFC+HxrkN/UBSzO3U4AaqMx7shg2ugesbkE
         x/MbHQ2xLNqL1bHcEpM9VEalpSLU/uQUJxqgUsWBj4ZuLuMUUB/kk5ytLf34k+x4wyTn
         EUpeR40hCKDXUej1aCEC/buzRAm01AS7W2bOTALOqx0jTZqAC8B+xxGtTyz1yanfE1qT
         dZu2FW6JKcCpbrkQ5DDKmxmfB+clKiImgRSdVhAE9Z8I4zKx4bzNUym1VU88OlthoWwj
         3lrHy91KhKnpfx7wN36OdHkfXAV+/vpCE0or56OD10W8taMzl29XyAf38F1A489k/oeL
         JL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712930342; x=1713535142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iRrlgRjpj1l5DgqhygqjMRC2WZ+61RQk+ceq2zPm6iw=;
        b=bF/Y8qkBrDQ8GJ7OKdFICjiweaTMKhV5DkFyDes19ScYYygAdCLpIlpWm6ei990mc4
         qmMwidMmz7KqlahUqu0+GppaIBuNlGTpqaKDIakFpCQIfvItHWLQM03k1HRWzOE9xITb
         6AO8lS+gPI/O8EMxY6pRWN/dwgHPnEVS4lLJnlebCDZn0HPZMcNAI6qUn6CII1nhLr3D
         OmBuxtiZAIGEX1YbEiSqZoJc1VN7NgtpPFEgMPkKR/NxikK9eSkuNrEjY/R4yY91QK8W
         aeNKxcWXLfJaS1a4D+6EkwZfHNFq7I+2pmJwD/sCRQ4xsmRnaiu6no2z0Zppg5lrQB41
         +7VQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2FK7hNAUt2g0zP0D2HMqfdEr39rs130DT9Jc2VwsNSgPqZ2m+W1azu8D6iSBccZ8cnxGKg+NASZY800TsWm1Na+UCgFaaKD1z+QN3XQ==
X-Gm-Message-State: AOJu0Yx7hOeqn5yc1Y/+hwjaBrozTppt4O1ER47kMQIzv0fCgV/fAtpt
	peIo58nnfGxlB8mEzm8agpSJ5ImjPAfCwSKZr6fMXwGjCul1/YfsKval3aHBBoI=
X-Google-Smtp-Source: AGHT+IHeHtH8JT2+opNbTc8ZphhH9GamYlO8H85818lTedasC/bglErfszTsMsJI62wCROsIHkkVbw==
X-Received: by 2002:adf:a390:0:b0:343:668b:be04 with SMTP id l16-20020adfa390000000b00343668bbe04mr1522428wrb.3.1712930341858;
        Fri, 12 Apr 2024 06:59:01 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id z15-20020adfe54f000000b00345c2f84d5asm4329605wrm.10.2024.04.12.06.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 06:59:01 -0700 (PDT)
Message-ID: <b6547b42-3e3f-4437-8e01-2fc113125289@linaro.org>
Date: Fri, 12 Apr 2024 14:58:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] mtd: spi-nor: get rid of non-power-of-2 page size
 handling
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240412134405.381832-1-mwalle@kernel.org>
 <20240412134405.381832-3-mwalle@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240412134405.381832-3-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_065905_799282_690A85C6 
X-CRM114-Status: UNSURE (   4.20  )
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


I'll let Pratyush review the details:
Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

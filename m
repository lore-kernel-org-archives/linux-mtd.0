Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B59AC4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 14:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z3HEIYzr5IL1mMrGb2DB+O6B/YNxR9zMB4Hqui9znnQ=; b=nfZ0SMoo46/KpZ
	D5b7qzZ6S1RruNGqpCUcAaUdg4uwH0IFQOODZuHZcN69h8phnQnytil3yuZHadQOknQNFcqil2Rzi
	MmBkz2Vkej4j978/RRNDILcUV4WQSIXuDsaeTb+RySj6ZBgbu+VFz7ljqYRS1XX9OAmwP1+UACaMu
	RLMiSZoWJthswiXss2YPQ1hWmsoTHWFm1qafhxjkCdRIGPQAHS0vqwGdGw5L3LeSEqpKQTdMERYK+
	W9KNX+P0aTMwHJ+cjzQcsvDJAqVEZQt5oQxZILTKlCSjsBT9VSJzmaO4DfNDikHYMul8RviRerUO4
	vDN4vXjTEezjB6W1IyPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHc9-0000000HUkh-1foT;
	Fri, 12 Apr 2024 14:10:49 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHc6-0000000HUjd-1PAN
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 14:10:47 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2d895e2c6efso10991361fa.0
        for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2024 07:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712931043; x=1713535843; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eHOxBBjprG1o9q20YKJ7kUwj0nRt3ln7D3EachtJXns=;
        b=urZ0kj0q5I4XxteH+Kwib04uNzLvNObAG26PdTqRKHyOOBQVovRadSJkPAYcmaXf/1
         3KMHSBw3IdM4daI4lFJT7NjbAvb2awhFTHgCDhLNHKnBUmPUKhq5DUbUz9W+AzmPZ8NF
         2GNX5YoeeAk0YOa+JTvEYTjfZRei2fU/UdJXj4Je51yl4+FW8f1IdwsPyeUrHguuARLv
         d7ksv0TR7HwhIbrCMsDefgeqyJ4FuoBmM3lY5nyAIlJ+roK1qvBZe+YA1lMOsXoLP7pS
         S7PGYkpMP7wrCOTHwpej5fY6/RMJh3/ZOz24/H04AyqkfbApBJCX4NV4S/bJ6wzC16hK
         EEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712931043; x=1713535843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHOxBBjprG1o9q20YKJ7kUwj0nRt3ln7D3EachtJXns=;
        b=Sfl9DmTM7QWvWYycwbmNLeBu9FWdBA3BbgRrSHVIGdJcTe8anMzeP0Bb0AtCbOstwH
         V6kEaurGVnkxM72NbdaV2Ay1EoS3/Xkm/7L1I0aCtYJpuN7/V5r+ORf7Pdklrha9fbN6
         R23pQNq8i/IpKcp4ozFWOU15cCRGfgfUuc9AuCXVaC8GK7b3KvUWe+IQdJ1EFhIKWUbe
         CzEMOv/iU0fyT4BBS61xiZ8IkF3BftJe1XxesydKz1Qv6kUVtnU9+tYM13/wboJm2Bno
         ebASxduh10L+3vw6nm18Hk9h4w5mwehp9vKwZ18QrBjWNbpSXW4+v/rJHCkCF5/Q1Jd2
         jIOg==
X-Forwarded-Encrypted: i=1; AJvYcCVM1hoUKoH4Y8Fkd9CZF4jofUZoIkIejSDF27BBcqkOGpVcvpan8EIQPHMV8LModttHIrfnpjnG4jSTB40UZ1hVV/wZearoIlfzs/LrFA==
X-Gm-Message-State: AOJu0YzYPgmLK8YJDLbYvnOOIrE+RyxWo8NRjQuKclcbovvPyIphzJi3
	fTnFBXWecRIW30N1yo5M/SjTNc920oXatr54fKCmqDhD7E/+vs/LpDUDfhMRsp4=
X-Google-Smtp-Source: AGHT+IHyq3RMCDUQZpF6XlMLtN0BgTnEUVKgIFmC4s6+esqCGkM831cc5336wcimG7a0/J47ls3jvA==
X-Received: by 2002:a05:651c:1502:b0:2d6:b11a:3a49 with SMTP id e2-20020a05651c150200b002d6b11a3a49mr2011608ljf.9.1712931043031;
        Fri, 12 Apr 2024 07:10:43 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id d9-20020a05600c3ac900b00417fea53331sm2109184wms.24.2024.04.12.07.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 07:10:42 -0700 (PDT)
Message-ID: <7657fab7-f925-4c32-8bf0-8513b51b06fb@linaro.org>
Date: Fri, 12 Apr 2024 15:10:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 6/6] mtd: spi-nor: introduce support for displaying
 deprecation message
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240412134405.381832-1-mwalle@kernel.org>
 <20240412134405.381832-7-mwalle@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240412134405.381832-7-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_071046_469898_40A64DBB 
X-CRM114-Status: UNSURE (   5.60  )
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



On 4/12/24 14:44, Michael Walle wrote:
> Therefore, introduce a (temporary) flag to display a message on boot if

Fine by me!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

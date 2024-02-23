Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEFFC54E49
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 10:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mw3pSsQ53+nmY4gQgW6Goa2Ery7/qplScwtz41/mn8g=; b=HpSQ65COjFwJBm
	KFqeMaAa2xTJmaYcwBLcdj3TUJmvIEQBFKdwyE8oYaszOyPEB4NEgZ6U06Dlyu2g4WYg7kmQ3RDGY
	LvAhrh89j3of0EuRTdNZCMn/0FN5Vh69UFCQY4IetJS6w7Es/KY9fMbaMO3UEtu6QZ20zLCBCu3bj
	J/ROtCzYOJvh4hW7qS4iGs10ccJBSG+OepoSNRwx1iHteGE2vk1opzwOUKfAK0/l2rwLvCZ5pPjjL
	Gaj4aBjggaesBNi125wrmQ/bz2R9auLRd2XAPlDzF3EqDNLFo4xgVEh6tVIOde6XcJLEbZzRj9Bbn
	V7tQ0LfMlc6S8esacezQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSdP-00000008s4t-3x00;
	Fri, 23 Feb 2024 10:18:27 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSd2-00000008rha-1J4H
	for linux-mtd@lists.infradead.org;
	Fri, 23 Feb 2024 10:18:12 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a3d01a9a9a2so69037366b.1
        for <linux-mtd@lists.infradead.org>; Fri, 23 Feb 2024 02:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708683472; x=1709288272; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z0Hy4WUupMJnaNE7byF7pkseWFlLhgHNeMgsX66Y5Ec=;
        b=eqQDVV3wU7n+u8kA3i+u19Qn+EqfzF5ku3iUV+MJi02K91wUQQx9XUsOihAoXiuwFq
         a+Z2mKfTI9NviKfcCF5HrqT7IZ81/1MR9NvjskHHNXxug+82/6XjeJVx8+n3YTSTwr7F
         XFdecGPU/t1bsDO5DSAEj7e5jApms73ulWReY4B5psHow11wiAUtH8EqjOHF93kAacwe
         tt3pg5Z3Qkhyqz7eYtkgUUVGE4N4gZoEBLkNrtoO2Q+nwzkeAzj/Dh/WioHZKwKlg7+x
         XfpLxHBDyDXalSaDiz/Qjf4u0orwwNI9s//pBFZMzG6QMGR4//cllLcJx7r7YbTlvwpj
         4yhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708683472; x=1709288272;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z0Hy4WUupMJnaNE7byF7pkseWFlLhgHNeMgsX66Y5Ec=;
        b=UVYD4ZVScTuYY0aAK+dCLRmzc957IoNQ8IgqEeqy/uEuEHCNuSHmAWiP5Bumzai2g4
         c8Cj2QzWDNiRhaJTe/yfqI2QvYasIg6yEhsRYIJ1/yNr3IZOSTmITj7Y/609zjYSIJYA
         umDJ80OTnhYci7otpGIepvAWR7t4BL6X7SY1jCe18ebhtkzMMpBYoL2NeE7rLTwHB8CS
         2CZSTwPxFDlPVB8ufWUAOLT22YcnrMxfBBgLr/w5imRLobsoJ8BW7m/AfCUhfNV0yLHy
         Fa1U9BUW6amuIAXuJM2/yMNPk1CqY4rcKDD8jcVHmREhW/DmXtfRcgv6tOszcB5Wnakf
         gbOA==
X-Forwarded-Encrypted: i=1; AJvYcCWP31tzG3Ed7hwFwbe5nOHQ5gyHQtQGlrFQPDFBK/yRWPTyvAHqX23MTvG8A/uqhq2EPXXcByASj/U4F0Orm1fVsq3S3zwB5ivpPVHDBQ==
X-Gm-Message-State: AOJu0YxcCTWLonehRupBqKi3HRPQ9essd/Uwh5JQshreytw0mjZPdsVh
	GJq5EsbfSCqbhBaqB02YFWvDCrSbMKVlXiI5HQSljWa1Ays59JfOFiYGurtz3MQ=
X-Google-Smtp-Source: AGHT+IGEkjYjKs0PfUMVTcEoFlASbvCOdpSkp2oEXyMpI2Ll8T8kyWeTrZzl2v/I40tpP/CgN8ahxQ==
X-Received: by 2002:a17:906:5619:b0:a3f:5dbd:7c50 with SMTP id f25-20020a170906561900b00a3f5dbd7c50mr829422ejq.73.1708683472389;
        Fri, 23 Feb 2024 02:17:52 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id r22-20020a170906281600b00a3d777aa8fesm6712610ejc.69.2024.02.23.02.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 02:17:51 -0800 (PST)
Message-ID: <ec847905-1b04-49d5-ab95-a3ec2d2db5c4@linaro.org>
Date: Fri, 23 Feb 2024 10:17:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] mtd: spi-nor: core: rework struct
 spi_nor_erase_region
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, tkuw584924@gmail.com,
 linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
 <8e5e9e4081ed9f16ea9dce30693304a4b54d19b1.1708404584.git.Takahiro.Kuwano@infineon.com>
 <CZCDNXMTGOA0.3QSDTTWS8H0LT@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CZCDNXMTGOA0.3QSDTTWS8H0LT@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_021804_840217_ACABCEEA 
X-CRM114-Status: UNSURE (   5.41  )
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



On 2/23/24 10:14, Michael Walle wrote:
> With above remarks fixed:
> Reviewed-by: Michael Walle <mwalle@kernel.org>
> 
> Maybe Tudor can fix while applying.


sure, I can do it. Thanks for reviewing the series. I'll take a look at
it later today.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

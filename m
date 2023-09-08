Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D752CCFA0A
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 11:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=WJiIzD5wWdtHiDTYkPaY7uPgiR
	jmkw3lY0kMPRVlxxMWHX2TBoRZyUi8jaejy+N19FhxLLGuk2koPCN6QzSiWH+txueQjHu1WNY/Um/
	oRAlgvdFPPp9lu0CXXDCLs6rHK+oywb6EtLecy8oBbpxVlTKZKs+jW3o/b3FMbwOD2QYC5nuGLsRw
	1eB+aleltefmxNHzWJwJwCW8Oa5hnjXlU/J6ZtDYFK7EiZtPDYlVk7ToCvWKerCRRdYIGvtNl5m/b
	8pFiDFde3H7b/xriQxfL/FxrvzVzS0INEGKc99s2FCOYnTIcQBVvGzajWe5N03xVunuARfrV2XFUU
	bjQGxDCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qea4x-00DiLA-31;
	Fri, 08 Sep 2023 11:55:15 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qea4v-00DiJh-2F
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 11:55:15 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso253107166b.2
        for <linux-mtd@lists.infradead.org>; Fri, 08 Sep 2023 04:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1694174107; x=1694778907; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=dxImOaoiQwVGP7BKMWTOasPbb/TUwXyiU+0KiTGnXDL0oUChqkovi5EkK3+7C4nubj
         LGsJ3R7Z3rBZBWHoDZQ/gg9xEhgEyX+6Yjl+bNREY/icrP4Dd3D3lZybqHCvKBb0GNtK
         MNCr12CdqF9/aYTGY4lunD3iffZUXzBuk0x35Qu2FYEjCxrBFSAvgF5dxZce+H8NHzA1
         DDr64CegRrQo73DhGeRbDIyHwS2M3YpQtxepqbn89Nr++CUsppHLVqnDEbulYvAPBTD4
         bYyaltxJxe2jNJ9HiWwwPY+9S0/bzJlIzuQ70C9XS4hlAoeqJFCBJvqg1lJMSCHX/Mq1
         Ws/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694174107; x=1694778907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=p7j/xHbLkSzEjb2kLMZU41oCAvbtTf3L083TXKHhf98l1Ar9oQ9KtHDetU9LNqLTG2
         I4EyFutNkV+smXw8f+QBaydiRNZMHT/v4CvVTRIyRgzTccIwqeCrbkpSN/JmDx8C/bDC
         DLqV3nrVleYrPfFY602ZX/+XM+SL5/L2yp+ZCdG1Z4OjVrUqH7hVpJ2flfogMh3I5n/n
         ROkY/J1crpM02lKj48Bh2H0EzzxGk8OCaexyXLw3Cs1ny1lXjGDc71KVka5FqUQYF3sQ
         KrBkGsDml0x36yqZjUnMBkHq52IZpnML0al4a1aPuXwv/xqzsUZ9LrzwmYH5m7NxQLCW
         ukRA==
X-Gm-Message-State: AOJu0Yy0iDjrJQHWsp4lyS7M8YvNFGrigpaK6rV9l3qD+Ko12q/96MyP
	shIYlcXbwzq360jwWyQfwa167ZjYB3Lkt+MWwRk=
X-Google-Smtp-Source: AGHT+IE6lgLdouW1VZzQhQxd92lWtUblVldfR+YlyuR96MjSluoJNvoJ9HzVuv3yi/Jo5Tp0inzjug==
X-Received: by 2002:a17:907:762d:b0:9a1:ec3d:9004 with SMTP id jy13-20020a170907762d00b009a1ec3d9004mr1893397ejc.9.1694174107077;
        Fri, 08 Sep 2023 04:55:07 -0700 (PDT)
Received: from [192.168.178.86] (clnet-p04-043.ikbnet.co.at. [83.175.81.43])
        by smtp.gmail.com with ESMTPSA id f2-20020a1709064dc200b0099cc15f09a0sm933073ejw.55.2023.09.08.04.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 04:55:06 -0700 (PDT)
Message-ID: <1ba76022-525a-7b48-22d2-88b7733470e4@sigma-star.at>
Date: Fri, 8 Sep 2023 13:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] flashcp: Add write last option.
To: Piotr Esden-Tempski <piotr@esden.net>, linux-mtd@lists.infradead.org
References: <BF77DED8-F817-4BDE-A668-4F8AD46A2836@esden.net>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <BF77DED8-F817-4BDE-A668-4F8AD46A2836@esden.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_045514_049347_44E53BDA 
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

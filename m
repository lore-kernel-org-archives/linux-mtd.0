Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883CFEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzrekKgDjQ7WYMWr9MwleWVRKz2W8ODExN4O5uuhJDo=; b=rNttlxriSPWG0J
	tl2/tPpuJGKt5Ulxx9/jiyyEj1oXl5u4XcZL/Vszm6nzlmCIHCUvaKiXPcwYO8UOLKuQxLbmIqmVi
	+b6ouQnWbPwkErao+WN06zzh2G+itz7A8DW90r4Ak5fcN4H0tYX8yAzk6TB+KBkFXbgW+MQUCXXcF
	3vtTnRO3Wh4IHu9prS3NNL5s7o34oZBpHs6vyNcBZLpmGOHLLBtI4BByAlT0gzbDzXSHlzxGOxpqY
	wOuSTtKilnCxFExf4d+R5TrWF7wI8rIoitZqP+57IzHNqrarESButlP4ZbXzSpC0xEn1hEXVx5lya
	VmGYN4CG/mK/5z8qVy5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzwn-005Nyf-1T;
	Wed, 19 Jul 2023 05:42:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzwm-005NyF-0N
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0b3Vly9emv1HHVlSd38yfh5xQjrqeAe6ysyE2is2jXc=; b=RxM3daHqDfRe8G7pIeiugprO9d
	j66lE8c2DmR32kWo+35HUztRxiU06Fu4e50VvBpCM8jB7kkY8UwmMiMySAD2a2mVO8v7zoiwHKJRa
	avFa97KL6NkbBnerRlfAv454df/YX1LuAMA7vHsg0wOLyZ9gLwwQMkpbzCT1Pz7EtgfPPzcDOzmwu
	arIf5+T3GUlMvB3YQJU8Y6MmYLPND38y0fLMM+qNcWEL/OCo1B+A5o6W2+L7GQ99/dg8tkKbN0OsO
	9i2X7Mza6EUjZngV4QjY2uTATm0IWZhBXnNaVabt0DhGw4MmdxYJf1msdH5JwMzMDXDwcelmd3ZSL
	x0mdI/IA==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLoK5-00BoQ6-07
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 17:17:19 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-315adee6ac8so5762385f8f.2
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 10:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689700515; x=1692292515;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0b3Vly9emv1HHVlSd38yfh5xQjrqeAe6ysyE2is2jXc=;
        b=h6TLwmWojjpbLukjXrGCuGV+GJT1TT3eflwtZw1JiAa8EaHDFqvztGhW2rOBTnNuYv
         pJscema2DoTzIZ6SqIAO8pYwN2bRJcM1GZf5/HRPmAIzCi3SH+MgPq6WJGz+F0YTm5ix
         1/M1QprNID/sFMmGTw/BEC/Huj4dB9DHCtirago5WfUCu8GzDP8V2kVYQQvoOcleMNvn
         ILP8m76TXAt9fIYrQRxuDfpmcqKKDDnlc/xLTClVyED91NVQg62cGrT6aPhPaa/fVrQv
         Z4/Jc8sShTdbV+3YJmQPb6bdgc9DzTqHk3mInaue1i11gaAOCvI4aHXRm3Kc/SiqVfz1
         oyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689700515; x=1692292515;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0b3Vly9emv1HHVlSd38yfh5xQjrqeAe6ysyE2is2jXc=;
        b=CGWkUp9qQN5JUpl+2nXcCXGYhofkdCTcoVn5m7pvMCFF3jIxoSg0MBjyMg5DVfB+mp
         YXvzIMVShvaJihXEMLOMSl40IGLwFQ912Q2NlkOyHOvl85+pKcDNDEJNG7j8DIttkil7
         Fbo78zumet2kHcuyb5wZu1JSaeWBBUv6kIve/aByDCJwZLCAwSXWsvnoLlWOxJve8/bU
         x7SbaPPknQxK0Vq0p0oxo5eg3fWofQXEMcmk3A9VeMfxsxI2+RWDCeV815w6N7JefKIA
         wO8U+hGu6CqBIeN9vuKTbmLqA4QCpJoJUnjeLPDWFcMyY6hFugz0mAuBWQuXdGcAtL+8
         Yytw==
X-Gm-Message-State: ABy/qLbQinttjCj7adRLDG9fytUH114MHj++Mavde4maGf60reHfqTbx
	C+oX7yW17/7wdkAfXgcIVFbhXw==
X-Google-Smtp-Source: APBJJlGFqBHV5lb5GSyERvL4mSEEBnqLmVmrcoJt9riZbVC8qBpdqlZlileeT2GgK6ldh6XYCRHibw==
X-Received: by 2002:a5d:452d:0:b0:315:ad03:a9e0 with SMTP id j13-20020a5d452d000000b00315ad03a9e0mr12487178wra.45.1689700514894;
        Tue, 18 Jul 2023 10:15:14 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id n8-20020adff088000000b00301a351a8d6sm2937641wro.84.2023.07.18.10.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 10:15:14 -0700 (PDT)
Message-ID: <4e6c4534-896b-8b35-b4c1-dd1359d6f8a1@linaro.org>
Date: Tue, 18 Jul 2023 18:15:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] Add support for XMC
 XM25QH128C/XM25QH256C/XM25QU256C/XM25QH512C/XM25QU512C
Content-Language: en-US
To: SSunk <ssunkkan@gmail.com>, pratyush@kernel.org, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230718145132.3811-1-ssunkkan@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230718145132.3811-1-ssunkkan@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_181717_438767_649174F3 
X-CRM114-Status: UNSURE (   7.16  )
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



On 7/18/23 15:51, SSunk wrote:
> Add support for XMC XM25QH128C/XM25QH256C/XM25QU256C/XM25QH512C/XM25QU512C and do not use the generic spi nor driver.

Why can't you use the generic SPI NOR driver?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC2DC4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 14:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PqCIxr2fAiNqxu0VdJCeCbZ5w1RsLNaXzAXcGiwKdhg=; b=efb1LyWk8wqr5F
	xSbJ4Ocbe0jMEaH0DF4FtXHqqKb3buPUSzGD/Ijwh83Vjs1zwDOejnRwD+GMai27EbKma754OrrDS
	T6zFcCupyFFVH4rK9OVRYKAw1LabpU6NG2P+m7dU6qwpo3hI9kn4GvsViSAltyEnRinr7taQoCLdK
	pFc+qc1WyF1nw+IQn8NBYstdqX/nGYye6JshTKnemDuQPcnJsvEFwKJHASwqrkvNCm6jhAt9BfDHb
	jn1hMjjCjodD+ejgoUzmsJNIgM5OQMr6YTVpJyNYoZsUsuICdxq0ZhBhR3/lX5vdldGtrvpsuNnCO
	PEoVeLD0xSO6DeTjfP5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHSp-0000000HSV1-2VtG;
	Fri, 12 Apr 2024 14:01:11 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHSh-0000000HSRI-1CMX
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 14:01:09 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-343f62d8124so691950f8f.2
        for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2024 07:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712930456; x=1713535256; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=axxv3exRUNlpWxgacDRk640x3V7VFxrh3mk8vTHKsfE=;
        b=plohiRhkqlhx0i8M16Q6FoVTbMlsRJ7QohidoKbjrKAVd/0BpQ6LVEN2nnP/BTHrsI
         A04vTcs4Z+s6sqQFmk2Sly2QEorIz3/nGiYoC1i+KkRXTzl4eBbssMqTO33FdiSGh2jQ
         +zTvJeEbTXtBsFeVnfB8KENx2IdVHXEnPDW87RoGb0ut+wrdC0r/e4tYThg6qcX4t7IK
         DPaCIe1zU5l3n0vb4U0N6CyZ0HHOaViJLWhd9lqkV0JDEWo13a/2vvfjXmI5utQtzeQN
         xIiM+FleUejomdFjl9qL1msxg1jZ+IpXS+6cKKn+t5BD6AlGsjjp039TaQ3cBgAzcpN0
         N8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712930456; x=1713535256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=axxv3exRUNlpWxgacDRk640x3V7VFxrh3mk8vTHKsfE=;
        b=l+2YzcW+hRlO7hUb0inFcUOYupONG6BkYiouotDRLZvl7vsK//TE6KNePrDV0pQfBg
         VDv2ML/f6kteQ88eZiu1BE/67FOANSOl4m71ZQNtCXsfg9NIUiJBQxdTIXuu7gOrVCyA
         /Sz7KKGZNOOtpRnOFEEU0sw/rGfjbY5IvB5hSiwVVTcwGHCE6CKgTn35JYunbQPOBYBW
         y2xe0Ue4QN+ryuPJiCsXGUcqnUiS3cfBYZoFKp4XJzYo7SLROWztgKGICzgt79OQIPZ+
         2xCpGRQvwS02hGo4G2CmTwR3xEgAKY9eaIgDovlf1PqEPrTyZuFo4nI8V2UZPbwtsFQ2
         buLw==
X-Forwarded-Encrypted: i=1; AJvYcCUj/sCFvM6oOPuiLteVGK9nyttUSBuX5c5HU5HSw3IZEGt/8QDxNogOJDSgnlUx+aAF6i1BEuMnoOnIyPHB7S1JM0Uqmkw4w4z2Ms0CpQ==
X-Gm-Message-State: AOJu0Yy3Nl1f3sUSyPAF1i879wFTWHfVupbU/q/Xx6DY6DsSIJRRvl6V
	q/t+Nj0AjwZtix/9EfpHNxi/NvLVQ9HL9aXEilu7YJwZuSYN1O7RkQeHMvQVa6jWARPrfFOaRp1
	7
X-Google-Smtp-Source: AGHT+IEC6OpeGC8GDPHDIg/HVT8gkVYiCxPQDyj+ORFfpgsNhYncGtGGbl2esbOLAccSKfM+0rXqrQ==
X-Received: by 2002:adf:e9d0:0:b0:343:9292:b28f with SMTP id l16-20020adfe9d0000000b003439292b28fmr1680227wrn.54.1712930456222;
        Fri, 12 Apr 2024 07:00:56 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d6281000000b003445bb2362esm4326402wru.65.2024.04.12.07.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 07:00:54 -0700 (PDT)
Message-ID: <14726a74-d54a-432d-a547-3b07ac97d413@linaro.org>
Date: Fri, 12 Apr 2024 15:00:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] mtd: spi-nor: get rid of SPI_NOR_NO_FR
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240412134405.381832-1-mwalle@kernel.org>
 <20240412134405.381832-4-mwalle@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240412134405.381832-4-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_070105_524629_D286C7B0 
X-CRM114-Status: UNSURE (   7.06  )
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
> The evervision FRAM devices are the only user of the NO_FR flag. Drop
> the global flag and instead use a manufacturer fixup for the evervision
> flashes to drop the fast read support.
> 

Don't we want to get rid of FRAMs from SPI NOR? Why the dance then?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

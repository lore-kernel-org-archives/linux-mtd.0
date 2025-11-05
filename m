Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36A7CCFA0D
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 16:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WgGhSX6+w04qlOFAXPIpKcA8L+P5dDVNizB9DlK7k7Q=; b=MziQSq+ZbCvGhh
	XRjK5y9EJsA4Uw82d2djiTKyHOEedGIdGzKLigqPKWAmn9CG6/TUOa6RCufM+Xc0MH86bcHTFTIBb
	X55FWZiLRNIvgI2HptnqqBRmAEwJaZj85lxLWVUEiH1JBYvKd3EozgmkSxjz/TwEM2m2M6C+xxDNU
	gWewseGDSGhZDYWVjS4ELMOun9faRpM0yYg0KZBoU5+nuEnNGAiJW7AMMGfVFOynEwrXQtZdfc9pg
	Xt34rKxqdFvPGi6MCLNBZEhVdXsxGtxs4t2KxlK7x7CQYaWiWUdQ9fto4iOrujGRyJF/f0zhGZzt1
	0dVkQxID2YDHjKL2ULjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgYP-0000000E5FG-0x8g;
	Wed, 05 Nov 2025 16:40:13 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgYM-0000000E5Et-2rEY
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 16:40:11 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6407e617ad4so109540a12.0
        for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2025 08:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762360809; x=1762965609; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=UALfDEWw5Kwdb/4xe60h73o8w7hWcuiJyrXd5riFEPKHwWRuOWEwd7nGyvlsGNBT8n
         hOx5hI9i0rHL/M6QzyWEmoY0X/w9my1AUyjlphT4aWnLJIH17V13ERdo/39HNWH1UQ8b
         8FAzq2bdAVDWhQiiZiGrP59QfL27CZv23/rUgvx3HKt6cd7kNWojaH61z/4qUE8/9ZDX
         oMW185RMxIpfCA1xgYKp83FG+AOmxorcxUYfi1Idj59PaHd8mYtVYOCr2exf4x1qmxrh
         Es46XhR3qxKdI8eYW/P0LzNm0ehj3iX9RCAYtMSqLq6mrQZJy2V6D4uQDo9AlDDDowom
         BgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762360809; x=1762965609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=bSTwK2rwPD2QF7sszSb/1rKVNG/woPCJgTElbkLOiU/uA57Nei4FmJKnyehV4Yo6Md
         LZOedEQ8ltdyXYN3mG/VTTY4yehU59OL4st9OSyR+Qk5yrElgT/B7H7RuY27US0vgO2l
         FtBohSgyM2dZTnegBwj2I/ek3kPNzMvZi8SjXaAG0oY8hXgqSdtMW59TehfPHV0GQGWp
         99h+d3g0F4R2O+T6xMlUAIf9UnJW9xcURMKXM/wTyeDNsv/7cpAatXn1zwYaqiXu+qBh
         sOFMGH7K47UT1YD0rzXHxaghPVCD1IYnqY2pDfW74UoLFc5fkH5DKSJBfDEkOBbXn+u3
         GcAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoMvFYJOzKeUJ2jaAtyjktwmPeNeurxXt938HyN34dCtLmq91cMu+90pkEhf87LeE29mGsqceTqwQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt4wH9q8C1NXMj7M8JCNwMgIPcHGme8DFqGEHM1Z/sEsGgizJt
	H9yQ1pMh0McXGCzhzghtw2RxAvVq9sr82RmQok63/z6TpW/VpJY9XwSmS6T3xZttgjA=
X-Gm-Gg: ASbGncuQiAVixMRXgk8x8YKGEX78nW80kMTKCWfj0TYN4UKxgP4NdQPvm5HEx5lclN2
	KXH8djT/xnAiJW7wTKJUHPwfDPwxznXLyi6Xb58GLnLq6OpLFNZbYN2Q8Atjp0y6JNiJvDZu48Q
	BbFPTxuBKVVrBbXIlXuBMoxODm4bl4JgQ8GBxpCk3+PleeKdYk4S5H8clGbB3E6oDa9LJS3hluP
	2p8sRKUyEAP9h6KP7muaojAyY9keSwgWIW5u7XVTcI+oZRBO1DOdTHI56DFxWAkCsIxMF3lYnfZ
	7VM0ReYf0mRmsY4wKVX5gQf0tOBZsvhvYPhBYwBJEDAMgQ8nu6gO/n5ArNwYcCFPogJ3AmYcHbx
	yrfdO5UK0aquFq5fAaWQv70U8ccy81qHqTF1kDDV93sIEcLfESY5aNIZav5Sh7KEovfyN9+6LIh
	OU6JLAha73KHOzLms3TdRnDh+JOjV4HzJB6g==
X-Google-Smtp-Source: AGHT+IE7wXx3urTFDNDSqobwKamWQF4BItgkmBjCAwdlchVnppz88UvExNlhgtNOLk7PtlOnGNVWQA==
X-Received: by 2002:a05:6402:40c7:b0:640:9997:a229 with SMTP id 4fb4d7f45d1cf-6411d16412emr55871a12.3.1762360808780;
        Wed, 05 Nov 2025 08:40:08 -0800 (PST)
Received: from [172.20.148.132] ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a721f1sm5105380a12.32.2025.11.05.08.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 08:40:07 -0800 (PST)
Message-ID: <4ad47442-1c51-45b7-b709-3cca029e4fc7@linaro.org>
Date: Wed, 5 Nov 2025 17:40:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/28] mtd: spinand: macronix: Convert vendor specific
 operation to SPINAND_OP()
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
 <20251031-winbond-v6-17-rc1-oddr-v1-12-be42de23ebf1@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-12-be42de23ebf1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_084010_737062_D8A9821F 
X-CRM114-Status: UNSURE (   4.64  )
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

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

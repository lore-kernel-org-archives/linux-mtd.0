Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CD5CF9C6C
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 06:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJqhb8iD2FvHR72CBSQzCuJaHV3BFTmSHeXg/XwiTsY=; b=h+25pHLZToz7dA
	qtdBXnBRTLK8f01iDUyQmV+afUQfD9GODnXC7hBDCKdDM55JwL3/j+3KqxNN+i7cI8rCny0tz04+o
	6FUAXCISIARBQrlNEKFLkz7Wn4kpE4zv7vNMLw1Sizmztm5u/H27OrCUYsIxT/gUR9fQ+t/5sft5u
	mFifH4t575mF4VKi2E5+n9txNzPJMD1GSW1T+fI+8E0kpHiIaR/VRMi1HmlaLuZDEU5l3JHjnfiyV
	TubEPmlJNf5En9u4UVTUy6VlJX8d3C6HPKlQLmfvP8CUU6CpQX4Vldh5KmnZd8RzxaYeuJfOyOzfT
	gXU6OlheMtmOzUJYGdBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stLQD-00000004A4U-3IH4;
	Wed, 25 Sep 2024 06:22:45 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stLQA-00000004A2Z-1qlR
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 06:22:43 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-37cc810ce73so75863f8f.1
        for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2024 23:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727245360; x=1727850160; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o/oS2ugpeUSW+6nwIvuuz9Sn1patnKM1K1PU0Uod2NY=;
        b=XTlwJK7O1GZJAdffCyuYJmp8BmrBFU9WlXo1FfriLHqUprs8SbyFWbNeOT6n0ladyE
         S7+RdF4ELa/2XHxrELbUtpzz6ClJG2PsDaDW3ByhMal3G65zFzO5OMKXcpV9pe9FLK0F
         5YI7zZLZKPzhLg489sWVWN3nCLo7Q6ne8n4wnpqMuu4IXMIGGCLe2H59bVo/KRn/PHd3
         YpkNJxpzdVUT0BCLrHXjH+BHR3jI0MNQUKuktI7JAX173BpKQ774qw+EhCKIvamizFup
         crJDJBpMuQlljOTYCURTdvVTJU2Khtp1AlgM9qUl8+TTbb7x687pqpfak09VWEkvrTsj
         cFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727245360; x=1727850160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o/oS2ugpeUSW+6nwIvuuz9Sn1patnKM1K1PU0Uod2NY=;
        b=Q3tD6RVmFUkdiqtQbMITQ5o1Psas+9QIYUUOvf5YCvzegpM86+e6J3xvZIrDwiYC8G
         sArRN9BlyZ5ICwzxyPCxTAIt+IURa1xoD8e8VN/Z0Bl0LJy9XqbSChJkO/G9qDh+mnTd
         f04ynmn2j3Sko2hPnhEJtWT3DOFEt04it33Q4VuvXCnjCeuHYDSmA9U+DmOCPFkhO0cO
         5CePMQVADzIkgeY7CKIOQIjocH5jgrWr1NrHNJZ83Fehmc8gPWF9W2PE3npji9y3aUEF
         XxK9M0jOvGezIC+Y1Ixv2zlK5fxXYA+jFDbveDqAjOtaqgu/d8l2TL2UFhX9JBhrs0c5
         TIBg==
X-Forwarded-Encrypted: i=1; AJvYcCVKEQTWmbHy+FX1E1711z5yn+rGTCtFRDVYHfC9HPZnwsM07gTjwLhiZ9bOt4Ijd1dgc0AIQBI0Fn8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyeq+Y2vcAHniz47m3a927xqFqvyLbQpE1TSfA/cg/cl/ppzLCn
	UOicaZpVOMH6IVg/6nVrJD1zTlDgcVxDZT6bW0JFH+Ojypn5c5p2hkRfAi8TZW9LLJLSHy4SinD
	C
X-Google-Smtp-Source: AGHT+IG3dYAVXO0Ep2i7vx0JuRGZS2wbqrxhkLOCav4gzYfGhkJtR3KQHMBdbfF5LZr1l8Ir4MTfmw==
X-Received: by 2002:a05:6000:4388:b0:37c:c870:b454 with SMTP id ffacd0b85a97d-37cc870bc64mr149201f8f.49.1727245359901;
        Tue, 24 Sep 2024 23:22:39 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2d25absm3108089f8f.65.2024.09.24.23.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 23:22:39 -0700 (PDT)
Message-ID: <b4dae4ba-c016-4384-8a20-5184cf113902@linaro.org>
Date: Wed, 25 Sep 2024 07:22:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] spi: mxic: Add support for swapping byte
To: Mark Brown <broonie@kernel.org>
Cc: AlvinZhou <alvinzhou.tw@gmail.com>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, chengminglin@mxic.com.tw,
 leoyu@mxic.com.tw, AlvinZhou <alvinzhou@mxic.com.tw>,
 JaimeLiao <jaimeliao@mxic.com.tw>
References: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
 <20240718034614.484018-6-alvinzhou.tw@gmail.com>
 <ZvKktPc0luV9hItN@finisterre.sirena.org.uk>
 <a87a159e-eff1-45c3-bf26-115d4ca5a9be@linaro.org>
 <ZvLSLt95Hrd7JYj3@finisterre.sirena.org.uk>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <ZvLSLt95Hrd7JYj3@finisterre.sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_232242_546702_462F0CFB 
X-CRM114-Status: GOOD (  12.48  )
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



On 9/24/24 3:52 PM, Mark Brown wrote:
> On Tue, Sep 24, 2024 at 03:29:37PM +0100, Tudor Ambarus wrote:
>> On 9/24/24 12:38 PM, Mark Brown wrote:
> 
>>> Acked-by: Mark Brown <broonie@kernel.org>
> 
>> I'm fine with the SPI bits as well. Shall I take the SPI/SPIMEM patches
>> through mtd and provide you an immutable tag? I can do that after -rc1
>> is out.
> 
>> Or you can take them directly through spi/, but I'll need an immutable tag.
> 
> If you apply and send me a pull request with the tag that should be
> good.

okay, will do, after -rc1 is out.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

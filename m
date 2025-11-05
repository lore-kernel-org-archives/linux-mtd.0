Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3A2CCF9F8
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 16:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xEOQpqRTr4OTJc2t2L4GroOp9keDK2cM3Ree3d38xjE=; b=Kr6S4Cp1sa6VY2
	ZYnVgoOCXN67K/xKc0F/mqLmiHpYDmkZe5hAOvx60fbjkLZrfr8rG4eivFLlU6OAC3dKcWtXWjPMu
	iHdl3zTLtl13/o+xlpvMUfRgdZx0JqNUG9l9S0r5vz4o/E57MzRyviG0An1g93ApJVC5wjqLenDAv
	/yLLp4yj96y0IYXPQ4UsGKs6VlwNw9I74I5+6hFdlOtH1sZTGrndExoNT94tQlTmXbDRiN0J9ZJZH
	f/2QdIPgnD9lb/cyZo/TLQQTEt0mBaTIEaHhuSI/fqOEB07c6XnU2JQRyxgHpy32a3AOHf42lAfra
	Cc46kLZiyolVkQXvcCqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgZ4-0000000E5Nj-1pFZ;
	Wed, 05 Nov 2025 16:40:54 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgZ1-0000000E5Me-3no4
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 16:40:53 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso7041410a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2025 08:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762360850; x=1762965650; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J5y3cvvKo5+9lQfpJmQgggsGD6TUmDXFlvyHA/c6DMg=;
        b=E6FRy/LgQSPNjmCsk9qsxUQ99IHhOE6trPmbzb0bEKvWAuT/a6urp3qPtXZaUAEJtE
         ZAmGU6mr4a1Ll7ED3gmr0UrrtV/5i2HWBM3yxdm0uFi8dhyF1979gNNuTCTAHLO1GjJw
         OMXDTCId82Cqpm5ICJw/Sn1xF/+8YJlVo98luR/SChe5xqbS8uAQB1j6VKyVUP6IdPlh
         +JqcryZJVFUHmM3BUkOF4UbE7zAuONWgutDdmBJfz9b4MW5+a7cdCu3Uf5+E0aSKe860
         pm55LWhNjYBwiBE8dcySLP28AMe+02/CZGLOKkPuZYn73oGarncxEgyave8v1Enrgs4U
         tJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762360850; x=1762965650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J5y3cvvKo5+9lQfpJmQgggsGD6TUmDXFlvyHA/c6DMg=;
        b=wqRbmxToyVZoefEhVTMRdY+jsvJ2yLaIT/utyaGlRHrbMZ8fcYssDwR0qGGwEOceZv
         b2vYXpjgqzzTrrmHtnjupplNRmDF6+7zgmjgXL8jloG9qWk54vMTARHcH+gQIKvc7n1D
         i3VteITp4/m6fqBVXh//b2yHCe9XTAne0IdBfpg/4h7yM+NUNrlyFC/NjoE79UFPFQTR
         IzTLO0SfBeMVFqiFv9aZw/Q6MnmUVus85czWg3aQY6Yp1PKcXfXWHUqTK7DfjL39QyeL
         W3KaTGYBQCx5V476h9hFJ4Wc3OHyY9K1VjtILTGiz3jH94PpTE9993cRY+yCPXyMNefD
         GeyA==
X-Forwarded-Encrypted: i=1; AJvYcCWcNs+F4IvzEX9XghPRoRHZIXidBAmfIKguOubcuhHukntKzjuCBHx30ob1QFNZQ7A0wjz8lnqZRK0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEiCUZEPA7FoTKbnu/hR/hknLiJ6oH6dw1XDmolkxz7u0ucD+Y
	LtrOuQA693Zki/tPttsxZE9xDdwxwmReeWqf/vjPzK7qGNnTqFkXoNjTuLWtAS4JWz8=
X-Gm-Gg: ASbGncuS7gMPWGYL9nlwLiXddbALswrZ2reIw0V2htpyKJS+OHRVOSSeCvHzVzKxHZ3
	Kxt9jQVNA4ncP6M4o+fq8s9xIlcoIGRcwB93LFETx41oqy3q5skXjDjtIQL8aKIW1luRgrsZrzu
	5vU64E7Rc/SSuxi+t2X0vhj6SHNaw9+yiMNS+t5ttdIYUY8cqvN8zBKv0t+6tyEovzJ6OsLJpy3
	IdylTUkRCXXmaAhyFAlw0kUXQL9AE6emH+vCu9hnmx5jz2b69OaYMg402/3Sygdgsj/X0datBOz
	fX3kEqnvxEfz2mJLOpmlujumDEt0GIYQKMR9sbeQ0nRwseU+2VXj636KrBgOaI3K3uAim1Eksht
	8egD7xq10CQtYEJVbLoeHkywilVS5HmqHbKTHXGv8o2Wr6dUSPa8sx3dM1k8lsBBq2iI9lj+FDs
	o4sFxjab85osyVW85YLiZppi0=
X-Google-Smtp-Source: AGHT+IHHiXKeERAxAGoA9dz0LSZUAmCzTEFW6Xdym3PQ8+7oh8lHWXBcPCZ2UhPmAtNDnOKZfma9sQ==
X-Received: by 2002:a05:6402:280f:b0:640:b573:a30a with SMTP id 4fb4d7f45d1cf-64105a44b13mr3577815a12.22.1762360849881;
        Wed, 05 Nov 2025 08:40:49 -0800 (PST)
Received: from [172.20.148.132] ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a5c881sm5086735a12.22.2025.11.05.08.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 08:40:49 -0800 (PST)
Message-ID: <e469cab3-c0d8-4d68-8eb9-4570ded1884b@linaro.org>
Date: Wed, 5 Nov 2025 17:40:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/28] mtd: spinand: winbond: Convert W25N specific
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
 <20251031-winbond-v6-17-rc1-oddr-v1-13-be42de23ebf1@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-13-be42de23ebf1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_084051_954329_80709A0D 
X-CRM114-Status: UNSURE (   4.43  )
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

no inline, good :)

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

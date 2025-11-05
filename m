Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2739DCCFA0D
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 16:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMEDiKvWSKJrV6uKqTHKbf/iRyW05SNxwiRFTbCt89Q=; b=ZcnsGXHxfIo38O
	F6qpEm0A22ISD7tBo68RDidxF1TcLbMgzLINOrl8ejz9IzX9kmxAB7qKzTN8BgXRgBkScDxAqi2wH
	7aLaEFC8XLICQvqe+GLz1GLnw1GMCY4nRkBM4vJAm+EFVRAuzk0nCuxXs2+UWFl0KlNnCgdAP/+cr
	nWnsewAt9aKbKGEoXo7JCaf3EgNk4DML7xcO13U8HfJFXycNP+ZiILH5zOs4qrWl2FGQD0RMRK6aC
	VMheRfETRMq9FGoZi4/mckdDQkG35Hnm8mE6t2jKDZ++VJ17yDAuLXWLd5PZ0/tHcaoAlAEOYN3lN
	H3CKEVRcIvZq+t3dz+SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgNA-0000000E4Os-2Na2;
	Wed, 05 Nov 2025 16:28:36 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgN7-0000000E4Nw-0kit
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 16:28:35 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-640b4a52950so4694954a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2025 08:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762360111; x=1762964911; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tI1w+zRHNjqYgYKUw8eqjf6yQpSJ+H6WAlDRjf6NeDY=;
        b=B5hSLC58csx1hc+mm8PItzA3kHsk/bIDtUlLozO0Gzwtk2wpbtQgTAusl4EjTXHYhg
         vfd0qzGup2UJrdxkNR3GP68lJ/NV5vhB3QdxUT07qpBfDukLdh8vZigH0zt5syWFraZR
         5cWyUCCfJLjiLYo5GIEz1Hgn2+HUn5Npv8VrabhbAm3wIISVOHmv3STsSdlOXckPV2TE
         I1mP8zOxHQZUfuoMo+2UrzgZAL80bnoEXEIJvNtokJzRDMUmLplzbvfywFs5Ia7vlSmD
         z63IvGYvTOACH7HWewc8oL8tvpz03hBcRPbUmmmcP/RtY2AbT2uvFwpntICgeBIwTI/G
         IVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762360111; x=1762964911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tI1w+zRHNjqYgYKUw8eqjf6yQpSJ+H6WAlDRjf6NeDY=;
        b=kEBQXX2XGJVclaYKiW6jN49Ft4DluW5Ts1Ia3+druZ+wJUs/HPEETNNOCgMfX6oaai
         zExvdYca2Qo23MResttSrfwkZ9Pdnee4SkmZrByhx8JM7r8H7KQKPB+91cCjW3D2QwtZ
         Ur7uNEpQuQV9oKhYIt47kVz5acAZhJ/0L96gZn6QRky6hmrThmpkJpURukk5NV4Z8R/o
         3NeD3UXF8+FMsPu8OZMvV+eHfMqQQRRqTJ+nhdLzHvok6Gl/DXxbOnp83eys4gap+MTX
         D+6X+TENZNosBj4iIEH1nIdIbro1v/PUXJW/Pj7+eZc0wGQE3aYJ/LYQf/5wphNboBH+
         Qc6g==
X-Forwarded-Encrypted: i=1; AJvYcCX6qwpa0+CrMqj/2AIvbqUy4Z/sFxv1MyqQzHazZcTLyN4sTvMplrNP+AiTJNbJ9zNSxBJXIkKabSU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1UvjC1ZKpAKjw4cRVdtBOgXTA1YC3BalQk8ix0cTlpWxoec4u
	zinoJOD/jPrWusSBr4W4cjgcA+JiWa5Xr/z2BbV9t+fwcBfcpe1DnE5PDuWwUFoQd98=
X-Gm-Gg: ASbGnctqnfqxez8URll57Fq1RVPy29FL9ljqzfRrIKepm/YdGWF0pEQ0zIKpe/yHrrR
	lED3Uzn1eI5ctZtqF7jxR48i4Lchu3XKcqVbJogr4Dph76WqzbhqmocYRl2w3RQWiHuQEUSiQg0
	M86thERGNZ7OW0TrySWPHyTrCyBInzCTaRqXfOm1l7h0RmWuzyGZM/OrwFoWCPdRZOz+cAEU4nD
	WTMEGl2P9F+NHzBsC0o+9UFfwb/G3TQs0BeZ2oH+1pD3luHcMc6WCz6QRad5sL+5YUNlLk9gUhA
	viuz9s1Rg6K6HzbF0g/wdXPigmK2zYZXD4Ps2GcS90ycUL9fxUWGuDB0SKMW07vqzMraOLVCgNf
	uFzeCcfO/o8KyKRH6D+GecGAoHe1hBZeDD7NiwiPtU4glpqatZfJwbG/PKkl/L1/HMNgdeu6QL5
	yZ6TRzcRU2wgf719SPdF7kbvc=
X-Google-Smtp-Source: AGHT+IHUIt7T9pXuVmpVYaL9XQ6GnLTYW2Usq+9EdzSRSWz7ihtMq4nQ0SqhbWd8MSLFCOpnH9FH5w==
X-Received: by 2002:a17:906:40d:b0:b72:6728:5bb1 with SMTP id a640c23a62f3a-b7267287f28mr269900866b.56.1762360111222;
        Wed, 05 Nov 2025 08:28:31 -0800 (PST)
Received: from [172.20.148.132] ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723db0f1besm522399366b.31.2025.11.05.08.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 08:28:30 -0800 (PST)
Message-ID: <5680a2a8-aeb3-4274-a264-4ff658cc9246@linaro.org>
Date: Wed, 5 Nov 2025 17:28:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/28] mtd: spinand: Make use of the operation templates
 through SPINAND_OP()
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
 <20251031-winbond-v6-17-rc1-oddr-v1-10-be42de23ebf1@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-10-be42de23ebf1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_082833_490334_855D3C62 
X-CRM114-Status: UNSURE (   8.81  )
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



On 10/31/25 6:26 PM, Miquel Raynal wrote:
> index 4afebaf5f0195b9bc617ea1f125f637f76fff9f8..a8fd04a67cfa9925bd68c57539d86e0816b76274 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -701,6 +701,93 @@ struct spinand_device {
>  			     unsigned int retry_mode);
>  };
>  
> +static inline struct spi_mem_op

Do we still do inlines?

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

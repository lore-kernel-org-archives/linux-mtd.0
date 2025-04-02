Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03832C28B20
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 12:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMmhQKUyAYki56m86PFvQEk0HpYbyQGP8N+JtH9VQ/0=; b=Qzwo36MtsLzcdU
	Vxnqi3JDKHpIJi0rxT3ZphXq+m0WmWvgjT4TGo+q2IUHMM2claYV18FevZosIV7hRIWa0QdKOfnsC
	aI1x5daXMnawSyiRu/Y6EgZfOGTWgRL8KdKQPBdPNtuMVEhYWmALRYVCbqxThUyEIIOpO4Q9W79fy
	lcA0N1iJdItxUheVu9T1C4HMJ61C681fD6F/h3dKyd+4cT1hADUovFtogh1rKTN1T/aAM0Ds8MvoE
	8Wdq22hIVy6gAZUMACnbC7yopXptP1gEvw5mWXuVzzPrTG6gPkxOsBpnQRgKEcxhqSaNMZ0hxIh28
	ahy3kd6V3MExlmotkp+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwvi-000000061sR-0fDj;
	Wed, 02 Apr 2025 12:10:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwvf-000000061ry-2UIM
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 12:10:48 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so59660495e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2025 05:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743595846; x=1744200646; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RYc1LuB/xIhlHruIFuXcUs0gJsKL3VzWsL18O/VLaxk=;
        b=pf/d5zJKzZVxZ+4lvgJc+Ol1CIsOtzBPsLKSkxcWtioHTLdkzNpODTmDbAvasjsuKK
         ZfB02d1yYwWCX163dNbaS5eUo4KrYFuzJW9iVXJuqxXv/ADhbvQfnHArPqRMeJeFdv7n
         TFtu3A5mCukQ/WrBHgyBGVxUZcv8O3C17X9aajpKTtfK0LGHXmdzYGE5/pX+6EsZMfkh
         3s0eRsvzpxdFgjVJBNX3G4416vi733/W7/httoJ1qnYrox3mMH7ra5CSLCi9iM1tiMYS
         kf+qcnoKk1j3RUFb7/0wi1C8qMKWzQYeZPy1QvKuE5ijhsxeGfmiifdj/C+mZK6RRMje
         ibSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743595846; x=1744200646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RYc1LuB/xIhlHruIFuXcUs0gJsKL3VzWsL18O/VLaxk=;
        b=TBo5gMn/f/sR7InuVtKGOmrwzpDgsv6fqEXs0/OdhTSPdtLUmvz0XgOxOseQhMN3Cq
         CkzaLrAGPd+4R/GRRL2mazoYXeKq/UganZgOnL/se7wS1SxwsaYaQ7sbe5xbY+j6rvhi
         zByBL1aPPBnGcLF0LU1iwPhhsnShzzaQGnz/GQ8y2w8dmLMz1ka7HYebVmFb0jJA+Ezd
         LiiDRqPfOsjdZEFA1zAGdY1djmiuZ8RUttzxhNPtZDwpl5w16Bxy0/QKE36KiFWkM28Z
         Q0AhElQ9h2unyV3OhvThyZhoRyaJkBSTozMTMV6lY00LUJ2VGijduoyJLuJerysorRRR
         Tsjw==
X-Forwarded-Encrypted: i=1; AJvYcCUWztFl7aelPr+NIiZHMjyZL2Cjad2P8lHxrWlS1iLdwpZbeSYHV+cz27VeQjHMxpF9rq1rNH3zVgA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXr74lkcNBAFT2XefgQl0lnYYkBwfGefUXqnhBXswDuoEoo857
	QvZHYufboUtoTjzs2xILDCHKylESu/FMwpXuVXBCwkf1e3SWNEsE/ULjvZebnp/a7HYdKMGlGAk
	J
X-Gm-Gg: ASbGncuN7O7d2UQja6JracstCvMEFXBVwEf8KwzVo+VS0MsL73S1Q/kMsaiWNQUDSBu
	03Q6yTzT0XopcLDgnYFVrpeKHB/09yi9Z/4COm+YmB8hg0fHQomiExGMxVZfAs8D91QEQ6tB9sx
	f2G1qUpiWId5UjTK0qXBY7pTuFOnVO1ZOOCxQPgOgB+k+Xs/pBFo9fIQ5ENtMT0TGnxOY69AaRi
	xztYzwNGWgrceGiMZM6Yx6Teia67wpiKcrqXgGdV80uYrKK/TN2kTQ6oEV8Qxdfb2kFZTEbtlSf
	aZWDfffWDiERf3/yQ3oO5u8P1hLEnBtYaoVAsR2w1VOkOaiWs48QCg==
X-Google-Smtp-Source: AGHT+IEUaRlq843Y7/JXmnM/b92P4/Evfz3Q6+OEj5CnWNZqw+5LChhSQFa8MJAQNMyyV9Csuv1rZQ==
X-Received: by 2002:a05:600c:b97:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-43db6228697mr160288065e9.9.1743595845868;
        Wed, 02 Apr 2025 05:10:45 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb613a7edsm18871825e9.38.2025.04.02.05.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 05:10:44 -0700 (PDT)
Message-ID: <7aca2dd2-611d-4af2-b4a8-265528de2534@linaro.org>
Date: Wed, 2 Apr 2025 13:10:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mtd: spi-nor: macronix: Move
 macronix_nor_default_init logic to macronix_nor_late_init
To: Cheng Ming Lin <linchengming884@gmail.com>, pratyush@kernel.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250402085129.1027670-1-linchengming884@gmail.com>
 <20250402085129.1027670-4-linchengming884@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250402085129.1027670-4-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_051047_642572_9A6D123E 
X-CRM114-Status: GOOD (  21.18  )
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



On 4/2/25 9:51 AM, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> Remove macronix_nor_default_init and move its functionality to
> macronix_nor_late_init to ensure proper quad_enable initialization.
> 
> For MX25L3255E, SFDP follows JESD216, which does not include the Quad
> Enable bit Requirements field in its version. When the size field is
> removed, manufacturer->fixups->default_init hook is not executed, causing
> params->quad_enable not being overwritten with the intended function.
> Consequently, it remains as the default spi_nor_sr2_bit1_quad_enable.
> 
> By moving quad_enable setup from default_init to late_init, quad_enable
> is correctly assigned after spi_nor_init_params, regardless of the size
> field removal.
> 
> Additionally, according to spi-nor/core.h, quad_enable is more
> appropriately placed in late_init, as older SFDP versions did not define
> the Quad Enable bit Requirements. This change removes default_init and
> moves quad_enable handling to late_init accordingly.
> 
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/macronix.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 07e0bd0b70a0..216c02b92bfe 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -282,22 +282,17 @@ static int macronix_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
>  	return enable ? macronix_nor_octal_dtr_en(nor) : macronix_nor_octal_dtr_dis(nor);
>  }
>  
> -static void macronix_nor_default_init(struct spi_nor *nor)
> -{
> -	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
> -}
> -
>  static int macronix_nor_late_init(struct spi_nor *nor)
>  {
>  	if (!nor->params->set_4byte_addr_mode)
>  		nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
> +	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;

Not at manufacturer level, please. You change the behavior and overwrite
whatever is retrieved from SFDP for all the flashes. Instead you should
introduce late init just for MX25L3255E, because set_4byte_addr_mode is
not covered in rev A of JESD216 I assume. Then if other flashes get this
param wrong from BFPT, amend them with post_bfpt hooks.


>  	nor->params->set_octal_dtr = macronix_nor_set_octal_dtr;
>  
>  	return 0;
>  }
>  
>  static const struct spi_nor_fixups macronix_nor_fixups = {
> -	.default_init = macronix_nor_default_init,
>  	.late_init = macronix_nor_late_init,
>  };
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

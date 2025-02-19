Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A78C021AA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2025 01:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ByWjTm8Tfu1pSptXQ2lstSj5xHH/fCQdsB5zQHARlAg=; b=L75f4s5mAXgfbV
	s0G/+R1ul8xLl+0jENp+p46+CYcNeiqHDLUepI9V0ggnkWlLav0SJg84Hp8NsVfvXpOoHure1NBrp
	5Z5qxeL2wTsbcX+wDoU9kXeWFWzRsVT9Tx1xTNhERADuTIrmTAmu/NSgeYP5//KoNI0vheqWDwtVC
	peAaqu+o7UF8wORK6ZDkPUxlC03Xn+iEj82OcHf6iaekRHP5l5FGfPJaqJQhHvmQOuRe0rxcl/CxC
	pJFICPeTxU0mS63LkHDOyJ91vC3yf6Wp006hRp9wMOfDxQCDNKhouFTnFRcKE/ipfF1QYTxWQcmpB
	gqfkFkH/o2mnhJlhfz+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZAi-0000000AZPN-0G91;
	Wed, 19 Feb 2025 01:46:44 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZAf-0000000AZNy-15wI
	for linux-mtd@lists.infradead.org;
	Wed, 19 Feb 2025 01:46:42 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2211acda7f6so66914655ad.3
        for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2025 17:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739929600; x=1740534400; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KHLM9BodbqExjTFZgfMt383nUiw2mHVQ8qKEiBq+U9Y=;
        b=bl4P0gLFD7elN3Qcu+UBT1m9bDlpA5w/CBsu1mNaYN4OFcQPkDJgPJSEq2eK3mD5Cx
         dJkj82tHg309uwsipjYcRhmG4ghfubk+I0JMxWQLHphB6ece8cypQk+ULhy0/A1XMZBC
         JisCbhzl0fSDrWZg9ve54GVwXpBLQn9pFEBG1sLn+Ej1F4RHbk2oEaCrBiBr/RSoIOdI
         fSeYDlHYPfyqnFfRG8Dp3Y7GU/qkXyzZntb2rQWS37BVqx67h5nQDNnQOAJpNojJgZca
         fCwdzdQwAGPUf84h6hnZJY9cbNEz97vL/CLZAzXhQ5cKkp2FigEsV6VyXdZdXE35fwHD
         dIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739929600; x=1740534400;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHLM9BodbqExjTFZgfMt383nUiw2mHVQ8qKEiBq+U9Y=;
        b=u0iqfNxGjRi1QaEaefrs8TwOBzhi+InL3GlM+RzifoIN54Wkt2+EcVEazmrt/K6aXq
         RPr3JvqZD5wLY1uU/IiG7IytHUEd4roq+QPAlTEJmKRuxs1SDDDSmaCyhZbx0QsVLUpn
         PdRWAKElVMOmYok8Plu2LYKl8DmBxDGx8cvTsYEiT0WRdFkefLTrhf97fRh+hLwUBlDU
         5tZsjuJ/c7NUXIsfgqJex6L3lm5/R2wOkGoyMlpdzKo/yoEPTF2HwqeXOZMQnrbQejtg
         OgwlBPVeE4oxG72P+NL16uhfh3ob4ZrcnXTG38E9O5s7imo0teEjcY+DS7j/t0mmo43i
         eQbg==
X-Forwarded-Encrypted: i=1; AJvYcCWa3Ky+zf6PXlwe3lU1hddfb3bOu40rtyWluJ1llk0QAaYztRE3nG71UY29odbtMH/u/SR34+MaSIw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAGcCP/iNxm4wM97Vc5PnsjRs4R3JMMmmmNi/br9YUCgpri8LK
	UXU6W/vMxjW2/3vOU7t7vbOou9IqmnHyK2uYhWzuKJRxYf+mTPRN4pvVTVZ0
X-Gm-Gg: ASbGnctqBEk5FRnCDMqf1U9DHXMEXd4m9KgEgzs7H2p131qeP9g1y7UohFhZlPlQL3+
	vUzSZctrfLecE2k72LEEuG1PheT88BhR4A5DJBeXZ6pipZSY39zHQCSyEbX4SjSSvJ1+ctWARJ2
	9I76oXQeZW2ejmQdaUBnzewpiLoSDPGTrH9/V536oc1yMxGmFQZjl+sYjP5VPg7ttOebg0Je5is
	3ffY+6L0K7evX7Bqefswbob4bhz69Oaop5dSxCCw3bbWaG4ugoGp3kgj9Ct63Q0ql7JUoD1deZ1
	pS7drHSGObXyYxdquzVb+q1C
X-Google-Smtp-Source: AGHT+IHYDUeDh+TjYMLZHZfiUdCo1D6T8CzcMh/69bNPaSIGjriv8NDC9cMcZ6HRiYZ9+HUyoJ6lcQ==
X-Received: by 2002:a17:903:244b:b0:220:fb23:48df with SMTP id d9443c01a7336-2217119ecd2mr32645005ad.36.1739929600118;
        Tue, 18 Feb 2025 17:46:40 -0800 (PST)
Received: from ?IPV6:2601:646:8201:fd20::6252? ([2601:646:8201:fd20::6252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2211d4c9c64sm48956895ad.214.2025.02.18.17.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 17:46:39 -0800 (PST)
Message-ID: <4436de8d-1e26-4f96-9691-cca19c81c095@gmail.com>
Date: Tue, 18 Feb 2025 17:46:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 mtd-utils 1/4] ubifs-utils: ubifs.h: Include <fcntl.h>
To: Fabio Estevam <festevam@gmail.com>, david.oberhollenzer@sigma-star.at
Cc: chengzhihao1@huawei.com, linux-mtd@lists.infradead.org
References: <20250219003329.2078308-1-festevam@gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20250219003329.2078308-1-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_174641_301232_29E1D2BF 
X-CRM114-Status: GOOD (  13.39  )
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



On 2/18/25 4:33 PM, Fabio Estevam wrote:
> Include the <fcntl.h> header file to fix the following error
> when building with musl:
> 
> | In file included from ../git/ubifs-utils/common/compr.c:42:
> | ../git/ubifs-utils/libubifs/ubifs.h:313:9: error: unknown type name 'loff_t'; did you mean 'off_t'?
> |   313 |         loff_t ui_size;
> |       |         ^~~~~~
> |       |         off_t
> | ../git/ubifs-utils/libubifs/ubifs.h:1341:9: error: unknown type name 'loff_t'; did you mean 'off_t'?
> |  1341 |         loff_t i_size;
> |       |         ^~~~~~
> |       |         off_t
> | ../git/ubifs-utils/libubifs/ubifs.h:1342:9: error: unknown type name 'loff_t'; did you mean 'off_t'?
> |  1342 |         loff_t d_size;
> |       |         ^~~~~~
> |       |         off_t
> | ../git/ubifs-utils/libubifs/ubifs.h:1899:44: error: unknown type name 'loff_t'; did you mean 'off_t'?
> |  1899 |                              int deletion, loff_t new_size);
> |       |                                            ^~~~~~
> |       |                                            off_t
> | make: *** [Makefile:4878: ubifs-utils/common/mkfs_ubifs-compr.o] Error 1
> 
> Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/20250218001512.1862030-2-festevam@gmail.com/T/#t]
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>

Reviewed-by: Khem Raj <raj.khem@gmail.com>

> ---
> Changes since v2:
> - None.
> 
>   ubifs-utils/libubifs/ubifs.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/ubifs-utils/libubifs/ubifs.h b/ubifs-utils/libubifs/ubifs.h
> index 0908a2289208..1c7bc7bd0c80 100644
> --- a/ubifs-utils/libubifs/ubifs.h
> +++ b/ubifs-utils/libubifs/ubifs.h
> @@ -11,6 +11,7 @@
>   #ifndef __UBIFS_H__
>   #define __UBIFS_H__
>   
> +#include <fcntl.h>
>   #include <string.h>
>   
>   #include "linux_types.h"


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

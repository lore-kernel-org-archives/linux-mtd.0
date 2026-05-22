Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E347CD5BB1
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 09:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=57L3grafU0ORtA0b5TzZFE936TZPZTzWvBB9ZXY45zc=; b=bycM+yzc7njkQd
	WB0SoCBKx3LXM9j57LW8ZYZUB9kE3p8H1jlxCAOLLamsXGkrAvW20DIsFyBzUUnTT1CoSPIxEx2/H
	I232dCugX3G59qvWzLlHqjyZ7I7RhnnNIV/HPABbLCWFAAUy3hCiFGUGcueL5o7gJ78BuaA5eg+3p
	EYJ3dhyyEZPiZkTpTo6SjALJ3HoRLp2qvuJf4o2qZd/3icaFWT23h4nrakK7uSwGzq78UYOWzuu0X
	MNlWllfXOE4mMA55nM5Jb3kXWr+rYnacHkbpt6Ad4enr0SE2jB9wTsKsbGViyWufTTZaPoxy9oxtu
	ym0tCTeaBC3XJp/pisXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMMG-0000000AMEt-2giB;
	Fri, 22 May 2026 09:39:56 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMME-0000000AMEO-3uFC
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 09:39:56 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-45e6a4d0be0so3142931f8f.1
        for <linux-mtd@lists.infradead.org>; Fri, 22 May 2026 02:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779442793; x=1780047593; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T4EjzCYBZo6gDDp6/NnHFvlpvgywvXkHrB1KsgSmjjY=;
        b=yK+UqPrDuml+i4vqqq3RfM5P7nYgqEDCtzzcSfyPY4z4bs+JfxH1tFYf3AmS4EZ373
         WHp2+lt0aCReog0K9n0sIgAyv8r8QyZnPvOaoXjBCgjOYnsnRFx7Avk3X7B6Kd9AnOlj
         DVEx6WdQonbsRqBdlk4uHv0Lnh4Zk1K15EWFualx8s806X0ezTNW8c+LHurx44KQc65B
         kuH+Yp2INGYVaGUGBimLv3BFSqP9PBQ7l6kdWntymPB3qzPwKOsVQy6mmnEDX8MyIS/a
         MBCp10ajXwXXPmBMjgeNfHe0yGZahG5XF8kvUOBvpf6sTYT6+guP8L8OsOSXoudFHaiS
         efNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442793; x=1780047593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4EjzCYBZo6gDDp6/NnHFvlpvgywvXkHrB1KsgSmjjY=;
        b=GNEQ78KXvzX5F4E7BeoaE12L39wQH6JXdVhZSL4KF+P4671Rc0gdbo3wF47aGvQRpb
         gt2Et8KCX0Ko5ihJ8DqANSkkF3c316rbmjVOr/pTzRbU9mCRmpM4CzPhltQFUWHQY1+Q
         JKh99TSKMekKp8HpPPqBDfet8hsE6dRFMIhMdnseBcYZGOEsNkVEB0yjSphbknrrSq8q
         qrz31J+K6FwaMrhhvEIhrplYuH2815PupaQyMnehiRXrliJDYTq3r5dLS/wMcDIl+zUl
         0Zh63VFZxvaA6PutPgm9cTFdK02n/a0e35GuQ7jnnrHzG35dLszogmrtnx9m9mWd2rse
         a72A==
X-Forwarded-Encrypted: i=1; AFNElJ8+9Nz1jzgE/5nI4rsJzWLXpQqby45KY8Ny0mnA2jtR+6J58+4bG5iLZUSO0IBYw6QA1pr1pLKUkYI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxobtmNTCFfqJKsuhHpo6aDsbDIZEdV+95gSnviMx0vkZc3W9tL
	+VdOi6S632xHKpje6tDKL2eMQZXhZ5iRdCkr2HqgAC41f7b0aCeCgsab+zdNIsi+808=
X-Gm-Gg: Acq92OHu5aABdQuYF/iGxQq1DAq+vnqdppe1xYEl3fokBQY4SxSe7euAjFAQpbY9qLU
	CRzEKO2/Zq/XcAcW1i3tbeTcfySvJQtjJuCTAdQw1zsTiyzt19VrhYQocwHI/VbdaYkJwpGDvJn
	0sqLexzzuvWyHK3MFSgyxJLeSytfcPxsuQNAi4nxNEzULREB9cU2bByUIQgbTHqv3cEQiHgB4s5
	6pwcAPpHFbwtihdhp0rXtbPQ1HRDPowwKZ9oyzOvKncahgKjUJcW259Ca6GfwVctXIz4yGJIA1o
	CLKmr3Opzi14Chs3lO9p8nTNd990ZSQh5Ez0qNnooDUD9Yq1pD7uehTykpjL5BlTC97kCsAn6gA
	evW04C74ZLnzwK9p+rgN+O8Q0ySueLZGwCiHGW9/jDV4t/vtS6t1Pu+Fbq8MItdJuGOls5gknBm
	tbbEVvgvBN3JVJ3ZpVsuhRZx8LvJRmBpNTjll64jMsSw==
X-Received: by 2002:a05:6000:290c:b0:455:d927:1b30 with SMTP id ffacd0b85a97d-45eb38af531mr4204251f8f.28.1779442792871;
        Fri, 22 May 2026 02:39:52 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f6ffsm2725005f8f.1.2026.05.22.02.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:39:52 -0700 (PDT)
Message-ID: <a54562a0-1a75-401c-9508-8e0322d81a3f@linaro.org>
Date: Fri, 22 May 2026 12:39:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/28] mtd: spi-nor: swp: Create a TB intermediate
 variable
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
 <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-13-93453e1a9597@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-13-93453e1a9597@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_023954_995203_477C6058 
X-CRM114-Status: GOOD (  14.84  )
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



On 5/7/26 7:46 PM, Miquel Raynal wrote:
> Ease the future reuse of the tb (Top/Bottom) boolean by creating an
> intermediate variable.

Please squash this in the patch that needs it.

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/swp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 07269e09370a..540cd221c455 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -62,6 +62,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
>  	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
>  	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
>  	u8 bp, val = sr[0] & bp_mask;
> +	bool tb = (nor->flags & SNOR_F_HAS_SR_TB) ? sr[0] & tb_mask : 0;
>  
>  	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
>  		val = (val & ~SR_BP3_BIT6) | SR_BP3;
> @@ -81,7 +82,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
>  	if (*len > nor->params->size)
>  		*len = nor->params->size;
>  
> -	if (nor->flags & SNOR_F_HAS_SR_TB && sr[0] & tb_mask)
> +	if (tb)
>  		*ofs = 0;
>  	else
>  		*ofs = nor->params->size - *len;
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

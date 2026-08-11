Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0F1C5CFCF
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 10:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=URl3CrIRLFkZjsy6JsJS9umzBXDDj5P7OPWMfrJ89KQ=; b=U60tECF2ThkxWC
	55BYO88m6xuEA8ceZ97YK9jgXzNQSu2SVRyOvXRWYb4/ko6+yxdp78UNSU465R2bCBKE+GWQuuKDm
	eVw+ExdGw3LYtlhnRQLkXW17LFCzWGo2zjWh2UhTJb00AjI+Trzjo3aVEw1MUxSzlKpoTjmHPc2NO
	/spXndJanGd3w342BPj0ivWDwIvzsdmTad463tQCVWbt8ElFsvT2EcVQg4FjrtMYUKPwW313UitIr
	rFROcpt2nUhPwxzE1gXOOC861Y3Yt2t4KP7OHA/Jfl+pwh/V8LqE6SKgm/0yHoqY0K10CpanMpb5C
	cNkBCq1XEmihvssulv9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjSX-0000000DosR-1q9t;
	Tue, 11 Aug 2026 10:11:49 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjSU-0000000Dorb-3xZS
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 10:11:48 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49553515a8bso45324315e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2026 03:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786443105; x=1787047905; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oGjBDmrMT1HdtDTd1zYF2GyNqQyxEZ7UjS4ThjuxXQ=;
        b=jrjsBv21Yi0OHDu1jI0EEgcoFTQNFua1NmK4Uao1MsLyH49XqJKMm+iqGNpMxO0Lbp
         3nfOva+1fjpnA9QvtLNn8LK0MNg1dfIqYlMtenlCLgkpRb8u5GE9ycyGIXCGorU3pBcA
         1/uE7e1/d6EGiNW9K1ecLH2+xmyNw/s6ZAkwZbWOETwcRGxufCT4OmnNsTKgnzsnFn0J
         LL3UJ0qB9cFPMxOva/JH0bNbK5hTnFnoP5RMgFVo9dkUfBem9/JWZ7Nf2MlpdE4cDIoW
         wRPzd1i8SSXFonezjZqV16BoFvrvlvfHMUseDcxUminseRpD1sSjvGfuVdSW1haASTOj
         q/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786443105; x=1787047905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9oGjBDmrMT1HdtDTd1zYF2GyNqQyxEZ7UjS4ThjuxXQ=;
        b=QLZfpOGtJNbDNGaLxyzxxnyrC9u95Foif3ZeMIb5FGw1tWqvcdLndpXJ1yVSpLa6ni
         ZPDL5STNu8o5TJHkj6RWtaRaemY16gvtHgLZDJ1mzjbbRylMQUNAgwwlmLtKr4I+/wtt
         v25YYOMtOcnJzAGnM1GwqKrbtTcBJpJ/lnBuaBc7hB8cqgD2hJQ63yB0fMGRKRNL2N/Q
         ZN9j7Dg4JHNPoj5kfqJE68/1WlZSJ43e9K2dCE04nJUvvWzXM5uaScpr3oxXbTN4wJp6
         4FtmOC2QKW2Uz7XcOPRi7FKq44nXHIrdl8+pGWeXcF5LiClX353BS7qZ+aGUTt0YoF5B
         MaNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkS/TBVVVe4ZNnAe4ZfMteVxsqI87uUbm8AcKZQ0tk17Dgh+BAQdasLAy5svlmyKghmI20sb9W79s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKfDqJ6g4ydWbgg/mbyoV4sZlEOfn0mxWuB9qMiN52pVNl219Q
	KVb4qqsmko5M5SmLInJOFhoPlcuJhjyZ1eqk/cZI/VoAyv09x1E0MVUbGoMZOLyH/YU=
X-Gm-Gg: AR+sD11Kh4HNu/NF5uqsrz1NdStMQ1xzkAMxAudMenZT7vreB0P2VftOhP7BP09gUAp
	CCsJ91PGFC647I9DSVdGQ6XXmVdnsjr+hENcHOXTVhoJX5OXYPcsoH3A4hu8cuPaBFMRXpjg3x9
	3G+1N85gJpQqIklqNmeU6364xsJ2Qh0cyQwlghswnF39XGktz+sOe31LbwUWmTk82gMKKvmPrEK
	SshaOPC66PUzXYpZE/NxaZjG9pPKgTI/De8gLzx/3F+5fMAY1l2ExAThUglV1ZIlai9uJdykd3X
	hN4iOOkgvn1D1NsFfs/Zn6w2oYy4SBR4KDvvxB5CIbh0I+KkBDT9gP1w38IfkHycBhvf5h2GOpN
	MM2U1Sk6e3NMpl3vVOd5lZoYrwBxP0+KN/bCAun9WQpjchDZHWR/Xzf7xnef+Li7kUbAhLY2Nlr
	xNrTHuCz94nc0URJXb6QblZy4bYvi5P1CaBTzoZW1mv1JLw0C1Pesh9S0SrGq1DAdhOQmzi24=
X-Received: by 2002:a05:600c:8b4c:b0:499:593c:3384 with SMTP id 5b1f17b1804b1-49978434835mr35593495e9.6.1786443104947;
        Tue, 11 Aug 2026 03:11:44 -0700 (PDT)
Received: from [192.168.0.252] ([79.115.156.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977bab2f5sm23183255e9.0.2026.08.11.03.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 03:11:44 -0700 (PDT)
Message-ID: <0ff8afdc-7a11-4a6c-9f62-6f8ba712c4ac@linaro.org>
Date: Tue, 11 Aug 2026 13:11:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mtd: spi-nor: use guard() in
 spi_nor_rww_start_exclusive
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, jianhao.xu@seu.edu.cn
References: <20260811041349.333176-1-runyu.xiao@seu.edu.cn>
 <20260811083111.403453-1-runyu.xiao@seu.edu.cn>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260811083111.403453-1-runyu.xiao@seu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_031147_023011_F91BA411 
X-CRM114-Status: GOOD (  20.14  )
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



On 8/11/26 11:31 AM, Runyu Xiao wrote:
> Commit 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup
> helpers") converted the RWW start helpers to scoped mutex cleanup, but
> left spi_nor_rww_start_exclusive() using a plain mutex_lock().
> 
> spi_nor_rww_start_exclusive() is used as a wait_event_killable()
> condition. When it returns false on the busy path, the raw mutex_lock()
> leaves nor->lock held and blocks the operation that must clear the RWW
> state in spi_nor_rww_end_exclusive().
> 
> Use guard(mutex) here as well so this helper matches the other RWW
> start helpers and releases nor->lock on the false return path.
> 
> Fixes: 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup helpers")

The fixes tag is wrong. The blamed commit did not change the functionality
of the code, while yours does.

You shall instead blame the commit that failed to release the lock in the
first place. But then if you want to have this backported to stable kernels
you may want to add 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex
cleanup helpers") as a prerequisite patch, as it includes <linux/cleanup.h>.

Cheers,
ta

> Cc: stable@vger.kernel.org
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> ---
> Changes in v3:
> - Reframe the changelog around the scoped-helper conversion that missed
>   spi_nor_rww_start_exclusive().
> 
> Changes in v2:
> - Replace the analysis-style explanation with a short maintainer-facing
>   description of the busy-path lock hold.
> - Keep the fix focused on using guard(mutex) so the mutex is released on
>   both paths.
> 
> drivers/mtd/spi-nor/core.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index ccf4396cdcd0..8bc117b46e02 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1310,7 +1310,7 @@ static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
>  {
>  	struct spi_nor_rww *rww = &nor->rww;
>  
> -	mutex_lock(&nor->lock);
> +	guard(mutex)(&nor->lock);
>  
>  	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
>  		return false;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

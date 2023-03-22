Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23642C6FD1C
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 03:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hjmk59jqlcbVaNQWkfb/Rnlyh4jcYKRW4cLhry54m5k=; b=EHdbHs9BwBasIN
	VIbfjoc54wrmJWZ+QcDN0MaaiyTjslYiLcd2RuBNssYRtoij9yDZ3ahf8W0RsR8frHyd5Aoud5qgp
	aHBNXXj134VybGg0+pXXv19ia8v/QIs7YSq3aafQb1jQfu7xvWkO0GnFP9fhcnXmaeAhQyDZhw2BQ
	wbdwM3ZulgNclfRjTFn2vI0YXK8nxsXhLvkR4h3j6Rq3T5ciWKNM7nLXVk5Nxw0d8HU8GR4Tx9ZvV
	wIZw28JGvrZURBxfXCDB4qG9Iqphhhid9Xfx6VaIQPSEvm5EHpDfEz/dDb4XhArt+l+HvKv5R+QTj
	zX8/wW3nY9wzwH5UQP6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pepb0-00EUoF-1k;
	Wed, 22 Mar 2023 03:57:06 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pepax-00EUng-0s
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 03:57:04 +0000
Received: by mail-ed1-x531.google.com with SMTP id i5so20859678eda.0
        for <linux-mtd@lists.infradead.org>; Tue, 21 Mar 2023 20:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679457420;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eHblcCz8UlInVrPAT4QjZ7JHrBbL1Sx9Jb9tFG5DNZo=;
        b=iowo7E0oMsif2y19DaQ+3Z0CGkCe6g2oyiI4FOIpIgV9fhQfvjy1atPTNB8/S2V+tg
         TyrT5XXxYvdg+Bv0fBlz9jVTfQsU4jyB4iOCrqd8tB6DfuCLzDEyHJDp5R3d/D+HXhBi
         oKHwrkNovxNi8bohGwuYLYm9DcY4NQTH47i5GpkcEf1Ww/BEG6YvFjJ2dOu15vy1Qvb6
         Q1z8MlSCTz/2hJ4L9pXovGsSXmRiFSicbUIOYLO/rX2uYu2neO8OgwmRDw8CjLoLX9C1
         O5Vmae0n5eSRxoL8MrGJS84DR8LuKds1eJU7roV3Tn2Oc25ezCtKrlQXLdeGNlPcPBBw
         w5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679457420;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHblcCz8UlInVrPAT4QjZ7JHrBbL1Sx9Jb9tFG5DNZo=;
        b=GDxnzdNqCX3WTh7Jsbdza3+yBCvHXDPi/SjaF7xmkQVKDpNg5DycigixwpQF/gyK+A
         gK3bSCq5eM9E7KWR6BIG7JSV0XbFOLMgMI2pFYFGdHcYDBO/JgxqaV38ctJFR+aPOh7e
         /btzIfxmDaDzzuR//i0zqXSApSLJ6pfAMDGvLKdle/M0YIGvai4F1Ttr7hhPYn7L4nED
         qmLdqBJfI0SjESLBzk5wZxLp06Hf8c6kM+UyCQUDjDIsxYtsKZxXttAY1RiqKjsuObFP
         L8aK7jQc4Eb4JZlc8SQSq6jV2d69aPcvuKn8ufJ2nrXkZmj45x+qqVaP8Xa7XK1Fn6yo
         ukpg==
X-Gm-Message-State: AO0yUKXDJhGtyh8q9JbBln+SbJ+/5EKRJJ3KXayIFbDFWUqAWWgyNKa4
	/CLwbcLR+QWVPOBG/tPrfoYFAENJ9Vqwgoe5ueNJFw==
X-Google-Smtp-Source: AK7set9Q0YWV+G3tFtSjHXvviSaWwz6AMcqvtcwi6eZVG/MYmC4iWpWfEUsv/iicG3SfLSOp4vvscA==
X-Received: by 2002:aa7:d81a:0:b0:4fb:8b80:e959 with SMTP id v26-20020aa7d81a000000b004fb8b80e959mr5511566edq.32.1679457420178;
        Tue, 21 Mar 2023 20:57:00 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id x30-20020a50d61e000000b004c30e2fc6e5sm6986325edi.65.2023.03.21.20.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 20:56:59 -0700 (PDT)
Message-ID: <7f34b3ff-45e0-fdc6-51ac-349f07e2f4fc@linaro.org>
Date: Wed, 22 Mar 2023 03:56:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] mtd-utils: flash_erase: Adjust jffs2 cleanmarker size for
 min_io_size
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20230315083325.8362-1-Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230315083325.8362-1-Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_205703_324263_47E0AA3D 
X-CRM114-Status: GOOD (  21.01  )
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

Hi!

On 3/15/23 08:33, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> JFFS2 supports buffer mode for ECC'd NOR Flash and the size of cleanmarker
> is rounded up to mtd->writesize. The flash_erase utility should do the
> same when it writes JFFS2 cleanmarker.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  include/common.h         | 1 +
>  misc-utils/flash_erase.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/common.h b/include/common.h
> index 31b6cd1..4b9b661 100644
> --- a/include/common.h
> +++ b/include/common.h
> @@ -46,6 +46,7 @@ extern "C" {
>  #define MAX(a, b) ((a) > (b) ? (a) : (b))
>  #endif
>  #define min(a, b) MIN(a, b) /* glue for linux kernel source */
> +#define max(a, b) MAX(a, b)
>  #define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
>  
>  #define ALIGN(x,a) __ALIGN_MASK(x,(typeof(x))(a)-1)
> diff --git a/misc-utils/flash_erase.c b/misc-utils/flash_erase.c
> index 49a880f..6ff4b93 100644
> --- a/misc-utils/flash_erase.c
> +++ b/misc-utils/flash_erase.c
> @@ -212,7 +212,7 @@ int main(int argc, char *argv[])
>  		cleanmarker.magic = cpu_to_je16 (JFFS2_MAGIC_BITMASK);
>  		cleanmarker.nodetype = cpu_to_je16 (JFFS2_NODETYPE_CLEANMARKER);
>  		if (!isNAND) {
> -			cleanmarker.totlen = cpu_to_je32(sizeof(cleanmarker));
> +			cleanmarker.totlen = cpu_to_je32(max(sizeof(cleanmarker), mtd.min_io_size));

If we really want to match what's in kernel, we should set it to
max(16u, c->mtd->writesize);

And you'll have to update clear_marker() as well.

Now while the change is fair, when looking into the kernel I see that
there's no magic value defined for the NOR cleanmarker and there are no
methods to check the value of the cleanmarker for NORs. Is this patch
part of a larger effort that adds cleanmarker support for NORs in kernel?

What motivated you to do this change?

Cheers,
ta

>  		} else {
>  			cleanmarker.totlen = cpu_to_je32(8);
>  			cmlen = min(mtd.oobavail, 8);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

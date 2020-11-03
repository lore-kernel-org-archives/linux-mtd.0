Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFB6C2D0A3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 12:36:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9788420735
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 12:36:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cl2iwVSw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h164jmH6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9788420735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Lb5e3kxAsKsdTGBDqsrEq8zFkWINzXAwzOxnOCSHx0g=; b=cl2iwVSwVPkH7EIgcPXJl9gQ1
	sPoBCX5iXelnM4EiEZrcHd1vCBRRW+sj5LoSX8ZqqbG6kQvJ5W/eNfS6b842rU4s9AN/jOPRXbIul
	EgfchhppjXYpubGC0OXgPvy9QAFhPwTCtEiQ2RpsteeJOGM35f2/FOTRNG3CO60KTvrhagq4ztAIP
	nnquCX6QS+Jl+GmKjGnIy3vh4kNxtI3YgzjdN6B41kG4UAQGLM1HwsSuetw0CjcM/hpiqxjlONh/v
	ccT/ufUeOMNtpwpkKvoY8mAXJs4fmNE/p+jcfJtvHMtu/FWzn3Q8tPeNfT0PFrxwoRcgE0kQ/+wqG
	sRym3w4Sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZvWm-0004ca-1o; Tue, 03 Nov 2020 12:35:08 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZvWj-0004ZN-As
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2020 12:35:06 +0000
Received: by mail-qt1-x841.google.com with SMTP id c5so11430298qtw.3
 for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2020 04:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UU5MbHumRhOWz5JLbHMs+2sxMU2srbV+zxrr4jBZi2I=;
 b=h164jmH6p50wj+mnP3PqI9hxv+1TNNnCzR0DJ8tBt8d9S3tr6kA9HU1Z93XEcyeO4q
 SehC5WwN6ThjIUptkhy/nOHEUGBIhKLW+BADyHTDBu/xHkqrVSgOsZ5FgsUI6J1jnTbT
 tv87qqQwbKFxV9a2RL7dngNztsoS7tjyGE2sZdODGRpcYNMuO/lNfCi7/kwj4i5teukK
 tB701hrZN4cLn2TIp7hDmJ7IVgDCTeNJSSR6KXBZvXiG+EpeB6YKG1dakmxFTxzVWd0Z
 +w0b1YS+Fu0wC2m+lIHFX6bp0/Exzf7buVXLRelDwUSOf6+lgwcjl5GSkY1rnKFxmz/Y
 CD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UU5MbHumRhOWz5JLbHMs+2sxMU2srbV+zxrr4jBZi2I=;
 b=rfaA8YUvjLJVLw5luid7eV8mA4RLOWOJ32F7GRnZAJHlf9rfClXhnoul2xu9Ee7Mso
 c/GwnfOpzkgYYk/b3RoJj7ESgvUJZldXt4nmpGWOMCETtDDNsyhbN9nruovWmeQ7hmld
 Ih5Xlh1yaegElOsri2ZxVp0CVLqCsUXAYTf7VwRyID5zF8Z1aKzrc4HNgJivpEuHObgz
 YmOn/J79dnVVi6PX/YLSNYkmZWnCmoKwWK7+XZpd4aCtADZOVeAWmjVe+gk7vyHB44C+
 Du2sbWZzKNBWacc6DGmVcmwOhP9nN+CTtY+7yiqhSM+V2gz2ySLvAgyf6yONQlMIEnzf
 byyg==
X-Gm-Message-State: AOAM530hyJV9/nTzG534Wgc5+oUSfubwK+AcCg3O8t7sH9dEbKjpyUQS
 j5IpNE7bcBUcuGU4v5uZSuozshdGgxNNlLSFfug=
X-Google-Smtp-Source: ABdhPJxW4sXn5T8vr31QlV/awsooj8O9pH/jklyMLlWscgm+PC1A+hvLLBLp8OdaGALS+uuBVMevWG4hT2cQq3GKE4o=
X-Received: by 2002:aed:384a:: with SMTP id j68mr18825464qte.170.1604406902596; 
 Tue, 03 Nov 2020 04:35:02 -0800 (PST)
MIME-Version: 1.0
References: <20201103115645.684-1-kechengsong@huawei.com>
In-Reply-To: <20201103115645.684-1-kechengsong@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 3 Nov 2020 13:34:51 +0100
Message-ID: <CAFLxGvwKTezooPvWQDZViaXsZ6zsbgf6b-O8RtcU9x6w27xYpQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd:ubi: Remove useless code in bytes_str_to_int
To: Chengsong Ke <kechengsong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_073505_436759_A57BE249 
X-CRM114-Status: GOOD (  16.55  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 3, 2020 at 1:00 PM Chengsong Ke <kechengsong@huawei.com> wrote:
>
> From: k00524021 <kechengsong@huawei.com>
>
> As a local variable, "endp" is neither refered nor returned
> after this line "endp += 2", it looks like a useless code,
> suggest to remove it.
>
> Signed-off-by: Chengsong Ke <kechengsong@huawei.com>
> ---
>  drivers/mtd/ubi/build.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index e85b04e9716b..46a6dd75e533 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -1351,8 +1351,6 @@ static int bytes_str_to_int(const char *str)
>                 fallthrough;
>         case 'K':
>                 result *= 1024;
> -               if (endp[1] == 'i' && endp[2] == 'B')
> -                       endp += 2;

Makes sense. But why did you send a v2?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

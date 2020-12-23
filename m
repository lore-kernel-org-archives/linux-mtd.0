Return-Path: <SRS0=nxGi=F3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF93C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Dec 2020 10:13:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40EBB22288
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Dec 2020 10:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40EBB22288
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U4BxuCZpm1+sToATaS9Y7gs1n3bi8GgtoyL6Po6nliU=; b=1sm0lif+ECWd7ejsZPDupdWx9
	SuKxZJPj0PkCyVvG8EOCiiiXevtL7YTRU5BybtJYfhKDMeT+gT6irv8WmXLkuX5iwMk2zhGCWsM1N
	p8xcjZ6NEjG616EZktx8S4xw7f1WnGwsjply5dWovi8Bbt9WQTLeinjbhaNwbsbSYiedYAv5G6C0k
	XLMGeRNrwaqcovtwkD2xRqpTiXFhcPpXTrVz78zYw8uzTQx+NSlySZ1jTjd9IkY4tE2mrONBkD/W3
	CtoQnrSROkVDv7EKmCfvuluIbl22MT50CPJVPfriphRHvJYg1JNb1gbzhtTRcZaypxZc1CXP515zL
	RI2kmuqgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks18k-0004Kr-29; Wed, 23 Dec 2020 10:13:06 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks18h-0004Jw-Av
 for linux-mtd@lists.infradead.org; Wed, 23 Dec 2020 10:13:04 +0000
Received: by mail-qt1-x82e.google.com with SMTP id 2so10904738qtt.10
 for <linux-mtd@lists.infradead.org>; Wed, 23 Dec 2020 02:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V7ul2mtHp6U+xwxNPA6N4h6XzfrNSOVuPWwpcUY8qBM=;
 b=PpGHY0IiIVhEmCzBqflwf2fFnjo7bpqTuaMYXAWsADJr/f5KnE0GRnxX9yRMFUENkn
 7yY7eK1t2Hf5aWFWE4r94bhU0Pts87fdAwP2PFWi9V22rhGjvFQD9GweEF+j2JyeXcrw
 RioFJ1Yih/DkSonJqI60CPmazjQZiFq0tZ1cRdpoK48GUdq4baT4ffWTjLg2tSk35twG
 xSw4YDNc2RtbKIDu/zTs/J3vsiVB7ahGCLFq9m1WHllAKEUfi3b8IIoyR9GD7TT1HpHa
 1XzhYUXJnF5x5B0Fz3gX7tRyqahF/kZ6M+hlqbdwfcFvs0jyIHj3WvxB1XXP+YZQYQ3I
 MSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V7ul2mtHp6U+xwxNPA6N4h6XzfrNSOVuPWwpcUY8qBM=;
 b=XQDh4eWiy+nA1BpoITDXFkT3/xWtkArMX/k/w4ZQ22YzTir57PWJgzdZJcHRqq1iAh
 lQPqNGs34IyijlF2a3O45JdV6ajSXFv2kgXOx9PWTh2mHptQX05/3ajU8W0KRFSVSU38
 eTmRq3+nq7Uz1yZ9iD3k1EEDJeREuHBN9UTyCAIJwsZxIVr45Yf3NOm0N8FbGeGGyuz+
 tInhQhKeifuWkPQaU+/W0n38SnwcM56lgeulMRP0rI9XKHYdCKolmkUn/EgJqkwc+aVi
 sNys5p6DnJURWS7RxN2t5YcXhjO7INUBXJB25ysRrqqYg3iTIieeZp4f/gqFhxpvheET
 qHyQ==
X-Gm-Message-State: AOAM5306oTOio7hYLZ295bC0/S0iofccfKesy2VKTbyF0y+wQ6Ez/YBj
 I/MZMx138uT4pfsxSIWoRsz7sY0FU7rBRAppAUM=
X-Google-Smtp-Source: ABdhPJyb7Ntv2c8KzUjwzT3h0jelzrxFvanPB4xg5gsMQc9kpysHJpGGCtalvWYnko43dgPlRXwEiicHDM2xuEwOpnA=
X-Received: by 2002:ac8:53c2:: with SMTP id c2mr24922721qtq.245.1608718380120; 
 Wed, 23 Dec 2020 02:13:00 -0800 (PST)
MIME-Version: 1.0
References: <20201216130728.14034-1-zhengyongjun3@huawei.com>
In-Reply-To: <20201216130728.14034-1-zhengyongjun3@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 23 Dec 2020 11:12:49 +0100
Message-ID: <CAFLxGvx_xpYprmdwbcGXNZkaaBGZwAeFeyOAgZpM7C+fvOPRrA@mail.gmail.com>
Subject: Re: [PATCH -next] ubi: eba: Delete useless kfree code
To: Zheng Yongjun <zhengyongjun3@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_051303_432040_69A0CF14 
X-CRM114-Status: GOOD (  18.51  )
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
Cc: LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Dec 16, 2020 at 2:13 PM Zheng Yongjun <zhengyongjun3@huawei.com> wrote:
>
> The parameter of kfree function is NULL, so kfree code is useless, delete it.
>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/mtd/ubi/eba.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
> index 0edecfdbd01f..9c2840ffd2e9 100644
> --- a/drivers/mtd/ubi/eba.c
> +++ b/drivers/mtd/ubi/eba.c
> @@ -142,7 +142,6 @@ struct ubi_eba_table *ubi_eba_create_table(struct ubi_volume *vol,
>         return tbl;
>
>  err:
> -       kfree(tbl->entries);
>         kfree(tbl);
>
>         return ERR_PTR(err);

On Sat, Dec 19, 2020 at 1:52 PM Jubin Zhong <zhongjubin@huawei.com> wrote:
>
> data_size is already checked against zero when vol_type matches
> UBI_VID_STATIC. Remove the following dead code.
>
> Signed-off-by: Jubin Zhong <zhongjubin@huawei.com>
> ---
>  drivers/mtd/ubi/io.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> index 2f3312c..8a7306c 100644
> --- a/drivers/mtd/ubi/io.c
> +++ b/drivers/mtd/ubi/io.c
> @@ -913,12 +913,7 @@ static int validate_vid_hdr(const struct ubi_device *ubi,
>                                 ubi_err(ubi, "bad data_size");
>                                 goto bad;
>                         }
> -               } else if (lnum == used_ebs - 1) {
> -                       if (data_size == 0) {
> -                               ubi_err(ubi, "bad data_size at last LEB");
> -                               goto bad;
> -                       }
> -               } else {
> +               } else if (lnum > used_ebs - 1) {
>                         ubi_err(ubi, "too high lnum");
>                         goto bad;
>                 }
> --

Looks good, applied to my 5.12 queue!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

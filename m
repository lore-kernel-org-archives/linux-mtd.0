Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC408C77B7D
	for <linux-mtd@archiver.kernel.org>; Wed, 17 May 2023 13:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nms/kVxIOdjL4O+ZJWZvqNURIvMT6JR8XhW0NCMByw=; b=xG5nMJFgXvKes+
	rDEqD0/Dk6UArsLJLVwyxEA5xctIA8KC5uREP2DmVlwLOKoaGT1c2/eS9ak3pFYsDCC46Hpz/HcSt
	crcR3WR+H8EjZwVWq3Mnwh8swB5xwJR4dTDz6xI7bnb9H1EhBCBjLyPr/a1E5EHx7cA0q6RW9RHN6
	z0hqda/mdSOQokmZz/GOee4y1Vn2W8A4XoLWmmINhnZY6VHJmfimhilqVc0to7WnvndZNAoJwEAPC
	fq8Ye4SEMeD8p0el2/XdoVJnNOyoMNWF/1RTdqyDwEQeydmUTdFQ7A+w1onQgs4rTzKA3RJPj5nBT
	Ak7bVikKOM10UtZ0vNrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzHeb-00A3A0-1x;
	Wed, 17 May 2023 13:57:21 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzHeZ-00A39M-0e
	for linux-mtd@lists.infradead.org;
	Wed, 17 May 2023 13:57:20 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3078aa0b152so557830f8f.3
        for <linux-mtd@lists.infradead.org>; Wed, 17 May 2023 06:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684331836; x=1686923836;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OKRMs4xBwcxe6pbrM4TISDziAjRrtGY3u+ik+E6ctaM=;
        b=Jrl3kxtJk/HLFSWty/jNmLRxKSgUJN0qDbaj9XxYlaqB38hMUgQp3PwnW3cKe85Tne
         5EDCUJFYCPLvAZgA5sMIJVmtiHobkoO7GM812sUXiZOqF9F5nmyR2pJ9Rmw9Qp5pzlEf
         iQ+hHQCCOpDzdITu1HpWEaBT6wIBD2fuIaQGpp8dtndCM2Ymcf7INpxu18JS6j2dI60p
         mKc/xttuSQPz7W6ry84ic3Mphr5AGPoAWyE4d45VjFef/8/qkgXUpDnu8GklUS3aCjsp
         gVQmPfUM9Ge1cT28KuhyjrntTgh2FjTKCH3/WewcIXkfHbbH1n0mTgudXhkHewwFSEja
         FIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684331836; x=1686923836;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OKRMs4xBwcxe6pbrM4TISDziAjRrtGY3u+ik+E6ctaM=;
        b=JSzW33cBsbuPpgHxTXcIOoQNtewwDwQK/JVqJIwVRst6LpAXkvMOlRJTkZ6lx2kZ1h
         hs1gZJpKS3tzylSL+5GI9MaBn4t0DXzFnUnMzBcK5qQz/YrvLp3NuPWh103ZvLZQJtKK
         qJch2vb56iG1RgxF2OU7kFuIeztpqWYjE53Oc0mIfoQ99pvNqEb4Te3ngJgMt2LeLVHE
         mWFxKxqeQS2/u+LeifsG2iQ8Io2lNXfnxprMIs7JAU/OT3apJgCETLak3JRydi4ZsDgE
         Oto4PEPYfayIBdiI3J2qg5nUFwsUbkdpKsQifVPqC9ffsxWPneCkdS7wql5NCoU1iL+q
         eqhw==
X-Gm-Message-State: AC+VfDz8M3qTWE2hfLNQzaA3vwe8AqO0FXSZVrhHz/GyhFDsn17yjFCd
	clFpVGSSlpK/r+bSs5YahXBwmQ==
X-Google-Smtp-Source: ACHHUZ49RqRDuEpyHmdcdHEBROOkpHaQjVQTM1CuYDI9M7EujogAiu6ABXMnTGhKbQaA6p8Sza/JdQ==
X-Received: by 2002:adf:f490:0:b0:307:8691:1ea5 with SMTP id l16-20020adff490000000b0030786911ea5mr998841wro.26.1684331836430;
        Wed, 17 May 2023 06:57:16 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.230])
        by smtp.gmail.com with ESMTPSA id s5-20020adfdb05000000b00307a83ea722sm2867056wri.58.2023.05.17.06.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 06:57:15 -0700 (PDT)
Message-ID: <43e2069b-83fe-4fb1-ceb8-b55c3e30fbfd@linaro.org>
Date: Wed, 17 May 2023 14:57:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] jffs2: mark __jffs2_dbg_superblock_counts() static
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230517132725.938292-1-arnd@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230517132725.938292-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_065719_260172_76DBC474 
X-CRM114-Status: GOOD (  17.20  )
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



On 5/17/23 14:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This function is only called locally and does not need to be
> global. Since there is no external prototype, gcc warns about
> the non-static definition:
> 
> fs/jffs2/debug.c:160:6: error: no previous prototype for '__jffs2_dbg_superblock_counts' [-Werror=missing-prototypes]
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  fs/jffs2/debug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/jffs2/debug.c b/fs/jffs2/debug.c
> index 9d26b1b9fc01..0925caab23c4 100644
> --- a/fs/jffs2/debug.c
> +++ b/fs/jffs2/debug.c
> @@ -157,7 +157,7 @@ __jffs2_dbg_prewrite_paranoia_check(struct jffs2_sb_info *c,
>  	kfree(buf);
>  }
>  
> -void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
> +static void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
>  {
>  	struct jffs2_eraseblock *jeb;
>  	uint32_t free = 0, dirty = 0, used = 0, wasted = 0,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

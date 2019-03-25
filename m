Return-Path: <SRS0=pM9p=R4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5C6C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 17:57:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30EAD2087E
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 17:57:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WW9QoKmv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="D9c8wTs0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30EAD2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xz1hJCUY1hRZa+tHOPQkLmeFgYzjRZq1eAaBZybkTMU=; b=WW9QoKmvcs0Q8e
	AjVYMRzf1LBRcMjckbf+og+hRdgcAuIMjRVcL3ooIDIH+qW7gNKzUpJ3R3sUewvq3Lb3+QNo0oSka
	n28Qw9a/k7LVsqvhNlKpnfyxSzGI5ukLnegVnznqopkumKIFLqucQCtncdVjBzoqwntWKCFgYbHCp
	8wpwknQD1fJk8RGtice/klJl4ZWMP5IS9+5fYJvTIAdHllJBcCUZaVQI1rb8Cy8qwPOkI+9mZj9MJ
	P55Nrrd/8p97NIqlshKzXtJDu2aZsmFh0tkL3UoEvD882xoKgBjg4g3eBZsV7tx2ePc1ChRqJX14T
	LPAObSKmHC6hjrxwZVrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8Tqb-0006ZA-S9; Mon, 25 Mar 2019 17:57:21 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8TqV-0006Uu-Vz
 for linux-mtd@lists.infradead.org; Mon, 25 Mar 2019 17:57:18 +0000
Received: by mail-pf1-x444.google.com with SMTP id i19so6810778pfd.0
 for <linux-mtd@lists.infradead.org>; Mon, 25 Mar 2019 10:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x0H6tmkxza/8d0+N913JHZ3De4yw9yKeqvruKlu2rc4=;
 b=D9c8wTs0NkN7Uh8lWSEvsILq9RHew5bXj8s5S7P4xFoAEVAJph4XOii7koKyaN03i8
 deWHhDjYPVRem2gGURMZ4Ohsf8uM4V/U/UpNEB+4oujSICm/Yu9uSBz6zYpjqpq88aps
 cD7SPllYvd/Jqcqd0e0eGx0eoKh3AOqaK95m4iv0n/x/ImLIzC4k0BE7x9+W+jQYGaDC
 5Pkw7EfoSMGMfnnVei/F5Afk4POU8ucNH2QlzZoD+DTO0pgEXDTNILnRmkQmguEoqK+O
 ZNiPL/1e2LV2uHetTFT8HX5GxMyJBBBi+3I/EvxmmFCe3Es+fd2RuuWVFPctk/7DXEt3
 iwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x0H6tmkxza/8d0+N913JHZ3De4yw9yKeqvruKlu2rc4=;
 b=kxirvOsUn8oY7VDXgH3h8uvrH7tY7aPjHC20UhFONa9OoLnOK938hIB8rTslRmEt8P
 /Us3vJy0DF8BjIrXOPSpE86HGU8fS3XcpxvvvwW+bx3daHw60EpPETfhYZfBcsbykzmT
 hnSBeDrIgsyhWzcFKWvxJsb6OJcU+I9bA7K+L5+LleuYsVYzv4GPfhjOOweopXd8SAEf
 y++kAEBuwD6BGhnUJMWgyRxBbXcENKFlFjwgKVWKQ77sze7cgwcNFbORumwFSHMLw+uF
 GQUERY7k66RbVW/eObdYFyT7U5z6jle9mab5o+w1aihipT3OYuRDqvKmEPI2bqAaMxzO
 3f4Q==
X-Gm-Message-State: APjAAAWEiPmMB1KbIrr8ToadyUbzhvaPX4ipC0RAdLm2FWmFsLJOssML
 kKNO9cihngsyt17vv57lgIZgRHzz/x4Dl3qs9DF+5A==
X-Google-Smtp-Source: APXvYqzyuJ7+cZVdUhdxPd44AK/Lb7S1zjwyVJIgc78P3c9DApdnlx6RPs+bTeyQ6ch6HV72IUo+B3dO5vYPXABBB6E=
X-Received: by 2002:a63:84c7:: with SMTP id
 k190mr24506978pgd.255.1553536631433; 
 Mon, 25 Mar 2019 10:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190324194505.3244479-1-arnd@arndb.de>
In-Reply-To: <20190324194505.3244479-1-arnd@arndb.de>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 25 Mar 2019 10:57:00 -0700
Message-ID: <CAKwvOdmH+G6asuizkYJ-A6OTepQ6MXKzTmLYoWrCK8nhXxYahw@mail.gmail.com>
Subject: Re: [PATCH] ubifs: work around high stack usage with clang
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_105716_083727_5935FB8B 
X-CRM114-Status: GOOD (  23.34  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Eric Biggers <ebiggers@google.com>, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux@googlegroups.com, linux-mtd@lists.infradead.org,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Mar 24, 2019 at 12:45 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Building this file with clang can result in large stack usage as seen from
> this warning:
>
> fs/ubifs/auth.c:78:5: error: stack frame size of 1152 bytes in function 'ubifs_prepare_auth_node'
>
> The problem is that inlining ubifs_hash_calc_hmac() leads to
> two SHASH_DESC_ON_STACK() blocks in the same function, and clang
> for some reason does not reuse the stack space as it should.
>
> Putting the first declaration into a separate basic block avoids
> this problem and reduces the stack allocation to 640 bytes.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

LGTM; in general, it can be useful to always include a comment before
a new scope like:

/* New scope to limit lifetime of large stack allocated hash_desc. */

but folks can always refer to the git blame/log for reasoning as to
why a new scope was added.

I plan on working on a pass in LLVM to improve stack slot reuse
sometime in 2019Q2.  Thanks for this patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  fs/ubifs/auth.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
> index 5bf5fd08879e..5d3d0b37a908 100644
> --- a/fs/ubifs/auth.c
> +++ b/fs/ubifs/auth.c
> @@ -78,7 +78,6 @@ static int ubifs_hash_calc_hmac(const struct ubifs_info *c, const u8 *hash,
>  int ubifs_prepare_auth_node(struct ubifs_info *c, void *node,
>                              struct shash_desc *inhash)
>  {
> -       SHASH_DESC_ON_STACK(hash_desc, c->hash_tfm);
>         struct ubifs_auth_node *auth = node;
>         u8 *hash;
>         int err;
> @@ -87,13 +86,17 @@ int ubifs_prepare_auth_node(struct ubifs_info *c, void *node,
>         if (!hash)
>                 return -ENOMEM;
>
> -       hash_desc->tfm = c->hash_tfm;
> -       hash_desc->flags = CRYPTO_TFM_REQ_MAY_SLEEP;
> -       ubifs_shash_copy_state(c, inhash, hash_desc);
> +       {
> +               SHASH_DESC_ON_STACK(hash_desc, c->hash_tfm);
>
> -       err = crypto_shash_final(hash_desc, hash);
> -       if (err)
> -               goto out;
> +               hash_desc->tfm = c->hash_tfm;
> +               hash_desc->flags = CRYPTO_TFM_REQ_MAY_SLEEP;
> +               ubifs_shash_copy_state(c, inhash, hash_desc);
> +
> +               err = crypto_shash_final(hash_desc, hash);
> +               if (err)
> +                       goto out;
> +       }
>
>         err = ubifs_hash_calc_hmac(c, hash, auth->hmac);
>         if (err)
> --
> 2.20.0
>


-- 
Thanks,
~Nick Desaulniers

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

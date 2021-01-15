Return-Path: <SRS0=0bx7=GS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98AAC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jan 2021 18:39:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77544208A9
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jan 2021 18:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77544208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eqYEm3p+RRMdyCv7T5YSwuEHbhI9NWD+Z5MN6AYjooE=; b=m8xOv9R5qHMWH5L7MlezLZdYY
	Ku84+W1UvVpZ45Z/GO9SSlN2LujbjeqXoDdyCqObTxam6E6eaT7oIbZXaWM9dJfGSzeGzEjSTvBuz
	WMOWHYg+MUJ6zOXbh25KlNPl96HSeJFJBMon5FUBuXKcBAnydCuWCmuV3k1UDyqzd5I7T/NcdkjJt
	I5DjUcZ578kxoTSepGH0R744+BXdmU2tZ0txfor/ptWriGgwIC9I6Go4kQdv6tPBXiDdtXcUoMDmP
	HHtOt4f7HDcapOUZrxReR1CncWLhM/l8ilL4xXob5yHQXGoqcDQH86XgFnNBToXQj8GLCAfU4FD59
	F10wc9FCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0TzU-0004Vh-Sc; Fri, 15 Jan 2021 18:38:32 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0TzR-0004Ul-8s
 for linux-mtd@lists.infradead.org; Fri, 15 Jan 2021 18:38:30 +0000
Received: by mail-qk1-x731.google.com with SMTP id h4so12652656qkk.4
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jan 2021 10:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lpbx5IuXtyrVJCLCdm7CWpFGzxLbsst3nNSrDQhdHIs=;
 b=FinYw/4W+EFazsX3IViQ+0YbMzK1U7X95ughL7z8odtwPvAuWrnTVovnSbtPJxfJf0
 EzxFWoyVEBIIUvbYZdkF/LF2iNJfbQg+l+b1nejyUxvp5EXTpCPcdo+FVVLeO029T2zs
 tmYRaRBOEA21WO5fdfK4COrO/jFfFWSO5bzaAjCoJO/obgPDDXonH23GiST5JZngPA9d
 0rqE6Qts0LpwLpoYNvQqDGR/1h+ZH17qxPHESuiTOZrxFhxQuKjEKjcFtMCU4GPoKkTX
 KHKd0QQXw4KUnhB0LOwlcomeNxazLN86wtDyEmu62mbGLkWVkm0GY0Comd7eb5Do/Su1
 0Z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lpbx5IuXtyrVJCLCdm7CWpFGzxLbsst3nNSrDQhdHIs=;
 b=Pwf3WfUlhfKHX7YYzgWOq8llbGZ5Jbuv7sy8q0qOTpE28OLqvtBtFNbWwLyWgOuf/U
 2CuqX/0+Wocw5ker+HuJnkpR84lwg8uBvcUo5xlJEUhrNBwjWQxCg4E8tM3uFvItfewP
 FO1CHEUuYuK0H2JKiGT6DelKgU25t3oeVGIJ7fcIGMc3xFArloDV1mIqfwto7d/dmMt7
 frQczdJ5/+QuGR4lvu8x7Cgmin3GZsOZLOjGCko76RWIIeamBxtPPaUDVJXN3E1SSsOu
 svATJr/4SfYfkWazZh2QeNNbluaaM+P9FSWwiR5dq2+y2gtC7jsdwyPGFfSOEoYmnU07
 yQeg==
X-Gm-Message-State: AOAM530nmsVZzCCDAhx7mU31AjGjS9eH7CPnhARDpcdE6yaymIuYPYH1
 D5Xl2uyY4/QVQdjFLQ6tAdQ=
X-Google-Smtp-Source: ABdhPJyEaIYbbejrIsurOuz1H4ibfoHcwE+61DLn4g4+QdBFDKpIWpnOmjkLy6bOMu16CxJyCanMmA==
X-Received: by 2002:a37:74c5:: with SMTP id
 p188mr14103185qkc.263.1610735907129; 
 Fri, 15 Jan 2021 10:38:27 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id c62sm5404885qkf.34.2021.01.15.10.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:38:26 -0800 (PST)
Date: Fri, 15 Jan 2021 11:38:24 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] ubifs: replay: Fix high stack usage, again
Message-ID: <20210115183824.GA2641750@ubuntu-m3-large-x86>
References: <20210114213020.4108485-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210114213020.4108485-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_133829_385150_7D096666 
X-CRM114-Status: GOOD (  20.59  )
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
Cc: Wang Hai <wanghai38@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@google.com>,
 Richard Weinberger <richard@nod.at>, Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, linux-mtd@lists.infradead.org,
 Zhihao Cheng <chengzhihao1@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jan 14, 2021 at 10:30:11PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> An earlier commit moved out some functions to not be inlined by gcc, but
> after some other rework to remove one of those, clang started inlining
> the other one and ran into the same problem as gcc did before:
> 
> fs/ubifs/replay.c:1174:5: error: stack frame size of 1152 bytes in function 'ubifs_replay_journal' [-Werror,-Wframe-larger-than=]
> 
> Mark the function as noinline_for_stack to ensure it doesn't happen
> again.
> 
> Fixes: f80df3851246 ("ubifs: use crypto_shash_tfm_digest()")
> Fixes: eb66eff6636d ("ubifs: replay: Fix high stack usage")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  fs/ubifs/replay.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
> index 79801c9a5b87..0f8a6a16421b 100644
> --- a/fs/ubifs/replay.c
> +++ b/fs/ubifs/replay.c
> @@ -559,7 +559,9 @@ static int is_last_bud(struct ubifs_info *c, struct ubifs_bud *bud)
>  }
>  
>  /* authenticate_sleb_hash is split out for stack usage */
> -static int authenticate_sleb_hash(struct ubifs_info *c, struct shash_desc *log_hash, u8 *hash)
> +static int noinline_for_stack
> +authenticate_sleb_hash(struct ubifs_info *c,
> +		       struct shash_desc *log_hash, u8 *hash)
>  {
>  	SHASH_DESC_ON_STACK(hash_desc, c->hash_tfm);
>  
> -- 
> 2.29.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

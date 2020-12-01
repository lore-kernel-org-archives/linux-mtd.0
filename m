Return-Path: <SRS0=jbuo=FF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB94C64E7A
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 19:11:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6F4D20639
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 19:11:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E/LpJUUA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I5YX0/C5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6F4D20639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jmvwF/zoZevih3rbSTf7C/qIb/2w+LYoZX1d1NmqCrM=; b=E/LpJUUAd7dSQ/FBIgX+WcaZn
	ysnCNyYBM6LrtMDkmkmuVE2v0fTcJbQ5hx91y6S/SbMf/tiKXeD7Ex++6R3CKeFieH6zomElSATWc
	PgfwmLkT9Ud10+AQSbgQOO1BlkfCjKta1mr2fsFnOo/4gH9pEavmZdfDJjgJZ28WvmqDSjJPCICE5
	nKJHRt48MDc0jnCzSTN6eeL7NH48stWkSDNSetj+c5MzxXvvzuuPvfdSQhz97GZjxv8t3BFI3PwQ/
	z+jmoQexlZGDuQYLCcO+b81wZD+YYTBeQcJQUUSWuGfmCfk/BylnNFLe3aRcTu3p7T7E45A4vJA2k
	Ak+cp72yg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkB2o-0002Ny-QF; Tue, 01 Dec 2020 19:10:34 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkB2l-0002NH-MO
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2020 19:10:33 +0000
Received: by mail-pl1-x644.google.com with SMTP id 4so1682830plk.5
 for <linux-mtd@lists.infradead.org>; Tue, 01 Dec 2020 11:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H90UyAJzvmoPRUfMh6apfAgsUXazwUJB3aNHvcWIGHI=;
 b=I5YX0/C5nVbGAWieLr/8Ha6VtOsNkjWnnJ2Qd/Y9ewwbhhMcDtFL+5KhABvcX+In0o
 x7Xu2ydSilrJRpv0QQ8N/m0XoiMV6C4Q53/6aaxK+lQ1S2YGq5YNRaKjjq7HGffu86TL
 UhHkgFuFvIpcoYkdkwwdicoqg0Coi5RRsjjzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H90UyAJzvmoPRUfMh6apfAgsUXazwUJB3aNHvcWIGHI=;
 b=V2wv9alE28Z7M7LT3FyUa8yoQ9t3lmtL1A2wy+ZxIDGqbjoyHGnLZc6DMtb3tLPRFt
 tu2vorFcq/7Hhh/6JglDSOAENN1dIjpcQsP18DhYqt7d4SjLv5SdjE7S9GgF1iZsn4xA
 gKtfW+DO7us/4l18cgbOnA3qWh5p9N0FqmQo38JTgGdS5RfWK5fgu7IDXfG5jnLPvmcD
 EnclO+bQPyFEZrykn1Lf/HAojyWiSnpUCXDg3uyVxTmhPStJgtqz7OGiVXs2JOSYIM6q
 W0nzbrltQgf1MA3mpcwRb89GD8e9gxUz8OqZ2bjEcwj0quN9JzNocGSPP8vzd7BKU1b2
 ni0A==
X-Gm-Message-State: AOAM5332G6lol5580fP74iBjLo41oaX0/C35r2ONxa4DztkcicyR3LfK
 LyVMM1o/DoBpcA4dCPn8tNBqdXW4P92GJMr0
X-Google-Smtp-Source: ABdhPJx7x0iRMtUz5Ywwp5v5n5BadeJy9m8KDj6Zo4n0WVF4edJ+2HmN3yI/8gKoFC66PFpZIwuaCA==
X-Received: by 2002:a17:902:9a4c:b029:d6:1f21:8021 with SMTP id
 x12-20020a1709029a4cb02900d61f218021mr4154492plv.58.1606849829316; 
 Tue, 01 Dec 2020 11:10:29 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 184sm542646pfc.28.2020.12.01.11.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:10:28 -0800 (PST)
Date: Tue, 1 Dec 2020 11:10:27 -0800
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/9] pstore/blk: update the command line example
Message-ID: <202012011109.6D417FB4@keescook>
References: <20201016132047.3068029-1-hch@lst.de>
 <20201016132047.3068029-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016132047.3068029-3-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_141031_924257_CACFB97D 
X-CRM114-Status: GOOD (  19.33  )
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
Cc: Tony Luck <tony.luck@intel.com>, Anton Vorontsov <anton@enomsg.org>,
 linux-kernel@vger.kernel.org, WeiXiong Liao <liaoweixiong@allwinnertech.com>,
 linux-mtd@lists.infradead.org, Colin Cross <ccross@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 03:20:40PM +0200, Christoph Hellwig wrote:
> Use the human readable device name instead of the device number, and
> add the required best_effort parameter.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Yeah, best_effort is needed here. I think changing from major:minor to a
path is also fine.

Reviewed-by: Kees Cook <keescook@chromium.org>

> ---
>  Documentation/admin-guide/pstore-blk.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/pstore-blk.rst b/Documentation/admin-guide/pstore-blk.rst
> index 296d5027787ac2..d9ec8b0572d3b2 100644
> --- a/Documentation/admin-guide/pstore-blk.rst
> +++ b/Documentation/admin-guide/pstore-blk.rst
> @@ -35,7 +35,7 @@ module parameters have priority over Kconfig.
>  
>  Here is an example for module parameters::
>  
> -        pstore_blk.blkdev=179:7 pstore_blk.kmsg_size=64
> +        pstore_blk.blkdev=/dev/mmcblk0p7 pstore_blk.kmsg_size=64 best_effort=y
>  
>  The detail of each configurations may be of interest to you.
>  
> -- 
> 2.28.0
> 

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

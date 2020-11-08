Return-Path: <SRS0=+6Wf=EO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B795DC4741F
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2020 14:06:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 572DF206A4
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2020 14:06:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="euTU451v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7TuwEee"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 572DF206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5EfWxpT30C4y3gvRhxYrG8RFCfkC9uTSRQuxvtDRtlQ=; b=euTU451vHLllSTYIjYkvOQb+H
	8iAwaUkwT3RE+0O3SiNSIZoBRR4J2F2b4LdSq43ZFfwqKTiq6x7RJPLZoAzpHSh95a8nlV+vgEn4m
	5TJhQvNixzMSV2gFuwVeIifBWRmsM27XC7yqgAbbHt24HR4jHyJy7mb59cTjc7qUvbMuVyR759J3M
	GTalZ9NrHTmVnkega8EyP3Mj7Cc4gnNB5tmjt1m/T8I0iX0+bMBrejHT4FyM6+mUfnmSVlRExOfUO
	khvSdByvz5P02HziXU3TTK9A4BkLtrpfJ9DutFO+2M/la9K2OInck2KQQn7TMqwou19W766De/NpZ
	0qb1acE6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kblK1-0000f8-DC; Sun, 08 Nov 2020 14:05:33 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kblJu-0000dx-3r
 for linux-mtd@lists.infradead.org; Sun, 08 Nov 2020 14:05:26 +0000
Received: by mail-io1-xd42.google.com with SMTP id m9so7171718iox.10
 for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2020 06:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KUFtdshuJjHLJInS0RfMmTlPvtFm7H16bmcaUQkCkec=;
 b=T7TuwEeebt6M0GKPdkadzqDb4Um09bBRP5mLio9eay+qTEM8GgfH7XmVg3yJL68KeC
 SZvhikqIL+jKkNlfMl9qrvlLkiARf+yF7znfgr0IdzwY+pCoBs0Ks1n3wNHIle1gHwib
 tDlsIvf+KkckT7/x0XYHdTIQvSmlrJBee0mSCDFvC0LjvEsRsQUbm8uiU0C9/bmfwKxO
 6EXbclRxuBJCTJGpqG6NYW7wRYWwT6YDATqi9OwBW5BHqlLfDzBK7mR8mu0XU6OCtrgG
 eDR7zPlQjrpWzhLKQeOOzKz6OT07IwOu6AM+0Nl7qMybE9RW3GSR8xmAjH1SXYkElos0
 ctXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KUFtdshuJjHLJInS0RfMmTlPvtFm7H16bmcaUQkCkec=;
 b=jxD4zbs9BEDRHnFZGJDE9544enX0hOoQYsDi0fDiZyNYSQZgFS3UjOwhWJSKPodHJP
 WGdSfLdT5mgXURtRzFTPfthMa841LYmI89Y008qp/xMq3XQcCiQFnIaSutPYm1u8v16H
 I1E4rdNUOSZfnelfuGXSwwr3F9FGKjyFRGsWjnaDCnwn8xdJq9Q838iWIfM2Z8/idBCu
 amhhZrSlwqeS0HhvO3Wwa4yTkEsSdjEFzoJfMWTaYlcOgj6fynDIWHXOHtn5pLvRUnmZ
 r+Q/WXiusGyEdaOJlD/wZ8rs7MKiVR5TTI3MYvg6B2GKr5srQ7kXO9bvpJ2EandZLMgR
 t47g==
X-Gm-Message-State: AOAM531X2kcVfhAQtPH8V5ToLkUIiVhcAikkoOGM3XdsHy99L34VXnmZ
 ZZ+JgMmC9uwE+IBxEhuLfsvaD7vEgy3/7UK+vJY=
X-Google-Smtp-Source: ABdhPJx4Yt46fQSCRI7b56rvvngAMwdLf+/9Z/8fCsB8R1mzsbzssUCjFkmMGvYq/PiurVLrFWhOp/GFlx8PGmhgY1E=
X-Received: by 2002:a02:9981:: with SMTP id a1mr7976758jal.54.1604844322446;
 Sun, 08 Nov 2020 06:05:22 -0800 (PST)
MIME-Version: 1.0
References: <20201016132047.3068029-1-hch@lst.de>
 <20201016132047.3068029-3-hch@lst.de>
In-Reply-To: <20201016132047.3068029-3-hch@lst.de>
From: =?UTF-8?B?5buW5aiB6ZuE?= <gmpy.liaowx@gmail.com>
Date: Sun, 8 Nov 2020 22:05:11 +0800
Message-ID: <CAL3PxMpPGsyX4LWxdJ=NdHJTv=L9EDKM8AqEfkpqzFft0k7cpg@mail.gmail.com>
Subject: Re: [PATCH 2/9] pstore/blk: update the command line example
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_090526_170668_9F25ADB1 
X-CRM114-Status: GOOD (  17.14  )
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
Cc: Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>,
 Anton Vorontsov <anton@enomsg.org>, linux-kernel@vger.kernel.org,
 WeiXiong Liao <liaoweixiong@allwinnertech.com>, linux-mtd@lists.infradead.org,
 Colin Cross <ccross@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 9:28 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Use the human readable device name instead of the device number, and
> add the required best_effort parameter.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
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

Reviewed-by: WeiXiong Liao <gmpy.liaowx@gmail.com>


>  The detail of each configurations may be of interest to you.
>
> --
> 2.28.0
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

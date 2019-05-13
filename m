Return-Path: <SRS0=6cMw=TN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C52C04AAA
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2019 21:41:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02BF22085A
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2019 21:41:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KtjaRIuh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UosvtbuZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02BF22085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmoMDUmlaFpoVgSDv5uWsnQTRxkZkjRkGbi6KQ21gJ8=; b=KtjaRIuhW7ny1/
	onfE1RidN9Y1U5o1BBEcuFLw6/aNhSi1TSh7OPkXku7LoT4fAbjGWH/dPttzGPJrGXa8N/okmlu3k
	+FfJFTWi8c4MFEPO0msiqje09kvqjgNSh2+sQhSwGRKB5mYGGAKUWl4mxb3lzpdlTaGnGtHo/6W7l
	r2iZZpFtnitESAsdJShXUaXexLlz2n+7c+qu0uUXiyWbJHTcvhhRvz8mUtExX2uf+UIYFAucetpz9
	8xsNwyXm5k4buGQnDwXDGzjV1nidTD7fuaeWbCoHV04Uq3fsH773ThSPYXhVYtfTQ4P58/oQCMsWJ
	/jd6Cs33CtdKnRSjrDNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQIh8-0004JO-A3; Mon, 13 May 2019 21:41:14 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQIh6-0004J5-46
 for linux-mtd@lists.infradead.org; Mon, 13 May 2019 21:41:13 +0000
Received: by mail-wm1-x342.google.com with SMTP id h11so742723wmb.5
 for <linux-mtd@lists.infradead.org>; Mon, 13 May 2019 14:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ml5e5SvV7EOXRrwnyGezErXhiPZR2O3UcJlBIK9a7mo=;
 b=UosvtbuZOLfQWGbKAQSLNFzjqFu3HvMBi5n+MqvZEiZslVZprGN96XE7HylDEqUC3r
 zoypEsCeENepF6lXHlmeXeZjlgQW4x0nXWC9YSFOuVB0jU1Zyw6D63GOiOogO0TOjqtz
 2MQ8cls6nIG+Qs/TsdmbKKaOTp0IaYsGZYQPx1M60qG4eyUJN1Bg4nAChBB0qrhv7wsw
 EQhm9P4A6fGQ0Xrb4+FFDjWuCM6u7RB6RYEjPyHBHk6sRDf3uFEugFKqGIFenMV9GKRS
 D/I1WM9P3h7Pq62/A+StGZuE06uqmrNlh0fY6CQLdV5DQlf/P11WFdTHFCqybRqPOaOw
 386g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ml5e5SvV7EOXRrwnyGezErXhiPZR2O3UcJlBIK9a7mo=;
 b=VC03cVtSzFPD7pG4v70GgEUsdKiDdltgoCpLQVpdO2TEmtTCcRnRXHt3tyhQP4jDyt
 t31GmT7+LYQG83fcWk2vJjQrHXQwUZdpkLi1HtFZgP8wG0dBoyLhUCWx3G8iM/6ZZDwD
 uyoUCn8JrzQh1KL+IgzBLJprnH8syqgh8R7esRA8ODJTj7ExQVBRg05j1V0XtAn74cZ1
 yBVoEjYRWKQyWbsp5N/IJcmSZym+XXgpJ0aU30qTTXW1QgHUAVpF052b5zqQWtVlksgS
 JfVwrm0K6oh67ZboA9YDoZqjGfVmV3koRDjg1qgze4ChdO1+kYfKaBCTSGHUhYiAOgbY
 VMqQ==
X-Gm-Message-State: APjAAAUrZdSwfbK6Xc0DsecxIQA9FzCn0+fQk7b81XsdCvTm8gHEn4E4
 XyNPsjBFJEvRZjdElWRGd0DCQWowV1cyjA7CflQ=
X-Google-Smtp-Source: APXvYqzni/E4Dhvw7yCFu+XIF07MLzzgBIFhXwcHPfbgbZQhGJijxeMMpKzr+DBWZG8wOsVvfiuS0fKSfYBvgleclrc=
X-Received: by 2002:a7b:c4d1:: with SMTP id g17mr8053477wmk.103.1557783670098; 
 Mon, 13 May 2019 14:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190510032144.15060-1-yuehaibing@huawei.com>
In-Reply-To: <20190510032144.15060-1-yuehaibing@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 13 May 2019 23:40:58 +0200
Message-ID: <CAFLxGvz4awNWpnb_hFxwpYy4X_w6Z6+aLqUZ5Zxu6fJKXsbJ9A@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Fix build error without CONFIG_UBIFS_FS_XATTR
To: YueHaibing <yuehaibing@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_144112_190107_1D39840D 
X-CRM114-Status: GOOD (  15.79  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, May 10, 2019 at 5:22 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fix gcc build error while CONFIG_UBIFS_FS_XATTR
> is not set
>
> fs/ubifs/dir.o: In function `ubifs_unlink':
> dir.c:(.text+0x260): undefined reference to `ubifs_purge_xattrs'
> fs/ubifs/dir.o: In function `do_rename':
> dir.c:(.text+0x1edc): undefined reference to `ubifs_purge_xattrs'
> fs/ubifs/dir.o: In function `ubifs_rmdir':
> dir.c:(.text+0x2638): undefined reference to `ubifs_purge_xattrs'
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 9ca2d7326444 ("ubifs: Limit number of xattrs per inode")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  fs/ubifs/ubifs.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index 379b9f7..fd7f399 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -2015,13 +2015,17 @@ int ubifs_xattr_set(struct inode *host, const char *name, const void *value,
>                     size_t size, int flags, bool check_lock);
>  ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
>                         size_t size);
> -int ubifs_purge_xattrs(struct inode *host);
>
>  #ifdef CONFIG_UBIFS_FS_XATTR
>  void ubifs_evict_xattr_inode(struct ubifs_info *c, ino_t xattr_inum);
> +int ubifs_purge_xattrs(struct inode *host);
>  #else
>  static inline void ubifs_evict_xattr_inode(struct ubifs_info *c,
>                                            ino_t xattr_inum) { }
> +static inline int ubifs_purge_xattrs(struct inode *host)
> +{
> +       return 0;
> +}
>  #endif
>
>  #ifdef CONFIG_UBIFS_FS_SECURITY
> --

Applied.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <SRS0=5Vwq=RS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9CDC43381
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 21:08:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BC2E21871
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 21:08:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pq+n+uoO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bS08G7LC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BC2E21871
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ly/E/ko9/nzSiuO5BUFkWDmcTrOMWA/1jcH25UeUkDo=; b=Pq+n+uoO7CBqZM
	P3caO0JtcPxTUgX7S5uIXm4PJv0EweqW8yk5P/61/ecBPr5Pbhq+XrdtKwKYb17x7ETJTZxJNfDaF
	ws4DFk/vMfybCPE8mTG/IKnLsk5/aUjLnznj3ZWuRXyPNMbik7S2lc4jY0KDdrWlH0TJPk5CqxHMV
	jHUzwUQp7FzZFmoySeYRMtMMS+2LB/6Uq484hmaBBY2ajQtJu9n2rqff+EaoAiub0AJt1+K5BeXDL
	OP8nepxlc+6ofgw6UnZkPp1EjISdq0tW85iI6rC2Gpye5PBdt2oWrYfqboQby5eMnkfsoSegYzzrB
	DlcE72gUr1UZeznlC7gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4u3s-0002LY-P6; Fri, 15 Mar 2019 21:08:16 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4u3q-0002LF-UN
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2019 21:08:16 +0000
Received: by mail-wr1-x441.google.com with SMTP id w1so5024288wrp.2
 for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2019 14:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JYzXGeNMT46lzQGbn//Hkpzt4Mh3r5101o8nxFCb8DY=;
 b=bS08G7LCt+65xU0qP4SfSKhRb6zF6EMmasryeP8ZPb968ejfT6xT7ctvBcdNMS7F+8
 bujFYsOlxkyO+jlbsXor64gaxKofgw/RfAwssvb+uTkxiD7TlITByRrOWQ4i3w8GZN5k
 RfG+FoO3uM814Hp0hM4RKOeyK0AbCb+wWAwaqkefv/cre7aU4ECfK5Xh0svG8t5BnT1U
 /JF2ObZxbQ4LeNF936z5JAGAfjuFjxLTx1gy8JY19RliIcH0WBUXR2Diexq69bS+9U9N
 UsEMfhzrRgfb1h1TC53z08jHnCa5+8B7r9Qgoa2/0E9b2JXB5h9nVLuCtkHZziczrwKb
 9XLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JYzXGeNMT46lzQGbn//Hkpzt4Mh3r5101o8nxFCb8DY=;
 b=t3M8LJZNNPI2Qu49IrDWkO9eT+WnaVXxKS+VhXEgVN88Lr17qOmQhxozi0/HOHlUjO
 RG39ylr9pysbqrpTNF0b7yb89Y1rpACMOoY+Y8EmnUsEqzcEk/wEuyyNsLmFvtPDb7s7
 +EwBQ+IDkREUndZYFqMknEwL2vNdFx1qBFUHp4A36qqESCW75uFyec00jT6BJw6OskmS
 zD45wX1CeKY2FiD/YwLmqYyL6N5Ev7SCGW4bTb07Htucd5qsgz7nagP3dcwE5sqdMxPv
 bQiwCAWdZc0poPpZJrFMLSz0+xj0MWpNP93rbjN67YnSXV+phi0BZGaCrWu+W4yg3ui4
 4Srg==
X-Gm-Message-State: APjAAAUtkvoMsj9Mwfz/EfWzF8B9FFetTzb6+YxlUQSHyZXSCm7x8mHm
 /w5/HXa8N5TnK0lriTOlN/RfdwZYLc5FUXx/92M=
X-Google-Smtp-Source: APXvYqyaXsvsW4AtW4/5I98VpR3yfYSPnk4jjm2J8YSIHgbysQW+6D29cHFVfZopNqJJ3zgxYDn1ALHAx20omIQYA4E=
X-Received: by 2002:adf:ec49:: with SMTP id w9mr3647976wrn.296.1552684093255; 
 Fri, 15 Mar 2019 14:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190315205503.195400-1-ebiggers@kernel.org>
In-Reply-To: <20190315205503.195400-1-ebiggers@kernel.org>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 15 Mar 2019 22:08:02 +0100
Message-ID: <CAFLxGvx3M61E1+Ts38BYRYu93QzmH=XMWoYYrFHTqWXUM7zREg@mail.gmail.com>
Subject: Re: [PATCH] ubifs: remove unnecessary #ifdef around
 fscrypt_ioctl_get_policy()
To: Eric Biggers <ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_140814_977935_C0A14D0C 
X-CRM114-Status: GOOD (  13.59  )
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
Cc: linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Mar 15, 2019 at 9:55 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> When !CONFIG_FS_ENCRYPTION, fscrypt_ioctl_get_policy() is already
> stubbed out to return -EOPNOTSUPP, so the extra #ifdef is not needed.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/ubifs/ioctl.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
> index 82e4e6a30b04..cd1d4212fc45 100644
> --- a/fs/ubifs/ioctl.c
> +++ b/fs/ubifs/ioctl.c
> @@ -205,13 +205,8 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>                 return -EOPNOTSUPP;
>  #endif
>         }
> -       case FS_IOC_GET_ENCRYPTION_POLICY: {
> -#ifdef CONFIG_FS_ENCRYPTION
> +       case FS_IOC_GET_ENCRYPTION_POLICY:
>                 return fscrypt_ioctl_get_policy(file, (void __user *)arg);
> -#else
> -               return -EOPNOTSUPP;
> -#endif
> -       }
>
>         default:
>                 return -ENOTTY;

Thanks for that one too. :-)

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

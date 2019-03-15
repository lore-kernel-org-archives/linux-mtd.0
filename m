Return-Path: <SRS0=5Vwq=RS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A20C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 21:06:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2A0F21871
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 21:06:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CZXDdH75";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cv8xKk+r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2A0F21871
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4v30CoYNMTl7FNemjfoiAyu5X3gbClaxh5UWC6F3fJ4=; b=CZXDdH75Z/9mPm
	nrOplRemGd3x0ttoFMOA4gXKPwQGQ9nF7NEkZo9CACWjCXDVICpDmYPQXZcxfbtuTTKr8RzvhygbG
	zxoqA5royR9eDiVc/M61wUQ9c4utNLwsr7/j/RXgN11RTED6M/+wEI4hmaccHMHw9owflv6LjMrto
	/JGptUIEt3lewIAbD/fvYnFDTAlFBP8Y74P7cNiU2Y/gWiTVGJwiuiAL8eUnstoqBAZYwyjLqooBf
	2b037YOhCFV15Ryrze7pAAwHMpI2/UK+HcHlfXYTUt0F/n59BRvoH3GhLUkw1js0FhjMmgXPja6ma
	WY5WRtF/GiWTEQrSmhhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4u1z-0001ke-Pn; Fri, 15 Mar 2019 21:06:19 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4u1w-0001js-J7
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2019 21:06:18 +0000
Received: by mail-wr1-x444.google.com with SMTP id h99so10953239wrh.12
 for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2019 14:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D2QsTti/mEqoYSjUnixrxsRalJHQzBj7c+PLMTC8TsE=;
 b=cv8xKk+rm3P1/oBm3foV/3WJr/uEdhHbKlYxadY/9MdjHIpc6ly+gHLAUAde0RxOyR
 r2zT1nrnQYRT8cictnlejkpbTVz7WmFlSf+Zy85ObWF1nRf0oe0jhhwJdIiKe8J2nbTS
 mIOv2C9WxDJg57shbkHEk9fZXpmJ2eX3ACzB99qT/T7leS8AqWayJpn7yNteWjYtISmW
 e+BVEmynD97JSydbBTcCl7WgO4Gtl0NXgK8pUuX0NSAG/MvbakXgYWjQCN4pVfUTvL8U
 n8OrRjEKG1sxR+oLbkCSYn7G5/ji6LHnDiVErdB2BadS5m9P1S+MfW+Ynaf7QYqwN1Rv
 2AgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D2QsTti/mEqoYSjUnixrxsRalJHQzBj7c+PLMTC8TsE=;
 b=Wd5xY7us3i9VKbOETVr2qEr0A8dSzxclykDikPEXFziUY4sBiTMRhFKFmZYkxn2ZsG
 pd5JHGUV/gajOYMMcStxflHOpY+Zq/s9CMe+8q7sPvrxh/FefG7RAxYfZXKrpi+dHG4H
 zk4TSQPyWueU/8TKlALNDZNnE8VRCAftgYsRkVvuqJlnXoeus8uA7H1AlMZbNQSJMMfs
 i980fA0kNjjltI9e7mOb+rW49HDBM6LfyGQ22JN0b1wBBiVXkrhWQX1aPBd4pMindkcj
 eIv0Y57PiFIW1jpcY+0m6mtD14IBGbGROmJ0TuMpGl4UbIFSm6c2oTMnw/8XilUP6zgq
 CzBQ==
X-Gm-Message-State: APjAAAV8GHKk1NWfBgJsAWQ66zpwNKNSk4hB/bR5UBE6QSh9X1Z16p7n
 bIO94Xz/JjT6xSsieQN2I8ITI7pJZK77mHw6S1Q=
X-Google-Smtp-Source: APXvYqwIvYm/5rf7mXWVShF9K3kA4/kvi1vBDsVfKxxqhuWSK6m54yCCB3qSdnkqspyc3K2ixFwCz2cqSOFA1vZCqmg=
X-Received: by 2002:a5d:4f82:: with SMTP id d2mr3924913wru.262.1552683971329; 
 Fri, 15 Mar 2019 14:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190315205432.195263-1-ebiggers@kernel.org>
In-Reply-To: <20190315205432.195263-1-ebiggers@kernel.org>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 15 Mar 2019 22:05:59 +0100
Message-ID: <CAFLxGvw1ETyuLf0yV_MqGyTKmUkxLu0vvZLh2QfLgvYExTosWQ@mail.gmail.com>
Subject: Re: [PATCH] ubifs: remove unnecessary calls to set up directory key
To: Eric Biggers <ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_140616_686661_11DEF0EA 
X-CRM114-Status: GOOD (  14.48  )
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
> In ubifs_unlink() and ubifs_rmdir(), remove the call to
> fscrypt_get_encryption_info() that precedes fscrypt_setup_filename().
> This call was unnecessary, because fscrypt_setup_filename() already
> tries to set up the directory's encryption key.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/ubifs/dir.c | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index 5767b373a8ff..c3311ea68fe5 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -792,12 +792,6 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
>                 dentry, inode->i_ino,
>                 inode->i_nlink, dir->i_ino);
>
> -       if (ubifs_crypt_is_encrypted(dir)) {
> -               err = fscrypt_get_encryption_info(dir);
> -               if (err && err != -ENOKEY)
> -                       return err;
> -       }
> -
>         err = fscrypt_setup_filename(dir, &dentry->d_name, 1, &nm);
>         if (err)
>                 return err;
> @@ -902,12 +896,6 @@ static int ubifs_rmdir(struct inode *dir, struct dentry *dentry)
>         if (err)
>                 return err;
>
> -       if (ubifs_crypt_is_encrypted(dir)) {
> -               err = fscrypt_get_encryption_info(dir);
> -               if (err && err != -ENOKEY)
> -                       return err;
> -       }
> -
>         err = fscrypt_setup_filename(dir, &dentry->d_name, 1, &nm);
>         if (err)
>                 return err;

Thanks for the cleanup, Eric!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

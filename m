Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732FAC10F0E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 19:29:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 425FB20693
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 19:29:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r6gu2ogO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSAv+E/O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 425FB20693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4a9nkYZo6010lhUgnSTSS38ZXuabhA89LXMwHWxsbgY=; b=r6gu2ogOjHGAX5
	XAgU0EUkXQstBqKCmUU16rnUSh9QslrdfTWZ/FERXq5fvXuy5AtEoRiyQmYLinFpnP12Yr+ywRwm0
	mpnFbq0nOJtSA/ZlFG0WdCbA6SIWQmiBzhPyz5rY3cfh+9ggdixhBlWhomLt4MG9H1wpUk7I5fblB
	ieVVQsYxuaUZ7iuSOkfxQm2RbE2KpVz9E1SjYgH9xW7H5DuOonyw7ZDM2bn3NRUBVBJ3rXhsuPF1G
	FiGhz+PElXTvtXjP0VUR6VKdxalfZEobcssdlbP696uB76l9HtHHc+hoUX+ZeyA3LiFqhWM2/ruye
	+RjPhCiAY5MkiDinHN0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHCj2-0000Uc-R3; Thu, 18 Apr 2019 19:29:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHCj0-0000UB-AO
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 19:29:35 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8556220693;
 Thu, 18 Apr 2019 19:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555615773;
 bh=vKFb9yaEK6/wWVD2WwuaQMUhq2f+Aheqcm5vAC7PerM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oSAv+E/O924vF/tIceQnWPGXOiwr058pCGckZ4QYBHk31wErFvjSMi5AP0SPTTv4m
 xIjIex3FOAnKX4PLRLSQ8A1wY6kXUvycZJFo1fNWl1N82OqgPuUUgF6F7m4g8IgFZc
 3tKrgkCo3gWldcuXP4zW7KDkTuvuP1YakDR2afDg=
Date: Thu, 18 Apr 2019 12:29:32 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH] ubifs: remove unnecessary calls to set up directory key
Message-ID: <20190418192930.GA20640@gmail.com>
References: <20190315205432.195263-1-ebiggers@kernel.org>
 <CAFLxGvw1ETyuLf0yV_MqGyTKmUkxLu0vvZLh2QfLgvYExTosWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFLxGvw1ETyuLf0yV_MqGyTKmUkxLu0vvZLh2QfLgvYExTosWQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_122934_381345_A43F9F66 
X-CRM114-Status: GOOD (  17.72  )
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

On Fri, Mar 15, 2019 at 10:05:59PM +0100, Richard Weinberger wrote:
> On Fri, Mar 15, 2019 at 9:55 PM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > From: Eric Biggers <ebiggers@google.com>
> >
> > In ubifs_unlink() and ubifs_rmdir(), remove the call to
> > fscrypt_get_encryption_info() that precedes fscrypt_setup_filename().
> > This call was unnecessary, because fscrypt_setup_filename() already
> > tries to set up the directory's encryption key.
> >
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >  fs/ubifs/dir.c | 12 ------------
> >  1 file changed, 12 deletions(-)
> >
> > diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> > index 5767b373a8ff..c3311ea68fe5 100644
> > --- a/fs/ubifs/dir.c
> > +++ b/fs/ubifs/dir.c
> > @@ -792,12 +792,6 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
> >                 dentry, inode->i_ino,
> >                 inode->i_nlink, dir->i_ino);
> >
> > -       if (ubifs_crypt_is_encrypted(dir)) {
> > -               err = fscrypt_get_encryption_info(dir);
> > -               if (err && err != -ENOKEY)
> > -                       return err;
> > -       }
> > -
> >         err = fscrypt_setup_filename(dir, &dentry->d_name, 1, &nm);
> >         if (err)
> >                 return err;
> > @@ -902,12 +896,6 @@ static int ubifs_rmdir(struct inode *dir, struct dentry *dentry)
> >         if (err)
> >                 return err;
> >
> > -       if (ubifs_crypt_is_encrypted(dir)) {
> > -               err = fscrypt_get_encryption_info(dir);
> > -               if (err && err != -ENOKEY)
> > -                       return err;
> > -       }
> > -
> >         err = fscrypt_setup_filename(dir, &dentry->d_name, 1, &nm);
> >         if (err)
> >                 return err;
> 
> Thanks for the cleanup, Eric!
> 
> -- 
> Thanks,
> //richard

Richard, can you take this through the ubifs tree for 5.2?

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

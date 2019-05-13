Return-Path: <SRS0=6cMw=TN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5FAC04AA7
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2019 19:57:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72144208C3
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2019 19:57:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tWBS60jo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="poPdEHBr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72144208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41bnY+SqXwQsHYlgI0WrBMMqcSzT8Cq23cKYOjxKF2Y=; b=tWBS60jow35U24
	EsNERBYncISPH9lcQcSZGasNw10255jO76HksygRzJNd213AfTbNnDA3Y/Uk5BMNmetMMjcXjlLyK
	UyrFuCkK+Mt73Lppum6UGezdCTKmEZxJAj/EyqxHg0XXCVl6yaQJO9vspG68AGCqCFrDBr9gRPsd4
	g30kJvd275EDt1AgW8x7RRTsOVn7yI1+x+WeJvIdghVvgAIFt3W1yuI2SQCLYGLxJGEAfOyKb7tU0
	79rsQwzMnA3W90IBRVW1QfDt8aKjNF8vWXBf0MUUI/tWnPwu6hTq9wSo1Izynzye74gLSV38aYgej
	ALE73rQrnmw9gIyK9cDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQH4E-0007ra-MR; Mon, 13 May 2019 19:56:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQH4B-0007rH-MH
 for linux-mtd@lists.infradead.org; Mon, 13 May 2019 19:56:57 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97820208C3;
 Mon, 13 May 2019 19:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557777414;
 bh=H/CvBCQg09lqqJZk0o1uuzjbgPqRVU7YsyNxmQ//uKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=poPdEHBr8h8uMe+khz3FYPyc+6HX4i3FGRXcwJkWW0s4xdgiLkvBeI27pgQQEvvR1
 /hNCpiDpG8sNusieY3szYv2k0eEeb4viOuObmWyzM2bGJl0tS6CFZ8/MIUP/LZhaQ+
 Qpuh9oK58WZ+P+xpmTuu2EfTnIKZdzXksXiQ2Xv8=
Date: Mon, 13 May 2019 12:56:53 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/2] ubifs: Remove #ifdef around CONFIG_FS_ENCRYPTION
Message-ID: <20190513195652.GB142816@gmail.com>
References: <20190326075232.11717-1-s.hauer@pengutronix.de>
 <20190326075232.11717-2-s.hauer@pengutronix.de>
 <20190508031954.GA26575@sol.localdomain>
 <1170873772.48849.1557298158182.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1170873772.48849.1557298158182.JavaMail.zimbra@nod.at>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_125655_760355_D53B4E66 
X-CRM114-Status: GOOD (  18.45  )
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
Cc: tytso <tytso@mit.edu>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>, linux-fscrypt@vger.kernel.org,
 kernel <kernel@pengutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 08, 2019 at 08:49:18AM +0200, Richard Weinberger wrote:
> Eric,
> =

> ----- Urspr=FCngliche Mail -----
> > Von: "Eric Biggers" <ebiggers@kernel.org>
> > An: "Sascha Hauer" <s.hauer@pengutronix.de>, "richard" <richard@nod.at>
> > CC: "linux-mtd" <linux-mtd@lists.infradead.org>, linux-fscrypt@vger.ker=
nel.org, "tytso" <tytso@mit.edu>, "kernel"
> > <kernel@pengutronix.de>
> > Gesendet: Mittwoch, 8. Mai 2019 05:19:55
> > Betreff: Re: [PATCH 1/2] ubifs: Remove #ifdef around CONFIG_FS_ENCRYPTI=
ON
> =

> > On Tue, Mar 26, 2019 at 08:52:31AM +0100, Sascha Hauer wrote:
> >> ifdefs reduce readablity and compile coverage. This removes the ifdefs
> >> around CONFIG_FS_ENCRYPTION by using IS_ENABLED and relying on static
> >> inline wrappers. A new static inline wrapper for setting sb->s_cop is
> >> introduced to allow filesystems to unconditionally compile in their
> >> s_cop operations.
> >> =

> >> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> >> ---
> >>  fs/ubifs/ioctl.c        | 11 +----------
> >>  fs/ubifs/sb.c           |  7 ++++---
> >>  fs/ubifs/super.c        |  4 +---
> >>  include/linux/fscrypt.h | 11 +++++++++++
> >>  4 files changed, 17 insertions(+), 16 deletions(-)
> >> =

> >> diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
> >> index 82e4e6a30b04..6b05b3ec500e 100644
> >> --- a/fs/ubifs/ioctl.c
> >> +++ b/fs/ubifs/ioctl.c
> >> @@ -193,7 +193,6 @@ long ubifs_ioctl(struct file *file, unsigned int c=
md,
> >> unsigned long arg)
> >>  		return err;
> >>  	}
> >>  	case FS_IOC_SET_ENCRYPTION_POLICY: {
> >> -#ifdef CONFIG_FS_ENCRYPTION
> >>  		struct ubifs_info *c =3D inode->i_sb->s_fs_info;
> >>  =

> >>  		err =3D ubifs_enable_encryption(c);
> >> @@ -201,17 +200,9 @@ long ubifs_ioctl(struct file *file, unsigned int =
cmd,
> >> unsigned long arg)
> >>  			return err;
> >>  =

> >>  		return fscrypt_ioctl_set_policy(file, (const void __user *)arg);
> >> -#else
> >> -		return -EOPNOTSUPP;
> >> -#endif
> >>  	}
> >> -	case FS_IOC_GET_ENCRYPTION_POLICY: {
> >> -#ifdef CONFIG_FS_ENCRYPTION
> >> +	case FS_IOC_GET_ENCRYPTION_POLICY:
> >>  		return fscrypt_ioctl_get_policy(file, (void __user *)arg);
> >> -#else
> >> -		return -EOPNOTSUPP;
> >> -#endif
> >> -	}
> >>  =

> >>  	default:
> >>  		return -ENOTTY;
> >> diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
> >> index 67fac1e8adfb..2afc8b1d4c3b 100644
> >> --- a/fs/ubifs/sb.c
> >> +++ b/fs/ubifs/sb.c
> >> @@ -748,14 +748,12 @@ int ubifs_read_superblock(struct ubifs_info *c)
> >>  		goto out;
> >>  	}
> >>  =

> >> -#ifndef CONFIG_FS_ENCRYPTION
> >> -	if (c->encrypted) {
> >> +	if (!IS_ENABLED(CONFIG_UBIFS_FS_ENCRYPTION) && c->encrypted) {
> >>  		ubifs_err(c, "file system contains encrypted files but UBIFS"
> >>  			     " was built without crypto support.");
> >>  		err =3D -EINVAL;
> >>  		goto out;
> >>  	}
> > =

> > A bit late, but I noticed this in ubifs/linux-next.  This needs to use
> > CONFIG_FS_ENCRYPTION here, not CONFIG_UBIFS_FS_ENCRYPTION, as the latte=
r no
> > longer exists.
> =

> Thanks for spotting. I'll fit it myself in -next.
> =

> Thanks,
> //richard

This was merged to mainline and it's still broken.  This breaks UBIFS encry=
ption
entirely, BTW.  Do you not run xfstests before sending pull requests?

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

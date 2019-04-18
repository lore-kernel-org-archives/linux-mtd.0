Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999C3C10F0E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 19:30:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A702206B6
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 19:30:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NQ+XgBOu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DwdWjh34"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A702206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzoBAULWvLoowEsIi5tPVKYl15lm7Pj94wj1jryMqQ4=; b=NQ+XgBOuWcTeS6
	IYMt7SFB8gOuGO9HxDVQYgc3Ggja3QH0PXgFwFLIVnX8obUket92VUPaC6amtN+L35omjTKatirQg
	KyRFgi+3kJDPdR1I5zYlBsRh0+6NVLmVH621s5qcC7hEQ+jm52nxe/Yy3agaMs2ZKNreH9aoClO5q
	izLcWMKT8m0zlDzKsFp+PeGQSIy3ZOGpnEMt8ekbJhr4WwJq5ej0gabYFkiCnFh9Dy7OlsvQW/V2r
	bMF5jHt+79K6zi8MDbEawk1GSnsGFlRnapN15xXkMr4NVF6R/XY8Kpv0W3F6ScI7NCvJJS9JwXYf+
	Zc6PqF4y5AcixMhr5cxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHCjO-0000jD-MH; Thu, 18 Apr 2019 19:29:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHCjL-0000ic-Ok
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 19:29:57 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 57E78206B6;
 Thu, 18 Apr 2019 19:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555615795;
 bh=3wb3l6bjQamDQp7+DSvIUYtgtEjnsNKMNSUS4Jqa0cc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DwdWjh34F91x07UIXz4HYD/osTwoKvDLl4r22b1kr3u74Wu1LeELGG6oip9RPy9oL
 J6xiAaCuipWce5Y5vKjB1KCx7zI5V8/G/zZR1VBFeDQGPx/Vn0palsTyFjY8DYTysK
 ozX1rKda5f2ep6Ww7Nd8AediPOkU4isenJCh6++M=
Date: Thu, 18 Apr 2019 12:29:53 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH] ubifs: remove unnecessary #ifdef around
 fscrypt_ioctl_get_policy()
Message-ID: <20190418192953.GB20640@gmail.com>
References: <20190315205503.195400-1-ebiggers@kernel.org>
 <CAFLxGvx3M61E1+Ts38BYRYu93QzmH=XMWoYYrFHTqWXUM7zREg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFLxGvx3M61E1+Ts38BYRYu93QzmH=XMWoYYrFHTqWXUM7zREg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_122955_816804_D7063A69 
X-CRM114-Status: GOOD (  17.11  )
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

On Fri, Mar 15, 2019 at 10:08:02PM +0100, Richard Weinberger wrote:
> On Fri, Mar 15, 2019 at 9:55 PM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > From: Eric Biggers <ebiggers@google.com>
> >
> > When !CONFIG_FS_ENCRYPTION, fscrypt_ioctl_get_policy() is already
> > stubbed out to return -EOPNOTSUPP, so the extra #ifdef is not needed.
> >
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >  fs/ubifs/ioctl.c | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> >
> > diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
> > index 82e4e6a30b04..cd1d4212fc45 100644
> > --- a/fs/ubifs/ioctl.c
> > +++ b/fs/ubifs/ioctl.c
> > @@ -205,13 +205,8 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> >                 return -EOPNOTSUPP;
> >  #endif
> >         }
> > -       case FS_IOC_GET_ENCRYPTION_POLICY: {
> > -#ifdef CONFIG_FS_ENCRYPTION
> > +       case FS_IOC_GET_ENCRYPTION_POLICY:
> >                 return fscrypt_ioctl_get_policy(file, (void __user *)arg);
> > -#else
> > -               return -EOPNOTSUPP;
> > -#endif
> > -       }
> >
> >         default:
> >                 return -ENOTTY;
> 
> Thanks for that one too. :-)
> 
> -- 
> Thanks,
> //richard

Richard, can you take this through the ubifs tree for 5.2?

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

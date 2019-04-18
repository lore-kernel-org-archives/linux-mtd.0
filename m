Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C71DC10F0E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 19:31:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4A71206B6
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 19:31:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n3vCPvbu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4A71206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgg1pYBhsNPAQo7DVBfQuJGZks12uO/Qn6TF9stdc1k=; b=n3vCPvbulHhH+V
	zxBzTyW32OrITzGTMtAhvxybx2IoMNivddSl9lS19r9pVzWgTJc94aqWtRqhBrZBF4Kuj+tP1eWkk
	z7xS0IULXcvpsAqA1OyOC+XLYd9yEdn4kqtgQumJaSw50D2aVLda2IhTg+tqAolhx0MqVW96UFfhW
	XvruHElJMwUxrKU4rAconn7jioOAXeLaW4fVjQfvlCKg3yX/pDXQQ/d7xkGtLbxK6KU5H5ugCoeYf
	NiLRtCGzM6PPPTpzE8vXPmGqBaRwpzsorjI1Zw93sAHj/lcrFICCFKhn3K8mGxtvMA1mAo4BDuwwR
	DS8v05yLSpbXqaDKog3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHCkz-0002BO-2t; Thu, 18 Apr 2019 19:31:37 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHCkv-0002B1-OV
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 19:31:35 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B466F6074CF1;
 Thu, 18 Apr 2019 21:31:23 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 7I8r91hMcP6H; Thu, 18 Apr 2019 21:31:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 793EF6074CF0;
 Thu, 18 Apr 2019 21:31:23 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id T3BIQ9IHCCYP; Thu, 18 Apr 2019 21:31:23 +0200 (CEST)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 3FC27609187E;
 Thu, 18 Apr 2019 21:31:23 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Eric Biggers <ebiggers@kernel.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ubifs: remove unnecessary #ifdef around
 fscrypt_ioctl_get_policy()
Date: Thu, 18 Apr 2019 21:31:22 +0200
Message-ID: <17887943.qBNreu9ReB@blindfold>
In-Reply-To: <20190418192953.GB20640@gmail.com>
References: <20190315205503.195400-1-ebiggers@kernel.org>
 <CAFLxGvx3M61E1+Ts38BYRYu93QzmH=XMWoYYrFHTqWXUM7zREg@mail.gmail.com>
 <20190418192953.GB20640@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_123133_945464_D3A4D06E 
X-CRM114-Status: GOOD (  16.04  )
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
Cc: linux-fscrypt@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Donnerstag, 18. April 2019, 21:29:53 CEST schrieb Eric Biggers:
> On Fri, Mar 15, 2019 at 10:08:02PM +0100, Richard Weinberger wrote:
> > On Fri, Mar 15, 2019 at 9:55 PM Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > From: Eric Biggers <ebiggers@google.com>
> > >
> > > When !CONFIG_FS_ENCRYPTION, fscrypt_ioctl_get_policy() is already
> > > stubbed out to return -EOPNOTSUPP, so the extra #ifdef is not needed.
> > >
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > ---
> > >  fs/ubifs/ioctl.c | 7 +------
> > >  1 file changed, 1 insertion(+), 6 deletions(-)
> > >
> > > diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
> > > index 82e4e6a30b04..cd1d4212fc45 100644
> > > --- a/fs/ubifs/ioctl.c
> > > +++ b/fs/ubifs/ioctl.c
> > > @@ -205,13 +205,8 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> > >                 return -EOPNOTSUPP;
> > >  #endif
> > >         }
> > > -       case FS_IOC_GET_ENCRYPTION_POLICY: {
> > > -#ifdef CONFIG_FS_ENCRYPTION
> > > +       case FS_IOC_GET_ENCRYPTION_POLICY:
> > >                 return fscrypt_ioctl_get_policy(file, (void __user *)arg);
> > > -#else
> > > -               return -EOPNOTSUPP;
> > > -#endif
> > > -       }
> > >
> > >         default:
> > >                 return -ENOTTY;
> > 
> > Thanks for that one too. :-)
> > 
> 
> Richard, can you take this through the ubifs tree for 5.2?

Sure. Queued for 5.2. :-)

Thanks,
//richard




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

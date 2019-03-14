Return-Path: <SRS0=YFz0=RR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9D0C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 20:54:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACE5120854
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 20:54:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a+UgZAr1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACE5120854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rbv3fKB7jjq93ix+DGiobxKZTuUzSpmw08MAN9jeb2I=; b=a+UgZAr1AVQmrN
	JSLrME9UcIzL/8uibI1/QdbofMSRXc5IWOtFkEV3oARCLG6zV8p7QUaClVnH+Dx08cWGWJX9lD3p2
	xrKq9ew5Sg55857lN7W+gD3UAXc+Bhi/VvUWQBqkumPQS5TlYWkoS7K54BelwWiBtu8oUL6WYQZUm
	6mDfzd+Wp9Hz+IB4zYt6mt6StzP2xTQjJuOc8XDAyXIndvx9q36xdxG/XRvCDMOfHARksyPeFAShC
	5zCAm7zwLKdPtkcDJURzrc7BgrlECq80VPEdfLObEwbtaWvsboH+/lridnoxDRjbSUKMIPFu3tyA6
	PbwiMwHpweiOEEZahOAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4XMp-0005MS-N2; Thu, 14 Mar 2019 20:54:19 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4XMm-0005Ls-JH
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2019 20:54:18 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E0CC860D4833;
 Thu, 14 Mar 2019 21:54:13 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id oEITekKMhT3l; Thu, 14 Mar 2019 21:54:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 7434060ED8B5;
 Thu, 14 Mar 2019 21:54:13 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id uTYZWp7_Dz-m; Thu, 14 Mar 2019 21:54:13 +0100 (CET)
Received: from blindfold.localnet (089144193070.atnat0002.highway.a1.net
 [89.144.193.70])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id A22E760D4833;
 Thu, 14 Mar 2019 21:54:11 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 4/4] ubifs: Implement new mount option,
 fscrypt_key_required
Date: Thu, 14 Mar 2019 21:54:10 +0100
Message-ID: <1957441.Hty6t2mpXG@blindfold>
In-Reply-To: <20190314174913.GA30026@gmail.com>
References: <CAJfpegvX4ANfso-Jn1zaB+m4Q_0eK9i-+MCJ+sTH5QzD3PZFMQ@mail.gmail.com>
 <20190314171559.27584-5-richard@nod.at> <20190314174913.GA30026@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_135416_928620_64C1A4B2 
X-CRM114-Status: GOOD (  22.77  )
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
Cc: tytso@mit.edu, miklos@szeredi.hu, amir73il@gmail.com,
 linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 paullawrence@google.com, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Eric,

Am Donnerstag, 14. M=E4rz 2019, 18:49:14 CET schrieb Eric Biggers:
> Hi Richard,
> =

> On Thu, Mar 14, 2019 at 06:15:59PM +0100, Richard Weinberger wrote:
> > Usually fscrypt allows limited access to encrypted files even
> > if no key is available.
> > Encrypted filenames are shown and based on this names users
> > can unlink and move files.
> =

> Actually, fscrypt doesn't allow moving files without the key.  It would o=
nly be
> possible for cross-renames, i.e. renames with the RENAME_EXCHANGE flag.  =
So for
> consistency with regular renames, fscrypt also forbids cross-renames if t=
he key
> for either the source or destination directory is missing.
> =

> So the main use case for the ciphertext view is *deleting* files.  For ex=
ample,
> deleting a user's home directory after that user has been removed from the
> system.  Or the system freeing up space by deleting cache files from a us=
er who
> isn't currently logged in.

Right, I somehow thought beside of deleting you can do more.

> > =

> > This is not always what people expect. The fscrypt_key_required mount
> > option disables this feature.
> > If no key is present all access is denied with the -ENOKEY error code.
> =

> The problem with this mount option is that it allows users to create unde=
letable
> files.  So I'm not really convinced yet this is a good change.  And thoug=
h the
> fscrypt_key_required semantics are easier to implement, we'd still have to
> support the existing semantics too, thus increasing the maintenance cost.

The undeletable-file argument is a good point. Thanks for bringing this up.
To get rid of such files root needs to mount without the new mount paramete=
r. ;-\

> > =

> > The side benefit of this is that we don't need ->d_revalidate().
> > Not having ->d_revalidate() makes an encrypted ubifs usable
> > as overlayfs upper directory.
> > =

> =

> It would be preferable if we could get overlayfs to work without providin=
g a
> special mount option.

Yes, but let's see what Al finds in his review.

> > Signed-off-by: Richard Weinberger <richard@nod.at>
> > ---
> >  fs/ubifs/crypto.c |  2 +-
> >  fs/ubifs/dir.c    | 29 ++++++++++++++++++++++++++---
> >  fs/ubifs/super.c  | 15 +++++++++++++++
> >  fs/ubifs/ubifs.h  |  1 +
> >  4 files changed, 43 insertions(+), 4 deletions(-)
> > =

> =

> Shouldn't readlink() honor the mount option too?

Hmmm, yes. We need to honor it in ->get_link() too.

> > +		if (c->fscrypt_key_required && !dir->i_crypt_info)
> > +			return -ENOKEY;
> > +
> =

> How about returning -ENOKEY when trying to open the directory in the first
> place, rather than allowing getting to readdir()?  That would match the b=
ehavior
> of regular files.

I'm not sure what the best approach is.
We could also do it in ->permission().

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

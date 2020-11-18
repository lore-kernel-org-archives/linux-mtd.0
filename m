Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE62C5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 06:28:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 577EE24655
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 06:28:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rEzyzKPK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="V58yRoep"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 577EE24655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kJqKhMHgTgHQbyU86C5+cUPB67LiXMPhX3NWfhxS2K8=; b=rEzyzKPKF01ZVhZozHzym7Efm
	/vZbxE/yUIfVD3/s07L2am8QnPYF4Q56zV89uCYR2889Gn0qqFGHRYScn1rfW8aA/vDFUehSGnhlT
	/AEhpAi89ZYCuu/4qmHZdNKvH37OrhcwDbknXpkvq+NziZQ2nsRGAQ49ZqbEeVtwFzMsHCMn/sE4g
	D6C4hoLbCGqt1XJiqVfqyj4ZxhqgD/nnSCWB46BiJqOfua62IyOijNzRtbFDa3wf+FZKDdLXzef4d
	gReW9yK5L+P9v0kUwxlgaNkaosbKxeVZTHvXwYYYympeOqLx1WbdDYDXN1b8L6jmCSN+Kg8uHYDjV
	1Q0Dwbo2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfGwg-0001VK-SE; Wed, 18 Nov 2020 06:27:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfGw9-0001GI-8m
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 06:27:26 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 967CC24655;
 Wed, 18 Nov 2020 06:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605680843;
 bh=RpCSS3y/duXfmLEcUn3G8/pHSXmT8ukKU/5AG+m0bT8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V58yRoepyagZTKlr+aW6gb29AshdnBnmgDiYwKqMm3jlLRYkgNPd33jvY3404zhqF
 f0Vq1eeZw/pwKC17YrReXC+eB7OqJ3I2z/UF/rbyQKIjkyufDOUzj36PJr33VOANJ1
 46Slhm5EzAs0u5/ypJRRtVFkLqUibL9cremOd1dY=
Date: Tue, 17 Nov 2020 22:27:20 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v2 3/3] f2fs: Handle casefolding with Encryption
Message-ID: <X7S+yK05aX+zB+k9@sol.localdomain>
References: <20201117040315.28548-1-drosen@google.com>
 <20201117040315.28548-4-drosen@google.com>
 <X7QbX9Q4xzhg+5UU@sol.localdomain>
 <CA+PiJmRQGJP5uHf-yXs=efo++JE+SUmjRizwzH-RGG92RdAxyw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+PiJmRQGJP5uHf-yXs=efo++JE+SUmjRizwzH-RGG92RdAxyw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_012725_444555_48C35206 
X-CRM114-Status: GOOD (  15.71  )
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
Cc: kernel-team@android.com, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Chao Yu <chao@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 17, 2020 at 10:22:28PM -0800, Daniel Rosenberg wrote:
> > > @@ -273,10 +308,14 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
> > >                       continue;
> > >               }
> > >
> > > -             if (de->hash_code == fname->hash &&
> > > -                 f2fs_match_name(d->inode, fname, d->filename[bit_pos],
> > > -                                 le16_to_cpu(de->name_len)))
> > > -                     goto found;
> > > +             if (de->hash_code == fname->hash) {
> > > +                     res = f2fs_match_name(d->inode, fname, d->filename[bit_pos],
> > > +                                 le16_to_cpu(de->name_len));
> > > +                     if (res < 0)
> > > +                             return ERR_PTR(res);
> > > +                     else if (res)
> > > +                             goto found;
> > > +             }
> >
> > Overly long line here.  Also 'else if' is unnecessary, just use 'if'.
> >
> > - Eric
> The 0 case is important, since that reflects that the name was not found.

I meant doing the following:

	if (res < 0)
		return ERR_PTR(res);
	if (res)
		goto found;

It doesn't really matter, but usually kernel code doesn't use 'else' after an
early return.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

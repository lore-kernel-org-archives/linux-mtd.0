Return-Path: <SRS0=aMQG=E5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BD7C2D0E4
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 22:53:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 588A7206D8
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 22:53:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fkl28DTY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qsDDuDnW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 588A7206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DwOo1JuCQDYFhSNMdX4kPHjSg/smW1slZNzxTtEEkbs=; b=Fkl28DTY6EO6LlVI3pFUK+dkT
	0c1PJe0gy0wGUxMzaP8Wth8u5x0XcbIuyHAX+yJrJwHgFxreiMQjvXIDQpLRYOFaUmRjPD+p7mTuf
	TNS3zlG6RcjNj1Fca6lv/Es2Gun/OzgSXUPhzFw7Q5ERnlHOu3EDr+jhAsr/rXsu6VJ+dGCkdZmBd
	RjbavKrZZgQdbDuqcO3vn9nWJnGFnHrm8Kthm0dKIjlt1jVpcDAJmgvGh/zUkNaIGL/v1zRxFFvPc
	xunxB1Ujf30Tq+5O3Jpwb6azANA6VXMHNq95Q9NG6HgTmTiwkVK9CXR1vzp4818V2+OOMFBb3IHOZ
	blHjkWZxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khKgZ-0005cS-EA; Mon, 23 Nov 2020 22:51:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khKgW-0005bz-7w
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2020 22:51:49 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F86C20715;
 Mon, 23 Nov 2020 22:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606171906;
 bh=ZXc9vIM5l13483UKyWWsubayfXoDDXtja33VNeTcUhU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qsDDuDnWK5GUaGQVbz8/5EO0/9DSdVrAPwZxZyKsgRZfSg/kyAN/ExsfMf6vCCBrg
 Bxpxd6KXI7WTvuvsYFKMGz2q2Z3jn+8IqNQnKyAF+mOclvnBsqJVUQI0a8ZsKfitu0
 oI21w81HVsopyq5JuVAM+2IYVC2aMkThQZlQxCTY=
Date: Mon, 23 Nov 2020 14:51:44 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gao Xiang <hsiangkao@redhat.com>,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v4 2/3] fscrypt: Have filesystems handle their d_ops
Message-ID: <X7w9AO0x8vG85JQU@sol.localdomain>
References: <20201119060904.463807-1-drosen@google.com>
 <20201119060904.463807-3-drosen@google.com>
 <20201122051218.GA2717478@xiangao.remote.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201122051218.GA2717478@xiangao.remote.csb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_175148_430897_D6EE1D83 
X-CRM114-Status: GOOD (  25.48  )
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Chao Yu <chao@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Nov 22, 2020 at 01:12:18PM +0800, Gao Xiang wrote:
> Hi all,
> 
> On Thu, Nov 19, 2020 at 06:09:03AM +0000, Daniel Rosenberg wrote:
> > This shifts the responsibility of setting up dentry operations from
> > fscrypt to the individual filesystems, allowing them to have their own
> > operations while still setting fscrypt's d_revalidate as appropriate.
> > 
> > Most filesystems can just use generic_set_encrypted_ci_d_ops, unless
> > they have their own specific dentry operations as well. That operation
> > will set the minimal d_ops required under the circumstances.
> > 
> > Since the fscrypt d_ops are set later on, we must set all d_ops there,
> > since we cannot adjust those later on. This should not result in any
> > change in behavior.
> > 
> > Signed-off-by: Daniel Rosenberg <drosen@google.com>
> > Acked-by: Eric Biggers <ebiggers@google.com>
> > ---
> 
> ...
> 
> >  extern const struct file_operations ext4_dir_operations;
> >  
> > -#ifdef CONFIG_UNICODE
> > -extern const struct dentry_operations ext4_dentry_ops;
> > -#endif
> > -
> >  /* file.c */
> >  extern const struct inode_operations ext4_file_inode_operations;
> >  extern const struct file_operations ext4_file_operations;
> > diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> > index 33509266f5a0..12a417ff5648 100644
> > --- a/fs/ext4/namei.c
> > +++ b/fs/ext4/namei.c
> > @@ -1614,6 +1614,7 @@ static struct buffer_head *ext4_lookup_entry(struct inode *dir,
> >  	struct buffer_head *bh;
> >  
> >  	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
> > +	generic_set_encrypted_ci_d_ops(dentry);
> 
> One thing might be worth noticing is that currently overlayfs might
> not work properly when dentry->d_sb->s_encoding is set even only some
> subdirs are CI-enabled but the others not, see generic_set_encrypted_ci_d_ops(),
> ovl_mount_dir_noesc => ovl_dentry_weird()
> 
> For more details, see:
> https://android-review.googlesource.com/c/device/linaro/hikey/+/1483316/2#message-2e1f6ab0010a3e35e7d8effea73f60341f84ee4d
> 
> Just found it by chance (and not sure if it's vital for now), and
> a kind reminder about this.
> 

Yes, overlayfs doesn't work on ext4 or f2fs filesystems that have the casefold
feature enabled, regardless of which directories are actually using casefolding.
This is an existing limitation which was previously discussed, e.g. at
https://lkml.kernel.org/linux-ext4/CAOQ4uxgPXBazE-g2v=T_vOvnr_f0ZHyKYZ4wvn7A3ePatZrhnQ@mail.gmail.com/T/#u
and
https://lkml.kernel.org/linux-ext4/20191203051049.44573-1-drosen@google.com/T/#u.

Gabriel and Daniel, is one of you still looking into fixing this?  IIUC, the
current thinking is that when the casefolding flag is set on a directory, it's
too late to assign dentry_operations at that point.  But what if all child
dentries (which must be negative) are invalidated first, and also the filesystem
forbids setting the casefold flag on encrypted directories that are accessed via
a no-key name (so that fscrypt_d_revalidate isn't needed -- i.e. the directory
would only go from "no d_ops" to "generic_ci_dentry_ops", not from
"generic_encrypted_dentry_ops" to "generic_encrypted_ci_dentry_ops")?

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

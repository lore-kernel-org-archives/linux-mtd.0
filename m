Return-Path: <SRS0=0SW8=SN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC22C10F13
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2019 17:28:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5CFB2146F
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2019 17:28:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yjo+SKOi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rUL2CvSa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5CFB2146F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQ5/QdWT9I5VTyp2Ma7WkldEH6Y7MIlFcYnJbfb55Og=; b=Yjo+SKOikb2+E0
	kQANamzrAcTudI1hgv7U4QbVCFNsi2cEoqTlBdaJ7CK3i3RE/isWCl7+zQtDokJ2NbS4D+3wx44PX
	V4zIrG3f3EewW+5BHqJrt8WvqiYfIJdC/5YIjBvt4zgRUmK28qfUP2xJvvQIKqG/ub20mSzfp4FDt
	joC/FKnHZLywwaV3HA23FhXuqR58Z6HB6odkzg5tDufdPYKIjbx/Jb0gN816nagLrtR/yq4tQ5GQj
	FINZYjfbrY03CaXoFVAklGwch9X5J6nlH7VgZsCh0wp92E+62Z7+mQtLdADkDJ1IczqbXoj3mEG9X
	PkwhSOXXfUMIuDCVbfHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEdVK-0001rm-JW; Thu, 11 Apr 2019 17:28:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEdVH-0001rB-Po
 for linux-mtd@lists.infradead.org; Thu, 11 Apr 2019 17:28:49 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 08C462084D;
 Thu, 11 Apr 2019 17:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555003727;
 bh=Z0/DmaNrnDC9OrljK1poyZTLwzQJq8FwEv9dGTtd81Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rUL2CvSaEyQQ2WRpMdkdT2D3P6oXuBAQymfy8FzOSYy4nTmeel9KPNRTM/uBXT6Pa
 mAdwIJKBw9vOpFZKrCZd5pEgrYP0ta6vZbmgICqodIuasVHUWpf2BUo9hW+PH5zgZH
 r0XyIAKdCd250xyT9oprWqE3nQsgIGpkd1lw2VgQ=
Date: Thu, 11 Apr 2019 10:28:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v2 1/2] vfs: use READ_ONCE() to access ->i_link
Message-ID: <20190411172844.GA225654@gmail.com>
References: <20190410202115.64501-1-ebiggers@kernel.org>
 <20190410202115.64501-2-ebiggers@kernel.org>
 <20190410210657.GA2217@ZenIV.linux.org.uk>
 <20190410231547.GC120258@gmail.com>
 <20190411022514.GC2217@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190411022514.GC2217@ZenIV.linux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_102847_849245_29C540D3 
X-CRM114-Status: GOOD (  16.65  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Apr 11, 2019 at 03:25:15AM +0100, Al Viro wrote:
> On Wed, Apr 10, 2019 at 04:15:48PM -0700, Eric Biggers wrote:
> > On Wed, Apr 10, 2019 at 10:06:57PM +0100, Al Viro wrote:
> > > On Wed, Apr 10, 2019 at 01:21:14PM -0700, Eric Biggers wrote:
> > > > From: Eric Biggers <ebiggers@google.com>
> > > > 
> > > > Use 'READ_ONCE(inode->i_link)' to explicitly support filesystems caching
> > > > the symlink target in ->i_link later if it was unavailable at iget()
> > > > time, or wasn't easily available.  I'll be doing this in fscrypt, to
> > > > improve the performance of encrypted symlinks on ext4, f2fs, and ubifs.
> > > > 
> > > > ->i_link will start NULL and may later be set to a non-NULL value by a
> > > > smp_store_release() or cmpxchg_release().  READ_ONCE() is needed on the
> > > > read side.  smp_load_acquire() is unnecessary because only a data
> > > > dependency barrier is required.  (Thanks to Al for pointing this out.)
> > > 
> > > You've missed vfs_readlink()...
> > 
> > How so?  The patch already updates vfs_readlink().
> 
> Huh?  Right you are - fsck knows how have I managed to misread that...
> Anyway, I can pick that READ_ONCE() patch through vfs.git if you wish,
> or it can go through your tree with my Acked-by - up to you...

Unless you expect merge conflicts, it's easier for me to take it through the
fscrypt tree, since it's a small patch and the second patch technically isn't
correct without it.  I'll add your Acked-by.

Are you planning to review the second patch too?

Thanks!

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AA3C87FCF
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 17:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qHcuCaPnld3Z/G9NFH7GZ2ICc91ocqM+o1/6BFnhdY=; b=JlYVVm0jHsJwKy
	j1p/eZgK8MxIPp/T5+2rlaZn4iQVCVLvazETIpdE0RHqYb/GPnrunuI+98zCX9DeM12XC7VR2AgTC
	bGGNkiurpVoz+MHyebYpkgHvTEDVxf5bcrDmBtKRHTAxXQ0g5y9AfnWP4t7cNTuBYXcDdHUw2Cv9r
	cr25MsIvAu4tDGcQuyoYrhlPicC/9pZg4MYOIJWUP0/UvN4pr/gpvvN8M7+e5ubS4MgqtwTAoO7nG
	rQmBTs7tDGoK5qQyF3RMFdXlJ3cqKLI/PjzpNuCrmrP2mkFIOglt3CPQxJWKVA7qiLId62Q9NWJAy
	0GikC2sCO5Ks3z2nfW5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul9cd-00000005pS7-0CKj;
	Sun, 10 Aug 2025 17:14:15 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul9cc-00000005pRq-0pCw;
	Sun, 10 Aug 2025 17:14:14 +0000
Date: Sun, 10 Aug 2025 10:14:14 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, linux-fscrypt@vger.kernel.org,
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org,
	ceph-devel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v5 00/13] Move fscrypt and fsverity info out of struct
 inode
Message-ID: <aJjTZg-VOaZ_2k2H@infradead.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
 <aJixkUfWPo5t8Ron@infradead.org>
 <20250810170311.GA16624@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250810170311.GA16624@sol>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Aug 10, 2025 at 10:03:11AM -0700, Eric Biggers wrote:
> I assume you actually still mean fsverity, not fscrypt.

Yes, sorry.

> First, it would
> be helpful not to use one solution for fscrypt and a totally different
> solution for fsverity, as that would increase the maintenance cost well
> beyond that of either solution individually.

I agree that reducing the number of infrastructures is a goal.  But I
don't think we should limit us to a single "solution" for different
kinds of problems.

> 
> Second, the fsverity info can be loaded very frequently.  For example,
> curently it's loaded for each 4K data block processed.

Well, we can easily keep a once looked up data structure around for
any operation that does not leave file system control.  So for writing
that's a single ioctl context.  For read that is a single call into
->readahead, or maybe even ->read_iter.

> Also, there
> *are* use cases in which most files on the filesystem have fsverity
> enabled.  Not super common, but they exist.

Sure.  But the typical use case is a few files, and even that is just
a tiny minority of all ext4/f2fs/xfs file systems.

> It doesn't really seem like the kind of solution that's a good choice
> for a frequently-loaded field.  And that's only the load; it's not
> getting into the insertion (and resizing) part.

Assuming you actually get it down to once per high-level operation
above, it will still be absolute noise compared to the I/O generated.

> If we're going so far as to use a rhashtable, I have to wonder why we
> aren't first prioritizing other fields.  For example ext4_inode_info
> unconditionally has 40 bytes for fast_commit information, even though
> fast_commit is an experimental ext4 feature that isn't enabled on most
> filesystems.  That's 5 times as much as i_verity_info.  And quota has 24
> bytes under CONFIG_QUOTA.  And there are even holes in the
> ext4_inode_info struct; we could also just improve the field packing!

All that does sound like a good idea, independent of what we are
discussing here.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

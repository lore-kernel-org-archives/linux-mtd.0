Return-Path: <SRS0=UdE+=DA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83207C4363D
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 06:09:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A30920739
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 06:09:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BrjfZ2wY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDlsAnvl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A30920739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YeCciBvrvFKJPU1sFlllKO+0rRGbrZFM7MhsIOsOouc=; b=BrjfZ2wYmoZuYUjO0GWgcxz//
	dnQgrqNlgp6HSAavrndAqfbadg/A6On2iderF68nvmhxHHQjNZlSxrNWrDTHBFqif+yys23xIllt/
	3tSnQOVLDv+z1uP9B4EOISrwAS2wJRgteuQ8vr6+2yjhU1B4rSGQFbf+TzJU3ULEdmoAcmYsjHQ9U
	PjIqqZ6qezEoJh2E7yCo+mjbvOW0J4Qlpv38QJwk3w2pg+nG7mB1gbx1aylmSSHcLscmFACTN/0aE
	LFhIJvjSh5mNzramp7WPLvLxKvtoDQoTUoiNWn2byelE5IWjLAyXGbLuOpUBbu85DBpLfXokDGQzu
	sWQcaqt0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKxwg-0002QD-4j; Wed, 23 Sep 2020 06:08:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKxvy-00021a-IT
 for linux-mtd@lists.infradead.org; Wed, 23 Sep 2020 06:07:19 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BEC9235FC;
 Wed, 23 Sep 2020 06:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600841236;
 bh=kyWQ8LYf7qzECEdXjAoNSqNNVC8G8Y8QllK22Douvts=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lDlsAnvlLTFfh5gvzZnIhu6t8x8513xuoBHUj/FJRyY6n5ixwf7t/gfjtYU2abUJE
 2ANdE+NbEuR3FdILpOGpbTXLaRP3o1THWDT+g2nbv/P27sYI3n3sxUEW6aIt4GnFmx
 0qPYtcS2uf+FibkrZAMT596HZyf3H9QGvUW8bUz0=
Date: Tue, 22 Sep 2020 23:07:15 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH 3/5] libfs: Add generic function for setting dentry_ops
Message-ID: <20200923060715.GD9538@sol.localdomain>
References: <20200923010151.69506-1-drosen@google.com>
 <20200923010151.69506-4-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923010151.69506-4-drosen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_020718_802340_0FDC4F60 
X-CRM114-Status: GOOD (  17.40  )
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

On Wed, Sep 23, 2020 at 01:01:49AM +0000, Daniel Rosenberg wrote:
> This adds a function to set dentry operations at lookup time that will
> work for both encrypted files and casefolded filenames.

"encrypted files" => "encrypted filenames"

> 
> A filesystem that supports both features simultaneously can use this
> function during lookup preperations to set up its dentry operations once
> fscrypt no longer does that itself.

"preperations" => "preparations"

> 
> Currently the casefolding dentry operation are always set because the
> feature is toggleable on empty directories. Since we don't know what
> set of functions we'll eventually need, and cannot change them later,
> we add just add them.

"are always set" => "are always set if the filesystem defines an encoding"

> +/**
> + * generic_set_encrypted_ci_d_ops - helper for setting d_ops for given dentry
> + * @dentry:	dentry to set ops on
> + *
> + * This function sets the dentry ops for the given dentry to handle both
> + * casefolding and encryption of the dentry name.
> + */

But it also seems that some of the information in the commit message should go
into this comment so that it isn't lost.  It's not clear to someone reading this
code what "handling encryption of the dentry name" means (hint: it doesn't
actually mean handling encryption...), and why setting the casefolding
operations isn't conditional on IS_CASEFOLDED(dir).

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

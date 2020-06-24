Return-Path: <SRS0=7p5O=AF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AE6C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 05:44:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F66120768
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 05:44:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WbrpIdv1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rqTgVkoO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F66120768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LvnTjDv7mBoHb6HANkRlhMkjZTSWCNyunf0lem4rI4k=; b=WbrpIdv1WoOlNaIC1nxQ6b1w4
	HhuIkjh3TOhOFqQ5n7o118nphsKwbfJ9QmPJi4og+SXGhRec9fZWHIPCXHOh9dzWWY26bHsIfEd8T
	PuIWhRDIzaLGmXCejEBc4aC5Cp2UFuTdtIwHv4oC3GANu2ceKo4HAQlgGXS1DOjcHRJiyFRK19BAq
	QoUoEOa5XxId+gvq2FHeFFNz5ywdOyuMo13gR3rzQbcY/dvrM5N9AaBxEg3tuyXWpIX0X9GCsFi4o
	hD+qPq4gL7J/Sc6J9sXlhLFyCiMc29HYGm5dUVHatvlZf9KKi7Nqcbv3aRukAZraJULJwNOPz4MU6
	9gRp/X43A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnyBG-000101-8F; Wed, 24 Jun 2020 05:42:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnyBE-0000zG-FC
 for linux-mtd@lists.infradead.org; Wed, 24 Jun 2020 05:42:41 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB01720768;
 Wed, 24 Jun 2020 05:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592977359;
 bh=fHdY9nn8NgJ9JVY0fSdYkbZ9nf7LPBc7XBKSfqLQLKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rqTgVkoO7ugKxbBCHnVIerXa56LTd+UjeSduGt5xrC9wVZYLMSDLRHe5prmgK9bSs
 w26715uwkfKDky4fGd86IXyd/REcd+htJsdcqPsptwZiIvuaZgf4+wJ46fh1yiRtFC
 uofq/Ed5ofwshr3zNAKS7TkxWxOI/HJe+vwKUgCs=
Date: Tue, 23 Jun 2020 22:42:37 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v9 2/4] fs: Add standard casefolding support
Message-ID: <20200624054237.GF844@sol.localdomain>
References: <20200624043341.33364-1-drosen@google.com>
 <20200624043341.33364-3-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624043341.33364-3-drosen@google.com>
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
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Chao Yu <chao@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jun 23, 2020 at 09:33:39PM -0700, Daniel Rosenberg wrote:
> This adds general supporting functions for filesystems that use
> utf8 casefolding. It provides standard dentry_operations and adds the
> necessary structures in struct super_block to allow this standardization.
> 
> Ext4 and F2fs will switch to these common implementations.

It would be helpful to explicitly call out anything that's "new" in this commit,
i.e. anything that isn't simply moving code into the libfs with no behavior
changes.  There's the change of ->d_hash() to use utf8_casefold_hash() instead
of allocating memory; that's not present in the ext4 and f2fs versions.

There's also the change of needs_casefold() to be aware of encrypt+casefold.
(Maybe that small change would better belong in a later patchset that actually
introduces encrypt+casefold support?)

Anything else?

> +/**
> + * generic_ci_d_hash - generic d_hash implementation for casefolding filesystems
> + * @dentry:	dentry whose name we are hashing
> + * @str:	qstr of name whose hash we should fill in
> + *
> + * Return: 0 if hash was successful, or -ERRNO
> + */

It also returns 0 if the hashing was not done because it wants to fallback to
the standard hashing.

> +static inline bool needs_casefold(const struct inode *dir)
> +{
> +	return 0;
> +}

The return type is bool, so it should 'return false', not 'return 0'.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

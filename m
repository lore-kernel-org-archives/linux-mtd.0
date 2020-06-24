Return-Path: <SRS0=7p5O=AF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81968C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 05:36:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B29B2072E
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 05:36:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xIJJQypd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aH7ky+hF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B29B2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nRO9HOULBiXZIPhDWhupIQgEqiaHNcM6XxZ0+HxHA7M=; b=xIJJQypdW6frgUJP8UXlsJxBW
	FIcWbsrlCG6HW7m6VBJVfMbozFIKpDSeqWTKNQ6zjw8Pr8epQKZHOPp/OEd2d54wl07cVIDcE6519
	uvJyTsm7RhXF5NhLN5WUYpa1E2yONXw08b0F+3zGAKHnjMDKPmOj8mXDepBs0KEI4kKNHASe91sy1
	uRrZ+rvM4eKIhc55YbnqdYgREGJk4yO8VkT8/HkSZnq71GBBD4ja40u/Rfoj3aMDjoEk8oYyvBkIe
	EqpkbHFC8o1VOune/SQ+s6W7OTtKJzudCVsHuZwfNbd4TBTBRNHUlSwq3o+9KWuOIHuv48LvDuRvf
	p3OQ085QQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jny3r-0006R5-Ux; Wed, 24 Jun 2020 05:35:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jny3p-0006Q0-RX
 for linux-mtd@lists.infradead.org; Wed, 24 Jun 2020 05:35:02 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E7FA2072E;
 Wed, 24 Jun 2020 05:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592976900;
 bh=Uvdb15+FwGUGLj2jhaGU6/DgaIrNmpWsV+ez1RtkBmM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aH7ky+hF/Jg1QGfBvwiqKCHIP0MpTE4LW78vI6dhtosOeYKEh+oTVtkYpAvkWt0iL
 ShgtMzLXPriGly+wa1+m9TELZOjEkpmRhniqkY7PbvwGbJ75CBOxbWj/lDddErBOg3
 6QVCfLlt6ajSXNSYRvGVdcGxxdHPpG/B6o059JkA=
Date: Tue, 23 Jun 2020 22:34:58 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v9 0/4] Prepare for upcoming Casefolding/Encryption patches
Message-ID: <20200624053458.GD844@sol.localdomain>
References: <20200624043341.33364-1-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624043341.33364-1-drosen@google.com>
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

On Tue, Jun 23, 2020 at 09:33:37PM -0700, Daniel Rosenberg wrote:
> This lays the ground work for enabling casefolding and encryption at the
> same time for ext4 and f2fs. A future set of patches will enable that
> functionality. These unify the highly similar dentry_operations that ext4
> and f2fs both use for casefolding.

I think this undersells this patchset a bit.  This patchset makes ext4 and f2fs
share the casefolded ->d_compare() and ->d_hash() implementations, which
eliminates duplicated code.  That's a good thing regardless of whether we're
going to add encrypt+casefold support or not.

It also changes the casefolded ->d_hash() implementation to not have to allocate
memory (with GFP_ATOMIC, no less), which was a big problem with the old
implementation as it's unreliable and inefficient.

So yes, this prepares for supporting encrypt+casefold.  But these changes make
sense on their own too as an improvement of the casefold feature.  Except for
the one line of code in needs_casefold() that is specific to encrypt+casefold;
maybe that should be left out for now.

(Side note: I think you could drop linux-doc and linux-mtd from Cc, as this
patchset isn't really relevant to those mailing lists.)

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

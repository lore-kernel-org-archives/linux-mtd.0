Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325FDC10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 23:17:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFF1F20820
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 23:17:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mlgLL/wB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OxyQkFX6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFF1F20820
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8RvlIsjDSVqc8LJFoQu9cjO863e7ax4NutBRBTh8eQw=; b=mlgLL/wBJGfVcu
	16AHmryDd81/x3w+cT8PAaz3GONZ2jXKdcDWUFfTunY/OJJmfiGf3OoBr8ySdVBmbbxp2AatlsufV
	jSnKWlOfIhmJfVM8ncUgqL4vorgD2EOYxAeA0kVE8GEKFCjKcHp/sfLwZLL1Fh4n4H9bJkiw6Oyrp
	WAFOrnryeYNcSVVlCq/VAbhqgjbBpT8vGY08VHQrqyWKYgOr3POeQ1KUBfKVtMI5uFEHRtbvPTahB
	KI/9LV2mfalHof+kkaHRIpLOL6/DwIQnhLTnTLbVYHVc6+inl8FGxgwehkKV5rJNyuzMbGSSgKOnE
	x46YtpJIQj4ZQzh8Q4PA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEMSv-0000oD-UL; Wed, 10 Apr 2019 23:17:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEMRa-0007WI-3f
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 23:16:00 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E03D20820;
 Wed, 10 Apr 2019 23:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554938149;
 bh=1gxdAOnNojCmWwSJ0r0v7Nz8pxGPPrn4uqvTyWoyzj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OxyQkFX684C7eZmJwptSahUQ6Wbb6ZK4wZtvbcsutr0tFJjQ/W8lk55uWFGIghziA
 C8nWLHF5D1l4fg/KzPfKa/PAFmoGv/Mmp3WmNrsh7YmxX7JuXi0IK40U5AUltPI0oR
 8+A435xGUwMS1PsigLo/PgxVTeG454qdYDNzEVhk=
Date: Wed, 10 Apr 2019 16:15:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v2 1/2] vfs: use READ_ONCE() to access ->i_link
Message-ID: <20190410231547.GC120258@gmail.com>
References: <20190410202115.64501-1-ebiggers@kernel.org>
 <20190410202115.64501-2-ebiggers@kernel.org>
 <20190410210657.GA2217@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190410210657.GA2217@ZenIV.linux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_161550_802866_22724BFE 
X-CRM114-Status: GOOD (  12.73  )
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

On Wed, Apr 10, 2019 at 10:06:57PM +0100, Al Viro wrote:
> On Wed, Apr 10, 2019 at 01:21:14PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Use 'READ_ONCE(inode->i_link)' to explicitly support filesystems caching
> > the symlink target in ->i_link later if it was unavailable at iget()
> > time, or wasn't easily available.  I'll be doing this in fscrypt, to
> > improve the performance of encrypted symlinks on ext4, f2fs, and ubifs.
> > 
> > ->i_link will start NULL and may later be set to a non-NULL value by a
> > smp_store_release() or cmpxchg_release().  READ_ONCE() is needed on the
> > read side.  smp_load_acquire() is unnecessary because only a data
> > dependency barrier is required.  (Thanks to Al for pointing this out.)
> 
> You've missed vfs_readlink()...

How so?  The patch already updates vfs_readlink().

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

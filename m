Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA37C282DA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 16:41:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84DF620821
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 16:41:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aoH6DdBh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84DF620821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zD0qJll9nm+aVRU0//5fRSsDjMm2yXZhcGaZQva/324=; b=aoH6DdBhgi1h4H
	yEzjkxaRpR3xfQ2Go19zTW0S5KI/HY/WAMhiw+ILNFClQ3g/uy6WiQ+rDX/NDOYPI5/xmUSmV1ZqK
	8dO2B6WdAUqQGp998NGnAE+odxya7CoivqVA45ktBdBFPqmgjgjnF2nQQyHezAuF2L2SRvWqtAarj
	uR4tGFUX9UohwZhjMQuI9T37qg+DqvI4iC4ZG7Ln2kQ0cMfVxFxq0XMQK12lSPle5sPVipdsERK2L
	GBtqrkDELAQWTCPGFbvBdGC6v1U8OyuoBJWF41BjB4iNmHMl6CjUCicwr5un+6rFBw2mlUbOHMZL2
	S29PLxY8aConX4vH8Ydw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGnd2-0004eT-LZ; Wed, 17 Apr 2019 16:41:44 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGnd0-0004e1-EJ
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 16:41:43 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-109.corp.google.com
 [104.133.0.109] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x3HGfbC6004544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Apr 2019 12:41:38 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 6913B420497; Wed, 17 Apr 2019 12:41:37 -0400 (EDT)
Date: Wed, 17 Apr 2019 12:41:37 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v2 1/2] vfs: use READ_ONCE() to access ->i_link
Message-ID: <20190417164137.GH4686@mit.edu>
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
X-CRM114-CacheID: sfid-20190417_094142_645125_935564A5 
X-CRM114-Status: GOOD (  13.95  )
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
Cc: linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
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

Al, I'll take it through the fscrypt tree with your Acked-by, if you
don't mind.

					- Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

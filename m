Return-Path: <SRS0=bf65=3J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A71C33CA1
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 06:54:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6DB72073D
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 06:54:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kK6SqPfo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Occ+eKdY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6DB72073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNH+whh4eixyPH+vAwibfwlTiBKoruLkVCQbBiTB9jM=; b=kK6SqPfoa94VHb
	kiF4TwJxyJJp2xeA7fNUGwwaBHPq43LWidE17rx5cJy3o5+hCCNEIUY/AWpzqmql6rFmTLuKc1rcf
	NrPYSi3snuvfZ2d8+sqRRZ3iT8pIlP//V2pQHNt5LyZkCQnd29QYek7rHPLQ+xBNXlTOLZpwZP1Pv
	zk1h2NKU9h8rKDvu93IER99ysaNdAvbF9eyCvZqudmoHDZOHazUa8j+kz1EYvYyrHQacLTl5Pj9mT
	rfZRb7XKByhUU4a43OLEKS8SLrS9VS81A4tsJqJD/e7DxTyaJJSu54QnkMtFpvZLWXpCqiL62vtxe
	6U57etio6d05nT83k/7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itQxC-0002dW-5z; Mon, 20 Jan 2020 06:54:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itQx8-0002d1-Fl
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2020 06:54:28 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6811F2073D;
 Mon, 20 Jan 2020 06:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579503264;
 bh=3/g8O0L8/HHyUM7mzXuzKScJszx17sO0OT6iedMCQbY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Occ+eKdYD75/B0vY5B8dPtboth69kxcmqdb2JLdJfROsBnMGeKyITZlIB9awuY89K
 KQZYwiWpREBVfe06v6ipryJId0Yd/UXeOZFkyWeO/P8Ch6xhbBjbuVhTsehCJbJCqC
 mtRjU2mVA2Mghajjr+xVlGKp6LibusrEYHO2AHRg=
Date: Sun, 19 Jan 2020 22:54:22 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH] ubifs: use IS_ENCRYPTED() instead of
 ubifs_crypt_is_encrypted()
Message-ID: <20200120065422.GA976@sol.localdomain>
References: <20191209212721.244396-1-ebiggers@kernel.org>
 <20200103170927.GO19521@gmail.com>
 <CAFLxGvwA6y2+Azm1Xc+-cz1N_jjJXY3uZBVDqGGLvc6GMcb5JA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFLxGvwA6y2+Azm1Xc+-cz1N_jjJXY3uZBVDqGGLvc6GMcb5JA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200119_225426_549871_51F633ED 
X-CRM114-Status: GOOD (  15.90  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jan 09, 2020 at 09:01:09AM +0100, Richard Weinberger wrote:
> On Fri, Jan 3, 2020 at 6:09 PM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Mon, Dec 09, 2019 at 01:27:21PM -0800, Eric Biggers wrote:
> > > From: Eric Biggers <ebiggers@google.com>
> > >
> > > There's no need for the ubifs_crypt_is_encrypted() function anymore.
> > > Just use IS_ENCRYPTED() instead, like ext4 and f2fs do.  IS_ENCRYPTED()
> > > checks the VFS-level flag instead of the UBIFS-specific flag, but it
> > > shouldn't change any behavior since the flags are kept in sync.
> > >
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > ---
> > >  fs/ubifs/dir.c     | 8 ++++----
> > >  fs/ubifs/file.c    | 4 ++--
> > >  fs/ubifs/journal.c | 6 +++---
> > >  fs/ubifs/ubifs.h   | 7 -------
> > >  4 files changed, 9 insertions(+), 16 deletions(-)
> >
> > Richard, can you consider applying this to the UBIFS tree for 5.6?
> 
> Sure. I'm back from the x-mas break and start collecting patches.
> 

Ping?  I see the other UBIFS patches I sent in linux-ubifs.git#linux-next,
but not this one.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

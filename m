Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E95C47422
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 05:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JE8K64mJop5xNdaNKYmbLSohPhQ1LlDtJTNMsp72AEM=; b=u5x7Gp5srzsL0X
	t1w25TTd/hodo9ChD8SEeVdbCWjkNiVxSg+MwDZsu3grWom0gRjXdkth6dAdlqMX4WPHWtkeepvHp
	HhMATh9v7pozuW6iWGKSR+sLb90Kzmy1DbCf2ow4MceLvp/e1+3INyIcSt8nU+uIevWpz0Gy0t9Am
	3/NMncqzZJAb+pkwWJn+bM4E/ipd/fmqR2RuOmnHPLbtVbwbu089wE54LF0cEskN1GtDzS6aja7CD
	Pk3BCJqrbDu+0g/3mnUxZsg+BmbrN5OQMyCSLGo0XF7s4OxmCnXw0MFvBJpofelyNP3ddSNUAT5Bv
	7BiAieNTFTmKkNpul/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSVNz-001VEF-1e;
	Wed, 24 Jan 2024 05:01:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSVNx-001VDS-2l
	for linux-mtd@bombadil.infradead.org;
	Wed, 24 Jan 2024 05:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3nLW/mbiwS3VnugIfMXOen5kXEP8bB2iFmbkVE+XROA=; b=ZNWym6uW+9mDWIa5D6XyRtWdcv
	oIwDfksNbHQ7O9A4slJpXSSSSUBkU0Kmwt/uc2i5nMBMGsCksCBfmOCbIiPPeIeT1gWsmpTOIU90K
	8o+c9USSdRuYzSLDZsK9RVBqNRNH2GL0Om6NVWP6juevhoEmtogpZSpIVAzR9w9MNBGS0dceWUhJy
	gJUYQ4z7AgH8kllNu5LR6aNx8QjjPyFD+7nXxWbUOApfrWjY63UTdfvpHrcyLGM0dKd6G/u96D9eT
	VXGl0ZxG2Ght2g/8IhCoOfvQZYu2il5Qia3h/nm5AonSyK7rM+05ami2h96fsM0IXGd7OwKBhuIak
	BrwELTOQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSVNv-00000005RZ1-3Yqq;
	Wed, 24 Jan 2024 05:01:11 +0000
Date: Wed, 24 Jan 2024 05:01:11 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 00/15] ubifs folio conversion
Message-ID: <ZbCZl056dM_YF0P0@casper.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <1132174888.268752.1705995229529.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1132174888.268752.1705995229529.JavaMail.zimbra@nod.at>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jan 23, 2024 at 08:33:49AM +0100, Richard Weinberger wrote:
> Matthew,
> =

> ----- Urspr=FCngliche Mail -----
> > Von: "Matthew Wilcox" <willy@infradead.org>
> > An: "richard" <richard@nod.at>
> > CC: "Matthew Wilcox" <willy@infradead.org>, "linux-mtd" <linux-mtd@list=
s.infradead.org>
> > Gesendet: Sonntag, 21. Januar 2024 00:08:08
> > Betreff: [PATCH 00/15] ubifs folio conversion
> =

> > This patchset converts ubifs to use folios throughout.  I made some
> > attempt to support large folios, but more work definitely needs to be
> > done before it can be enabled.  It's not clear to me whether it's worth
> > doing, so I've left that for you ;-)
> =

> what is the benefit of large folios?

For another purpose, I just wrote this up.  Possibly there are more
benefits, but these are the ones I remembered just now:

But why should a filesystem put in the effort to support large folios
(aka multi-page folios)?

    Lower overheads
        Fewer calls to the page allocator
        Shorter LRU list helps vmscan age memory
        Fewer calls to the page cache for large read()/write()
        Fewer calls to the architecture code for handling faults in mmaped =
files
        Potential use of larger TLB entries (eg contPTE / NAPOT)
    Being a better kernel citizen
        The more code using large folios, the easier it is to allocate larg=
e folios

The costs may outweigh the benefits. I would not invest time in making
iso9660, adfs or efs support large folios. But for filesystems which
are used every day (XFS, NFS, ext4, btrfs, ...) the benefit is very much
worth the cost.

> > I ran this through xfstests and it didn't seem any worse.
> =

> Can you recommend a specific real load workload to stress test your chang=
es?

Not really.  Everything should work just as it did before.  I doubt
you'd be able to see any performance differences with, eg, a kernel
compile.  There's usually a few % gain when enabling large folios.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

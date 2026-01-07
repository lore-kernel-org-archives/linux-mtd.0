Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3203CCF6BF4
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jan 2026 07:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/vfNhASCQm32RZ41ZHl9MaZz8/0asI1ueTqJMCWjQU=; b=UxkgpW3MUNAgV6
	BANysA9YHhUdwNI+eFU9qPoRKUOuXZBmub4eqkt9lB5nh3Tpt/xpbG6Nyrkst5dV5oVd9s4mkrJxY
	3c1UoGk2Sxpyqlu87tLX+rnWDX36nf4Lul9E3X6BPnA1bRKjdHpJduSGjwF30cIuZgHwba7VqNeFF
	i/r7Ht/PQjQ0XisQEKcxg5L1Zgg+rtyfhykeL2MPAqfsECMsv9qEd046soajS7dxPFSj8vMyMdZ89
	6bVtWcvToX+MS2q1K4gMTvRsQvDcs6f5tfwImeZQ+rm5PXXrRc4mYrt1J4Jll4FuDhGpFTcmrNdYa
	hK3xSV219vuNJbYpB2Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOCv-0000000EJAe-0Sag;
	Wed, 07 Jan 2026 07:43:53 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOCs-0000000EJA2-3J2B
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jan 2026 07:43:52 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7108E227A87; Wed,  7 Jan 2026 08:43:46 +0100 (CET)
Date: Wed, 7 Jan 2026 08:43:46 +0100
From: Christoph Hellwig <hch@lst.de>
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
	Jan Kara <jack@suse.cz>, Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>, linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	gfs2@lists.linux.dev, io-uring@vger.kernel.org,
	devel@lists.orangefs.org, linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: Re: [PATCH 04/11] fat: cleanup the flags for fat_truncate_time
Message-ID: <20260107074346.GA18258@lst.de>
References: <20260106075008.1610195-1-hch@lst.de> <20260106075008.1610195-5-hch@lst.de> <87cy3nrpdu.fsf@mail.parknet.co.jp> <878qeask1x.fsf@mail.parknet.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878qeask1x.fsf@mail.parknet.co.jp>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_234350_968113_83F3C82C 
X-CRM114-Status: GOOD (  13.84  )
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

On Wed, Jan 07, 2026 at 02:55:06AM +0900, OGAWA Hirofumi wrote:
> > Thanks.
> 
> Ah, I was overlooking that new value is using same value with S_*.

Still not a good idea to not create a bisection hazard.  I've added
a local fat_flags variable and a translation for this patch, even
if that will go away in the next patch to be 100% sane.

> Acked-by: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

But I've kept the ACK.  Let me know if I should drop it for now with
the change instead.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

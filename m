Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A476CF6BF3
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jan 2026 07:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5zlKRX5LZyyY7jEziQLC6ev+tvwDCzgRDtGuc9S92A=; b=r+yiUwqWS0laVp
	gA9vfLBhSL6fkFqbfSJZNWbXFh9pICVr9Pfbc/h4CSxAjQvjleOtvEHR/mc484ECTkyv9AqHE43X1
	a0qW90e33eu5a8IYl+ArzWWL/kyoRsYFshYjBlYHkDxR8ONZj10YcZjUWJQg2XEQMgbS6Zkky4trJ
	c/CWLxuXGDTSP9UwtN6vGc1Fyfa3YzkCAeiZZ2t8jn2UFC/s1kP41lan7D/c2XWVd3jenR+5eHnqK
	MFvpiZrLr6E/QbnI4n59TX1mcpYnEF4GJDrYupQRouYJ9zQCKcHsu5CLEs3OEDKmXjbc7JYkq8JhR
	pgf8VVTuAi6f7ajUloFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdO5H-0000000EIIA-2eZ0;
	Wed, 07 Jan 2026 07:35:59 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdO5F-0000000EIHl-2JcF
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jan 2026 07:35:59 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 5170F227A87; Wed,  7 Jan 2026 08:35:53 +0100 (CET)
Date: Wed, 7 Jan 2026 08:35:52 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>, linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	gfs2@lists.linux.dev, io-uring@vger.kernel.org,
	devel@lists.orangefs.org, linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: Re: [PATCH 05/11] fs: refactor ->update_time handling
Message-ID: <20260107073552.GB17448@lst.de>
References: <20260106075008.1610195-1-hch@lst.de> <20260106075008.1610195-6-hch@lst.de> <jlw4ghr5vx32ss576akxes25oodlcx42zak7vjaaktlgn3m3d7@cbpcvx66y7za>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <jlw4ghr5vx32ss576akxes25oodlcx42zak7vjaaktlgn3m3d7@cbpcvx66y7za>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_233558_212554_BEEC2658 
X-CRM114-Status: GOOD (  11.00  )
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

On Tue, Jan 06, 2026 at 12:48:47PM +0100, Jan Kara wrote:
> > +static int inode_update_cmtime(struct inode *inode)
> > +{
> > +	struct timespec64 now = inode_set_ctime_current(inode);
> 
> This needs to be below sampling of ctime. Otherwise inode dirtying will be
> broken...

Fixed.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

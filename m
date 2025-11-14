Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20C9CE8D44
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 15:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4l3h2Kvp6xpdwV1rSMe90Jd3c95Fp6lee39eQVhN/k=; b=ja4gJDAiFzwR8Z
	y+KzxJbfw6DUlIhfsQD+8PWB8rTyPmSDQcq9HiPeHcyb0I8LchYbayoWK8Q57a0fz6WNW5aYcWbs+
	Z9iqsOThPW9kD9EGCbuN+Z9Y6UAd1mrEa9TcE17RCzrWlF+rEt3lO+6Z73AhEo69+/uv7ArWHLiO5
	22/kO0GK/xsshHT9sTfYProNRCqMhnGWXJyjggpQXQn0jGp37LYqioIG0/GFXzoWMV7w89+yswOLZ
	4hOKlmiVzxuiD2aBF0d3nZG+yaoZQdJDuosBnb0ZXCSLZ1gx0mx9E/viraETzKFP2B6d8inI2fRZS
	s9YS0RbZpfipBZACew+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvjJ-0000000CYmA-3ATy;
	Fri, 14 Nov 2025 15:28:53 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvjH-0000000CYgt-15Qi
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 15:28:52 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id EBCCD227A88; Fri, 14 Nov 2025 16:28:40 +0100 (CET)
Date: Fri, 14 Nov 2025 16:28:40 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jeff Layton <jlayton@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
	Jan Kara <jack@suse.cz>, Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>,
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	gfs2@lists.linux.dev, io-uring@vger.kernel.org,
	devel@lists.orangefs.org, linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: Re: re-enable IOCB_NOWAIT writes to files
Message-ID: <20251114152840.GD30351@lst.de>
References: <20251114062642.1524837-1-hch@lst.de> <b7e8d5e3a0ce8da103f4591afc1f4a9c683ef3c7.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b7e8d5e3a0ce8da103f4591afc1f4a9c683ef3c7.camel@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_072851_451496_B34F8786 
X-CRM114-Status: GOOD (  13.74  )
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

On Fri, Nov 14, 2025 at 09:04:58AM -0500, Jeff Layton wrote:
> This all looks pretty reasonable to me. There are a few changelog and
> subject line typos, but the code changes look fine. You can add:

Please tell me about them so I can fix them. 

> As far as nfsd's usage of FMODE_NOCMTIME, it looks OK to me. That's
> implemented today by the check in file_modified_flags(), which is
> generic and should work across filesystems.

Nothing requires file_update_time / file_modified_flags are helpers
that a file system may or may not call.  I've not done an audit
if everyone actually uses them.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

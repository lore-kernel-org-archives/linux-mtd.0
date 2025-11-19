Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F829CF258F
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Nov 2025 06:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YvlJR+TL6O0hMjo24hnwYUhiNdw7BbBJClbdJLGd37c=; b=Z3QuF1h0jGaA7F
	ll/j8XNlY+cNBYs40p+VY7zdQIS3Hw/OIwCAfcbfXLatuvKTeMwsgPl6CsDn2+dQBSqUyGFD80w5I
	B7BJmKJxxqyI28k+hcrPrEdqcvO90AikU4RjD9QeSOFOxpdRXw8aTscqlFzMCBXeoV2F5xdY/iMD5
	yCbvjvUTAnFlkLEUK2vJqLbZUCbyeif3vua+yqY0rG2BWbwb3dCUIWZiqMEml8mlPH5B5Ct6zRk7u
	+JV98UTT5yubCPicsgOOJy9a86tlHgz3eEaKMJ6VgYfmDmplPvo3dSFPWVXlumHPoEbmpj0N9tZto
	visRAn6O1qFyN+pZg66w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLbgD-00000002dPO-2sLd;
	Wed, 19 Nov 2025 06:28:37 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLbgB-00000002dOz-2Pu2
	for linux-mtd@lists.infradead.org;
	Wed, 19 Nov 2025 06:28:36 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2B98C68AFE; Wed, 19 Nov 2025 07:28:31 +0100 (CET)
Date: Wed, 19 Nov 2025 07:28:30 +0100
From: Christoph Hellwig <hch@lst.de>
To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
	Jan Kara <jack@suse.cz>, Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
	"gfs2@lists.linux.dev" <gfs2@lists.linux.dev>,
	"io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
	"devel@lists.orangefs.org" <devel@lists.orangefs.org>,
	"linux-unionfs@vger.kernel.org" <linux-unionfs@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>
Subject: Re: [PATCH 10/14] fs: factor out a sync_lazytime helper
Message-ID: <20251119062830.GB20592@lst.de>
References: <20251114062642.1524837-1-hch@lst.de> <20251114062642.1524837-11-hch@lst.de> <cff9dffc-dd49-45db-bc47-efab498065c4@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cff9dffc-dd49-45db-bc47-efab498065c4@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_222835_780924_7155B3F9 
X-CRM114-Status: GOOD (  13.49  )
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

On Mon, Nov 17, 2025 at 07:38:29AM +0000, Chaitanya Kulkarni wrote:
> 
> This sync_lazytime() will always return false ?
> shouldn't this be returning true at sometime if not then why not
> change return type to void ?
> 
> returning same value doesn't add any value here ..

Yes, it should return true when actually doing work.  So currently the
syncing on final inode eviction is broken, but it looks like non of the
tests actually hits it.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

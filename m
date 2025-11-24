Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3A9CFA466
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Nov 2025 14:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMVxzt4NOV/MX0zr5Zn6ZnrEGNxR3TYirIY9rzny7b8=; b=0yiCDhYjgl2LYv
	yATVntFgAq7HUx+xZ9X0gXXEwEw+uSZGjrVe+NwIfw2xjY46vL3UkTeFxqwz/bzSH6vZkbdIo1EDF
	v/bC6FCKQAXKxRhl/3NGHW7gDVI0cTLAalcYc8pdEKYjBtfVpHUkZB8GZ2PuAfR6oEcn4aV+OrkM8
	VeVgzcWMCASIZINoMvMW9grfKWES95gqnwdajJndBzR97Z9PMVTwnwaFtYTHIM3DPRkx2gJfq1Z1Z
	Y/DWlq9vbIGUQHfPe7j6vOef/lJ3DvQD0IQjwXx4JaSNB3aP/Uz1DYsQQBzzQ3FJBYigdr2n443oj
	b/rC3/3ecHj8bYwRioSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNXEQ-0000000BoXf-3IOB;
	Mon, 24 Nov 2025 14:07:54 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNXEO-0000000BoX7-38gb
	for linux-mtd@lists.infradead.org;
	Mon, 24 Nov 2025 14:07:54 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id A379A68B05; Mon, 24 Nov 2025 15:07:47 +0100 (CET)
Date: Mon, 24 Nov 2025 15:07:46 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev,
	io-uring@vger.kernel.org, devel@lists.orangefs.org,
	linux-unionfs@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 09/14] fs: factor out a mark_inode_dirty_time helper
Message-ID: <20251124140746.GA14417@lst.de>
References: <20251114062642.1524837-1-hch@lst.de> <20251114062642.1524837-10-hch@lst.de> <fbym7i2zelbatxbhy5eeffwpa3ni7bstjddbf7ran7djzthwjo@kfxj3wrxeuou>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fbym7i2zelbatxbhy5eeffwpa3ni7bstjddbf7ran7djzthwjo@kfxj3wrxeuou>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_060752_947693_59CAA34C 
X-CRM114-Status: GOOD (  16.21  )
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

On Mon, Nov 24, 2025 at 02:22:59PM +0100, Jan Kara wrote:
> What I find a bit concerning here is that mark_inode_dirty_time() takes a
> different kind of flags than __mark_inode_dirty() so it's relatively easy
> to confuse. Proper typing of 'flags' would be nice here but it's a bit
> cumbersome to do in C so I'm not sure if it's worth it for this relatively
> limited use. So I guess feel free to add:

Adding a __bitwise annotation for the S_ flags seems easy enough
as there's not a whole lot of variables/arguments of that time.  I can
do that as a follow-on.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

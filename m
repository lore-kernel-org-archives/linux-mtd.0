Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFBCD68BE1
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Dec 2025 06:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VlXSz66p2jhdpa1mbxqS1aQY9rYxF8IMTz/MQwV5vRs=; b=zpYS35XthIf+R+
	ffi0weIxgMKHjgS5bm+/xe6qTLD3r9jpGdV6tWu06DX+VDohsbApryBTvbwHQVop4G1K8nzYFRfWH
	cABpmBesJbhl3D3LvNnz1J/w7D2Sdt6ak6B04sjvOzANjYJAczGlav2T28UZSXRl3llM9cWkDEtlL
	OAnfORXpF5uRZPaG14mo0v4/SnX/WMP5p20oVN/XUOQdjY/eUzWtpsvuz/jJxKlM62XJBl+bABNjy
	ZoarQijbWZH+t5Jv6RRnotWPU2XcmBVionBGvZ5FLHIHtNT4qXE2zx2iYE9yoGIgB2+iHTt8kG/9s
	vuza4VfYAYC6goyzH4oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW7Gf-00000007seP-0nC5;
	Thu, 18 Dec 2025 06:13:41 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW7Ga-00000007sdR-2TgQ
	for linux-mtd@lists.infradead.org;
	Thu, 18 Dec 2025 06:13:38 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 41DC7227A88; Thu, 18 Dec 2025 07:13:18 +0100 (CET)
Date: Thu, 18 Dec 2025 07:13:17 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	gfs2@lists.linux.dev, io-uring@vger.kernel.org,
	devel@lists.orangefs.org, linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: Re: [PATCH 07/10] fs: add a ->sync_lazytime method
Message-ID: <20251218061317.GA2775@lst.de>
References: <20251217061015.923954-1-hch@lst.de> <20251217061015.923954-8-hch@lst.de> <ghtgokkzdo7owrkfkpittqlc6xvjhr5w4eprbq5gcszqpmy7z3@7m3ecvlqfrzu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ghtgokkzdo7owrkfkpittqlc6xvjhr5w4eprbq5gcszqpmy7z3@7m3ecvlqfrzu>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_221336_798026_F279852E 
X-CRM114-Status: GOOD (  17.12  )
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

On Wed, Dec 17, 2025 at 01:30:18PM +0100, Jan Kara wrote:
> >  	if (flags & I_DIRTY_INODE) {
> > +		bool was_dirty_time =
> > +			inode_state_read_once(inode) & I_DIRTY_TIME;
> > +
> >  		/*
> >  		 * Inode timestamp update will piggback on this dirtying.
> >  		 * We tell ->dirty_inode callback that timestamps need to
> >  		 * be updated by setting I_DIRTY_TIME in flags.
> >  		 */
> > -		if (inode_state_read_once(inode) & I_DIRTY_TIME) {
> > +		if (was_dirty_time) {
> >  			spin_lock(&inode->i_lock);
> >  			if (inode_state_read(inode) & I_DIRTY_TIME) {
> >  				inode_state_clear(inode, I_DIRTY_TIME);
> >  				flags |= I_DIRTY_TIME;
> > +				was_dirty_time = true;
> 
> This looks bogus. was_dirty_time is already true here. What I think you
> wanted here is to set it to false if locked I_DIRTY_TIME check failed.
> Otherwise the patch looks good.

Or better set it to false at initialization time and only set it to
true here to simply things a bit.  But otherwise: yes.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

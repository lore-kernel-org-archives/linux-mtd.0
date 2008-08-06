Received: from mail.fieldses.org ([66.93.2.214] helo=fieldses.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KQp7m-0003rz-3q
	for linux-mtd@lists.infradead.org; Wed, 06 Aug 2008 19:56:46 +0000
Date: Wed, 6 Aug 2008 15:56:35 -0400
To: Neil Brown <neilb@suse.de>, chucklever@gmail.com,
	David Woodhouse <dwmw2@infradead.org>, viro@zeniv.linux.org.uk,
	Christoph Hellwig <hch@infradead.org>,
	linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [RFC] Reinstate NFS exportability for JFFS2.
Message-ID: <20080806195635.GA31126@fieldses.org>
References: <1217607571.3454.417.camel@pmac.infradead.org>
	<76bd70e30808011047u3cd0a56cg3b2d62e01afed014@mail.gmail.com>
	<20080802182644.GE30454@fieldses.org>
	<18581.40178.976747.769343@notabene.brown>
	<76bd70e30808031015l36db41bexf319e85ba7acc4e9@mail.gmail.com>
	<18582.21855.2092.903688@notabene.brown>
	<76bd70e30808032319u65e35dbdj9cc5be07e1aef829@mail.gmail.com>
	<20080805085157.GG21635@disturbed>
	<18584.56584.98868.881298@notabene.brown>
	<20080806000805.GJ21635@disturbed>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080806000805.GJ21635@disturbed>
From: "J. Bruce Fields" <bfields@fieldses.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

So the only solution that seems to really be holding up (at least for
the near term) is the double-buffering "hack"; could we get a version of
that with Neil's review comments addressed?

--b.

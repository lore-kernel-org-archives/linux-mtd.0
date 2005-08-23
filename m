From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050823124649.GB30853@wohnheim.fh-wedel.de>
References: <430AF95F.1050704@ak.jp.nec.com>
	<20050823124649.GB30853@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Aug 2005 13:52:48 +0100
Message-Id: <1124801569.29448.13.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ma Yun <sx_yunma@hotmail.com>, linux-mtd@lists.infradead.org,
	Kaigai Kohei <kaigai@ak.jp.nec.com>
Subject: Re: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-08-23 at 14:46 +0200, Jörn Engel wrote:
> Which is quite nice.  Would you two mind reading the others patch and
> stating what is bad at that one and why your's is better?  If there is
> a clear winner in this batter, we should merge that one. 

I'm happier with inventing new node types for xattrs instead of re-using
existing nodes, I think. And I'd also like to make sure we can share
xattr data on the medium where appropriate. In an selinux system, you'll
end up with a _multitude_ of xattrs used for selinux, many of which will
have precisely the same contents. Each should be stored only once on the
flash, like hard links. The ext2 implementation manages this.

-- 
dwmw2

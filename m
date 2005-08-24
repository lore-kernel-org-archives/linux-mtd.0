Received: from tyo202.gate.nec.co.jp ([210.143.35.52])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7rt6-0007ZQ-9T
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2005 05:49:44 -0400
Message-ID: <430C429B.6040500@ak.jp.nec.com>
Date: Wed, 24 Aug 2005 18:49:15 +0900
From: Kaigai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <430AF95F.1050704@ak.jp.nec.com>	<20050823124649.GB30853@wohnheim.fh-wedel.de>
	<1124801569.29448.13.camel@hades.cambridge.redhat.com>
In-Reply-To: <1124801569.29448.13.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: James Morris <jmorris@redhat.com>, linux-mtd@lists.infradead.org,
	Stephen Smalley <sds@tycho.nsa.gov>, Ma Yun <sx_yunma@hotmail.com>
Subject: Re: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, Thanks for your comments.

David Woodhouse wrote:
> I'm happier with inventing new node types for xattrs instead of re-using
> existing nodes, I think. And I'd also like to make sure we can share
> xattr data on the medium where appropriate. In an selinux system, you'll
> end up with a _multitude_ of xattrs used for selinux, many of which will
> have precisely the same contents. Each should be stored only once on the
> flash, like hard links. The ext2 implementation manages this.

Indeed, it is key concept to separate the relationship between inode and
XATTR from XATTR-entry which contain name/value.
In my implementation, an increase/decrease of inode which shares XATTR-entry
does not need to update the XATTR-entry. It's represented by an existance of
XATTR-reference node. Therefore, it's possible to update less frequently.

If this approach is acceptable, I'm willing to implement something to do.
* Dividing the global xattr_sem semaphore into more small lock.
* Indexing the XATTR-entry by its contains, for fast looking-up shared entry.
and, Stephen suggested as follows:
* Using generic_{set|get|list}xattr method like ext2/3.

Thanks,
-- 
Linux Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>

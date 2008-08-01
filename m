Subject: Re: [RFC] Reinstate NFS exportability for JFFS2.
From: David Woodhouse <dwmw2@infradead.org>
To: Neil Brown <neilb@suse.de>
In-Reply-To: <1217551230.3719.15.camel@shinybook.infradead.org>
References: <1209670979.25560.587.camel@pmac.infradead.org>
	<20080501204820.GA5951@infradead.org>
	<1209681898.25560.613.camel@pmac.infradead.org>
	<18458.28833.539314.455215@notabene.brown>
	<1217541264.1126.15.camel@shinybook.infradead.org>
	<18578.21997.529551.676627@notabene.brown>
	<1217551230.3719.15.camel@shinybook.infradead.org>
Content-Type: text/plain
Date: Fri, 01 Aug 2008 01:52:56 +0100
Message-Id: <1217551976.3719.24.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-08-01 at 01:40 +0100, David Woodhouse wrote:
> For any file system which has its own internal locking -- which includes
> jffs2, btrfs, xfs, jfs, gfs*, ocfs* and probably others -- that
> recursive call back into the file system will deadlock.

It _would_ deadlock, I mean. They each have their own strategy to avoid
it, for now. jffs2 and btrfs just don't provide export_ops so they avoid
the problem, but we'd _like_ to be able to export them. xfs has the hack
I've just transplanted. gfs2 has a 'lock is owned by me' check. Not sure
about the others.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation

Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHfIs-0001tt-GD
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 06:25:57 -0400
Date: Tue, 20 Sep 2005 12:24:36 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050920102436.GC2143@wohnheim.fh-wedel.de>
References: <BAY17-F171945FE7F31D429CCE8BEE8950@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F171945FE7F31D429CCE8BEE8950@phx.gbl>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Add JFFS2 eraseblock header support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 20 September 2005 15:45:37 +0800, zhao forrest wrote:
> 
> This is the patch for eraseblock header, the high-level design
> can be found at http://lists.infradead.org/pipermail/linux-mtd/
> 2005-August/013374.html.
> 
> This patch closely follows the high-level design. Here I list
> some main implementation points:
> 1 eraseblock_header replaces clean marker, clean marker no
> longer exists.
> 2 now eraseblock header carrys version and erase count, but the
> length of eraseblock header is not constant and it allows further
> extention.
> 3 for NAND flash, the eraseblock header is stored in OOB and it
> may span several OOBs
> 4 old JFFS2 binaries reject mounting new JFFS2 images

Why this?

> 5 change the type of dirent/inode nodes and adding INCOMPAT flag
> there in order to make old JFFS2 binaries reject mounting new
> JFFS2 images for NAND flash

Why?

> 6 new JFFS2 binary, when mounting an old JFFS2 image, will reject
> mounting unless the old JFFS2 image doesn't use 1:N(N>1)mapping.

I wouldn't waste code on this.

> 7 If JFFS2 finds that the version of the image is larger, it will
> reject mounting the image

Really bad idea.  Incompatible changes won't make users rejoice.  Have
a look at ext2:
	__le32	s_feature_compat; 	/* compatible feature set */
	__le32	s_feature_incompat; 	/* incompatible feature set */
	__le32	s_feature_ro_compat; 	/* readonly-compatible feature set */

The destinction between compatible, incompatible and ro-compatible
features is done for a reason.  If a new feature is harmless to
ignore, like EXT2_FEATURE_COMPAT_DIR_PREALLOC, there is no reason not
to mount the filesystem.  New feature is just a performance thing,
nothing more.

JFFS2 has the same for node types, you should know that.  Rationale is
the same.

So if we need a version (which I was always against, as you may
remember), we should at least express it as three sets of features.

> 8 currently this patch doesn't take the "eraseblock summary" patch
> into account. It's greatly appreciated if Ferenc can help to add
> the missing part :)

He can't.  It's against the rules of physics.

Jörn

-- 
People will accept your ideas much more readily if you tell them
that Benjamin Franklin said it first.
-- unknown

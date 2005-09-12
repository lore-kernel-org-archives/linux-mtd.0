Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EEhzf-0003IM-6Q
	for linux-mtd@lists.infradead.org; Mon, 12 Sep 2005 02:40:55 -0400
Date: Mon, 12 Sep 2005 08:40:38 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Kaigai Kohei <kaigai@ak.jp.nec.com>
Message-ID: <20050912064038.GA21304@wohnheim.fh-wedel.de>
References: <20050823124649.GB30853@wohnheim.fh-wedel.de>
	<1124801569.29448.13.camel@hades.cambridge.redhat.com>
	<430C429B.6040500@ak.jp.nec.com> <431E772B.9090004@ak.jp.nec.com>
	<20050908194915.GG20668@wohnheim.fh-wedel.de>
	<43210C7A.60109@ak.jp.nec.com>
	<20050909072416.GA19251@wohnheim.fh-wedel.de>
	<43225DEB.4070809@ak.jp.nec.com>
	<20050911114642.GA11788@wohnheim.fh-wedel.de>
	<4324E525.60805@ak.jp.nec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4324E525.60805@ak.jp.nec.com>
Cc: James Morris <jmorris@redhat.com>, Ma Yun <sx_yunma@hotmail.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Stephen Smalley <sds@tycho.nsa.gov>
Subject: Re: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 12 September 2005 11:17:09 +0900, Kaigai Kohei wrote:
> >
> >Sounds scary.  But in principle, you are right.  In case of either 1
> >or 3, we attach "something" to next_in_ino.  Now we only have to
> >decide whether "something" is an inode, or the new xattr-struff.
> >
> >If you add an extra field to jffs2_inode_cache (which also is grossly
> >misnamed, old mistake), you can do so.  And since inodes are a lot
> >less frequent than raw nodes, the memory consumption should have
> >improved quite a bit.
> 
> I prefer this kind of approach than other one. It's simple solution.
> I'm afraid of breaking something to be assumed implicitly by reserving
> some inode-numbers.
> 
> And, how about such an idea ?
> Currently, the variable of 'state' in jffs2_inode_cache is defined
> as int type, but the range of this variable is between 0 and 6.
> In general case, 'int' has 32-bit width.  It's so much for this field.
> 
> For example, we can redefine the 'state' as 16-bit width variable,
> and insert a new 16-bit width variable to discriminate own object.
> If acceptable, it can also keep the memory comsumption for 
> jffs2_inode_cache.

Yes, that sounds fine.

> In this plan, jffs2_inode_cahce and jffs2_xattr_datum will be defined as 
> follows:
> struct jffs2_inode_cache {
>     struct jffs2_full_dirent *scan_dents;
>     uint16_t class; /* =0 means jffs2_inode_cache */
>     uint16_t state;
>        :
> 
> struct jffs2_xattr_datum {
>     void *dummy;    /* always NULL */
>     uint16_t class; /* =1 means jffs2_xattr_datum */
>        :

You could even make the class a u8.  For inodes, the remaining 8 bits
would just be reserved space for proper alignment.  If either of your
xattr object could make use of the extra byte, it would be worth it.
If not, just ignore my silly idea.

> I see, jffs2_scan_eraseblock() is indeed a bit long.
> Please send your attempt patches at first.
> I'll try to cleanup it for the basis of XATTR patch.

It was 34 patches going over all of jffs2, actually.  I guess it's
easier to send the changed scan.c.  The pseudo-random stuff was
controversial, so I lost interest after a while.

> >This is just wrong.  I agree that something inside the kernel must
> >know whether users need specific capabilities to read/write the xattr.
> >Sure.  But why in hell does it have to be JFFS2?
> >
> >How do other filesystems deal with this?  ext[23] and reiserfs (v3)
> >all have xattr, I believe.
> 
> Indeed, more upper layer might be able to manage this kind of decision
> making as you say. But it's transferred to the filesystem currently.
> All of them (ext2/3, reiser and so on) have own permission checking codes
> like 'fs/ext2/xattr_trusted.c', and I imitated those implementations.
> I don't know the reason correctly.

The code is not exactly easy to follow.  But it appears as if they
used that stuff for compression.  If prefix is "trusted.", just use an
e_name_index of 4 and drop the prefix.  It can be reconstructed on
reads.

Reiserfs doesn't worry about compression and has should-be-generic
code only.

I guess it would make sense to copy the compression stuff from ext2,
at least the concept.

Jörn

-- 
Don't patch bad code, rewrite it.
-- Kernigham and Pike, according to Rusty

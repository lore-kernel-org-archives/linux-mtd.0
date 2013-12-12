Received: from zimbra13.linbit.com ([212.69.166.240])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrBag-0006Zs-Hl
 for linux-mtd@lists.infradead.org; Thu, 12 Dec 2013 19:06:31 +0000
Date: Thu, 12 Dec 2013 20:06:09 +0100 (CET)
From: Andreas Gruenbacher <andreas.gruenbacher@linbit.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <1724169901.69108.1386875169382.JavaMail.zimbra@linbit.com>
In-Reply-To: <20131211104526.648135334@bombadil.infradead.org>
References: <20131211104243.148113893@bombadil.infradead.org>
 <20131211104526.648135334@bombadil.infradead.org>
Subject: Re: [PATCH 02/18] fs: add get_acl helper
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: xfs@oss.sgi.com, Jan Kara <jack@suse.cz>, Mark Fasheh <mfasheh@suse.com>,
 reiserfs-devel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mtd@lists.infradead.org,
 viro@zeniv.linux.org.uk, jfs-discussion@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Christoph,

> +struct posix_acl *get_acl(struct inode *inode, int type)
> +{
> +	struct posix_acl *acl;
> +
> +	acl = get_cached_acl(inode, type);
> +	if (acl != ACL_NOT_CACHED)
> +		return acl;
> +
> +	if (!IS_POSIXACL(inode))
> +		return NULL;
> +
> +	/*
> +	 * A filesystem can force a ACL callback by just never filling the
> +	 * ACL cache. But normally you'd fill the cache either at inode
> +	 * instantiation time, or on the first ->get_acl call.
> +	 *
> +	 * If the filesystem doesn't have a get_acl() function at all, we'll
> +	 * just create the negative cache entry.
> +	 */
> +	if (!inode->i_op->get_acl) {
> +		set_cached_acl(inode, type, NULL);
> +		return ERR_PTR(-EAGAIN);

The function should return NULL here.

Andreas

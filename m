Received: from zimbra13.linbit.com ([212.69.166.240])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrBbp-0006ex-Iv
 for linux-mtd@lists.infradead.org; Thu, 12 Dec 2013 19:07:43 +0000
Date: Thu, 12 Dec 2013 20:07:20 +0100 (CET)
From: Andreas Gruenbacher <andreas.gruenbacher@linbit.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <389888733.69110.1386875240679.JavaMail.zimbra@linbit.com>
In-Reply-To: <20131211104527.223923019@bombadil.infradead.org>
References: <20131211104243.148113893@bombadil.infradead.org>
 <20131211104527.223923019@bombadil.infradead.org>
Subject: Re: [PATCH 05/18] fs: make posix_acl_chmod more useful
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

> +int
> +posix_acl_chmod(struct inode *inode)
> +{
> +	struct posix_acl *acl;
> +	int ret = 0;
> +
> +	if (S_ISLNK(inode->i_mode) || !inode->i_op->set_acl)
> +		return -EOPNOTSUPP;

Symlinks never have get_acl callbacks, so I would remove the S_ISLNK() check here.

Andreas

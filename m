Date: Thu, 12 Dec 2013 13:05:31 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <andreas.gruenbacher@linbit.com>
Subject: Re: [PATCH 16/18] gfs2: use generic posix ACL infrastructure
Message-ID: <20131212210531.GC27686@infradead.org>
References: <20131211104243.148113893@bombadil.infradead.org>
 <20131211104529.142731540@bombadil.infradead.org>
 <966512490.69128.1386875318581.JavaMail.zimbra@linbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <966512490.69128.1386875318581.JavaMail.zimbra@linbit.com>
Cc: cluster-devel@redhat.com, xfs@oss.sgi.com, Mark Fasheh <mfasheh@suse.com>,
 reiserfs-devel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
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

On Thu, Dec 12, 2013 at 08:08:38PM +0100, Andreas Gruenbacher wrote:
> Christoph,
> 
> gfs2 has a left-over get_acl callback in gfs2_symlink_iops in
> fs/gfs2/inode.c, from a long time ago, which should be removed
> as well.

Ok, will fix.

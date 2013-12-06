Date: Fri, 6 Dec 2013 11:46:37 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <andreas.gruenbacher@linbit.com>
Subject: Re: [PATCH 00/18] Consolidate Posix ACL implementation
Message-ID: <20131206194637.GA32122@infradead.org>
References: <20131201115903.910559036@bombadil.infradead.org>
 <279325185.39210.1386266234086.JavaMail.zimbra@linbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <279325185.39210.1386266234086.JavaMail.zimbra@linbit.com>
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

On Thu, Dec 05, 2013 at 06:57:14PM +0100, Andreas Gruenbacher wrote:
> I see that get_acl and set_acl are being defined in some but not all symlink inode operations (for example, btrfs them while ext4 does not), and that posix_acl_xattr_set() doesn't check if set_acl is defined.  Symlinks cannot have ACLs, so set_acl should either never be defined for symlinks (and a NULL check is then needed in posix_acl_xattr_set()), or it is defined in all inode operations, and S_ISNLNK() check is needed in posix_acl_xattr_set().  That latter check should probably be added in any case to be on the safe side.

Yes, we should add the check.  We also in general should not have
set_acl/get_acl on links and I'll look over it.

> Patch 6 also declares posix_acl_prepare() but this function is never introduced; this must be a leftover from a previous version.

Indeed.

Thanks for the review!

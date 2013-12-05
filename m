Received: from zimbra13.linbit.com ([212.69.166.240])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VodBI-0000Mm-C1
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 17:57:45 +0000
Date: Thu, 5 Dec 2013 18:57:14 +0100 (CET)
From: Andreas Gruenbacher <andreas.gruenbacher@linbit.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <279325185.39210.1386266234086.JavaMail.zimbra@linbit.com>
In-Reply-To: <20131201115903.910559036@bombadil.infradead.org>
References: <20131201115903.910559036@bombadil.infradead.org>
Subject: Re: [PATCH 00/18] Consolidate Posix ACL implementation
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: xfs@oss.sgi.com, Mark Fasheh <mfasheh@suse.com>,
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

nice work, and a pretty diffstat.

I see that get_acl and set_acl are being defined in some but not all symlink inode operations (for example, btrfs them while ext4 does not), and that posix_acl_xattr_set() doesn't check if set_acl is defined.  Symlinks cannot have ACLs, so set_acl should either never be defined for symlinks (and a NULL check is then needed in posix_acl_xattr_set()), or it is defined in all inode operations, and S_ISNLNK() check is needed in posix_acl_xattr_set().  That latter check should probably be added in any case to be on the safe side.

  Test case:

  setfattr -h -n system.posix_acl_access \
           -v 0sAgAAAAEABgD/////AgAGABMEAAAEAAYA/////xAABgD/////IAAEAP////8= \
           symlink

Patch 6 also declares posix_acl_prepare() but this function is never introduced; this must be a leftover from a previous version.

Thanks,
Andreas

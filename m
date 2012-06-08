Date: Fri, 8 Jun 2012 23:23:37 +0100
From: Al Viro <viro@ZenIV.linux.org.uk>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [RFC, PATCH, RESEND] fs: push rcu_barrier() from
 deactivate_locked_super() to filesystems
Message-ID: <20120608222337.GR30000@ZenIV.linux.org.uk>
References: <1339191663-17693-1-git-send-email-kirill.shutemov@linux.intel.com>
 <20120608150253.e42464a6.akpm@linux-foundation.org>
 <20120608221446.GA18250@otc-wbsnb-06>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120608221446.GA18250@otc-wbsnb-06>
Sender: Al Viro <viro@ftp.linux.org.uk>
Cc: jfs-discussion@lists.sourceforge.net, "Dmitry V. Levin" <ldv@altlinux.org>,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 codalist@TELEMANN.coda.cs.cmu.edu, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Boaz Harrosh <bharrosh@panasas.com>,
 v9fs-developer@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 Nick Piggin <npiggin@kernel.dk>, fuse-devel@lists.sourceforge.net,
 Tao Ma <boyu.mt@taobao.com>, ecryptfs@vger.kernel.org,
 reiserfs-devel@vger.kernel.org, osd-dev@open-osd.org,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, logfs@logfs.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-btrfs@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 09, 2012 at 01:14:46AM +0300, Kirill A. Shutemov wrote:
> > The implementation would be less unpleasant if we could do the
> > rcu_barrier() in kmem_cache_destroy().  I can't see a way of doing that
> > without adding a dedicated slab flag, which would require editing all
> > the filesystems anyway.
> 
> I think rcu_barrier() for all kmem_cache_destroy() would be too expensive.

You've got to be kidding.  Please, show us the codepath that would be hot
enough to make that too expensive and would contain kmem_cache_destroy().
Note that module unload is *not* a hot path - not on any even remotely sane
use.

MIME-Version: 1.0
Sender: linus971@gmail.com
In-Reply-To: <20120608220049.GA18024@otc-wbsnb-06>
References: <1339191663-17693-1-git-send-email-kirill.shutemov@linux.intel.com>
 <20120608220049.GA18024@otc-wbsnb-06>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 8 Jun 2012 15:06:20 -0700
Message-ID: <CA+55aFxbEk0k0jYtkn-H-sT0m4Fy5pH_OQZiPwCtwMvh22-3-w@mail.gmail.com>
Subject: Re: [RFC, PATCH] fs: push rcu_barrier() from deactivate_locked_super()
 to filesystems
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: jfs-discussion@lists.sourceforge.net, "Dmitry V. Levin" <ldv@altlinux.org>,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, Boaz Harrosh <bharrosh@panasas.com>,
 v9fs-developer@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 Nick Piggin <npiggin@kernel.dk>, fuse-devel@lists.sourceforge.net,
 Tao Ma <boyu.mt@taobao.com>, ecryptfs@vger.kernel.org,
 reiserfs-devel@vger.kernel.org, osd-dev@open-osd.org,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, logfs@logfs.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-btrfs@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 8, 2012 at 3:00 PM, Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> IIUC, moving rcu_barrier() up should help, but I can't say that I fully
> understand SLAB_DESTROY_BY_RCU semantics.

.. hmm. I think you may be right. Even if we do move it up, we
probably shouldn't use it.

We don't even want SLAB_DESTROY_BY_RCU, since we do the delayed RCU
free for other reasons anyway, so it would duplicate the RCU delaying
and cause problems. I forgot about that little complication.

We could have a separate "RCU_BARRIER_ON_DESTROY" thing, but that's
just silly too.

Maybe your patch is the right thing.

            Linus

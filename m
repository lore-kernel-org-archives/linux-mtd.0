Date: Wed, 27 Apr 2016 22:30:10 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Chris Mason <clm@fb.com>, Jan Kara <jack@suse.cz>,
 ceph-devel@vger.kernel.org, cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org, logfs@logfs.org, xfs@oss.sgi.com,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, reiserfs-devel@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1.2/2] mm: introduce memalloc_nofs_{save,restore} API
Message-ID: <20160427203010.GD22544@dhcp22.suse.cz>
References: <1461671772-1269-2-git-send-email-mhocko@kernel.org>
 <1461758075-21815-1-git-send-email-mhocko@kernel.org>
 <1461758075-21815-2-git-send-email-mhocko@kernel.org>
 <20160427200927.GC22544@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160427200927.GC22544@dhcp22.suse.cz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed 27-04-16 22:09:27, Michal Hocko wrote:
[...]
> [   53.993480]   [<ffffffff810945e3>] mark_held_locks+0x5e/0x74
> [   53.993480]   [<ffffffff8109722c>] lockdep_trace_alloc+0xb2/0xb5
> [   53.993480]   [<ffffffff81174e56>] kmem_cache_alloc+0x36/0x2b0

Scratch that. I got it. It is the lockdep annotation which I got wrong
with my patch. I thought this was done much later in the slow path.
My head is burnt so I will get back to it tomorrow. The patch 1.1 should
be OK to go for XFS though because it doesn't really introduce anything
new.

Sorry about the noise!
-- 
Michal Hocko
SUSE Labs

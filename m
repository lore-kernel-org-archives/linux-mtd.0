Date: Wed, 27 Apr 2016 15:07:12 +0200
From: Michal Hocko <mhocko@kernel.org>
To: linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Dave Chinner <david@fromorbit.com>, Theodore Ts'o <tytso@mit.edu>,
 Chris Mason <clm@fb.com>, Jan Kara <jack@suse.cz>,
 ceph-devel@vger.kernel.org, cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org, logfs@logfs.org, xfs@oss.sgi.com,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, reiserfs-devel@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1.2/2] mm: introduce memalloc_nofs_{save,restore} API
Message-ID: <20160427130712.GK2179@dhcp22.suse.cz>
References: <1461671772-1269-2-git-send-email-mhocko@kernel.org>
 <1461758075-21815-1-git-send-email-mhocko@kernel.org>
 <1461758075-21815-2-git-send-email-mhocko@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461758075-21815-2-git-send-email-mhocko@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed 27-04-16 13:54:35, Michal Hocko wrote:
> From: Michal Hocko <mhocko@suse.com>
> 

Ups missed Dave's note about:

> GFP_NOFS context is used for the following 4 reasons currently
> 	- to prevent from deadlocks when the lock held by the allocation
> 	  context would be needed during the memory reclaim
> 	- to prevent from stack overflows during the reclaim because
> 	  the allocation is performed from a deep context already
> 	- to prevent lockups when the allocation context depends on
> 	  other reclaimers to make a forward progress indirectly
> 	- just in case because this would be safe from the fs POV

	- silence lockdep false positives
-- 
Michal Hocko
SUSE Labs

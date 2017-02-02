From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, linux-block@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-mtd@lists.infradead.org,
 linux-nfs@vger.kernel.org, Petr Vandrovec <petr@vandrovec.name>,
 linux-nilfs@vger.kernel.org, cluster-devel@redhat.com,
 osd-dev@open-osd.org, codalist@coda.cs.cmu.edu,
 linux-afs@lists.infradead.org, ecryptfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 lustre-devel@lists.lustre.org
Subject: [PATCH 0/24 RFC] fs: Convert all embedded bdis into separate ones
Date: Thu,  2 Feb 2017 18:33:58 +0100
Message-Id: <20170202173422.3240-1-jack@suse.cz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

this patch series converts all embedded occurences of struct backing_dev_info
to use standalone dynamically allocated structures. This makes bdi handling
unified across all bdi users and generally removes some boilerplate code from
filesystems setting up their own bdi. It also allows us to remove some code
from generic bdi implementation.

The patches were only compile-tested for most filesystems (I've tested
mounting only for NFS & btrfs) so fs maintainers please have a look whether
the changes look sound to you.

This series is based on top of bdi fixes that were merged into linux-block
git tree.

								Honza

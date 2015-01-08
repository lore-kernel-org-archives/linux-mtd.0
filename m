From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@fb.com>
Subject: backing_dev_info cleanups & lifetime rule fixes
Date: Thu,  8 Jan 2015 18:45:21 +0100
Message-Id: <1420739133-27514-1-git-send-email-hch@lst.de>
Cc: linux-nfs@vger.kernel.org, linux-mm@kvack.org,
 David Howells <dhowells@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tejun Heo <tj@kernel.org>,
 ceph-devel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The first 8 patches are unchanged from the series posted a week ago and
cleans up how we use the backing_dev_info structure in preparation for
fixing the life time rules for it.  The most important change is to
split the unrelated nommu mmap flags from it, but it also remove a
backing_dev_info pointer from the address_space (and thus the inode)
and cleans up various other minor bits.

The remaining patches sort out the issues around bdi_unlink and now
let the bdi life until it's embedding structure is freed, which must
be equal or longer than the superblock using the bdi for writeback,
and thus gets rid of the whole mess around reassining inodes to new
bdis.

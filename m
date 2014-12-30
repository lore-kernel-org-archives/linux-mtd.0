From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@fb.com>
Subject: backing_dev_info cleanups
Date: Tue, 30 Dec 2014 09:57:31 +0100
Message-Id: <1419929859-24427-1-git-send-email-hch@lst.de>
Cc: David Howells <dhowells@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-mm@kvack.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series cleans up how we use the backing_dev_info structure in 
preparation for fixing the life time rules for it.  The most important
change is to split the unrelated nommu mmap flags from it, but it
also remove a backing_dev_info pointer from the address_space 
(and thus the inode) and cleans up various other minor bits.

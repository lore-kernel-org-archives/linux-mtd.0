Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxbS9-00075I-4D
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2004 21:10:54 -0400
Received: from [10.0.10.193] (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id SAA31411
	for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2004 18:10:49 -0700
Message-ID: <4123FE19.9000109@mvista.com>
Date: Wed, 18 Aug 2004 18:10:49 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: mtdblock cache flush at remount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

So far as I've been able to determine, the mtdblock cache is not 
automatically flushed after a remount read-only, including remounts 
performed by a sysrq-s emergency sync.

To pick the somewhat silly example of an ext3 filesystem, the "no 
recovery needed" superblock modification of which still sits in the 
cache after the remount:

# mount -o remount -o ro /mnt/mtd
# dumpe2fs /dev/mtd2
...
Filesystem features:      has_journal filetype needs_recovery sparse_super
...
# # Block access shows the modified value, and the mount/unmount
# # flushes the value to flash.
# dumpe2fs /dev/mtdblock2
...
Filesystem features:      has_journal filetype sparse_super
...
# dumpe2fs /dev/mtd2
...
Filesystem features:      has_journal filetype sparse_super

Since the block is committed from the block layer's point of view, even 
a following sync won't flush it out; it seems only something like an 
unmount (which explicitly calls the block device layer to release the 
superblock) will flush it.  In certain admittedly unusual situations 
this is undesirable (in particular, consumer electronics device flushing 
and marking clean filesystems prior to a prolonged system suspend 
interval during which it is expected batteries may die or be changed).

Figured I'd check whether anybody feels this is something that could and 
should be fixed or whether there's already a solution for this.  I've 
recommended use of only mtd-savvy filesystems like JFFS2 for this sort 
of usage, but the CE developers I talked to felt filesystems over 
mtdblock were also important.  Thanks,

-- 
Todd Poynor
MontaVista Software

Received: from gum.itee.uq.edu.au ([130.102.66.1])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HYBoI-0005D1-5G
	for linux-mtd@lists.infradead.org; Sun, 01 Apr 2007 21:58:20 -0400
Message-ID: <461057B4.8030209@itee.uq.edu.au>
Date: Mon, 02 Apr 2007 11:09:08 +1000
From: John Williams <jwilliams@itee.uq.edu.au>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org,
	uClinux development list <uclinux-dev@uclinux.org>
Subject: ENOENT creating /dev/root on MTD RAM partition
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm working on the 2.6 kernel for MicroBlaze (embedded, NOMMU) arch. 
Like some other nommu archs, we typically mount root on an MTD RAM 
partition (either CRAMFS or ROMFS).

All of this is working fine on 2.6.19 plus SnapGear 2.6.19-uc0-bigpatch 
NOMMU patchset.

However, since coming forward to 2.6.20 (plus equiv. SnapGear patchset) 
mount_root is failing.

Details follow, but basically create_dev(/dev/root, ROOT_DEV) is 
returning -ENOENT.  ROOT_DEV points to a valid MTD RAM partition, with a 
valid ROMFS (or CRAMFS, doesn't matter which) image. I've dumped the 
memory, the image is good.

Googling the various archives finds one or two past references to 
create_dev or do_mount_root returning -ENOENT on MTD RAM partitions, but 
I found no followups or solutions posted.

 From my bootlog:

uclinux[mtd]: RAM probe address=0x22182cc8 size=0x21d000
Creating 1 MTD partitions on "RAM":
0x00000000-0x0021d000 : "ROMfs"
mtd: Giving out device 5 to ROMfs
uclinux[mtd]: set ROMfs to be root filesystem index=5

...

((my debug output in namei.c))
hello from __link_walk_path(/dev/root)
__link_walk_path says -ENOENT
next:0x23ff4694
next.dentry:0x23e12d08

...

Kernel panic - not syncing: VFS: Unable to mount root fs on 
unknown-block(31,5)
  <0>Rebooting in 120 seconds..Machine restart...

I traced down into fs/namei.c - it's a fragment in 
__link_path_walk("/dev/root"):

line 892:
                 /* This does the actual lookups.. */
                 err = do_lookup(nd, &this, &next);
                 if (err)
                         break;
 
 

                 err = -ENOENT;
                 inode = next.dentry->d_inode;
                 if (!inode) {
---> we are hitting this error path
                         goto out_dput;

                 }

So, it seems that do_lookup is returning a dentry with no inode.

I've tried this with both ROMFS and CRAMFS types, with the same result. 
      If it was a random memory corruption event I'd expect to see 
different failure modes for the two filesystem types.

Any comments or suggestions on a possible cause or approach to track it 
down would be greatly appreciated.

Thanks,

John

Received: from web15707.mail.cnb.yahoo.com ([202.165.102.74])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C88Wm-0000QF-AI
	for linux-mtd@lists.infradead.org; Thu, 16 Sep 2004 22:31:17 -0400
Message-ID: <20040917023100.99191.qmail@web15707.mail.cnb.yahoo.com>
Date: Fri, 17 Sep 2004 10:31:00 +0800 (CST)
From: <gyf606-mtd@yahoo.com.cn>
To: David Woodhouse <dwmw2@infradead.org>, gyf606-mtd@yahoo.com.cn
In-Reply-To: <1095326635.9144.2198.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: jffs2 filesystem on flash problem CRC errpr
Reply-To: gyf606-mtd@yahoo.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 --- David Woodhouse <dwmw2@infradead.org> wrote:
> On Thu, 2004-09-16 at 11:10 +0800, gyf606-mtd@yahoo.com.cn wrote:
> > /usr> erase /dev/mtd4
> > Erase Total 1 Units
> > Performing Flash Erase of length 131072 at offset 0x0 done
> 
> You erased only the first block (128KiB) of the partition.
> 
> > /usr> cp fs2.img /dev/mtd4
> 
> You wrote the image using the character device, which does not erase
> first -- hence performing a bitwise 'OR' with the previous contents of
> the flash.
> 
> > /usr> mount -t jffs2 /dev/mtdblock4 /mnt
> 
> You mounted it.
> 
> > jffs2_scan_dirent_node(): Name CRC failed on node at 0x00000000: Read 0xca6598d0, calculated
> > 0x00000000
> 
> It was corrupt.
> 
> Use 'eraseall' instead of 'erase'.
> 
> -- 
> dwmw2
> 


Thank you for your attention, Mr. Woodhouse. I followed your suggestion, but the problem still
exists. Do you think maybe that's because of the bad format of the jffs2 image file(fs1.img)?
How can I get a good file to be mounted ? Is it platform independent? 

The following is the process I tried.

/bin> mount
rootfs on / type rootfs (rw)
/dev/root on / type nfs (rw,v2,rsize=4096,wsize=4096,hard,udp,nolock,addr=172.17.70.194)
/proc on /proc type proc (rw)
/dev/ram0 on /var type ext2 (rw)
/dev/ram1 on /etc/config type ext2 (rw)
/bin> cd /usr
/usr> ls
api
/usr> ls
api
fs1.img
fs2.img
/usr> cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00040000 00020000 "u-boot"
mtd1: 000a0000 00020000 "kernel"
mtd2: 00020000 00020000 "config"
mtd3: 00200000 00020000 "ramfs"
mtd4: 00100000 00020000 "jffs2fs"
mtd5: 00800000 00020000 "mtdram test device"
/usr> eraseall /dev/mtd4
Erased 1024 Kibyte @ 0 -- 100% complete.
/usr> cp fs1.img /dev/mtd4
/usr> mount -t jffs2 /dev/mtdblock4 /mnt
jffs2: read_super for device 1f:04
jffs2_scan_eraseblock(): Scanning block at 0x0
jffs2_scan_dirent_node(): Node at 0x0000000c
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0000000c: Read 0xca6598d0, calculated
0x00000000
Name for which CRC failed is (now) '', ino #2
jffs2_scan_inode_node(): Node at 0x00000038
jffs2_get_ino_cache(): ino 2
jffs2_get_ino_cache found 00000000 for ino 2
Allocated inocache at 82db52c0
jffs2_add_ino_cache: Add 82db52c0 (ino #2)
Node is ino #2, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x0000007c
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0000007c: Read 0xc1d3e37e, calculated
0x715da5a5
Name for which CRC failed is (now) 'readme.t', ino #3
jffs2_scan_inode_node(): Node at 0x000000b0
jffs2_scan_inode_node(): Data CRC failed on node at 0x000000b0: Read 0x935644bc, calculated
0x56361fba
Found empty flash at 0x12c
Empty flash detected from 0x0000012c to 0x00020000
Block at 0x00000000: free 0x0001fed4, dirty 0x000000dc, used 0x00000050
jffs2_scan_eraseblock(): Scanning block at 0x20000
Empty flash detected from 0x00020000 to 0x00040000
Block at 0x00020000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0x40000
Empty flash detected from 0x00040000 to 0x00060000
Block at 0x00040000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0x60000
Empty flash detected from 0x00060000 to 0x00080000
Block at 0x00060000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0x80000
Empty flash detected from 0x00080000 to 0x000a0000
Block at 0x00080000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0xa0000
Empty flash detected from 0x000a0000 to 0x000c0000
Block at 0x000a0000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0xc0000
Empty flash detected from 0x000c0000 to 0x000e0000
Block at 0x000c0000 is empty (erased)
jffs2_scan_eraseblock(): Scanning block at 0xe0000
Empty flash detected from 0x000e0000 to 0x00100000
Block at 0x000e0000 is empty (erased)
Scanned flash completely
Pass 1: ino #2
jffs2_build_inode building inode #2
Pass 1 complete
Pass 2 (re)starting
Pass 2: ino #2, nlink 0, ic 82db52c0, nodes 82db8350
JFFS2: Removing ino #2 with nlink == zero.
obsoleting node at 0x00000038
Not moving nextblock 0x00000000 to dirty/erase_pending list
obliterating obsoleted node at 0x00000038
Pass 2 complete
Pass 3: ino #2, ic 82db52c0, nodes 82db8350
Pass 3 complete
jffs2_read_super(): Getting root inode
jffs2_read_inode(): inode->i_ino == 1
getting inocache
jffs2_get_ino_cache(): ino 1
jffs2_get_ino_cache found 00000000 for ino 1
jffs2_read_inode(): Got inocache at 00000000
Allocated inocache at 82db52d4
jffs2_read_inode(): Creating inocache for root inode
jffs2_add_ino_cache: Add 82db52d4 (ino #1)
jffs2_read_inode(): ino #1 nlink is 1
jffs2_get_inode_nodes(): ino #1
jffs2_read_inode() returning
jffs2_read_super(): d_alloc_root()
JFFS2: Garbage collect thread is pid 62
thread_should_wake(): nr_free_blocks 0, nr_erasing_blocks 7, dirty_size 0x120
jffs2_garbage_collect_thread sleeping...
/usr> thread_should_wake(): nr_free_blocks 0, nr_erasing_blocks 7, dirty_size 0x120
Starting erase of pending block 0x00080000
Freeing all node refs for eraseblock offset 0x00080000
Erase completed successfully at 0x00380000
Starting erase of pending block 0x00060000
Freeing all node refs for eraseblock offset 0x00060000
Erase completed successfully at 0x00360000
Starting erase of pending block 0x00040000
Freeing all node refs for eraseblock offset 0x00040000
Erase completed successfully at 0x00340000
Starting erase of pending block 0x00020000
Freeing all node refs for eraseblock offset 0x00020000
Erase completed successfully at 0x00320000
Starting erase of pending block 0x000e0000
Freeing all node refs for eraseblock offset 0x000e0000
Erase completed successfully at 0x003e0000
Starting erase of pending block 0x000c0000
Freeing all node refs for eraseblock offset 0x000c0000
Erase completed successfully at 0x003c0000
Starting erase of pending block 0x000a0000
Freeing all node refs for eraseblock offset 0x000a0000
Erase completed successfully at 0x003a0000
jffs2_erase_pending_blocks completed
Verifying erase at 0x00080000
Writing erased marker to block at 0x00080000
Verifying erase at 0x00060000
Writing erased marker to block at 0x00060000
Verifying erase at 0x00040000
Writing erased marker to block at 0x00040000
Verifying erase at 0x00020000
Writing erased marker to block at 0x00020000
Verifying erase at 0x000e0000
Writing erased marker to block at 0x000e0000
Verifying erase at 0x000c0000
Writing erased marker to block at 0x000c0000
Verifying erase at 0x000a0000
Writing erased marker to block at 0x000a0000
thread_should_wake(): nr_free_blocks 7, nr_erasing_blocks 0, dirty_size 0x120
jffs2_erase_pending_blocks completed
                                                                                                  
                          
/usr> mount
rootfs on / type rootfs (rw)
/dev/root on / type nfs (rw,v2,rsize=4096,wsize=4096,hard,udp,nolock,addr=172.17.70.194)
/proc on /proc type proc (rw)
/dev/ram0 on /var type ext2 (rw)
/dev/ram1 on /etc/config type ext2 (rw)
/dev/mtdblock4 on /mnt type jffs2 (rw)
/usr> ls /mnt
jffs2_readdir() for dir_i #1
Dirent 0: ".", ino #1
Dirent 1: "..", ino #1
jffs2_readdir() for dir_i #1
/usr> ls /mnt
jffs2_readdir() for dir_i #1
Dirent 0: ".", ino #1
Dirent 1: "..", ino #1
jffs2_readdir() for dir_i #1
/usr> umount /mnt
jffs2_clear_inode(): ino #1 mode 40755
jffs2: jffs2_put_super()
jffs2: Killing GC task 62
jffs2_garbage_collect_thread(): SIGKILL received.
jffs2_free_ino_caches: Freeing ino #1 at 82db52d4
Freeing inocache at 82db52d4
jffs2_free_ino_caches: Freeing ino #2 at 82db52c0
Freeing inocache at 82db52c0
jffs2_put_super returning
......
    
     Best Regards,
                    
                   Gyf




_________________________________________________________
Do You Yahoo!?
150万曲MP3疯狂搜，带您闯入音乐殿堂
http://music.yisou.com/
美女明星应有尽有，搜遍美图、艳图和酷图
http://image.yisou.com
1G就是1000兆，雅虎电邮自助扩容！
http://cn.rd.yahoo.com/mail_cn/tag/1g/*http://cn.mail.yahoo.com/event/mail_1g/

Received: from [66.78.16.3] (helo=host2.hosting4everyone.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qISy-00020s-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2002 18:48:13 +0000
Message-ID: <005a01c1d5c0$26756730$be04010a@MTG016>
From: "Sebastian" <sebastian.vaitus@masstechgroup.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <001201c1cf6b$64df4a50$be04010a@MTG016>  <8945.1016645253@redhat.com>
Subject: Re: No space left on device 
Date: Wed, 27 Mar 2002 13:49:37 -0500
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0057_01C1D596.3C0D9BA0"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This is a multi-part message in MIME format.

------=_NextPart_000_0057_01C1D596.3C0D9BA0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

David,

I have logged the output for the problem described in a previous email
(attached below). I am using 6 erase blocks this time instead of 8 (which
should still be enough for the 280 byte JFFS2 image). From what I saw in the
logs, I think that JFFS is only able to use the first block out of the 6 due
to some formatting or erasing problem with the rest of 5 blocks. Please have
a  look at the attached log and maybe you'll be able to easily identify the
problem..

Regards,
Sebastian

>
> sebastian.vaitus@masstechgroup.com said:
> >  I was able to create a JFFS2 image with mkfs.jffs2, erase the flash,
> > and then copy the image to the flash ( about 200 bytes). I can mount
> > the mtdblock and browse the files on the JFFS2 file system, but I
> > cannot make any changes to the existing files or add new ones.
> > Everytime I try to modify it I get the 'No space left on device'
> > error.
>
> Please compile with CONFIG_JFFS2_FS_DEBUG=1, set the console loglevel to 9
> so that you see all the KERN_DEBUG messages, and log the output over a
> serial console while you reproduce this and also run 'df'.
>
> --
> dwmw2
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>

------=_NextPart_000_0057_01C1D596.3C0D9BA0
Content-Type: application/octet-stream;
	name="jffs2_clean"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="jffs2_clean"

=0A=
*** Make the jffs2 image=0A=
=0A=
root@192.0.0.123:/jffs2#=0A=
root@192.0.0.123:/jffs2# mkfs.jffs2 -d ./imgdir -o jffs2.img=0A=
root@192.0.0.123:/jffs2# ls=0A=
imgdir	jffs2.img=0A=
root@192.0.0.123:/jffs2# ls -l=0A=
total 8=0A=
drwxr-xr-x    2 root     root         4096 Mar 27  2002 imgdir=0A=
-rw-r--r--    1 root     root          280 Mar 27  2002 jffs2.img=0A=
=0A=
*** Copy the image to flash=0A=
=0A=
root@192.0.0.123:/jffs2# cd ..=0A=
root@192.0.0.123:/# cat /proc/mtd=0A=
dev:    size   erasesize  name=0A=
mtd0: 00060000 00010000 "Flash File System"=0A=
mtd1: 00020000 00010000 "ROM Monitor"=0A=
mtd2: 00080000 00010000 "Whole Flash"=0A=
root@192.0.0.123:/# eraseall /dev/mtd0=0A=
MTD_open=0A=
MTD_ioctl=0A=
MTD_ioctl=0A=
Erasing 64 Kibytodo: 1 0 0 0=0A=
te @ 0 --  0 % complete.MTD_ioctl=0A=
Erasing 64 Kibytodo: 1 0 0 0=0A=
te @ 10000 -- 16 % complete.MTD_ioctl=0A=
Erasing 64 Kibytodo: 1 0 0 0=0A=
te @ 20000 -- 33 % complete.MTD_ioctl=0A=
Erasing 64 Kibytodo: 1 0 0 0=0A=
te @ 30000 -- 50 % complete.MTD_ioctl=0A=
Erasing 64 Kibytodo: 1 0 0 0=0A=
te @ 40000 -- 66 % complete.MTD_ioctl=0A=
Erasing 64 Kibytodo: 1 0 0 0=0A=
te @ 50000 -- 83 % complete.MTD_close=0A=
Erased 384 Kibyte @ 0 -- 100% complete.=0A=
root@192.0.0.123:/# cp /jffs2/jffs2.img /dev/mtd0=0A=
MTD_open=0A=
MTD_write=0A=
MTD_close=0A=
=0A=
*** Mount the JFFS2 file system=0A=
=0A=
root@192.0.0.123:/# cd mnt/flash=0A=
root@192.0.0.123:/mnt/flash# ls=0A=
root@192.0.0.123:/mnt/flash# cd ..=0A=
root@192.0.0.123:/mnt# mount -t jffs2 /dev/mtdblock0 /mnt/flash=0A=
mtdblock_open=0A=
ok=0A=
jffs2: read_super for device 1f:00=0A=
jffs2_scan_eraseblock(): Scanning block at 0x0=0A=
jffs2_scan_inode_node(): Node at 0x00000000=0A=
jffs2_get_ino_cache(): ino 1=0A=
jffs2_get_ino_cache found 00000000 for ino 1=0A=
Allocated inocache at c778c2d4=0A=
jffs2_add_ino_cache: Add c778c2d4 (ino #1)=0A=
Node is ino #1, version 1. Range 0x0-0x0=0A=
jffs2_scan_dirent_node(): Node at 0x00000044=0A=
jffs2_get_ino_cache(): ino 1=0A=
jffs2_get_ino_cache found c778c2d4 for ino 1=0A=
jffs2_add_fd_to_list( c70124c0, c70124a0 (->00000000))=0A=
Dirent "test" (hash 0x01c4ddc5, ino #2=0A=
jffs2_scan_inode_node(): Node at 0x00000070=0A=
jffs2_get_ino_cache(): ino 2=0A=
jffs2_get_ino_cache found 00000000 for ino 2=0A=
Allocated inocache at c778c2c0=0A=
jffs2_add_ino_cache: Add c778c2c0 (ino #2)=0A=
Node is ino #2, version 1. Range 0x0-0x1d=0A=
jffs2_scan_inode_node(): Node at 0x000000d0=0A=
jffs2_get_ino_cache(): ino 2=0A=
jffs2_get_ino_cache found c778c2c0 for ino 2=0A=
Node is ino #2, version 2. Range 0x1d-0x1f=0A=
Found empty flash at 0x118=0A=
Empty flash detected from 0x00000118 to 0x00010000=0A=
Block at 0x00000000: free 0x0000fee8, dirty 0x00000000, used 0x00000118=0A=
jffs2_scan_eraseblock(): Scanning block at 0x10000=0A=
Found empty flash at 0x10000=0A=
Empty flash detected from 0x00010000 to 0x00020000=0A=
Block at 0x00010000: free 0x00010000, dirty 0x00000000, used 0x00000000=0A=
JFFS2: Erase block at 0x00010000 is not formatted. It will be erased=0A=
jffs2_scan_eraseblock(): Scanning block at 0x20000=0A=
Found empty flash at 0x20000=0A=
Empty flash detected from 0x00020000 to 0x00030000=0A=
Block at 0x00020000: free 0x00010000, dirty 0x00000000, used 0x00000000=0A=
JFFS2: Erase block at 0x00020000 is not formatted. It will be erased=0A=
jffs2_scan_eraseblock(): Scanning block at 0x30000=0A=
Found empty flash at 0x30000=0A=
Empty flash detected from 0x00030000 to 0x00040000=0A=
Block at 0x00030000: free 0x00010000, dirty 0x00000000, used 0x00000000=0A=
JFFS2: Erase block at 0x00030000 is not formatted. It will be erased=0A=
jffs2_scan_eraseblock(): Scanning block at 0x40000=0A=
Found empty flash at 0x40000=0A=
Empty flash detected from 0x00040000 to 0x00050000=0A=
Block at 0x00040000: free 0x00010000, dirty 0x00000000, used 0x00000000=0A=
JFFS2: Erase block at 0x00040000 is not formatted. It will be erased=0A=
jffs2_scan_eraseblock(): Scanning block at 0x50000=0A=
Found empty flash at 0x50000=0A=
Empty flash detected from 0x00050000 to 0x00060000=0A=
Block at 0x00050000: free 0x00010000, dirty 0x00000000, used 0x00000000=0A=
JFFS2: Erase block at 0x00050000 is not formatted. It will be erased=0A=
Scanned flash completely=0A=
Pass 1: ino #1=0A=
jffs2_build_inode building inode #1=0A=
jffs2_get_ino_cache(): ino 2=0A=
jffs2_get_ino_cache found c778c2c0 for ino 2=0A=
Increased nlink for child "test" (ino #2)=0A=
Pass 1: ino #2=0A=
jffs2_build_inode building inode #2=0A=
adding node 0000-001d @0x00000070 on flash, newfrag *c778b2d4=0A=
adding node 001d-001f @0x000000d0 on flash, newfrag *c778b2c0=0A=
j_a_f_d_t_f: skipping frag 0x0000-0x001d; phys 0x00000070 =
(*c778b2d4->00000000)=0A=
Pass 1 complete=0A=
Pass 2 (re)starting=0A=
Pass 2: ino #1, nlink 1, ic c778c2d4, nodes c778f360=0A=
Pass 2: ino #2, nlink 1, ic c778c2c0, nodes c778f340=0A=
Pass 2 complete=0A=
Pass 3: ino #1, ic c778c2d4, nodes c778f360=0A=
Pass 3: ino #2, ic c778c2c0, nodes c778f340=0A=
Pass 3 complete=0A=
jffs2_read_super(): Getting root inode=0A=
jffs2_read_inode(): inode->i_ino =3D=3D 1=0A=
getting inocache=0A=
jffs2_get_ino_cache(): ino 1=0A=
jffs2_get_ino_cache found c778c2d4 for ino 1=0A=
jffs2_read_inode(): Got inocache at c778c2d4=0A=
jffs2_read_inode(): ino #1 nlink is 1=0A=
jffs2_get_inode_nodes(): ino #1=0A=
Node at 00000044 is a dirent node=0A=
Adding fd "test", ino #2=0A=
jffs2_add_fd_to_list( c70124e0, c7429c1c (->00000000))=0A=
Dirent "test" (hash 0x01c4ddc5, ino #2=0A=
Node at 00000000 is a data node=0A=
version 1, highest_version now 2=0A=
dnode @00000000: ver 1, offset 0000, dsize 0000=0A=
metadata @00000000: ver 1=0A=
jffs2_read_inode() returning=0A=
jffs2_read_super(): d_alloc_root()=0A=
JFFS2: Garbage collect thread is pid 186=0A=
thread_should_wake(): nr_free_blocks 0, nr_erasing_blocks 5, dirty_size =
0x0=0A=
jffs2_garbage_collect_thread sleeping...=0A=
thread_should_wake(): nr_free_blocks 0, nr_erasing_blocks 5, dirty_size =
0x0=0A=
Starting erase of pending block 0x00050000=0A=
Freeing all node refs for eraseblock offset 0x00050000=0A=
todo: 1 0 0 0=0A=
Erase at 0x00050000 finished, but state !=3D MTD_ERASE_DONE. State is =
0x0 instead.=0A=
Starting erase of pending block 0x00040000=0A=
Freeing all node refs for eraseblock offset 0x00040000=0A=
todo: 1 0 0 0=0A=
Erase at 0x00040000 finished, but state !=3D MTD_ERASE_DONE. State is =
0x0 instead.=0A=
Starting erase of pending block 0x00030000=0A=
Freeing all node refs for eraseblock offset 0x00030000=0A=
todo: 1 0 0 0=0A=
Erase at 0x00030000 finished, but state !=3D MTD_ERASE_DONE. State is =
0x0 instead.=0A=
Starting erase of pending block 0x00020000=0A=
Freeing all node refs for eraseblock offset 0x00020000=0A=
todo: 1 0 0 0=0A=
Erase at 0x00020000 finished, but state !=3D MTD_ERASE_DONE. State is =
0x0 instead.=0A=
Starting erase of pending block 0x00010000=0A=
Freeing all node refs for eraseblock offset 0x00010000=0A=
todo: 1 0 0 0=0A=
Erase at 0x00010000 finished, but state !=3D MTD_ERASE_DONE. State is =
0x0 instead.=0A=
jffs2_erase_pending_blocks completed=0A=
root@192.0.0.123:/mnt# thread_should_wake(): nr_free_blocks 0, =
nr_erasing_blocks 0, dirty_size 0x0=0A=
jffs2_erase_pending_blocks completed=0A=
=0A=
*** List files on JFFS2 drive=0A=
=0A=
root@192.0.0.123:/mnt# cd flash=0A=
root@192.0.0.123:/mnt/flash# ls=0A=
jffs2_readdir() for dir_i #1=0A=
Dirent 0: ".", ino #1=0A=
Dirent 1: "..", ino #1=0A=
Dirent 2: "test", ino #2, type 8=0A=
jffs2_readdir() for dir_i #1=0A=
Skipping dirent: "test", ino #2, type 8, because curofs 2 < offset 3=0A=
test=0A=
=0A=
*** Attempt to rename the file under JFFS2=0A=
=0A=
root@192.0.0.123:/mnt/flash# mv test test1=0A=
jffs2_lookup()=0A=
jffs2_lookup()=0A=
jffs2_read_inode(): inode->i_ino =3D=3D 2=0A=
getting inocache=0A=
jffs2_get_ino_cache(): ino 2=0A=
jffs2_get_ino_cache found c778c2c0 for ino 2=0A=
jffs2_read_inode(): Got inocache at c778c2c0=0A=
jffs2_read_inode(): ino #2 nlink is 1=0A=
jffs2_get_inode_nodes(): ino #2=0A=
Node at 000000d0 is a data node=0A=
version 2, highest_version now 2=0A=
dnode @000000d0: ver 2, offset 001d, dsize 0002=0A=
Node at 00000070 is a data node=0A=
version 1, highest_version now 2=0A=
dnode @00000070: ver 1, offset 0000, dsize 001d=0A=
jffs2_add_full_dnode_to_inode(ino #2, f c6fd8b10, fn c778d360)=0A=
adding node 0000-001d @0x00000070 on flash, newfrag *c778b2c0=0A=
frag 0000-001d: 0x00000070 on flash (*c778b2c0->00000000)=0A=
jffs2_add_full_dnode_to_inode(ino #2, f c6fd8b10, fn c778d350)=0A=
adding node 001d-001f @0x000000d0 on flash, newfrag *c778b2d4=0A=
j_a_f_d_t_f: skipping frag 0x0000-0x001d; phys 0x00000070 =
(*c778b2c0->00000000)=0A=
frag 0000-001d: 0x00000070 on flash (*c778b2c0->c778b2d4)=0A=
frag 001d-001f: 0x000000d0 on flash (*c778b2d4->00000000)=0A=
Truncating fraglist to 0x0000001f bytes=0A=
jffs2_read_inode() returning=0A=
jffs2_reserve_space(): Requested 0x30 bytes=0A=
jffs2_reserve_space(): alloc sem got=0A=
Short on space, but total dirty size 0x00000000 < sector size =
0x00010000, so -ENOSPC=0A=
jffs2_create()=0A=
jffs2_reserve_space(): Requested 0x44 bytes=0A=
jffs2_reserve_space(): alloc sem got=0A=
Short on space, but total dirty size 0x00000000 < sector size =
0x00010000, so -ENOSPC=0A=
jffs2_create(): reserved 0xc7aef000 bytes=0A=
mv: cannot create regular file `test1': No space left on device=0A=
=0A=
*** Attempt to change permissions on file=0A=
=0A=
root@192.0.0.123:/mnt/flash# chmod 777 test=0A=
jffs2_setattr(): ino #2=0A=
jffs2_reserve_space(): Requested 0x44 bytes=0A=
jffs2_reserve_space(): alloc sem got=0A=
Short on space, but total dirty size 0x00000000 < sector size =
0x00010000, so -ENOSPC=0A=
chmod: changing permissions of `test': No space left on device=0A=
=0A=
*** Attempt to create a directory=0A=
=0A=
root@192.0.0.123:/mnt/flash# mkdir test123=0A=
jffs2_lookup()=0A=
jffs2_reserve_space(): Requested 0x44 bytes=0A=
jffs2_reserve_space(): alloc sem got=0A=
Short on space, but total dirty size 0x00000000 < sector size =
0x00010000, so -ENOSPC=0A=
mkdir: cannot create directory `test123': No space left on device=0A=
=0A=
*** DF=0A=
=0A=
root@192.0.0.123:/mnt/flash# df=0A=
Filesystem      STATFS:=0A=
flash_size: 00060000=0A=
used_size: 00000118=0A=
dirty_size: 00000000=0A=
free_size: 0000fee8=0A=
erasing_size: 00000000=0A=
bad_size: 00050000=0A=
sector_size: 00010000=0A=
nextblock: 0x00000000=0A=
gcblock: NULL=0A=
clean_list: empty=0A=
dirty_list: empty=0A=
erasing_list: empty=0A=
erase_pending_list: empty=0A=
free_list: empty=0A=
bad_list: 00010000=0A=
bad_list: 00020000=0A=
bad_list: 00030000=0A=
bad_list: 00040000=0A=
bad_list: 00050000=0A=
bad_used_list: empty=0A=
     1k-blocks      Used Available Use% Mounted on=0A=
/dev/root              2869272   1721132   1002384  64% /=0A=
/dev/mtdblock0             384       384         0 100% /mnt/flash=0A=
=0A=

------=_NextPart_000_0057_01C1D596.3C0D9BA0--

From: "Kyungmin Park" <kmpark@infradead.org>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Subject: FW: [JFFS2] kernel BUG at fs/jffs2/gc.c:516!
Date: Mon, 7 May 2007 18:28:00 +0900
Message-ID: <001201c7908a$044b7890$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Umm I can't attach the debug message file.

Sorry please see the jffs2.bug.txt file in kmpark@git.infradead.org directory.

Thank you,
Kyungmin Park

-----Original Message-----
From: Kyungmin Park [mailto:kmpark@infradead.org] 
Sent: Monday, May 07, 2007 6:23 PM
To: 'David Woodhouse'
Cc: 'linux-mtd@lists.infradead.org'
Subject: RE: [JFFS2] kernel BUG at fs/jffs2/gc.c:516!

Sorry for delayed reply

> On Thu, 2007-04-26 at 13:03 +0900, Kyungmin Park wrote:
> > When the JFFS2 is tested with fsstress, I delete the 
> several open files forcely.
> > The goal of this test is that it is robust and handles it 
> well when disk is
> > full. But JFFS2 doesn't, it is died rarely with below message.
> > 
> > In POSIX Spec., it is possible to delete the open file, but 
> I think JFFS2 don't
> > handle this one well. This problem is occured at every 
> kernel version.
> > 
> > My queustion is that Is it the expected behavior of JFFS2 
> or we missed the
> > handling of this case? please give some clues.
> 
> I suspect the problem is not related to deleting open files 
> -- that's a
> case which we should handle just fine.
> 
> I suspect a locking issue, which leads to this node being absent from
> the node lists even though it's not marked obsolete. Do you have an
> image of the flash when this has happened? I'd like to see the _full_
> set of nodes for this file.
> 
> If you can reproduce, then logs of CONFIG_JFFS2_FS_DEBUG=1 
> while you do
> so would be enlightening -- we need to see what's happening 
> to that node
> at 0x00540000 when it was dropped from the lists.

Here's another jffs2 debug messsage with CONFIG_JFFS2_FS_DEBUG=1.
It is tested on nand simulator. It also happens on OneNAND.

Test scenarios
1. create nand or onenand mtd partition
2. cp dummy data to fill fullness 90~99%
3. test fsstress with delete the open file forcely
# fssstress -p 3 -n 100000000000 -d /tmp/t -c -C 100 -l 0
(-C option is delete the open file forcely)
4. jffs2 oops

Filesystem            Size  Used Avail Use% Mounted on
/dev/mtdblock6        8.0M  8.0M  100k  99% /tmp
/tmp/t # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00020000 00020000 "X-Loader + U-Boot"
mtd1: 00020000 00020000 "params"
mtd2: 00200000 00020000 "kernel"
mtd3: 01000000 00020000 "rootfs"
mtd4: 02000000 00020000 "filesystem00"
mtd5: 0cdc0000 00020000 "filesystem01"
mtd6: 00800000 00002000 "NAND simulator partition"

You can also access the jffs2.bug.txt file in kmpark@git.infradead.org
directory.

If you need the more information, please let me know.

Thank you,
Kyungmin Park

--

[JFFS2 DBG] (271) jffs2_add_ino_cache: add c558ea10 (ino #46254)
[JFFS2 DBG] (271) jffs2_link_node_ref: Last node at c57205bc is
(007ffe02,c54299d0)
[JFFS2 DBG] (271) jffs2_link_node_ref: New ref is c57205c8 (fffffffe becomes
007ffe2e,00000000) len 0x44
[JFFS2 DBG] (271) jffs2_link_node_ref: Last node at c57205c8 is
(007ffe2e,c5720604)
[JFFS2 DBG] (271) jffs2_link_node_ref: New ref is c57205d4 (fffffffe becomes
007ffe72,00000000) len 0x2c
[JFFS2 DBG] (271) jffs2_add_fd_to_list: add dirent "ce", ino #0
[JFFS2 DBG] (271) jffs2_add_fd_to_list: marking old dirent "ce", ino #0 bsolete
[JFFS2 DBG] (271) jffs2_link_node_ref: Last node at c57205d4 is
(007ffe72,c57205bc)
[JFFS2 DBG] (271) jffs2_link_node_ref: New ref is c57205e0 (fffffffe becomes
007ffe9e,00000000) len 0x2c
[JFFS2 DBG] (271) jffs2_add_fd_to_list: add dirent "p2", ino #101
[JFFS2 DBG] (271) jffs2_add_fd_to_list: marking old dirent "p2", ino #101
bsolete
[JFFS2 DBG] (271) jffs2_link_node_ref: Last node at c57205e0 is
(007ffe9e,c5720670)
[JFFS2 DBG] (272) jffs2_link_node_ref: Last node at c572052c is
(003a6fe6,c5720520)
[JFFS2 DBG] (272) jffs2_link_node_ref: New ref is c5720538 (fffffffe becomes
003a705f,00000000) len 0x5c
[JFFS2 DBG] (272) jffs2_add_full_dnode_to_inode: adding node 0x71000-0x71280
@0x003a705c on flash, newfrag *c5be67a0
[JFFS2 DBG] (272) jffs2_link_node_ref: Last node at c5720538 is
(003a705f,c572052c)
[JFFS2 DBG] (272) jffs2_link_node_ref: New ref is c5720544 (fffffffe becomes
003a70ba,00000000) len 0x2c
[JFFS2 DBG] (272) jffs2_add_fd_to_list: add dirent "f9", ino #0
[JFFS2 DBG] (272) jffs2_add_fd_to_list: marking old dirent "f9", ino #46286
bsolete
[JFFS2 DBG] (272) jffs2_add_ino_cache: add c558eb30 (ino #46288)
[JFFS2 DBG] (272) jffs2_link_node_ref: Last node at c5720544 is
(003a70ba,c5720508)
[JFFS2 DBG] (272) jffs2_link_node_ref: New ref is c5720550 (fffffffe becomes
003a70e6,00000000) len 0x44
[JFFS2 DBG] (272) jffs2_link_node_ref: Last node at c5720550 is
(003a70e6,c558eb30)
[JFFS2 DBG] (272) jffs2_link_node_ref: New ref is c572055c (fffffffe becomes
003a712a,00000000) len 0x2c
[JFFS2 DBG] (272) jffs2_add_fd_to_list: add dirent "dc", ino #46288
Raw node at 0x00004000 wasn't in node lists for ino #352
[JFFS2 DBG] dump node at offset 0x004000.
magic:  0x1985
nodetype:       0xe002
totlen: 0x000046
hdr_crc:        0x32fe3396
the node is inode node
ino:    0x000160
version:        0x000001
mode:   0x002124
uid:    0x00
gid:    0x00
isize:  0x000000
atime:  0x463f608a
mtime:  0x463f608a
ctime:  0x463f608a
offset: 0x000000
csize:  0x000002
dsize:  0x000002
compr:  0x0
usercompr:      0x0
flags:  0x00
data_crc:       0x000000
node_crc:       0xb50b673a
kernel BUG at fs/jffs2/gc.c:517!
Unable to handle kernel NULL pointer dereference at virtual address 00000000

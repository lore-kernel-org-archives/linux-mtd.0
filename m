Received: from ns2.discountwebhost.com ([64.170.22.131]
	helo=ns1.discountwebhost.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Ay7S-0004AC-GD
	for <linux-mtd@lists.infradead.org>; Wed, 30 Apr 2003 21:23:58 +0100
Message-Id: <5.1.0.14.0.20030430145340.02502ea8@ns.webzsite.com>
Date: Wed, 30 Apr 2003 15:22:14 -0500
To: linux-mtd@lists.infradead.org
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Oops in mounting jffs2 (jffs2_get_ino_cache())
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm using CVS code (HEAD) from Feb 16th on x86 w/ NOR flash chips (AMD).

I've been doing pwr fail testing on my application code and during a power 
up I got the following Oops.
Don't ask me to reproduce it- it happened after about 2K power fails, and 
unfortunately my script detected the failed mount and went ahead and 
reformatted the partition- so I don't know if it would have happened again 
on a restart. I've got the kernel files if someone wants them.

Vipin

ksymoops 2.4.8 on i686 2.4.7-10smp.  Options used
      -v vmlinux (specified)
      -k jffs2.oops.ksyms (specified)
      -L (specified)
      -O (specified)
      -m System.map (specified)

Unable to handle kernel paging request at virtual address 176027cd
c015136b
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c015136b>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010202
eax: ffffffef   ebx: 0031dc68   ecx: ffff066f   edx: 176027c1
esi: c1a264d0   edi: c1a52930   ebp: c1af24bc   esp: c1afdd3c
ds: 0018   es: 0018   ss: 0018
Process mount (pid: 17, stackpage=c1afd000)
Stack: c0154c85 c1af24bc ffff066f ffff066f 0031dc68 00310000 c1a49bd4 0000009f
        c015485a c1af24bc c1a52930 c1a49bd4 0031dc68 00010000 0000e002 
00000001
        c1a49000 c01d8d90 0031dd07 0000000a 0000000c 00000000 00000000 
00001000
Call Trace:    [<c0154c85>] [<c015485a>] [<c0153f6f>] [<c0124de8>] [<c0156912>]
   [<c0156d8a>] [<c0157ec9>] [<c01580cb>] [<c01306f1>] [<c014c035>] 
[<c01308a2>]
   [<c013495b>] [<c013f836>] [<c0120000>] [<c013facf>] [<c013f947>] 
[<c013fe20>]
   [<c01083f3>]
Code: 39 4a 0c 72 f4 85 d2 74 0b 31 c0 39 4a 0c 0f 95 c0 48 21 c2


 >>EIP; c015136b <jffs2_get_ino_cache+2b/44>   <=====

 >>esi; c1a264d0 <_end+1813ad0/2e7365c>
 >>edi; c1a52930 <_end+183ff30/2e7365c>
 >>ebp; c1af24bc <_end+18dfabc/2e7365c>
 >>esp; c1afdd3c <_end+18eb33c/2e7365c>

Trace; c0154c85 <jffs2_scan_inode_node+41/130>
Trace; c015485a <jffs2_scan_eraseblock+58a/910>
Trace; c0153f6f <jffs2_scan_medium+e7/410>
Trace; c0124de8 <kmalloc+f0/118>
Trace; c0156912 <jffs2_build_filesystem+12/14c>
Trace; c0156d8a <jffs2_do_mount_fs+1e6/214>
Trace; c0157ec9 <jffs2_do_fill_super+16d/216>
Trace; c01580cb <jffs2_read_super+8b/b4>
Trace; c01306f1 <get_sb_bdev+1a5/208>
Trace; c014c035 <ext2_lookup+5d/68>
Trace; c01308a2 <do_kern_mount+56/f8>
Trace; c013495b <link_path_walk+72b/838>
Trace; c013f836 <do_add_mount+76/13c>
Trace; c0120000 <__find_lock_page_helper+58/60>
Trace; c013facf <do_mount+137/154>
Trace; c013f947 <copy_mount_options+4b/9c>
Trace; c013fe20 <sys_mount+74/b0>
Trace; c01083f3 <system_call+33/40>

Code;  c015136b <jffs2_get_ino_cache+2b/44>
00000000 <_EIP>:
Code;  c015136b <jffs2_get_ino_cache+2b/44>   <=====
    0:   39 4a 0c                  cmp    %ecx,0xc(%edx)   <=====
Code;  c015136e <jffs2_get_ino_cache+2e/44>
    3:   72 f4                     jb     fffffff9 <_EIP+0xfffffff9> 
c0151364 <jffs2_get_ino_cache+24/44>
Code;  c0151370 <jffs2_get_ino_cache+30/44>
    5:   85 d2                     test   %edx,%edx
Code;  c0151372 <jffs2_get_ino_cache+32/44>
    7:   74 0b                     je     14 <_EIP+0x14> c015137f 
<jffs2_get_ino_cache+3f/44>
Code;  c0151374 <jffs2_get_ino_cache+34/44>
    9:   31 c0                     xor    %eax,%eax
Code;  c0151376 <jffs2_get_ino_cache+36/44>
    b:   39 4a 0c                  cmp    %ecx,0xc(%edx)
Code;  c0151379 <jffs2_get_ino_cache+39/44>
    e:   0f 95 c0                  setne  %al
Code;  c015137c <jffs2_get_ino_cache+3c/44>
   11:   48                        dec    %eax
Code;  c015137d <jffs2_get_ino_cache+3d/44>
   12:   21 c2                     and    %eax,%edx


The file tags are:
background.c: * $Id: background.c,v 1.35 2003/01/21 18:11:28 dwmw2 Exp $
build.c: * $Id: build.c,v 1.44 2003/01/17 16:04:16 dwmw2 Exp $
compr.c: * $Id: compr.c,v 1.26 2003/01/12 13:21:28 dwmw2 Exp $
compr_rtime.c: * $Id: compr_rtime.c,v 1.9 2002/05/20 14:56:37 dwmw2 Exp $
compr_rubin.c: * $Id: compr_rubin.c,v 1.17 2002/05/20 14:56:37 dwmw2 Exp $
compr_zlib.c: * $Id: compr_zlib.c,v 1.22 2003/01/12 13:21:28 dwmw2 Exp $
comprtest.c:/* $Id: comprtest.c,v 1.5 2002/01/03 15:20:44 dwmw2 Exp $ */
crc32.c:/* $Id: crc32.c,v 1.4 2002/01/03 15:20:44 dwmw2 Exp $ */
dir.c: * $Id: dir.c,v 1.74 2003/01/14 14:06:22 dwmw2 Exp $
erase.c: * $Id: erase.c,v 1.49 2003/01/21 18:11:28 dwmw2 Exp $
file.c: * $Id: file.c,v 1.84 2003/01/23 11:11:06 dwmw2 Exp $
fs.c: * $Id: fs.c,v 1.23 2003/01/21 18:11:28 dwmw2 Exp $
gc.c: * $Id: gc.c,v 1.100 2003/01/22 14:43:51 dwmw2 Exp $
ioctl.c: * $Id: ioctl.c,v 1.6 2002/05/20 14:56:38 dwmw2 Exp $
malloc.c: * $Id: malloc.c,v 1.22 2002/05/20 14:56:38 dwmw2 Exp $
nodelist.c: * $Id: nodelist.c,v 1.75 2003/01/21 18:11:28 dwmw2 Exp $
nodemgmt.c: * $Id: nodemgmt.c,v 1.92 2003/01/22 14:40:26 dwmw2 Exp $
rbtree.c:  $Id: rbtree.c,v 1.2 2002/11/15 13:18:04 dwmw2 Exp $
read.c: * $Id: read.c,v 1.31 2003/01/14 14:06:22 dwmw2 Exp $
readinode.c: * $Id: readinode.c,v 1.103 2003/01/22 14:43:29 dwmw2 Exp $
scan.c: * $Id: scan.c,v 1.98 2003/01/22 16:33:39 dwmw2 Exp $
super-v24.c: * $Id: super-v24.c,v 1.64 2003/01/21 18:11:29 dwmw2 Exp $
super.c: * $Id: super.c,v 1.77 2003/01/22 14:39:18 dwmw2 Exp $
symlink.c: * $Id: symlink.c,v 1.11 2002/07/23 17:00:45 dwmw2 Exp $
wbuf.c: * $Id: wbuf.c,v 1.25 2003/02/15 11:31:56 gleixner Exp $
write.c: * $Id: write.c,v 1.65 2003/01/21 18:11:29 dwmw2 Exp $
writev.c: * $Id: writev.c,v 1.3 2002/08/08 08:35:21 dwmw2 Exp $

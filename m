Received: from 0x3ef25f5e.honxl.paisdn.tele.dk ([62.242.95.94] helo=sss.dnsalias.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17yt94-0007Yp-00
	for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2002 13:07:26 +0100
Received: from SSSW2K.sss.dnsalias.net (sss-gw.intermate.dk [192.168.0.1])
	by sss.dnsalias.net (8.12.1/8.12.1) with ESMTP id g98C7PpD021370
	for <linux-mtd@lists.infradead.org>; Tue, 8 Oct 2002 14:07:25 +0200
Message-Id: <5.1.0.14.0.20021008132754.00b9b3d0@sss.dnsalias.net>
Date: Tue, 08 Oct 2002 14:10:12 +0200
To: linux-mtd@lists.infradead.org
From: Svenning Sorensen <sss@sss.dnsalias.net>
Subject: [BUG] Oops in nftl driver
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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

Hello, good MTD folks.

I ran across what appears to be a bug in the nftl driver, resulting in a kernel oops when triggered.

I don't know if it will be triggered under "normal" circumstances. In my case, it happened after I had
switched from using the M-Systems driver to the linux-mtd driver, without reformatting the DOC in between,
and with an ext2-compressed file system on it.
I would say that the kernel should not oops, no matter the state and content of the DOC, so I believe the bug is real.

I'm using the linux-2.4.19 driver, but the bug still appears to exist in the cvs version.

I wrote down the oops info and handed it to ksymoops:
=====================================================
Unable to handle kernel paging request at virtual address c1d8cffe
*pde = 00008063
Oops: 0000
CPU:	0
EIP:	0010:[<c018579c>]	Not tainted
EFLAGS:	00010246
eax: 0000ffff   ebx: 00000400     ecx: c1d72260       edx: 0000ffff
esi: 0000ffff   edi: c1d6d000     ebp: 00000002       esp: c1137c98
ds: 0018        es: 0018       ss: 0018
Process tgd (pid 9, stackpage=c1137000)
Stack:  0000270f 0000ffff c1d72260 c01860eb c1d72260 00000000 00000002 00000123
        c1d72260 c1137d3c 00000082 c1b84ac8 c1d6e980 00000010 00000012 00003e01
        00120178 00000600 c027a964 c017d094 00000008 70d5ed0a 55551c6a c1d6e980
Call Trace: [<c01860eb>] [<c017d094>] [<c017dce5>] [<c01868ab>] [<c017cbd4>]
        [<c011717f>] [<c012ee78>] [<c012f886>] [<c014dcaf>] [<c01394c3>] [<c0136844>]
        [<c0136815>] [<c0137281>] [<c01c1d7d>] [<c01c2220>] [<c0136844>] [<c01367b7>]
        [<c01379ff>] [<c012da22>] [<c012d92f>] [<c014ec75>] [<c014ec52>] [<c012f255>]
        [<c0108773>]
Code: 66 81 3c 47 fe ff 74 c1 66 42 66 3b 51 3a 76 04 66 8b 51 28

>>EIP; c018579c <NFTL_findfreeblock+5c/84>   <=====
Trace; c01860eb <NFTL_writeblock+df/324>
Trace; c017d094 <account_io_end+38/40>
Trace; c017dce5 <end_that_request_last+1d/24>
Trace; c01868ab <nftl_request+57/1e8>
Trace; c017cbd4 <generic_unplug_device+20/28>
Trace; c011717f <__run_task_queue+4f/5c>
Trace; c012ee78 <__wait_on_buffer+6c/98>
Trace; c012f886 <fsync_buffers_list+fe/144>
Trace; c014dcaf <ext2_file_write+77/fa4>
Trace; c01394c3 <vfs_follow_link+d3/13c>
Trace; c0136844 <cached_lookup+10/54>
Trace; c0136815 <path_release+d/2c>
Trace; c0137281 <link_path_walk+849/858>
Trace; c01c1d7d <unix_find_other+3d/10c>
Trace; c01c2220 <unix_dgram_connect+78/10c>
Trace; c0136844 <cached_lookup+10/54>
Trace; c01367b7 <permission+2b/30>
Trace; c01379ff <open_namei+32b/584>
Trace; c012da22 <dentry_open+ea/194>
Trace; c012d92f <filp_open+47/50>
Trace; c014ec75 <ext2_fsync_inode+1d/68>
Trace; c014ec52 <ext2_sync_file+12/18>
Trace; c012f255 <sys_fsync+5d/a0>
Trace; c0108773 <system_call+33/40>
Code;  c018579c <NFTL_findfreeblock+5c/84>
00000000 <_EIP>:
Code;  c018579c <NFTL_findfreeblock+5c/84>   <=====
   0:   66 81 3c 47 fe ff         cmpw   $0xfffe,(%edi,%eax,2)   <=====
Code;  c01857a2 <NFTL_findfreeblock+62/84>
   6:   74 c1                     je     ffffffc9 <_EIP+0xffffffc9> c0185765 <NFTL_findfreeblock+25/84>
Code;  c01857a4 <NFTL_findfreeblock+64/84>
   8:   66 42                     incw   %dx
Code;  c01857a6 <NFTL_findfreeblock+66/84>
   a:   66 3b 51 3a               cmpw   0x3a(%ecx),%dx
Code;  c01857aa <NFTL_findfreeblock+6a/84>
   e:   76 04                     jbe    14 <_EIP+0x14> c01857b0 <NFTL_findfreeblock+70/84>
Code;  c01857ac <NFTL_findfreeblock+6c/84>
  10:   66 8b 51 28               movw   0x28(%ecx),%dx
=============================

After a bit poking around, I came up with the following fix.
I don't know if this is the "correct" fix, but at least it works for me: no more oops,
and everything seem to work:
===============================
diff -u -r1.1.1.6 nftlcore.c
--- nftlcore.c	2002/08/07 06:37:14	1.1.1.6
+++ nftlcore.c	2002/10/08 11:19:16
@@ -247,7 +247,7 @@
 
 	/* Scan for a free block */
 	do {
-		if (nftl->ReplUnitTable[pot] == BLOCK_FREE) {
+		if (pot < nftl->nb_blocks && nftl->ReplUnitTable[pot] == BLOCK_FREE) {
 			nftl->LastFreeEUN = pot;
 			nftl->numfreeEUNs--;
 			return pot;
================================

I'm not subscribed to the list, so please cc: any replies to me.

Regards,
Svenning Sorensen

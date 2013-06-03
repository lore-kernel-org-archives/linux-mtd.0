Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UjUQ7-00075p-1k
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2013 13:03:31 +0000
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
 by tritech.se (8.14.3/8.14.3) with ESMTP id r53D34Wg016570
 for <linux-mtd@lists.infradead.org>; Mon, 3 Jun 2013 15:03:09 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: UBIFS: Orphaned inode 1
Date: Mon, 3 Jun 2013 13:03:04 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FC8C034@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FC8BF32@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FC8BF32@post.tritech.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,=0A=
=0A=
I'm facing a problem involving systems running in the field that suddenly c=
annot=0A=
boot anymore because the root UBIFS file system residing in a NOR flash=0A=
cannot be mounted. Error msg in kernel log is:=0A=
=0A=
UBIFS error (pid 1): ubifs_iget: failed to read inode 1, error -2=0A=
=0A=
I have managed to copy a failing FLASH image into a file on my PC, uploaded=
 it=0A=
to an mtdram device and tried to mount it with all debug info turned on and=
=0A=
"general" checks enabled. The final error is the same:=0A=
=0A=
< snip >=0A=
[ 5513.523872] UBIFS: mounted UBI device 0, volume 0, name "debug-rootfs"=
=0A=
[ 5513.523878] UBIFS: file system size:   57877248 bytes (56520 KiB, 55 MiB=
, 442 LEBs)=0A=
[ 5513.523882] UBIFS: journal size:       8773248 bytes (8567 KiB, 8 MiB, 6=
7 LEBs)=0A=
[ 5513.523885] UBIFS: media format:       w4/r0 (latest is w4/r0)=0A=
[ 5513.523887] UBIFS: default compressor: lzo=0A=
[ 5513.523893] UBIFS: reserved for root:  261902 bytes (255 KiB)=0A=
[ 5513.523896] UBIFS DBG (pid 4659): mount_ubifs: compiled on:         May =
31 2013 at 13:31:25=0A=
[ 5513.523900] UBIFS DBG (pid 4659): mount_ubifs: min. I/O unit size:  8 by=
tes=0A=
[ 5513.523903] UBIFS DBG (pid 4659): mount_ubifs: max. write size:     64 b=
ytes=0A=
[ 5513.523905] UBIFS DBG (pid 4659): mount_ubifs: LEB size:            1309=
44 bytes (127 KiB)=0A=
[ 5513.523908] UBIFS DBG (pid 4659): mount_ubifs: data journal heads:  1=0A=
[ 5513.523911] UBIFS DBG (pid 4659): mount_ubifs: UUID:                B43E=
1323-1747-41FB-9C11-F4C0E59C24B8=0A=
[ 5513.523914] UBIFS DBG (pid 4659): mount_ubifs: big_lpt              0=0A=
[ 5513.523916] UBIFS DBG (pid 4659): mount_ubifs: log LEBs:            4 (3=
 - 6)=0A=
[ 5513.523919] UBIFS DBG (pid 4659): mount_ubifs: LPT area LEBs:       2 (7=
 - 8)=0A=
[ 5513.523921] UBIFS DBG (pid 4659): mount_ubifs: orphan area LEBs:    1 (9=
 - 9)=0A=
[ 5513.523924] UBIFS DBG (pid 4659): mount_ubifs: main area LEBs:      442 =
(10 - 451)=0A=
[ 5513.523926] UBIFS DBG (pid 4659): mount_ubifs: index LEBs:          32=
=0A=
[ 5513.523935] UBIFS DBG (pid 4659): mount_ubifs: total index bytes:   6227=
20 (608 KiB, 0 MiB)=0A=
[ 5513.523940] UBIFS DBG (pid 4659): mount_ubifs: key hash type:       0=0A=
[ 5513.523944] UBIFS DBG (pid 4659): mount_ubifs: tree fanout:         8=0A=
[ 5513.523949] UBIFS DBG (pid 4659): mount_ubifs: reserved GC LEB:     443=
=0A=
[ 5513.523953] UBIFS DBG (pid 4659): mount_ubifs: first main LEB:      10=
=0A=
[ 5513.523958] UBIFS DBG (pid 4659): mount_ubifs: max. znode size      320=
=0A=
[ 5513.523964] UBIFS DBG (pid 4659): mount_ubifs: max. index node size 192=
=0A=
[ 5513.523967] UBIFS DBG (pid 4659): mount_ubifs: node sizes:          data=
 48, inode 160, dentry 56=0A=
[ 5513.523970] UBIFS DBG (pid 4659): mount_ubifs: node sizes:          trun=
 56, sb 4096, master 512=0A=
[ 5513.523973] UBIFS DBG (pid 4659): mount_ubifs: node sizes:          ref =
64, cmt. start 32, orph 32=0A=
[ 5513.523977] UBIFS DBG (pid 4659): mount_ubifs: max. node sizes:     data=
 4144, inode 4256 dentry 312, idx 188=0A=
[ 5513.523979] UBIFS DBG (pid 4659): mount_ubifs: dead watermark:      56=
=0A=
[ 5513.523982] UBIFS DBG (pid 4659): mount_ubifs: dark watermark:      4256=
=0A=
[ 5513.523984] UBIFS DBG (pid 4659): mount_ubifs: LEB overhead:        2480=
=0A=
[ 5513.523987] UBIFS DBG (pid 4659): mount_ubifs: max. dark space:     1881=
152 (1837 KiB, 1 MiB)=0A=
[ 5513.523989] UBIFS DBG (pid 4659): mount_ubifs: maximum bud bytes:   8249=
472 (8056 KiB, 7 MiB)=0A=
[ 5513.523992] UBIFS DBG (pid 4659): mount_ubifs: BG commit bud bytes: 6702=
696 (6545 KiB, 6 MiB)=0A=
[ 5513.523995] UBIFS DBG (pid 4659): mount_ubifs: current bud bytes    9011=
2 (88 KiB, 0 MiB)=0A=
[ 5513.523998] UBIFS DBG (pid 4659): mount_ubifs: max. seq. number:    2385=
1433=0A=
[ 5513.524000] UBIFS DBG (pid 4659): mount_ubifs: commit number:       1769=
=0A=
[ 5513.524003] ubifs_iget: UBIFS DBG gen: inode 1=0A=
[ 5513.524011] ubifs_lookup_level0: UBIFS DBG tnc: search key (1, inode)=0A=
[ 5513.524015] ubifs_lookup_level0: UBIFS DBG tnc: found 0, lvl 0, n -1=0A=
[ 5513.524018] UBIFS error (pid 4659): ubifs_iget: failed to read inode 1, =
error -2=0A=
[ 5513.524022] ubifs_evict_inode: UBIFS DBG gen: inode 1, mode 0x8000=0A=
[ 5513.524026] ubifs_umount: UBIFS DBG gen: un-mounting UBI device 0, volum=
e 0=0A=
[ 5513.524049] UBIFS DBG (pid 4660): ubifs_bg_thread: background thread "ub=
ifs_bgt0_0" stops=0A=
=0A=
If i grep the log for recovery messages I get:=0A=
=0A=
[ 5513.520324] UBIFS: recovery needed=0A=
[ 5513.520327] ubifs_recover_inl_heads: UBIFS DBG rcvry: checking index hea=
d at 449:109136=0A=
[ 5513.520343] ubifs_recover_inl_heads: UBIFS DBG rcvry: checking LPT head =
at 7:123208=0A=
[ 5513.520983] ubifs_recover_leb: UBIFS DBG rcvry: 219:93032, jhead 0, grou=
ped 0=0A=
[ 5513.521039] ubifs_recover_leb: UBIFS DBG rcvry: found corruption - -1=0A=
[ 5513.521073] clean_buf: UBIFS DBG rcvry: cleaning corruption at 219:93032=
=0A=
[ 5513.521079] fix_unclean_leb: UBIFS DBG rcvry: fixing LEB 219 start 93032=
 endpt 93032=0A=
[ 5513.521396] ubifs_recover_leb: UBIFS DBG rcvry: 369:83568, jhead 1, grou=
ped 1=0A=
[ 5513.521474] ubifs_recover_leb: UBIFS DBG rcvry: found corruption - -1=0A=
[ 5513.521548] clean_buf: UBIFS DBG rcvry: cleaning corruption at 369:83568=
=0A=
[ 5513.521557] fix_unclean_leb: UBIFS DBG rcvry: fixing LEB 369 start 83568=
 endpt 83568=0A=
[ 5513.521853] ubifs_recover_leb: UBIFS DBG rcvry: 444:126120, jhead 2, gro=
uped 1=0A=
[ 5513.521919] ubifs_recover_leb: UBIFS DBG rcvry: found corruption - -1=0A=
[ 5513.521952] clean_buf: UBIFS DBG rcvry: cleaning corruption at 444:12612=
0=0A=
[ 5513.521968] fix_unclean_leb: UBIFS DBG rcvry: fixing LEB 444 start 12612=
0 endpt 126120=0A=
[ 5513.522770] kill_orphans: UBIFS DBG rcvry: LEB 9=0A=
[ 5513.522885] do_kill_orphans: UBIFS DBG rcvry: deleting orphaned inode 12=
08852=0A=
[ 5513.523313] do_kill_orphans: UBIFS DBG rcvry: deleting orphaned inode 1=
=0A=
[ 5513.523489] do_kill_orphans: UBIFS DBG rcvry: last orph node for commit =
1700 at 9:0=0A=
[ 5513.523494] ubifs_rcvry_gc_commit: UBIFS DBG rcvry: GC head LEB 219, off=
s 93032=0A=
[ 5513.523512] ubifs_rcvry_gc_commit: UBIFS DBG rcvry: committing=0A=
[ 5513.523768] ubifs_rcvry_gc_commit: UBIFS DBG rcvry: GC'ing LEB 443=0A=
[ 5513.523840] ubifs_rcvry_gc_commit: UBIFS DBG rcvry: allocated LEB 443 fo=
r GC=0A=
[ 5513.523843] UBIFS: recovery completed=0A=
=0A=
The message that caught my attention:=0A=
=0A=
[ 5513.523313] do_kill_orphans: UBIFS DBG rcvry: deleting orphaned inode 1=
=0A=
=0A=
How can inode 1 be an orphan, or rather shouldn't it be?=0A=
Is it possible for a user-space application to cause this error?=0A=
Should I also look in UBI and MTD layers for the cause?=0A=
I'm not sure where to go on from here, any suggestions are welcome!!=0A=
=0A=
My target system runs a Freescale MPC5125 (PPC e300c4) with a Linux 2.6.35.=
14=0A=
kernel patched with all UBFS patches from Artem's 2.6.35 maintenance tree a=
nd=0A=
additional ones from later kernel versions.=0A=
My PC runs the latest LMDE (3.2.32) recompiled with dynamic debug turned on=
.=0A=
=0A=
BR // Mats=0A=

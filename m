Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NmSoz-000375-KA
	for linux-mtd@lists.infradead.org; Tue, 02 Mar 2010 14:11:42 +0000
Received: by fxm6 with SMTP id 6so346485fxm.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Mar 2010 06:11:34 -0800 (PST)
Date: Tue, 2 Mar 2010 15:11:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: mkfs.ubifs: double free or corruption, while trying to create
	bigger image than -c allow
Message-ID: <20100302141158.GE3206@jama>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

when I run mkfs.ubifs and the rootfs directory is bigger and needs more
LEBs than -c parameter, then it says right message, but then fails with
"double free or corruption" and shows backtrace.

But the backtrace is shown only for some bigger counts (or so it seems), 
in some cases is only the Error about LEBs count shown and no backtrace.

But those error messages also doesn't seem right:

(gdb) set args  -r /home/projects/OE/tmpdir-dev-shr/rootfs/shr-lite-image/ -o image.ubifs -m 2048 -e 126976 -c 2
Error: too low max. count of LEBs, minimum is 17
(gdb) set args  -r /home/projects/OE/tmpdir-dev-shr/rootfs/shr-lite-image/ -o image.ubifs -m 2048 -e 126976 -c 17
Error: too many log LEBs, maximum is 0
(gdb) set args  -r /home/projects/OE/tmpdir-dev-shr/rootfs/shr-lite-image/ -o image.ubifs -m 2048 -e 126976 -c 18
Error: too many log LEBs, maximum is 1

Build arch is x86_64, gcc-4.4.3, glibc-2.11, latest gentoo.

Starting program: /home/projects/OE/projects/mtd-utils/mkfs.ubifs/mkfs.ubifs -r /home/projects/OE/tmpdir-dev-shr/rootfs/shr-lite-image/ -o image.ubifs -m 2048 -e 126976 -c 204
Error: max_leb_cnt too low (431 needed)
*** glibc detected *** /home/projects/OE/projects/mtd-utils/mkfs.ubifs/mkfs.ubifs: double free or corruption (!prev): 0x0000000000612080 ***
======= Backtrace: =========
/lib/libc.so.6(+0x72406)[0x7ffff7232406]
/lib/libc.so.6(cfree+0x6c)[0x7ffff72371ac]
/home/projects/OE/projects/mtd-utils/mkfs.ubifs/mkfs.ubifs[0x405030]
/lib/libc.so.6(__libc_start_main+0xfd)[0x7ffff71debbd]
/home/projects/OE/projects/mtd-utils/mkfs.ubifs/mkfs.ubifs[0x401a89]
======= Memory map: ========
00400000-00411000 r-xp 00000000 09:04 1010792                            /home/projects/OE/projects/mtd-utils/mkfs.ubifs/mkfs.ubifs
00610000-00611000 r--p 00010000 09:04 1010792                            /home/projects/OE/projects/mtd-utils/mkfs.ubifs/mkfs.ubifs
00611000-00612000 rw-p 00011000 09:04 1010792                            /home/projects/OE/projects/mtd-utils/mkfs.ubifs/mkfs.ubifs
00612000-008e6000 rw-p 00000000 00:00 0                                  [heap]
7ffff0000000-7ffff0021000 rw-p 00000000 00:00 0
7ffff0021000-7ffff4000000 ---p 00000000 00:00 0
7ffff6fa9000-7ffff6fbf000 r-xp 00000000 09:03 1355761                    /lib64/libgcc_s.so.1
7ffff6fbf000-7ffff71be000 ---p 00016000 09:03 1355761                    /lib64/libgcc_s.so.1
7ffff71be000-7ffff71bf000 r--p 00015000 09:03 1355761                    /lib64/libgcc_s.so.1
7ffff71bf000-7ffff71c0000 rw-p 00016000 09:03 1355761                    /lib64/libgcc_s.so.1
7ffff71c0000-7ffff7310000 r-xp 00000000 09:03 1339351                    /lib64/libc-2.11.so
7ffff7310000-7ffff750f000 ---p 00150000 09:03 1339351                    /lib64/libc-2.11.so
7ffff750f000-7ffff7513000 r--p 0014f000 09:03 1339351                    /lib64/libc-2.11.so
7ffff7513000-7ffff7514000 rw-p 00153000 09:03 1339351                    /lib64/libc-2.11.so
7ffff7514000-7ffff7519000 rw-p 00000000 00:00 0
7ffff7519000-7ffff751d000 r-xp 00000000 09:03 1338882                    /lib64/libuuid.so.1.3.0
7ffff751d000-7ffff771c000 ---p 00004000 09:03 1338882                    /lib64/libuuid.so.1.3.0
7ffff771c000-7ffff771d000 r--p 00003000 09:03 1338882                    /lib64/libuuid.so.1.3.0
7ffff771d000-7ffff771e000 rw-p 00004000 09:03 1338882                    /lib64/libuuid.so.1.3.0
7ffff771e000-7ffff779e000 r-xp 00000000 09:03 1340354                    /lib64/libm-2.11.so
7ffff779e000-7ffff799d000 ---p 00080000 09:03 1340354                    /lib64/libm-2.11.so
7ffff799d000-7ffff799e000 r--p 0007f000 09:03 1340354                    /lib64/libm-2.11.so
7ffff799e000-7ffff799f000 rw-p 00080000 09:03 1340354                    /lib64/libm-2.11.so
7ffff799f000-7ffff79c7000 r-xp 00000000 09:03 963262                     /usr/lib64/liblzo2.so.2.0.0
7ffff79c7000-7ffff7bc7000 ---p 00028000 09:03 963262                     /usr/lib64/liblzo2.so.2.0.0
7ffff7bc7000-7ffff7bc8000 r--p 00028000 09:03 963262                     /usr/lib64/liblzo2.so.2.0.0
7ffff7bc8000-7ffff7bc9000 rw-p 00029000 09:03 963262                     /usr/lib64/liblzo2.so.2.0.0
7ffff7bc9000-7ffff7bde000 r-xp 00000000 09:03 1338978                    /lib64/libz.so.1.2.3
7ffff7bde000-7ffff7ddd000 ---p 00015000 09:03 1338978                    /lib64/libz.so.1.2.3
7ffff7ddd000-7ffff7dde000 r--p 00014000 09:03 1338978                    /lib64/libz.so.1.2.3
7ffff7dde000-7ffff7ddf000 rw-p 00015000 09:03 1338978                    /lib64/libz.so.1.2.3
7ffff7ddf000-7ffff7dfd000 r-xp 00000000 09:03 1340346                    /lib64/ld-2.11.so
7ffff7f52000-7ffff7fc7000 rw-p 00000000 00:00 0
7ffff7ffa000-7ffff7ffb000 rw-p 00000000 00:00 0
7ffff7ffb000-7ffff7ffc000 r-xp 00000000 00:00 0                          [vdso]
7ffff7ffc000-7ffff7ffd000 r--p 0001d000 09:03 1340346                    /lib64/ld-2.11.so
7ffff7ffd000-7ffff7ffe000 rw-p 0001e000 09:03 1340346                    /lib64/ld-2.11.so
7ffff7ffe000-7ffff7fff000 rw-p 00000000 00:00 0
7ffffffe9000-7ffffffff000 rw-p 00000000 00:00 0                          [stack]
ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0                  [vsyscall]

Program received signal SIGABRT, Aborted.
0x00007ffff71f21b5 in raise () from /lib/libc.so.6
(gdb) back
#0  0x00007ffff71f21b5 in raise () from /lib/libc.so.6
#1  0x00007ffff71f35e0 in abort () from /lib/libc.so.6
#2  0x00007ffff722ce77 in ?? () from /lib/libc.so.6
#3  0x00007ffff7232406 in ?? () from /lib/libc.so.6
#4  0x00007ffff72371ac in free () from /lib/libc.so.6
#5  0x0000000000405030 in deinit (argc=<value optimized out>, argv=<value optimized out>) at mkfs.ubifs.c:2250
#6  mkfs (argc=<value optimized out>, argv=<value optimized out>) at mkfs.ubifs.c:2313
#7  main (argc=<value optimized out>, argv=<value optimized out>) at mkfs.ubifs.c:2329

Let me know if you need any aditional information.

Thanks

Kind regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         

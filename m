Received: from mail.everest-co.com ([64.3.182.162] helo=pe2650.everest-co.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DWG9l-0005jx-4l
	for linux-mtd@lists.infradead.org; Thu, 12 May 2005 12:03:26 -0400
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Date: Thu, 12 May 2005 11:04:05 -0500
Message-ID: <81772B4336DEC14EBB8C519C4EC21051F80D96@pe2650.everest-co.com>
From: "Ralph Walden" <ralphw@everest-co.com>
To: <linux-mtd@lists.infradead.org>
Subject: kernel BUG at fs/jffs2/gc.c:190!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In an attempt to solve a problem I have been having with the stock
2.6.11 JFFS2 filesystem I described in an earlier post, I upgraded my
kernel with a MTD snapshot dated 2005-04-05.

I implemented a test whereby my system will boot up then:
       1. mount the JFFS2 filesystem,
       2. write a 512k file to the JFFS2 filesystem.
       3. umount the JFFS2 filesystem
       4. reboot


After the 88th cycle, after step 3, the umount, I get:

kernel BUG at fs/jffs2/gc.c:190!
Unable to handle kernel NULL pointer dereference at virtual address
00000000
pgd = c0004000
[00000000] *pgd=00000000
Internal error: Oops: 817 [#1]
Modules linked in: ide_disk ide_generic ide_core ide_omap omap_keypad
rv5c387_rt
c i2c_omap ladue1510_bq2050h ladue1510_ts alarm loc_init
CPU: 0
PC is at __bug+0x40/0x54
LR is at release_console_sem+0x1d0/0x250
pc : [<c0038700>]    lr : [<c004da0c>]    Tainted: P
sp : c08f1d90  ip : c08f1d24  fp : c08f1da0
r10: 00000000  r9 : 00000000  r8 : c0030d50
r7 : 00000001  r6 : 00000000  r5 : c08f0000  r4 : 00000000
r3 : 00000000  r2 : 00000000  r1 : 00000a5c  r0 : 00000001
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: 317F  Table: 102EC000  DAC: 00000015
Process jffs2_gcd_mtd5 (pid: 235, stack limit = 0xc08f0194)
Stack: (0xc08f1d90 to 0xc08f2000)
1d80:                                     c0b1bbf4 c08f1f50 c08f1da4
c0116070
1da0: c00386d0 c006340c c08f1dbc c08f1dbc 00000000 c09af580 c006340c
c08f1dbc
1dc0: c08f1dbc c00b1958 c0090b88 00000001 c0892b4c 00000350 000001b0
c09af580
1de0: c09af580 c0281970 c09af580 c0030d20 00000000 00000000 00000000
00000000
1e00: c08f1e30 c08f1e10 c0034628 c00488ec 00000000 c01f731c 00000000
00000020
1e20: c027d60c 35393333 c0273935 00000024 c08f1e4c c08f1e40 c0277230
00000024
1e40: c08f1e7c c08f1e50 c00349c4 c0048870 c08f1e88 c08f1e60 ffffffff
fefe0000
1e60: ffffffff 00000001 c027d250 0000000a c08f1f30 ffffffff 00000002
c027d20d
1e80: c027d60c c08f1ed4 c08f1e94 c01298fc c01290f0 0000000a ffffffff
ffffffff
1ea0: 00000002 00000400 c020b82e 00000400 c08f0000 0031661c c08f1ee8
c08f1ec8
1ec0: c004da0c 00000400 c020f9e8 00000400 c08f0000 00316644 c08f1f08
c08f1ee8
1ee0: c004da0c c0048870 c08f0000 00000000 60000013 00000028 c0030d20
c08f1f30
1f00: c08f1f0c c004dc40 c004d84c c004dca8 c004da9c 00000001 20000013
c09af580
1f20: c08f0000 c08f1f40 00000001 20000013 c09af580 c08f0000 c0030d20
00000000
1f40: 00000000 c08f1ff4 c08f1f54 c0119bfc c0115e20 00000001 00000000
00000080
1f60: 00000000 00000000 5a5a5a5a 5a5a5a5a 5a5a5a5a c08f1f9c c08f1f84
c00494f4
1f80: c0048870 00000000 00000000 00000000 c08f1fac c08f1fa0 c0049584
c00494d8
1fa0: 00000000 c08f1fb0 c0033988 c0049584 00000000 c0030d20 c0119a64
c004f430
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
1fe0: 00000000 00000000 00000000 c08f1ff8 c004f430 c0119a74 4bdd0c2f
7e8b537d
Backtrace:
[<c00386c0>] (__bug+0x0/0x54) from [<c0116070>]
(jffs2_garbage_collect_pass+0x26
0/0x1fb8)
 r4 = C0B1BBF4
[<c0115e10>] (jffs2_garbage_collect_pass+0x0/0x1fb8) from [<c0119bfc>]
(jffs2_ga
rbage_collect_thread+0x198/0x1f8)
[<c0119a64>] (jffs2_garbage_collect_thread+0x0/0x1f8) from [<c004f430>]
(do_exit
+0x0/0xc08)
 r8 = 00000000  r7 = 00000000  r6 = 00000000  r5 = 00000000
 r4 = 00000000
Code: 1b005565 e59f0014 eb005563 e3a03000 (e5833000)
 <6>note: jffs2_gcd_mtd5[235] exited with preempt_count 1
jffs2_clear_inode(): ino #2 mode 40755
jffs2_clear_inode(): ino #9 mode 100755
jffs2_clear_inode(): ino #24 mode 100644
jffs2_clear_inode(): ino #6 mode 100644
jffs2_clear_inode(): ino #23 mode 100644
jffs2_clear_inode(): ino #22 mode 100644
jffs2_clear_inode(): ino #15 mode 100644
jffs2_clear_inode(): ino #28 mode 100644
jffs2_clear_inode(): ino #25 mode 100644
jffs2_clear_inode(): ino #20 mode 100644
jffs2_clear_inode(): ino #17 mode 100644
jffs2_clear_inode(): ino #19 mode 100644
jffs2_clear_inode(): ino #18 mode 100644
jffs2_clear_inode(): ino #170 mode 100644
jffs2_clear_inode(): ino #21 mode 100755
jffs2_clear_inode(): ino #182 mode 100644
jffs2: Killing GC task 235


I started with a filesystem that was build from a directory of files,
with the following command:

mkfs.jffs2 -l --pad=0x1b00000 -d $JFFS2_ROOT -o jffs2.img -n -e 128

Which makes a 27MB filesystem seeded with my data and programs.  This is
variously written with u-boot or under linux using 
       flash_erase /dev/mtd5 etc,etc,
       cp jffs2.img /dev/mtd5


I have debugging level 1 turned on, and throughout the trial, there are
scattered debug messages when the file is (over)written:
----
>Marking node at 0x007c6d70 REF_PRISTINE
----
7>dnode @01a11f70: ver 1890, offset 55800, dsize 0400
ion now 2060
----
ode at 019f24f8 (0) is a data node
----
AL
----
de
ersion now 40
----
fraglist to 0x000008fd bytes
Marking node at 0x0078ae90 REF_PRISTINE
----
ta node a data node
---- 
Etc... I realize that many of these are lost by being split up by other
intervening kernel messages and are only partial messages.  I can
provide the whole 800k log if necessary.

Since this happens after the umount of the filesystem, and the garbage
collector bombs while trying to do some work, is it possible this is a
race condition that the garbage collector lost?

Thanks,

Ralph Walden



******************************************************************

This email and any files transmitted with it are the property of 
Everest Biomedical Instruments Company and are confidential. If 
you have received this email in error please notify the sender or 
Everest Biomedical at postmaster@everest-co.com or 636-519-7770.

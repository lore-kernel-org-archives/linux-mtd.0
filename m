Received: from web52702.mail.yahoo.com ([206.190.39.153])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CAWjY-0001dz-NA
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2004 12:46:20 -0400
Message-ID: <20040923163829.13502.qmail@web52702.mail.yahoo.com>
Date: Thu, 23 Sep 2004 09:38:29 -0700 (PDT)
From: Michael Moedt <xemc@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: problem code confusion
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.
My kernel crashed recently, and I'm analyzing the kernel oops.  I'll
put parts of the dump at the end of this message.  It crashed because
of a NULL pointer dereference (doesn't every crash do this?).

Anyways, I ran into this assembly:
(looking at the 'objdump -D vmlinux' output)

c00b093c:       ebfdfa5e        bl      c002f2bc <printk>
c00b0940:       e5953110        ldr     r3, [r5, #272]
c00b0944:       e3530000        cmp     r3, #0  ; 0x0
c00b0948:       1595110c        ldrne   r1, [r5, #268]
c00b094c:       159f0300        ldrne   r0, [pc, #768]  ; c00b0c54
<jffs2_flash_writev+0x468>
c00b0950:       10812003        addne   r2, r1, r3
c00b0954:       1bfdfa58        blne    c002f2bc <printk>
c00b0958:       e3a03000        mov     r3, #0  ; 0x0
c00b095c:       e5833000        str     r3, [r3]
c00b0960:       e51b104c        ldr     r1, [fp, -#76]
c00b0964:       e3510002        cmp     r1, #2  ; 0x2
c00b0968:       9a000003        bls     c00b097c
<jffs2_flash_writev+0x190>
c00b096c:       e59f02e4        ldr     r0, [pc, #740]  ; c00b0c58
<jffs2_flash_writev+0x46c>
c00b0970:       ebfdfa51        bl      c002f2bc <printk>
c00b0974:       e3a03000        mov     r3, #0  ; 0x0
c00b0978:       e5833000        str     r3, [r3]

I'm interested in the last two lines (it happens furter up too..)
Wouldn't that move 0x0 into r3, and then try to store it at address
0x00000000.  Could that be the NULL pointer dereference referred to?
Why would the compiled code have that in there?  (Please forgive my
naivite if i'm completely out to lunch)

Any comments would be apprectiated.   Thanks.


This is kernel 2.6.9-rc2, mtd-snapshot-20040921, with
arm-softfloat-linux-gnu-gcc (from crosstool) 3.3.2.
Here's that part of the dump:

Unable to handle kernel NULL pointer dereference at virtual address
00000000
Internal error: Oops: 807 [#1]
CPU: 0
pc : [<c00b095c>]    lr : [<00000001>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
sp : c11fbbc4  ip : 60000093  fp : c11fbc34
r10: c11014f4  r9 : 00000000  r8 : 007d8000
r7 : 00000000  r6 : 007dae40  r5 : c0170400  r4 : 00000000
r3 : 00000000  r2 : 00000000  r1 : c11fa000  r0 : 0000003a
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: 4000717F  Table: C01DC000  DAC: 00000015
Stack: (0xc11fbbc4 to 0xc11fc000)
bbc0:          c11fbbec cc167979 c0135728 00000004 007dae40 00000000
ffffffff
bbe0: 00000000 00000000 00000002 c11fbc6c c00b8b10 cd800000 00000000
c0135728
bc00: c11fbc2c c11fbc10 c00bda6c 007dae40 00000000 c11014f4 c1178b60
c0170400

<I'll cut to the backtrace here>

Backtrace:
Function entered at [<c00b07f0>] from [<c00a6ef8>]
Function entered at [<c00a6d84>] from [<c00a7d14>]
Function entered at [<c00a7a2c>] from [<c00a3060>]
Function entered at [<c00a2eb4>] from [<c0048e58>]
Function entered at [<c0048ab0>] from [<c004956c>]
Function entered at [<c004909c>] from [<c0049618>]
Function entered at [<c0049594>] from [<c00497a8>]
 r9 = BEFFEAF8  r8 = C01A8260  r7 = C1178B88  r6 = 00037000
 r5 = C1178C20  r4 = C1178BF0
Function entered at [<c004974c>] from [<c0060994>]
Function entered at [<c00608b0>] from [<c0060a90>]
Function entered at [<c0060a40>] from [<c001b240>]
 r9 = C11FA000  r8 = C001B3C4  r7 = 00000004  r6 = BEFFEAF8
 r5 = 00001000  r4 = 00001000
Code: 159f0300 10812003 1bfdfa58 e3a03000 (e5833000)

>>EIP; c00b095c <jffs2_flash_writev+170/51c>   <=====

Trace; c00b07f0 <jffs2_flash_writev+4/51c>
Trace; c00a6ef8 <jffs2_write_dnode+174/684>
Trace; c00a6d84 <jffs2_write_dnode+0/684>
Trace; c00a7d14 <jffs2_write_inode_range+2e8/46c>
Trace; c00a7a2c <jffs2_write_inode_range+0/46c>
Trace; c00a3060 <jffs2_commit_write+1ac/308>
Trace; c00a2eb4 <jffs2_commit_write+0/308>
Trace; c0048e58 <generic_file_buffered_write+3ac/5f0>
Trace; c0048ab0 <generic_file_buffered_write+4/5f0>
<snip>

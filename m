Received: from pc-195141233162.pcds.ch ([195.141.233.162] helo=fela.ch)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CMoGH-0004DW-0a
	for linux-mtd@lists.infradead.org; Wed, 27 Oct 2004 09:54:50 -0400
Received: from [192.168.139.130] (DHCP130 [192.168.139.130])
	by fela.ch (8.9.3/8.9.3) with ESMTP id PAA15225
	for <linux-mtd@lists.infradead.org>; Wed, 27 Oct 2004 15:54:30 +0200
Message-ID: <417FA8BD.4070600@gmx.net>
Date: Wed, 27 Oct 2004 15:55:09 +0200
From: Lukas Heiniger <lh_mail@gmx.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Strange kernel crashes when probing intel strata flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all

We're facing strange problems with our intel strata flash. In some cases 
the kernel crashes while probing the flash (see oops message below). The 
crash occurs in cfi_probe_chip() around

cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
(http://lxr.linux.no/source/drivers/mtd/chips/cfi_probe.c?v=2.6.8.1;a=arm#L85)

The strange thing is that the crashes do not occur randomly. The 
behaviour seems to change only if we use our bootloader to download 
something new to the flash (kernel, rootfs etc). I.e. after a download 
the kernel either always crashes at the point mentioned or it always 
boots correctly. Yes, this sounds like a bootloader issue, but what 
permanent change could a bootloader make, that would cause the kernel to 
crash?

The other strange thing is, that inserting printks for debugging into 
cfi_send_gen_cmd() seems to be a reliable remedy. A kernel with a printk 
inserted before map_write() in cfi_send_gen_cmd() never crashed up to 
now. Even a mdelay(100) works. Timing issue, you might say. But then, 
why do we have phases where the kernel boots happily without any printk 
until we do the next flash download via bootloader?

Also, the 0xF0 command which is the first commmand to be sent to the 
flash, is not documented in the datasheet. I guess it's required by 
other flash types. Could it be that this command puts our flash into an 
undefined state under certain circumstances?

Thanks in advance
Lukas



System setup:
Bootloader: U-Boot 1.0.0
Kernel: Linux-2.6.9-rc4
Controller: Hynix HMS30C7202
Flash: 2 x Intel 28F128J3, 16MB, 16Bit, Interleave = 1

--
Internal error: Oops: 0 [#1]
CPU: 0
pc : [<c011dc58>]    lr : [<c011dbd8>]    Not tainted
sp : c027becc  ip : 00000000  fp : c027bf28
r10: c027bf30  r9 : 00000055  r8 : 00000000
r7 : 00000002  r6 : c01c45f0  r5 : 00000001  r4 : 00000002
r3 : c1880000  r2 : 00000098  r1 : 00000002  r0 : 00000001
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: 217F  Table: 4000401D  DAC: 0000001D
Stack: (0xc027becc to 0xc027c000)
bec0:                            00000020 c01fa577 00000010 00000000 
0000001e
bee0: c027bf24 00000002 c027befc c027bf24 c027befc 00000098 000000ff 
000000f0
bf00: 00000001 00000002 00000000 c0016fd0 c01c45f0 c027bf30 c01c458c 
c027bf90
bf20: c027bf2c c0123a28 c011d9d8 0000075d 00000000 00000000 00000001 
00000001
bf40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
bf60: 00000000 00000000 c01c4574 c01a16dc c01c45f0 c0016fd0 00000000 
00000000
bf80: c01c46e8 c027bfac c027bf94 c011c9bc c01239b8 c027a000 00000000 
c01c45f0
bfa0: c027bfd4 c027bfb0 c0013470 c011c974 c027a000 c0016fa4 00000001 
c0016fd0
bfc0: 00000000 00000000 c027bff4 c027bfd8 c0018150 c00133f4 00000000 
00000000
bfe0: 00000000 00000000 00000000 c027bff8 c002f534 c00180b0 e92ddff0 
e24cb004
Backtrace:
[<c011d9c8>] ($a+0x0/0x87c) from [<c0123a28>] ($a+0x80/0x2f4)
[<c01239a8>] ($a+0x0/0x2f4) from [<c011c9bc>] ($a+0x58/0xc8)
[<c011c964>] ($a+0x0/0xc8) from [<c0013470>] ($a+0x8c/0x13c)
 r6 = C01C45F0  r5 = 00000000  r4 = C027A000
[<c00133e4>] ($a+0x0/0x13c) from [<c0018150>] ($a+0xb0/0x1e8)
[<c00180a0>] ($a+0x0/0x1e8) from [<c002f534>] (do_exit+0x0/0xc7c)
 r7 = 00000000  r6 = 00000000  r5 = 00000000  r4 = 00000000
Code: 07c32009 0a000006 e3530002 0596300c (018320b9)


 >>LR;  c011dbd8 <cfi_probe_chip+210/cb4>

 >>PC;  c011dc58 <cfi_probe_chip+290/cb4>   <=====

Code;  c011dc48 <cfi_probe_chip+280/cb4>
00000000 <_PC>:
Code;  c011dc48 <cfi_probe_chip+280/cb4>
   0:   07c32009  streqb  r2, [r3, r9]
Code;  c011dc4c <cfi_probe_chip+284/cb4>
   4:   0a000006  beq     24 <_PC+0x24>
Code;  c011dc50 <cfi_probe_chip+288/cb4>
   8:   e3530002  cmp     r3, #2      ; 0x2
Code;  c011dc54 <cfi_probe_chip+28c/cb4>
   c:   0596300c  ldreq   r3, [r6, #12]
Code;  c011dc58 <cfi_probe_chip+290/cb4>
  10:   018320b9  streqh  r2, [r3, r9]

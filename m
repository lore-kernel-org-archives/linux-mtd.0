Received: from mail.bugwerft.de ([46.23.86.59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4Kd6-0004Jl-3B
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2018 06:46:02 +0000
From: Daniel Mack <daniel@zonque.org>
Subject: Trouble with new marvell_nand driver on PXA3xx
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Message-ID: <f3cf564d-7976-5b2e-ca07-ea872c165396@zonque.org>
Date: Mon, 24 Sep 2018 08:45:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

I'm having issues using the new marvell_nand driver on a PXA3xx based 
platform. My test does a ubiformat on the chip, then creates a volume, 
mounts it and runs bonnie++ on the file system. After some time (usually 
less than half a minute), the driver spits out a warning like the one 
below, and eventually the UBI layer bails out, which leads to a r/o 
remount and (possibly) file system corruptions.

FWIW, this is the test script I'm using:

 > #!/bin/sh
 >
 > UBIDEV=0
 > UBIMTD=3
 >
 > umount /mnt
 > ubidetach /dev/ubi_ctrl -d $UBIDEV
 > ubiformat -y /dev/mtd$UBIMTD
 > ubiattach /dev/ubi_ctrl -d $UBIDEV -m $UBIMTD
 > ubimkvol /dev/ubi$UBIDEV -N test -m
 > mount -t ubifs ubi0:test /mnt
 > bonnie\+\+ -d /mnt -u 0:0


The legacy pxa3xx_nand driver didn't have this issue, but my system was 
also running a much older kernel with that. I'm currently still 
struggling to resurrect the old code, but I'm running into "Wait time 
out!!!" conditions immediately right now. Not sure what's going on.

Interestingly, I can't seem to reproduce the bug with any of the mtd 
kernel tests, I've tried all of them, several times, and all succeed. So 
a file system test that includes the UBI/UBIFS layers seems to trigger 
different things in the driver than the the tests that operate on the 
mtd device directly.

I'v also tried this with and without the keep-config DT property, but 
that didn't change anything.

Could you try my script on some other device that runs the new driver 
and see if you can reproduce? If bonnie++ is unavailable, extracting a 
bigger tarball a couple of times will also trigger the bug at some point.

Meanwhile, I can start poking around in the driver. I'd be grateful for 
a hint on where to start.


Thanks,
Daniel


/ # bonnie\+\+ -d /mnt -u 0:0
Using uid:0, gid:0.
Writing with putc()...done
Writing intelligently...done
Rewriting...done
Reading with getc()...done
Reading intelligently...done
start 'em...done...done...done...
Create files in sequential order...[ 1290.458167] marvell-nfc 
43100000.nand-controller: Timeout waiting for RB signal
[ 1290.465532] ubi0 error: ubi_io_write: error -110 while writing 2048 
bytes to PEB 905:67584, written 0 bytes
[ 1290.475325] CPU: 0 PID: 1340 Comm: bonnie++ Not tainted 4.19.0-rc4+ #438
[ 1290.482055] Hardware name: Marvell PXA3xx (Device Tree Support)
[ 1290.487934] Backtrace:
[ 1290.490488] [<c0106120>] (dump_backtrace) from [<c01063dc>] 
(show_stack+0x18/0x1c)
[ 1290.498092]  r6:00000389 r5:00000000 r4:07130800 r3:2ebc2099
[ 1290.503745] [<c01063c4>] (show_stack) from [<c0686a64>] 
(dump_stack+0x20/0x28)
[ 1290.511013] [<c0686a44>] (dump_stack) from [<c045cf08>] 
(ubi_io_write+0x418/0x6bc)
[ 1290.518637] [<c045caf0>] (ubi_io_write) from [<c0459f80>] 
(ubi_eba_write_leb+0xc0/0x6f8)
[ 1290.526692]  r10:00000000 r9:c6769600 r8:00000104 r7:00000104 
r6:c686ec00 r5:c602d000
[ 1290.534546]  r4:00000000
[ 1290.537088] [<c0459ec0>] (ubi_eba_write_leb) from [<c04587f8>] 
(ubi_leb_write+0xc4/0xdc)
[ 1290.545209]  r10:00000000 r9:c6769600 r8:00000800 r7:00000104 
r6:00000080 r5:c6754000
[ 1290.553061]  r4:000007ff
[ 1290.555606] [<c0458734>] (ubi_leb_write) from [<c02d9420>] 
(ubifs_leb_write+0x88/0xf8)
[ 1290.563552]  r6:0000f800 r5:c6029000 r4:c6754000
[ 1290.568235] [<c02d9398>] (ubifs_leb_write) from [<c02da5b0>] 
(ubifs_wbuf_write_nolock+0x328/0x704)
[ 1290.577141]  r8:00000188 r7:c6beddc0 r6:00000188 r5:c6029000 r4:c67b5480
[ 1290.583909] [<c02da288>] (ubifs_wbuf_write_nolock) from [<c02cd260>] 
(write_head.constprop.1+0x3c/0x5c)
[ 1290.593333]  r10:00000000 r9:c6769648 r8:c6ce4000 r7:c6beddc0 
r6:c38809f0 r5:c6769600
[ 1290.601177]  r4:c67b5480
[ 1290.603720] [<c02cd224>] (write_head.constprop.1) from [<c02cd5dc>] 
(ubifs_jnl_update+0x35c/0x5ec)
[ 1290.612690]  r4:c6029000 r3:c6bedd48
[ 1290.616261] [<c02cd280>] (ubifs_jnl_update) from [<c02d3ce0>] 
(ubifs_create+0x134/0x1ec)
[ 1290.624384]  r10:c6ce4180 r9:c6ce4168 r8:c38767f8 r7:c6029000 
r6:c38809f0 r5:00000000
[ 1290.632238]  r4:c6ce4000
[ 1290.634785] [<c02d3bac>] (ubifs_create) from [<c01d0ba0>] 
(path_openat+0x770/0xe3c)
[ 1290.642475]  r10:c6ce4000 r9:c38767f8 r8:00000241 r7:c38767f8 
r6:00000000 r5:c666c280
[ 1290.650321]  r4:c6bede98
[ 1290.652858] [<c01d0430>] (path_openat) from [<c01d12b8>] 
(do_filp_open+0x4c/0xb0)
[ 1290.660376]  r10:00020000 r9:c6bec000 r8:c6068000 r7:00000001 
r6:c6bedf50 r5:c0a03008
[ 1290.668221]  r4:00000004
[ 1290.670761] [<c01d126c>] (do_filp_open) from [<c01befac>] 
(do_sys_open+0x124/0x1e0)
[ 1290.678447]  r7:00000241 r6:ffffff9c r5:c0a03008 r4:00000004
[ 1290.684086] [<c01bee88>] (do_sys_open) from [<c01bf0dc>] 
(sys_creat+0x28/0x30)
[ 1290.691351]  r10:00020000 r9:c6bec000 r8:c01011e4 r7:00000008 
r6:00000000 r5:0000f6c4
[ 1290.699204]  r4:b6c1f18c
[ 1290.701743] [<c01bf0b4>] (sys_creat) from [<c0101000>] 
(ret_fast_syscall+0x0/0x50)
[ 1290.709338] Exception stack(0xc6bedfa8 to 0xc6bedff0)
[ 1290.714367] dfa0:                   b6c1f18c 0000f6c4 b6c1f18c 
00000180 00000064 00000000
[ 1290.722566] dfc0: b6c1f18c 0000f6c4 00000000 00000008 beb2d8bc 
0002da58 00000000 0002c170
[ 1290.730768] dfe0: 00028010 beb2d850 00013f3c b6d20648
[ 1290.736257] ubi0: dumping 2048 bytes of data from PEB 905, offset 67584
...

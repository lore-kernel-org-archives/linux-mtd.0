Received: from fk-out-0910.google.com ([209.85.128.186])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LUmcF-0003ZY-Ll
	for linux-mtd@lists.infradead.org; Wed, 04 Feb 2009 18:36:55 +0000
Received: by fk-out-0910.google.com with SMTP id z23so2340190fkz.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Feb 2009 10:36:49 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 4 Feb 2009 13:36:49 -0500
Message-ID: <5c9cd53b0902041036g74c02067pcd05b60ff9f06630@mail.gmail.com>
Subject: Kernel Oops when load MTD NOR driver
From: mike zheng <mail4mz@gmail.com>
To: linuxppc-dev@ozlabs.orgl, linux-mtd@lists.infradead.org,
	linuxppc-embedded@ozlabs.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I have kernel Oops when load MTD NOR driver on 2.6.13.7. The flash I
have is 29LV160, physical address is 0xbf80,0000. Any idea on this
issue?

Thanks,

Mike

# insmod ./gen_probe.ko
# insmod ./cfi_util.ko
# insmod ./cfi_probe.ko
# insmod ./cfi_cmdset_0002.ko
# insmod ./1140e-mtd-nor.ko
Data bus error, epc == c0092204, ra == c00926a4
Oops[#1]:
Cpu 0
$ 0   : 00000000 00000000 c0480020 00000020
$ 4   : c0136550 00000000 00000002 00000002
$ 8   : 00000001 00000001 00000002 00020000
$12   : 80442e60 00000001 00200200 00100100
$16   : c0136550 00000002 80637de8 00000000
$20   : 00000016 00000000 00000016 c0136550
$24   : 00000008 c0095150
$28   : 80634000 80637d88 00000029 c00926a4
Hi    : 00000000
Lo    : 00000002
epc   : c0092204 qry_present+0x204/0x32c [cfi_probe]     Tainted: P
ra    : c00926a4 cfi_probe_chip+0x364/0x1450 [cfi_probe]
Status: 10008403    KERNEL EXL IE
Cause : 0080001c
PrId  : 00029018
Modules linked in: 1140e_mtd_nor cfi_cmdset_0002 cfi_probe cfi_util
gen_probe ept(P) halaudio(P) bcm1103_ts
Process insmod (pid: 252, threadinfo=80634000, task=80648a28)
Stack : 10008403 00000000 00000002 00005151 00005252 00005959 000284d0 801628dc
        000284d0 801d11a8 00800000 00800000 00000002 00000002 00000001 c0093d38
        00000016 c0133000 c00951e0 c0480000 80447c0c 00080000 bf800000 80162bb0
        00000000 00000000 00000002 00000001 00000000 00000000 00000000 00000000
        00000000 00000000 00000000 00000000 00000000 00000000 c0093d20 c01360a0
        ...
Call Trace:
[<c0092204>] qry_present+0x204/0x32c [cfi_probe]
[<c00926a4>] cfi_probe_chip+0x364/0x1450 [cfi_probe]
[<c00951e0>] mtd_do_chip_probe+0x90/0x4b0 [gen_probe]
[<80281af4>] do_map_probe+0x60/0x94
[<c01380d0>] ipclient_1140e_mtd_nor_map_init+0xd0/0x1e4 [1140e_mtd_nor]
[<80156134>] sys_init_module+0x14d4/0x1648
[<80111b50>] stack_done+0x20/0x3c


Code: 24020004  8c82000c  00431021 <94420000> 08024889  3046ffff
14c20005  000a1100  8c82000c
Dec 31 16:00:54 kernel: Data bus error, epc == c0092204, ra == c00926a4
Dec 31 16:00:54 kernel: Oops[#1]:
Dec 31 16:00:54 kernel: Cpu 0
Dec 31 16:00:54 kernel: $ 0   : 00000000 00000000 c0480020 00000020
Dec 31 16:00:54 kernel: $ 4   : c0136550 00000000 00000002 00000002
Dec 31 16:00:54 kernel: $ 8   : 00000001 00000001 00000002 00020000
Dec 31 16:00:54 kernel: $12   : 80442e60 00000001 00200200 00100100
Dec 31 16:00:54 kernel: $16   : c0136550 00000002 80637de8 00000000
Dec 31 16:00:54 kernel: $20   : 00000016 00000000 00000016 c0136550
Dec 31 16:00:54 kernel: $24   : 00000008 c0095150
Dec 31 16:00:54 kernel: $28Kernel Log Dump Start (logging disabled
while dumping)...
124512672 ticks/sec, 4294967295 (0xffffffff) max_timestamp, 0 entries
Kernel Log Dump End...
   : 80634000 80637d88 00000029 c00926a4
Dec 31 16:00:54 kernel: Hi    : 00000000
Dec 31 16:00:54 kernel: Lo    : 00000002
Dec 31 16:00:54 kernel: epc   : c0092204 qry_present+0x204/0x32c
[cfi_probe]     Tainted: P
Segmentation fault
# Dec 31 16:00:54 kernel: ra    : c00926a4 cfi_probe_chip+0x364/0x1450
[cfi_probe]
Dec 31 16:00:54 kernel: Status: 10008403    KERNEL EXL IE
Dec 31 16:00:54 kernel: Cause : 0080001c
Dec 31 16:00:54 kernel: PrId  : 00029018
Dec 31 16:00:54 kernel: Modules linked in: 1140e_mtd_nor
cfi_cmdset_0002 cfi_probe cfi_util gen_probe ept(P) has
Dec 31 16:00:54 kernel: Process insmod (pid: 252, threadinfo=80634000,
task=80648a28)
Dec 31 16:00:54 kernel: Stack : 10008403 00000000 00000002 00005151
00005252 00005959 000284d0 801628dc
Dec 31 16:00:54 kernel:         000284d0 801d11a8 00800000 00800000
00000002 00000002 00000001 c0093d38
Dec 31 16:00:54 kernel:         00000016 c0133000 c00951e0 c0480000
80447c0c 00080000 bf800000 80162bb0
Dec 31 16:00:54 kernel:         00000000 00000000 00000002 00000001
00000000 00000000 00000000 00000000
Dec 31 16:00:54 kernel:         00000000 00000000 00000000 00000000
00000000 00000000 c0093d20 c01360a0
Dec 31 16:00:54 kernel:         ...
Dec 31 16:00:54 kernel: Call Trace:
Dec 31 16:00:54 kernel: [<c0092204>] qry_present+0x204/0x32c [cfi_probe]
Dec 31 16:00:54 kernel: [<c00926a4>] cfi_probe_chip+0x364/0x1450 [cfi_probe]
Dec 31 16:00:54 kernel: [<c00951e0>] mtd_do_chip_probe+0x90/0x4b0 [gen_probe]
Dec 31 16:00:54 kernel: [<80281af4>] do_map_probe+0x60/0x94
Dec 31 16:00:54 kernel: [<c01380d0>]
ipclient_1140e_mtd_nor_map_init+0xd0/0x1e4 [1140e_mtd_nor]
Dec 31 16:00:54 kernel: [<80156134>] sys_init_module+0x14d4/0x1648
Dec 31 16:00:54 kernel: [<80111b50>] stack_done+0x20/0x3c
Dec 31 16:00:54 kernel:
Dec 31 16:00:54 kernel:
Dec 31 16:00:54 kernel: Code: 24020004  8c82000c  00431021 <94420000>
08024889  3046ffff  14c20005  000a1100  8
Dec 31 16:00:54 kernel: Kernel Log Dump Start (logging disabled while
dumping)...
Dec 31 16:00:54 kernel: 124512672 ticks/sec, 4294967295 (0xffffffff)
max_timestamp, 0 entries
Dec 31 16:00:54 kernel: Kernel Log Dump End...

# lsmod
Module                  Size  Used by
1140e_mtd_nor           2356  1
cfi_cmdset_0002        29728  0
cfi_probe               7872  1
cfi_util                3264  1 cfi_cmdset_0002
gen_probe               3456  1 cfi_probe
ept                  1680304  0
halaudio               74688  1 ept
bcm1103_ts              7216  0

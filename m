Received: from mail-ig0-x233.google.com ([2607:f8b0:4001:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhRgc-0003xt-2N
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2015 00:25:26 +0000
Received: by igbkq10 with SMTP id kq10so6283878igb.0
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2015 17:25:04 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 1 Oct 2015 08:25:04 +0800
Message-ID: <CAKA5=i-JCDkYAfwLde=QhCSg7E4y-7cXDLMKhy2A_Pd1oPDnOA@mail.gmail.com>
Subject: Kernel segfault when using nandsim on Debian kernel 4.1
From: ispamyou <ispamyou@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

when I try and use nandsim to emulate "SDTNRGAMA 64G 3.3V 8-bit" using
the following command I get a segmentation fault:

modprobe nandsim id_bytes=0x45,0xde,0x94,0x93,0x76,0x50 cache_file=./test.img

[  142.734637] [nandsim] warning: read_byte: unexpected data output
cycle, state is STATE_READY return 0x0
[  142.734637] [nandsim] warning: read_byte: unexpected data output
cycle, state is STATE_READY return 0x0
[  142.734640] nand: device found, Manufacturer ID: 0x45, Chip ID: 0xde
[  142.734641] nand: SanDisk SDTNRGAMA 64G 3.3V 8-bit
[  142.734644] nand: 8192 MiB, MLC, erase size: 4096 KiB, page size:
16384, OOB size: 1280
[  142.734650] nand: No oob scheme defined for oobsize 1280
[  142.734672] ------------[ cut here ]------------
[  142.734674] kernel BUG at
/build/linux-PoJsUp/linux-4.1.6/drivers/mtd/nand/nand_base.c:3952!
[  142.734677] invalid opcode: 0000 [#1] SMP
[  142.734680] Modules linked in: nandsim(+) nand nand_ecc nand_bch
bch nand_ids mtd cfg80211 rfkill joydev nfsd auth_rpcgss oid_registry
nfs_acl nfs lockd grace fscache sunrpc iosf_mbi coretemp
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_intel
hid_generic aes_x86_64 lrw irda gf128mul glue_helper psmouse
vmw_balloon crc_ccitt ablk_helper serio_raw vmw_vmci cryptd battery
pcspkr 8250_fintek acpi_cpufreq processor thermal_sys ac shpchp evdev
i2c_piix4 fuse parport_pc ppdev lp parport autofs4 usbhid hid ext4
crc16 mbcache jbd2 sr_mod cdrom ata_generic sg sd_mod crc32c_intel
ata_piix uhci_hcd ehci_pci ehci_hcd usbcore e1000 usb_common button
libata vmwgfx ttm mptspi scsi_transport_spi mptscsih drm_kms_helper
mptbase scsi_mod drm
[  142.734731] CPU: 0 PID: 1235 Comm: modprobe Not tainted
4.1.0-0.bpo.2-amd64 #1 Debian 4.1.6-1~bpo8+1
[  142.734733] Hardware name: VMware, Inc. VMware Virtual
Platform/440BX Desktop Reference Platform, BIOS 6.00 09/20/2012
[  142.734735] task: ffff88007aaf54f0 ti: ffff880079134000 task.ti:
ffff880079134000
[  142.734737] RIP: 0010:[<ffffffffa05d5ff0>]  [<ffffffffa05d5ff0>]
nand_scan_tail+0xa40/0xac0 [nand]
[  142.734743] RSP: 0018:ffff880079137c58  EFLAGS: 00010296
[  142.734745] RAX: 000000000000002c RBX: ffff880077093450 RCX: 0000000000000006
[  142.734746] RDX: 000000000000002c RSI: 0000000000000246 RDI: ffff88007f60ea10
[  142.734748] RBP: ffff880077093000 R08: 00000000000094d8 R09: 00000000000044aa
[  142.734750] R10: 0000000000000086 R11: 20726f662064656e R12: ffff880077093860
[  142.734751] R13: 0000000000000000 R14: ffffffffa05ec200 R15: ffff88007b67ad40
[  142.734754] FS:  00007fe945772700(0000) GS:ffff88007f600000(0000)
knlGS:0000000000000000
[  142.734756] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  142.734757] CR2: 00007f57a6920040 CR3: 00000000790fa000 CR4: 00000000000406f0
[  142.734870] Stack:
[  142.734873]  0000000000000000 0000000000000000 ffff880077093000
ffffffffa05ef54a
[  142.734877]  0000000000000000 0000000000000018 ffff880079137cd8
ffff880079137c98
[  142.734879]  0000000000000000 ffffffff81814080 ffff880077211760
ffffffffa05ef000
[  142.734882] Call Trace:
[  142.734889]  [<ffffffffa05ef54a>] ? ns_init_module+0x54a/0x1000 [nandsim]
[  142.734896]  [<ffffffffa05ef000>] ? 0xffffffffa05ef000
[  142.734902]  [<ffffffff81002148>] ? do_one_initcall+0xd8/0x210
[  142.734907]  [<ffffffff815723c1>] ? do_init_module+0x5a/0x1c2
[  142.734912]  [<ffffffff810f2316>] ? load_module+0x2026/0x24e0
[  142.734915]  [<ffffffff810ede60>] ? store_uevent+0x40/0x40
[  142.734919]  [<ffffffff810ee9d5>] ? copy_module_from_fd.isra.45+0xb5/0x140
[  142.734923]  [<ffffffff810f299d>] ? SyS_finit_module+0x7d/0xa0
[  142.734928]  [<ffffffff815792b2>] ? system_call_fast_compare_end+0xc/0x6b
[  142.734930] Code: 00 00 30 10 5d a0 e9 f8 f6 ff ff 48 c7 83 88 03
00 00 30 19 5d a0 e9 3c f7 ff ff 89 c6 48 c7 c7 b8 9c 5d a0 31 c0 e8
33 c2 f9 e0 <0f> 0b 48 c7 83 40 03 00 00 40 bb 5d a0 e9 14 f6 ff ff 48
c7 83
[  142.734959] RIP  [<ffffffffa05d5ff0>] nand_scan_tail+0xa40/0xac0 [nand]
[  142.734964]  RSP <ffff880079137c58>
[  142.734975] ---[ end trace 0270ba33a10a2b05 ]---

I have also witnessed this segmentation fault on Ubuntu 14.04 LTS with
an older kernel (3.19).

Is there any more information I can provide to try and help fix this issue?

Thanks, Brian (aka MrZaphod on irc)

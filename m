Received: from mx3.wp.pl ([212.77.101.7])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PbZcG-0008Be-1K
	for linux-mtd@lists.infradead.org; Sat, 08 Jan 2011 14:18:01 +0000
Date: Sat, 8 Jan 2011 15:24:37 +0100
From: Stanislaw Gruszka <stf_xl@wp.pl>
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: [PATCH] amd76xrom: fix oops at boot when resources are not available
Message-ID: <20110108142437.GB3306@r2bh72.net.upc.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Russell Whitaker <russ@ashlandhome.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For some unknown reason resources needed by amd76xrom driver can not be
available. Instead of return error, driver crash the kernel with
messages like below. Patch fix that.

amd76xrom_init_one(): Unable to register resource 0x00000000ffc00000-0x00000000ffffffff - kernel bug?
BUG: unable to handle kernel paging request at f862aaa0
IP: [<f8120282>] simple_map_write+0x82/0xbb [map_funcs]
*pde = 36ad2067 *pte = 00000000
Oops: 0002 [#1] SMP
last sysfs file: /sys/devices/pci0000:00/0000:00:07.1/host0/target0:0:1/0:0:1:0/block/sdb/removable
Modules linked in: rtc_core thermal_sys jedec_probe serio_raw rtc_lib snd_ca0106 snd_rawmidi snd_seq_device snd_ac97_codec cfi_probe hwmon gen_probe cfi_util amd76xrom(+) ac97_bus snd_pcm snd_timer container mtd amd_rng snd amd_k7_agp chipreg map_funcs
+snd_page_alloc agpgart button

Pid: 690, comm: modprobe Not tainted 2.6.35.9-smp #1 S2466 TIGER MPX/Unknown
EIP: 0060:[<f8120282>] EFLAGS: 00010212 CPU: 1
EIP is at simple_map_write+0x82/0xbb [map_funcs]
EAX: 000000aa EBX: 00000020 ECX: 00000008 EDX: 000000aa
ESI: f6869a48 EDI: f862aaa0 EBP: f6869a74 ESP: f6869a48
 DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
Process modprobe (pid: 690, ti=f6868000 task=f738ecb0 task.ti=f6868000)
Stack:
 000000aa 000000aa 000000aa 000000aa 000000aa 000000aa 000000aa 000000aa
<0> 00000008 f6869b84 f6869a9c f6869d90 f8159ad4 000000aa 000000aa 000000aa
<0> 000000aa 000000aa 000000aa 000000aa 000000aa 000aaaa0 00000000 00000004
Call Trace:
 [<f8159ad4>] ? cfi_qry_mode_on+0xc74/0x1130 [cfi_util]
 [<f864be7c>] ? jedec_probe_chip+0x6fc/0x1394 [jedec_probe]
 [<f819c1c1>] ? cfi_probe_chip+0x41/0x48c [cfi_probe]
 [<f815d1aa>] ? mtd_do_chip_probe+0xaa/0x358 [gen_probe]
 [<f819c00d>] ? cfi_probe+0xd/0x10 [cfi_probe]
 [<f8129154>] ? do_map_probe+0x24/0x73 [chipreg]
 [<f812621a>] ? init_amd76xrom+0x21a/0x3d2 [amd76xrom]
 [<c100122d>] ? do_one_initcall+0x2d/0x180
 [<f8126000>] ? init_amd76xrom+0x0/0x3d2 [amd76xrom]
 [<c10614eb>] ? sys_init_module+0x9b/0x1e0
 [<c10aa49d>] ? sys_write+0x3d/0x70
 [<c134f83c>] ? syscall_call+0x7/0xb
Code: 7f 17 f0 83 04 24 00 8b 5d f4 8b 75 f8 8b 7d fc 89 ec 5d c3 90 8d 74 26 00 01 cf 81 fb ff 01 00 00 77 2e 89 d9 c1 e9 02 8d 75 d4 <f3> a5 89 d9 83 e1 03 74 02 f3 a4 eb ca 90 01 cf 88 07 eb c3 66
EIP: [<f8120282>] simple_map_write+0x82/0xbb [map_funcs] SS:ESP 0068:f6869a48
CR2: 00000000f862aaa0

Reported-by: Russell Whitaker <russ@ashlandhome.net>
Signed-off-by: Stanislaw Gruszka <stf_xl@wp.pl>
---
 drivers/mtd/maps/amd76xrom.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/maps/amd76xrom.c b/drivers/mtd/maps/amd76xrom.c
index 19fe92d..370509a 100644
--- a/drivers/mtd/maps/amd76xrom.c
+++ b/drivers/mtd/maps/amd76xrom.c
@@ -154,6 +154,7 @@ static int __devinit amd76xrom_init_one (struct pci_dev *pdev,
 			__func__,
 			(unsigned long long)window->rsrc.start,
 			(unsigned long long)window->rsrc.end);
+		return -EBUSY;
 	}
 
 
-- 
1.7.0.4

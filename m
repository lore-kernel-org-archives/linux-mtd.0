Received: from zrtps0kn.nortel.com ([47.140.192.55])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J3C9G-000822-2g
	for linux-mtd@lists.infradead.org; Fri, 14 Dec 2007 15:08:29 +0000
Received: from zcarhxm2.corp.nortel.com (zcarhxm2.corp.nortel.com
	[47.129.230.99])
	by zrtps0kn.nortel.com (Switch-2.2.6/Switch-2.2.0) with ESMTP id
	lBEF8IL10640
	for <linux-mtd@lists.infradead.org>; Fri, 14 Dec 2007 15:08:18 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Fail to access 4 x8 bit CFI compliance NOR chip 
Date: Fri, 14 Dec 2007 10:08:02 -0500
Message-ID: <0BDFFF51DC89434FA33F8B37FCE363D51087DAED@zcarhxm2.corp.nortel.com>
From: "Chi-Ho Sung" <chsung@nortel.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Does the CFI driver support the 8/16 bit flash in 8 bit mode ?

I have 4 Spansion S29GL01GP (8/16 bit) chips on the board. They are in 8
bit mode and are connected 4 x8 bit interleave to a 32 bits local bus. I
can see the partition defined in /proc/mtd, but when I try to access it
(i.e. cat /dev/mtd1), I got "Oops: kernel access of bad area".

I noticed that the kernel see "MTD: Physically mapped S29GL01GP flash:
Found 4 x16 devices at 0x0 in 32-bit bank ". Is this normal ? Does it
mean the cfi_probe_chip does not support 16 bit device in 8 bit mode ?

Looking at the codes which print out this message:

	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit
bank\n",
	       map->name, cfi->interleave, cfi->device_type*8, base,
	       map->bankwidth*8);

The 4 (cfi->interleave) is from the kernel config option.
The 32-bit (map->bankwidth*8) is also from config option.
But, the 16 (cfi->device_type*8) is detected by the "genprobe_new_chip"
from the kernel. The genprobe_new_chip calls cfi_probe_chip to check for
the QRY pattern.

   In "genprobe_new_chip", there is a FOR loop.
   Case 1:
     If (cfi->device_type =3D 1)=20
       cfi_probe_chip(map, 0, NULL, cfi) --> return false.
   Case 2:
     If (cfi->device_type =3D 2)=20
       cfi_probe_chip(map, 0, NULL, cfi) --> return TRUE.
   Therefore, cfi_probe assigns 2 to cfi->device_type.

The reason cfi_probe_chip failed in case 1, is because
"qry_present(map,base,cfi)" failed. "qry_present" fail, when 0x98 is
sent to hard coded offset 0x55, but it did not receive back "QRY".=20

mtd/chips/cfi_probe.c  - Note the hardcoded offset "0x55".
-----------------------
static int __xipram cfi_probe_chip(struct map_info *map, __u32 base,
				   unsigned long *chip_map, struct
cfi_private *cfi)
{
	...
	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type,
NULL);
	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type,
NULL);
	cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type,
NULL);

	if (!qry_present(map,base,cfi)) {
		xip_enable(base, map, cfi);
		return 0;
	}
	...
}

For your information, below is my configuration.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
struct map_info nt_cb_cp_map =3D {
	.name		=3D "Physically mapped S29GL01GP flash",
	.size		=3D WINDOW_SIZE,
	.phys		=3D WINDOW_ADDR,
	.bankwidth	=3D 4,              =20
};

CONFIG_MTD=3Dy
CONFIG_MTD_DEBUG=3Dy
CONFIG_MTD_DEBUG_VERBOSE=3D3
CONFIG_MTD_CONCAT=3Dy
CONFIG_MTD_PARTITIONS=3Dy
CONFIG_MTD_CHAR=3Dy
CONFIG_MTD_BLOCK=3Dy
CONFIG_MTD_CFI=3Dy
CONFIG_MTD_GEN_PROBE=3Dy
CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
CONFIG_MTD_CFI_NOSWAP=3Dy
CONFIG_MTD_CFI_GEOMETRY=3Dy
CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
CONFIG_MTD_CFI_I4=3Dy
CONFIG_MTD_CFI_AMDSTD=3Dy
CONFIG_MTD_CFI_AMDSTD_RETRY=3D0
CONFIG_MTD_CFI_UTIL=3Dy=20

Below is the "Oops":
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
root@localhost:/dev> cat /dev/mtd1
Oops: kernel access of bad area, sig: 11 [#1]
NIP: C001E6AC LR: C001E73C SP: E1A9FDF0 REGS: e1a9fd40 TRAP: 0300    Not
tainted
MSR: 00021000 EE: 0 PR: 0 FP: 0 ME: 1 IR/DR: 00
DAR: 00000000, DSISR: 00000000
TASK =3D cee444a0[341] 'cat' THREAD: e1a9e000
Last syscall: 3=20
GPR00: C001E73C E1A9FDF0 CEE444A0 CEE61B34 00000003 00000001 00000000
00000000=20
GPR08: FFFFFFFF 03F80000 C0261C6C 00000000 C02DD530 1001C140 00000220
00000000=20
GPR16: 00001000 E1A9FE6C 00000000 E1A9FEC8 CEE61AE0 E1994000 00000000
CEE61AE0=20
GPR24: 03F80000 00000003 00000000 00000000 00000001 00029000 CEE61B34
CEE61B18=20
NIP [c001e6ac] __wake_up_common+0x2c/0x94
LR [c001e73c] __wake_up+0x28/0x40
Call trace:
 [c001e73c] __wake_up+0x28/0x40
 [c017eab4] put_chip+0x5c/0x1ac
 [c017ef18] cfi_amdstd_read+0x1b4/0x220
 [c0176990] part_read+0xd4/0xf4
 [c01797d0] mtd_read+0xe4/0x214
 [c00664a4] vfs_read+0x18c/0x1a8
 [c00667ec] sys_read+0x4c/0x90
 [c0002330] ret_from_syscall+0x0/0x48
MTD_close
Oops: kernel access of bad area, sig: 11 [#2]
NIP: C001E6AC LR: C001E73C SP: E1A9FB90 REGS: e1a9fae0 TRAP: 0300    Not
tainted
MSR: 00021000 EE: 0 PR: 0 FP: 0 ME: 1 IR/DR: 00
DAR: 00000000, DSISR: 00000000
TASK =3D cee444a0[341] 'cat' THREAD: e1a9e000
Last syscall: 3=20
GPR00: C001E73C E1A9FB90 CEE444A0 CEE61B34 00000003 00000001 00000000
00000000=20
GPR08: C0250000 C001E678 00000000 00000000 24004428 1001C140 00000220
00000000=20
GPR16: 00001000 E1A9FE6C 00000000 E1A9FEC8 CEE61AE0 E1994000 00000000
CEE61AE0=20
GPR24: 03F80000 00000003 00000000 00000000 00000001 00029000 CEE61B34
CEE61B4C=20
NIP [c001e6ac] __wake_up_common+0x2c/0x94
LR [c001e73c] __wake_up+0x28/0x40
Call trace:
 [c001e73c] __wake_up+0x28/0x40
 [c0181998] cfi_amdstd_sync+0x100/0x11c
 [c0177488] part_sync+0x20/0x30
 [c01796cc] mtd_close+0x60/0x80
 [c006773c] __fput+0x188/0x1a0
 [c0065a40] filp_close+0x54/0xac
 [c0023ab0] put_files_struct+0xb0/0x100
 [c00242fc] do_exit+0xe8/0xae4
 [c0002ff4] _exception+0x0/0x11c
 [c000c1dc] bad_page_fault+0x94/0xc4
 [c0002894] handle_page_fault+0x7c/0x80
 [c0057d94] do_no_page+0x250/0xb18
 [c001e73c] __wake_up+0x28/0x40
 [c017eab4] put_chip+0x5c/0x1ac
 [c017ef18] cfi_amdstd_read+0x1b4/0x220
Fixing recursive fault but reboot is needed!


Thanks,
Ben

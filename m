Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXoxt-00032n-Lw
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 09:38:42 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Helmut Schaa <helmut.schaa@googlemail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH] mtd: nand: Disable subpage writes for drivers without
 ecc->hwctl
Date: Wed, 9 Apr 2014 09:38:09 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAC1D46@DBDE04.ent.ti.com>
References: <1397034804-27161-1-git-send-email-helmut.schaa@googlemail.com>
In-Reply-To: <1397034804-27161-1-git-send-email-helmut.schaa@googlemail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Helmut Schaa [mailto:helmut.schaa@googlemail.com]
>
>nand_write_subpage_hwecc causes a crash if the driver did not register
>ecc->hwctl or ecc->calculate. Fix this by disabling subpage writes if
>ecc->hwctl or ecc->calculate is not provided by the driver.
>
>This behavior was introduced in commit 837a6ba4f3b6d23026674e6af6b6849a463=
4fff9
>"mtd: nand: subpage write support for hardware based ECC schemes".
>
>This fixes a crash with fsl_elbc_nand and maybe others:
>
>Unable to handle kernel paging request for instruction fetch
>Faulting instruction address: 0x00000000
>Oops: Kernel access of bad area, sig: 11 [#1]
>SMP NR_CPUS=3D2 P1020 RDB
>Modules linked in: ath9k ath9k_common pppoe ppp_async option iptable_nat a=
th9k_hw ath usb_wwan pppox ppp_generic
>nf_nat_ipv4 nf_conntrack_ipv4 mac80211 ipt_MASQUERADE cfg80211 xt_time xt_=
tcpudp xt_state xt_quota xt_policy xt_pkttype
>xt_owner xt_nat xt_multiport xt_mh
>CPU: 1 PID: 2161 Comm: ubiformat Not tainted 3.10.26 #6
>task: efbc2700 ti: c7950000 task.ti: c7950000
>NIP: 00000000 LR: c01a495c CTR: 00000000
>REGS: c7951cb0 TRAP: 0400   Not tainted  (3.10.26)
>MSR: 00029000 <CE,EE,ME>  CR: 24002028  XER: 00000000
>
>GPR00: c01a4b6c c7951d60 efbc2700 ef84b000 00000001 00000000 000001ff c780=
0500
>GPR08: 00000000 00000000 efae5e40 c01a4ae4 24002022 10023418 c7951e5c c780=
0500
>GPR16: c017b6a8 00000000 0000003f c053404c 00000000 00000004 00000000 0000=
0003
>GPR24: 00000010 00000200 ef84b000 c7800d00 c7800000 c7800500 ef84b1c8 0000=
0000
>NIP [00000000]   (null)
>LR [c01a495c] nand_write_subpage_hwecc+0x74/0x174
>Call Trace:
>[c7951d60] [c7951d64] 0xc7951d64 (unreliable)
>[c7951da0] [c01a4b6c] nand_write_page+0x88/0x198
>[c7951dd0] [c01a5f7c] nand_do_write_ops+0x2f4/0x39c
>[c7951e40] [c01a61e0] nand_write+0x58/0x84
>[c7951e80] [c019e29c] mtdchar_write+0x1dc/0x28c
>[c7951ef0] [c00aba84] vfs_write+0xcc/0x1ac
>[c7951f10] [c00ac04c] SyS_write+0x4c/0x90
>[c7951f40] [c000cd84] ret_from_syscall+0x0/0x3c
> --- Exception: c01 at 0x48050ed8
>     LR =3D 0x100071b8
> Instruction dump:
> XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
> XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
> ---[ end trace 161d3c65a2a15cb8 ]---
>
>Kernel panic - not syncing: Fatal exception
>
>Cc: Gupta, Pekon <pekon@ti.com>
>Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>Cc: David Woodhouse <David.Woodhouse@intel.com>
>Signed-off-by: Helmut Schaa <helmut.schaa@googlemail.com>
>---
>I noticed this bug on openwrt with kernel 3.10 but it looks as if this can
>still happen in more recent kernels.
>
> drivers/mtd/nand/nand_base.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>index 9715a7b..2298289 100644
>--- a/drivers/mtd/nand/nand_base.c
>+++ b/drivers/mtd/nand/nand_base.c
>@@ -3768,7 +3768,7 @@ int nand_scan_tail(struct mtd_info *mtd)
> 			ecc->write_oob =3D nand_write_oob_std;
> 		if (!ecc->read_subpage)
> 			ecc->read_subpage =3D nand_read_subpage;
>-		if (!ecc->write_subpage)
>+		if (!ecc->write_subpage && ecc->hwctl && ecc->calculate)

I don't think this is correct because nand_write_subpage_hwecc() is a
replaceable function (default generic implementation). So

(1) if chip->ecc.hwctl() and chip->ecc.calculate are not implemented but yo=
u
 still want to use subpage write feature, then you need to provide custom
 implementation for chip->ecc.write_subpage().
 that's same for other interfaces of nand_chip like chip->ecc.write_page().

(2) If you don't want to use subpage write feature then just disable it usi=
ng
	chip->options |=3D NAND_NO_SUBPAGE_WRITE;

Can you please tell which NAND controller driver is causing this ?
We need to fix that..

with regards, pekon

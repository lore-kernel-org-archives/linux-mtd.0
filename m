Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e2zQV-0004QO-Rp
 for linux-mtd@lists.infradead.org; Fri, 13 Oct 2017 12:50:58 +0000
Date: Fri, 13 Oct 2017 14:50:33 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Roger Quadros <rogerq@ti.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-omap <linux-omap@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: gpmc-nand broken since v4.12
Message-ID: <20171013145033.5d1d9647@bbrezillon>
In-Reply-To: <7eae9266-558f-6578-66d7-7ab0eb659a81@ti.com>
References: <7eae9266-558f-6578-66d7-7ab0eb659a81@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 13 Oct 2017 14:57:29 +0300
Roger Quadros <rogerq@ti.com> wrote:

> =EF=BB=BFHi Boris,
>=20
> NAND on gpmc-omap breaks for me while doing a unmount of a ubi volume sin=
ce v4.12
>=20
> Behaviour follows through in v4.13 and v4.14-rc as well.
>=20
> Do you have any idea about this?

Can you try with this patch [1] applied and paste me the values printed
just before the crash?

[1]http://code.bulix.org/lc8xk0-209746

>=20
> =3D=3D unmounting volume
> [   30.128584] Unable to handle kernel NULL pointer dereference at virtua=
l address 00000000
> [   30.137234] pgd =3D ed3d0000
> [   30.140079] [00000000] *pgd=3Dfd67a835
> [   30.143843] Internal error: Oops: 17 [#1] SMP ARM
> [   30.148781] Modules linked in: snd_soc_davinci_mcasp xhci_plat_hcd snd=
_soc_edma xhci_hcd snd_soc_tlv320aic3x snd_soc_simple_card snd_soc_omap snd=
_soc_simple_card_utils snd_soc_core usbcoe
> [   30.193881] CPU: 1 PID: 2149 Comm: umount Not tainted 4.12.0-00001-g2c=
09531 #1440
> [   30.201734] Hardware name: Generic DRA74X (Flattened Device Tree)
> [   30.208130] task: ec870140 task.stack: ed406000
> [   30.212889] PC is at memcpy+0xe8/0x330
> [   30.216833] LR is at mtd_ooblayout_set_bytes+0x7c/0xa4
> [   30.222231] pc : [<c04abe68>]    lr : [<c05d7490>]    psr: 60000013
> [   30.222231] sp : ed407b74  ip : 00000002  fp : 00000200
> [   30.234276] r10: ed082800  r9 : 00000000  r8 : ed079010
> [   30.239761] r7 : c05d76d8  r6 : 00000000  r5 : 00000038  r4 : 00000038
> [   30.246614] r3 : 00000038  r2 : 00000034  r1 : 00000000  r0 : ed082802
> [   30.253468] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segme=
nt none
> [   30.260957] Control: 10c5387d  Table: ad3d006a  DAC: 00000051
> [   30.266986] Process umount (pid: 2149, stack limit =3D 0xed406218)
> [   30.273296] Stack: (0xed407b74 to 0xed408000)
> [   30.277868] 7b60:                                              ed08280=
2 00000038 c05d7490
> [   30.286458] 7b80: c05d76d8 ed082600 0000ffff 00000000 00000002 0000003=
8 00000004 ed082800
> [   30.295047] 7ba0: ed079010 00000000 00000000 ed082800 ed079010 c05d74f=
c 00000038 c05d76d8
> [   30.303635] 7bc0: ed0e8f6a c05e8388 00000038 00000000 c0dc60f0 0000000=
1 00000010 0000000e
> [   30.312216] 7be0: 00000004 00000001 00000001 00000001 c05f2668 ed07901=
0 00000200 00000200
> [   30.320806] 7c00: 000095c0 00000200 ed082000 ed312200 000095c0 c05e965=
8 ed082000 00000000
> [   30.329392] 7c20: 000095c0 00000002 00000200 00000000 ed082000 ed407c8=
0 00000000 00000000
> [   30.337975] 7c40: 00000000 00000001 00000040 00000000 00000000 04ae020=
0 00000000 ed079010
> [   30.346563] 7c60: ed407c80 ed407d30 00000200 ed312200 ed312200 c05e999=
4 ed407c80 c0191f70
> [   30.355150] 7c80: 00000000 00000200 00000000 00000000 00000000 0000000=
0 ed312200 00000000
> [   30.363738] 7ca0: 00a00000 00000000 00000200 00000000 0f600000 0000000=
0 ed407d30 c05d9fbc
> [   30.372328] 7cc0: 00000200 ed407d30 ed312200 00000000 9188fed8 c05d9f7=
c 00000000 c05d6c7c
> [   30.380917] 7ce0: 00000200 ed407d30 ed312200 ed312200 040e0200 0000000=
0 ed628000 00000200
> [   30.389509] 7d00: 00000200 00000207 00000000 c0604cd0 00000200 ed407d3=
0 ed312200 60000013
> [   30.398097] 7d20: 00000200 00000000 ed208040 c019269c 00000000 0000000=
4 ed628dd8 ed312200
> [   30.406676] 7d40: ed628000 00000207 ed312200 00000800 00000207 0000000=
0 ffffffff c060536c
> [   30.415267] 7d60: 00000200 c0607fb8 ed18c800 ed628000 ed2a0800 0000000=
8 00000000 c0601178
> [   30.423851] 7d80: ed312200 ed628550 00000000 ed628000 ed312200 ed18c80=
0 ed2a0800 ed628000
> [   30.432437] 7da0: ed312200 00000008 00000004 ed18c800 ed2a0800 0000101=
4 ed208040 c0601cf0
> [   30.441020] 7dc0: 00000000 00000800 00000000 ec870140 00000003 6000001=
3 c1568e2c c060154c
> [   30.449605] 7de0: ed18c800 c019269c 00000000 00000002 ed628000 0000080=
0 ed628000 00000000
> [   30.458191] 7e00: 00000008 ed18c800 00000000 00000088 ed18c800 c060053=
8 00000000 00000800
> [   30.466779] 7e20: ed18c800 ed770000 00000000 00000008 ed770000 c0426a9=
0 00000800 00000000
> [   30.475366] 7e40: 00000088 00000000 00000800 000000a0 ed770000 c043090=
4 00000800 c08002e8
> [   30.483952] 7e60: 00000000 00000000 000000d8 00000000 00000000 0000000=
0 00000000 00000000
> [   30.492545] 7e80: ed18c800 ed407eb4 00000001 ed770000 00000000 0000028=
8 00000003 ed51b5d4
> [   30.501126] 7ea0: ed406000 00000000 00000000 c0431880 ed77014c 76ecb30=
e 5c265a59 ec870140
> [   30.509709] 7ec0: 00000003 60000013 c1568e2c c0431f38 00000000 c019269=
c ed77014c 00000002
> [   30.518301] 7ee0: ed51b5d4 ed77014c ed77014c ed770104 ed51b5d4 ed77000=
0 ed406000 00000000
> [   30.526886] 7f00: ed77014c c08039c8 00000000 00000288 00000003 ed51b5d=
4 ed770000 c042201c
> [   30.535471] 7f20: ed1cb000 00000000 c0dcbbe0 00000534 ec870140 c02e632=
4 edf88a10 ed1cb000
> [   30.544056] 7f40: c0926528 c02afaf4 c0421714 00000015 c0d823cc c02afc4=
0 ed770000 c0421720
> [   30.552643] 7f60: ed1cb000 c02b0288 ec870140 ed61a600 00000000 c02d095=
0 ec870634 c0159b34
> [   30.561220] 7f80: ed61a61c 00000000 ed407fb0 c0107ae4 00000034 c0107ae=
4 00000000 c010b09c
> [   30.569803] 7fa0: 00021cb8 0001e320 00021cb8 c0107968 00000000 0000000=
0 00000000 00000000
> [   30.578392] 7fc0: 00021cb8 0001e320 00021cb8 00000034 00021ca8 0000000=
0 00000000 00000000
> [   30.586973] 7fe0: 00021ce8 bec06600 b6e11dbc b6e11ddc 60000010 00021cb=
8 afffd861 afffdc61
> [   30.595558] [<c04abe68>] (memcpy) from [<c05d7490>] (mtd_ooblayout_set=
_bytes+0x7c/0xa4)
> [   30.603968] [<c05d7490>] (mtd_ooblayout_set_bytes) from [<c05d74fc>] (=
mtd_ooblayout_set_eccbytes+0x1c/0x28)
> [   30.614207] [<c05d74fc>] (mtd_ooblayout_set_eccbytes) from [<c05e8388>=
] (nand_write_subpage_hwecc+0x1a8/0x1d0)
> [   30.624707] [<c05e8388>] (nand_write_subpage_hwecc) from [<c05e9658>] =
(nand_do_write_ops+0x22c/0x50c)
> [   30.634397] [<c05e9658>] (nand_do_write_ops) from [<c05e9994>] (nand_w=
rite+0x5c/0x7c)
> [   30.642621] [<c05e9994>] (nand_write) from [<c05d9fbc>] (part_write+0x=
40/0x48)
> [   30.650211] [<c05d9fbc>] (part_write) from [<c05d6c7c>] (mtd_write+0x9=
0/0xa8)
> [   30.657718] [<c05d6c7c>] (mtd_write) from [<c0604cd0>] (ubi_io_write+0=
x114/0x6b8)
> [   30.665573] [<c0604cd0>] (ubi_io_write) from [<c060536c>] (ubi_io_writ=
e_vid_hdr+0xf8/0x148)
> [   30.674342] [<c060536c>] (ubi_io_write_vid_hdr) from [<c0601178>] (try=
_write_vid_and_data+0x54/0x1a4)
> [   30.684030] [<c0601178>] (try_write_vid_and_data) from [<c0601cf0>] (u=
bi_eba_write_leb+0x1f8/0x7bc)
> [   30.693525] [<c0601cf0>] (ubi_eba_write_leb) from [<c0600538>] (ubi_le=
b_write+0xbc/0xdc)
> [   30.702021] [<c0600538>] (ubi_leb_write) from [<c0426a90>] (ubifs_leb_=
write+0x9c/0x11c)
> [   30.710426] [<c0426a90>] (ubifs_leb_write) from [<c0430904>] (ubifs_lo=
g_start_commit+0x27c/0x444)
> [   30.719743] [<c0430904>] (ubifs_log_start_commit) from [<c0431880>] (d=
o_commit+0x1b8/0x7e8)
> [   30.728521] [<c0431880>] (do_commit) from [<c042201c>] (ubifs_sync_fs+=
0x8c/0xa0)
> [   30.736292] [<c042201c>] (ubifs_sync_fs) from [<c02e6324>] (sync_files=
ystem+0x88/0xac)
> [   30.744616] [<c02e6324>] (sync_filesystem) from [<c02afaf4>] (generic_=
shutdown_super+0x24/0xf8)
> [   30.753754] [<c02afaf4>] (generic_shutdown_super) from [<c02afc40>] (k=
ill_anon_super+0xc/0x18)
> [   30.762807] [<c02afc40>] (kill_anon_super) from [<c0421720>] (kill_ubi=
fs_super+0xc/0x18)
> [   30.771308] [<c0421720>] (kill_ubifs_super) from [<c02b0288>] (deactiv=
ate_locked_super+0x5c/0x80)
> [   30.780627] [<c02b0288>] (deactivate_locked_super) from [<c02d0950>] (=
cleanup_mnt+0x38/0x78)
> [   30.789492] [<c02d0950>] (cleanup_mnt) from [<c0159b34>] (task_work_ru=
n+0xc0/0xe8)
> [   30.797444] [<c0159b34>] (task_work_run) from [<c010b09c>] (do_work_pe=
nding+0xd4/0xd8)
> [   30.805759] [<c010b09c>] (do_work_pending) from [<c0107968>] (slow_wor=
k_pending+0xc/0x20)
> [   30.814345] Code: e8bd8011 e26cc004 e35c0002 c4d13001 (a4d14001)=20
> [   30.820843] ---[ end trace bc240a5a583e6e02 ]---
>=20

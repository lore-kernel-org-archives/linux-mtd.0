Received: from mail-ot0-x22c.google.com ([2607:f8b0:4003:c0f::22c])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eroYa-0003CH-OF
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2018 17:35:23 +0000
Received: by mail-ot0-x22c.google.com with SMTP id 108so9388057otv.3
 for <linux-mtd@lists.infradead.org>; Fri, 02 Mar 2018 09:33:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU3JhZRFfh-GC+SDXe0ynQadt1Yup4vLFfGuzRy_c5a8QQ@mail.gmail.com>
References: <CAJ+vNU0O4uBHzd2h0Nbjbm8fp+9e2UEiqHEZ6A5RZHjLsArAPw@mail.gmail.com>
 <9684795.NoKKx6Kvh2@blindfold>
 <CAJ+vNU3hx8rGh-Kx-UpBU-eYvkT-zspggndChg16Hzu7v_8mBA@mail.gmail.com>
 <4813843.hImRYGMsqb@blindfold>
 <CAJ+vNU3JhZRFfh-GC+SDXe0ynQadt1Yup4vLFfGuzRy_c5a8QQ@mail.gmail.com>
From: Han Xu <xhnjupt@gmail.com>
Date: Fri, 2 Mar 2018 11:33:08 -0600
Message-ID: <CA+EcR23dgZc78n9NUyMXXxWrYTdL0FXLAVHN8L=ajw0pRqNmjg@mail.gmail.com>
Subject: Re: Does modern UBI/UBIFS still suffer from the 'unstable bits issue'?
To: Tim Harvey <tharvey@gateworks.com>
Cc: Richard Weinberger <richard@nod.at>, Scott Bowman <wbowma01@harris.com>,
 linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>,
 Koen Vandeputte <koen.vandeputte@ncentric.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Tim,

I know one potential issue may cause rare UBIFS mount failure, only If
both dma_mapping_error and bitflip happened, the alternative buffer
failed to swap back to the correct data buffer. The detailed workflow
as follows:

1.read_page_prepare: direct_dma_map_ok is 0, alternative buffer path is ena=
bled.

2.gpmi_read_page: page data goes to alloc DMA buffer (not direct mapped).

3.read_page_end: nothing happens, dma_map_ok is 0.

4.Loop over ECC chunks, STATUS_UNCORRECTABLE is hit, gpmi_erased_check star=
ts.

5.gpmi_erased_check: gpmi_read_buf occurs, this leads to
prepare_data_dma. direct_dma_map_ok goes to 1. This is the important
part as direct_dma_map_ok changes.

6.gpmi_erased_check: payload_virt/payload_phys (alloc DMA buffer) is
set to 0xFF since page is erased.

7.read_page_swap_end: direct_map_ok is now 1, data from
payload_virt/payload_phys (alloc DMA buffer) never makes it back to
data buffer, previous page data from previous operation is there
instead.

This issue was fixed by Markus patch[1], you can follow the same
implementation to move the read_page_swap_end() call before the ECC
status checking for-loop, and gpmi_erased_check to check buf rather
than payload_virt, for kernel 4.4

Please let me know if it helps.

[1]:http://patchwork.ozlabs.org/patch/614433/

On Fri, Mar 2, 2018 at 10:20 AM, Tim Harvey <tharvey@gateworks.com> wrote:
> On Fri, Mar 2, 2018 at 2:07 AM, Richard Weinberger <richard@nod.at> wrote=
:
>> Tim,
>>
>> Am Freitag, 2. M=C3=A4rz 2018, 02:19:54 CET schrieb Tim Harvey:
>>> On Thu, Mar 1, 2018 at 8:32 AM, Richard Weinberger <richard@nod.at> wro=
te:
>>> > Tim,
>>> >
>>> > Am Donnerstag, 1. M=C3=A4rz 2018, 17:15:44 CET schrieb Tim Harvey:
>>> >> Greetings,
>>> >>
>>> >> I have a user with an IMX6 and raw NAND using UBI/UBIFS who has been
>>> >
>>> >> able to reproduce a NAND corruption:
>>> > What does your user to reproduce this?
>>>
>>> Richard,
>>>
>>> It's unclear at the moment. It's one of those 'this happened twice on
>>> two different boards' reports without a lot of detail. However I do
>>> know they do write to the filesystem on every boot and do encounter
>>> random power-cuts.
>>>
>>> >> [   10.611972] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" star=
ted,
>>> >> PID 631 [   10.634365] ubi0 warning: ubi_io_read: error -74 (ECC err=
or)
>>> >> while reading 253952 bytes from PEB 2807:8192, read only 253952 byte=
s,
>>> >> retry [ 10.657492] ubi0 warning: ubi_io_read: error -74 (ECC error)
>>> >> while reading 253952 bytes from PEB 2807:8192, read only 253952 byte=
s,
>>> >> retry [
>>> >> 10.681137] ubi0 warning: ubi_io_read: error -74 (ECC error) while re=
ading
>>> >> 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry [
>>> >> 10.704267] ubi0 error: ubi_io_read: error -74 (ECC error) while read=
ing
>>> >> 253952 bytes from PEB 2807:8192, read 253952 bytes
>>
>> BTW: I miss a back trace here. How did you obtain that messages?
>>
>
> [   10.528272] Buffer I/O error on dev mtdblock0, logical block 0,
> async page read
> [   10.611972] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" started, =
PID 631
> [   10.634365] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry
> [   10.657492] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry
> [   10.681137] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry
> [   10.704267] ubi0 error: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read 253952 bytes
> [   10.715425] CPU: 2 PID: 629 Comm: block Not tainted 4.4.0 #6
> [   10.721087] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> [   10.727619] Backtrace:
> [   10.730108] [<8001e674>] (dump_backtrace) from [<8001e86c>]
> (show_stack+0x18/0x1c)
> [   10.737679]  r7:00000af7 r6:0003e000 r5:60000013 r4:00000000
> [   10.743406] [<8001e854>] (show_stack) from [<80232028>]
> (dump_stack+0x84/0xa4)
> [   10.750649] [<80231fa4>] (dump_stack) from [<8030a9c4>]
> (ubi_io_read+0x1dc/0x2b0)
> [   10.758132]  r5:bf206000 r4:ffffffb6
> [   10.761744] [<8030a7e8>] (ubi_io_read) from [<80308974>]
> (ubi_eba_read_leb+0x27c/0x388)
> [   10.769748]  r10:be913c00 r9:00000000 r8:00000000 r7:00000002
> r6:bf206000 r5:bf206000
> [   10.777646]  r4:0003e000
> [   10.780204] [<803086f8>] (ubi_eba_read_leb) from [<80307864>]
> (ubi_leb_read+0x74/0xc4)
> [   10.788120]  r10:c0d81000 r9:00000002 r8:00000002 r7:00000000
> r6:bf206000 r5:be913c00
> [   10.796020]  r4:0003e000
> [   10.798579] [<803077f0>] (ubi_leb_read) from [<801da34c>]
> (ubifs_leb_read+0x34/0x98)
> [   10.806322]  r10:be55eec0 r9:00000002 r8:00000000 r7:00000002
> r6:0003e000 r5:bf1cb000
> [   10.814221]  r4:be560180
> [   10.816779] [<801da318>] (ubifs_leb_read) from [<801e19c8>]
> (ubifs_start_scan+0x7c/0xf8)
> [   10.824869]  r8:00000002 r7:c0d81000 r6:00000000 r5:bf1cb000 r4:be5601=
80
> [   10.831648] [<801e194c>] (ubifs_start_scan) from [<801e1ccc>]
> (ubifs_scan+0x2c/0x330)
> [   10.839477]  r8:00000003 r7:0003e000 r6:c0d81000 r5:00000000 r4:bf1cb0=
00
> [   10.846252] [<801e1ca0>] (ubifs_scan) from [<801e0e38>]
> (ubifs_read_master+0xb4/0x924)
> [   10.854169]  r10:be55eec0 r9:000000a0 r8:00000003 r7:00002000
> r6:be560300 r5:be560180
> [   10.862069]  r4:bf1cb000
> [   10.864622] [<801e0d84>] (ubifs_read_master) from [<801d82c4>]
> (ubifs_mount+0xa7c/0x156c)
> [   10.872798]  r10:be55eec0 r9:000000a0 r8:bf1cb87c r7:be538000
> r6:00000000 r5:bf1cb000
> [   10.880697]  r4:bf2da140
> [   10.883255] [<801d7848>] (ubifs_mount) from [<801011ac>] (mount_fs+0x1=
c/0xa0)
> [   10.890390]  r10:be55e000 r9:806f2078 r8:00000000 r7:806f2078
> r6:806f2078 r5:00000000
> [   10.898291]  r4:801d7848
> [   10.900849] [<80101190>] (mount_fs) from [<80119054>]
> (vfs_kern_mount+0x50/0x108)
> [   10.908332]  r6:be55e180 r5:00000000 r4:bf1a6cc0
> [   10.913002] [<80119004>] (vfs_kern_mount) from [<8011c354>]
> (do_mount+0x9d8/0xb70)
> [   10.920572]  r9:806f2078 r8:be55e180 r7:7eeabe14 r6:00000400
> r5:806dbc6c r4:00000008
> [   10.928391] [<8011b97c>] (do_mount) from [<8011c72c>] (SyS_mount+0x7c/=
0xa8)
> [   10.935354]  r10:00000000 r9:be4f6000 r8:00000400 r7:7eeabe14
> r6:be55e180 r5:be55e000
> [   10.943253]  r4:00000000
> [   10.945811] [<8011c6b0>] (SyS_mount) from [<80009bc0>]
> (ret_fast_syscall+0x0/0x3c)
> [   10.953380]  r8:80009d84 r7:00000015 r6:00027014 r5:7eeabe14 r4:000000=
00
> [   10.984081] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry
> [   11.007847] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry
> [   11.031492] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry
> [   11.055202] ubi0 error: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read 253952 bytes
> [   11.066358] CPU: 2 PID: 629 Comm: block Not tainted 4.4.0 #6
> [   11.072020] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> [   11.078549] Backtrace:
> [   11.081034] [<8001e674>] (dump_backtrace) from [<8001e86c>]
> (show_stack+0x18/0x1c)
> [   11.088606]  r7:00000af7 r6:0003e000 r5:60000013 r4:00000000
> [   11.094334] [<8001e854>] (show_stack) from [<80232028>]
> (dump_stack+0x84/0xa4)
> [   11.101575] [<80231fa4>] (dump_stack) from [<8030a9c4>]
> (ubi_io_read+0x1dc/0x2b0)
> [   11.109058]  r5:bf206000 r4:ffffffb6
> [   11.112669] [<8030a7e8>] (ubi_io_read) from [<80308974>]
> (ubi_eba_read_leb+0x27c/0x388)
> [   11.120673]  r10:be913c00 r9:00000000 r8:00000000 r7:00000002
> r6:bf206000 r5:bf206000
> [   11.128571]  r4:0003e000
> [   11.131126] [<803086f8>] (ubi_eba_read_leb) from [<80307864>]
> (ubi_leb_read+0x74/0xc4)
> [   11.139042]  r10:c0e3e000 r9:c0e3e000 r8:00000002 r7:00000000
> r6:bf206000 r5:be913c00
> [   11.146941]  r4:0003e000
> [   11.149498] [<803077f0>] (ubi_leb_read) from [<801da34c>]
> (ubifs_leb_read+0x34/0x98)
> [   11.157240]  r10:00000002 r9:c0e3e000 r8:00000000 r7:00000002
> r6:0003e000 r5:bf1cb000
> [   11.165140]  r4:bf1cb000
> [   11.167706] [<801da318>] (ubifs_leb_read) from [<801f1668>]
> (get_master_node+0x58/0x1f0)
> [   11.175796]  r8:bf1cb000 r7:00001000 r6:be560300 r5:00000000 r4:bf1cb0=
00
> [   11.182575] [<801f1610>] (get_master_node) from [<801f1b0c>]
> (ubifs_recover_master_node+0x70/0x2f4)
> [   11.191620]  r10:be55eec0 r9:000000a0 r8:00000003 r7:00001000
> r6:be560300 r5:00000000
> [   11.199520]  r4:bf1cb000
> [   11.202077] [<801f1a9c>] (ubifs_recover_master_node) from
> [<801e0f28>] (ubifs_read_master+0x1a4/0x924)
> [   11.211383]  r7:00002000 r6:be560300 r5:ffffff8b r4:bf1cb000
> [   11.217106] [<801e0d84>] (ubifs_read_master) from [<801d82c4>]
> (ubifs_mount+0xa7c/0x156c)
> [   11.225282]  r10:be55eec0 r9:000000a0 r8:bf1cb87c r7:be538000
> r6:00000000 r5:bf1cb000
> [   11.233180]  r4:bf2da140
> [   11.235735] [<801d7848>] (ubifs_mount) from [<801011ac>] (mount_fs+0x1=
c/0xa0)
> [   11.242870]  r10:be55e000 r9:806f2078 r8:00000000 r7:806f2078
> r6:806f2078 r5:00000000
> [   11.250769]  r4:801d7848
> [   11.253326] [<80101190>] (mount_fs) from [<80119054>]
> (vfs_kern_mount+0x50/0x108)
> [   11.260808]  r6:be55e180 r5:00000000 r4:bf1a6cc0
> [   11.265478] [<80119004>] (vfs_kern_mount) from [<8011c354>]
> (do_mount+0x9d8/0xb70)
> [   11.273047]  r9:806f2078 r8:be55e180 r7:7eeabe14 r6:00000400
> r5:806dbc6c r4:00000008
> [   11.280865] [<8011b97c>] (do_mount) from [<8011c72c>] (SyS_mount+0x7c/=
0xa8)
> [   11.287827]  r10:00000000 r9:be4f6000 r8:00000400 r7:7eeabe14
> r6:be55e180 r5:be55e000
> [   11.295727]  r4:00000000
> [   11.298284] [<8011c6b0>] (SyS_mount) from [<80009bc0>]
> (ret_fast_syscall+0x0/0x3c)
> [   11.305853]  r8:80009d84 r7:00000015 r6:00027014 r5:7eeabe14 r4:000000=
00
> [   11.313088] UBIFS error (ubi0:2 pid 629):
> ubifs_recover_master_node: failed to recover master node
> [   11.322071] UBIFS error (ubi0:2 pid 629):
> ubifs_recover_master_node: dumping first master node
> [   11.330686]  magic          0x6101831
> [   11.334361]  crc            0xd0feaa12
> [   11.338113]  node_type      7 (master node)
> [   11.342310]  group_type     0 (no node group)
> [   11.346668]  sqnum          272796
> [   11.350071]  len            512
> [   11.353226]  highest_inum   3500
> [   11.356456]  commit number  8967
> [   11.359686]  flags          0x3
> [   11.362840]  log_lnum       3
> [   11.365809]  root_lnum      461
> [   11.368950]  root_offs      74096
> [   11.372276]  root_len       128
> [   11.375418]  gc_lnum        460
> [   11.378559]  ihead_lnum     461
> [   11.381701]  ihead_offs     77824
> [   11.385026]  index_size     210120
> [   11.388429]  lpt_lnum       10
> [   11.391483]  lpt_offs       94430
> [   11.394809]  nhead_lnum     10
> [   11.397865]  nhead_offs     98304
> [   11.401180]  ltab_lnum      10
> [   11.404246]  ltab_offs      94208
> [   11.407561]  lsave_lnum     0
> [   11.410529]  lsave_offs     0
> [   11.413508]  lscan_lnum     460
> [   11.416650]  leb_cnt        7820
> [   11.419878]  empty_lebs     7705
> [   11.423118]  idx_lebs       10
> [   11.426174]  total_free     1957130240
> [   11.429925]  total_dirty    6846968
> [   11.433425]  total_used     18161984
> [   11.437001]  total_dead     88160
> [   11.440317]  total_dark     63299584
> [   11.443952] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" stops
> [   11.451984] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" started, =
PID 634
> [   11.474373] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry
> [   11.497488] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry
> [   11.520558] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry
> [   11.543655] ubi0 error: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read 253952 bytes
> [   11.554809] CPU: 1 PID: 626 Comm: mount_root Not tainted 4.4.0 #6
> [   11.560905] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> [   11.567435] Backtrace:
> [   11.569917] [<8001e674>] (dump_backtrace) from [<8001e86c>]
> (show_stack+0x18/0x1c)
> [   11.577489]  r7:00000af7 r6:0003e000 r5:60000013 r4:00000000
> [   11.583216] [<8001e854>] (show_stack) from [<80232028>]
> (dump_stack+0x84/0xa4)
> [   11.590455] [<80231fa4>] (dump_stack) from [<8030a9c4>]
> (ubi_io_read+0x1dc/0x2b0)
> [   11.597938]  r5:bf206000 r4:ffffffb6
> [   11.601549] [<8030a7e8>] (ubi_io_read) from [<80308974>]
> (ubi_eba_read_leb+0x27c/0x388)
> [   11.609552]  r10:be913c00 r9:00000000 r8:00000000 r7:00000002
> r6:bf206000 r5:bf206000
> [   11.617453]  r4:0003e000
> [   11.620008] [<803086f8>] (ubi_eba_read_leb) from [<80307864>]
> (ubi_leb_read+0x74/0xc4)
> [   11.627924]  r10:c0e7d000 r9:00000002 r8:00000002 r7:00000000
> r6:bf206000 r5:be913c00
> [   11.635823]  r4:0003e000
> [   11.638377] [<803077f0>] (ubi_leb_read) from [<801da34c>]
> (ubifs_leb_read+0x34/0x98)
> [   11.646120]  r10:bf17d680 r9:00000002 r8:00000000 r7:00000002
> r6:0003e000 r5:bf210000
> [   11.654019]  r4:bf17d240
> [   11.656576] [<801da318>] (ubifs_leb_read) from [<801e19c8>]
> (ubifs_start_scan+0x7c/0xf8)
> [   11.664666]  r8:00000002 r7:c0e7d000 r6:00000000 r5:bf210000 r4:bf17d2=
40
> [   11.671442] [<801e194c>] (ubifs_start_scan) from [<801e1ccc>]
> (ubifs_scan+0x2c/0x330)
> [   11.679271]  r8:00000003 r7:0003e000 r6:c0e7d000 r5:00000000 r4:bf2100=
00
> [   11.686046] [<801e1ca0>] (ubifs_scan) from [<801e0e38>]
> (ubifs_read_master+0xb4/0x924)
> [   11.693963]  r10:bf17d680 r9:000000a0 r8:00000003 r7:00002000
> r6:bf17d440 r5:bf17d240
> [   11.701862]  r4:bf210000
> [   11.704415] [<801e0d84>] (ubifs_read_master) from [<801d82c4>]
> (ubifs_mount+0xa7c/0x156c)
> [   11.712592]  r10:bf17d680 r9:000000a0 r8:bf21087c r7:be548400
> r6:00000000 r5:bf210000
> [   11.720489]  r4:bf2d9300
> [   11.723045] [<801d7848>] (ubifs_mount) from [<801011ac>] (mount_fs+0x1=
c/0xa0)
> [   11.730180]  r10:bf17d180 r9:806f2078 r8:00000000 r7:806f2078
> r6:806f2078 r5:00000000
> [   11.738081]  r4:801d7848
> [   11.740636] [<80101190>] (mount_fs) from [<80119054>]
> (vfs_kern_mount+0x50/0x108)
> [   11.748119]  r6:bf17d480 r5:00000000 r4:bf183cc0
> [   11.752788] [<80119004>] (vfs_kern_mount) from [<8011c354>]
> (do_mount+0x9d8/0xb70)
> [   11.760356]  r9:806f2078 r8:bf17d480 r7:76edc4c5 r6:00000400
> r5:806dbc6c r4:00000008
> [   11.768176] [<8011b97c>] (do_mount) from [<8011c72c>] (SyS_mount+0x7c/=
0xa8)
> [   11.775137]  r10:00000000 r9:be588000 r8:00000400 r7:76edc4c5
> r6:bf17d480 r5:bf17d180
> [   11.783036]  r4:00000000
> [   11.785591] [<8011c6b0>] (SyS_mount) from [<80009bc0>]
> (ret_fast_syscall+0x0/0x3c)
> [   11.793160]  r8:80009d84 r7:00000015 r6:76eece70 r5:76ebd0e0 r4:000000=
00
> [   11.823668] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry
> [   11.847405] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry
> [   11.871113] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry
> [   11.894761] ubi0 error: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read 253952 bytes
> [   11.905915] CPU: 1 PID: 626 Comm: mount_root Not tainted 4.4.0 #6
> [   11.912010] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> [   11.918540] Backtrace:
> [   11.921022] [<8001e674>] (dump_backtrace) from [<8001e86c>]
> (show_stack+0x18/0x1c)
> [   11.928593]  r7:00000af7 r6:0003e000 r5:60000013 r4:00000000
> [   11.934321] [<8001e854>] (show_stack) from [<80232028>]
> (dump_stack+0x84/0xa4)
> [   11.941562] [<80231fa4>] (dump_stack) from [<8030a9c4>]
> (ubi_io_read+0x1dc/0x2b0)
> [   11.949044]  r5:bf206000 r4:ffffffb6
> [   11.952657] [<8030a7e8>] (ubi_io_read) from [<80308974>]
> (ubi_eba_read_leb+0x27c/0x388)
> [   11.960660]  r10:be913c00 r9:00000000 r8:00000000 r7:00000002
> r6:bf206000 r5:bf206000
> [   11.968559]  r4:0003e000
> [   11.971114] [<803086f8>] (ubi_eba_read_leb) from [<80307864>]
> (ubi_leb_read+0x74/0xc4)
> [   11.979030]  r10:c0f3a000 r9:c0f3a000 r8:00000002 r7:00000000
> r6:bf206000 r5:be913c00
> [   11.986929]  r4:0003e000
> [   11.989484] [<803077f0>] (ubi_leb_read) from [<801da34c>]
> (ubifs_leb_read+0x34/0x98)
> [   11.997227]  r10:00000002 r9:c0f3a000 r8:00000000 r7:00000002
> r6:0003e000 r5:bf210000
> [   12.005127]  r4:bf210000
> [   12.007691] [<801da318>] (ubifs_leb_read) from [<801f1668>]
> (get_master_node+0x58/0x1f0)
> [   12.015782]  r8:bf210000 r7:00001000 r6:bf17d440 r5:00000000 r4:bf2100=
00
> [   12.022560] [<801f1610>] (get_master_node) from [<801f1b0c>]
> (ubifs_recover_master_node+0x70/0x2f4)
> [   12.031606]  r10:bf17d680 r9:000000a0 r8:00000003 r7:00001000
> r6:bf17d440 r5:00000000
> [   12.039505]  r4:bf210000
> [   12.042060] [<801f1a9c>] (ubifs_recover_master_node) from
> [<801e0f28>] (ubifs_read_master+0x1a4/0x924)
> [   12.051366]  r7:00002000 r6:bf17d440 r5:ffffff8b r4:bf210000
> [   12.057088] [<801e0d84>] (ubifs_read_master) from [<801d82c4>]
> (ubifs_mount+0xa7c/0x156c)
> [   12.065264]  r10:bf17d680 r9:000000a0 r8:bf21087c r7:be548400
> r6:00000000 r5:bf210000
> [   12.073164]  r4:bf2d9300
> [   12.075721] [<801d7848>] (ubifs_mount) from [<801011ac>] (mount_fs+0x1=
c/0xa0)
> [   12.082856]  r10:bf17d180 r9:806f2078 r8:00000000 r7:806f2078
> r6:806f2078 r5:00000000
> [   12.090756]  r4:801d7848
> [   12.093311] [<80101190>] (mount_fs) from [<80119054>]
> (vfs_kern_mount+0x50/0x108)
> [   12.100794]  r6:bf17d480 r5:00000000 r4:bf183cc0
> [   12.105462] [<80119004>] (vfs_kern_mount) from [<8011c354>]
> (do_mount+0x9d8/0xb70)
> [   12.113031]  r9:806f2078 r8:bf17d480 r7:76edc4c5 r6:00000400
> r5:806dbc6c r4:00000008
> [   12.120852] [<8011b97c>] (do_mount) from [<8011c72c>] (SyS_mount+0x7c/=
0xa8)
> [   12.127814]  r10:00000000 r9:be588000 r8:00000400 r7:76edc4c5
> r6:bf17d480 r5:bf17d180
> [   12.135713]  r4:00000000
> [   12.138269] [<8011c6b0>] (SyS_mount) from [<80009bc0>]
> (ret_fast_syscall+0x0/0x3c)
> [   12.145840]  r8:80009d84 r7:00000015 r6:76eece70 r5:76ebd0e0 r4:000000=
00
> [   12.153108] UBIFS error (ubi0:2 pid 626):
> ubifs_recover_master_node: failed to recover master node
> [   12.162093] UBIFS error (ubi0:2 pid 626):
> ubifs_recover_master_node: dumping first master node
> [   12.170708]  magic          0x6101831
> [   12.174389]  crc            0xd0feaa12
> [   12.178140]  node_type      7 (master node)
> [   12.182340]  group_type     0 (no node group)
> [   12.186699]  sqnum          272796
> [   12.190101]  len            512
> [   12.193258]  highest_inum   3500
> [   12.196492]  commit number  8967
> [   12.199722]  flags          0x3
> [   12.202877]  log_lnum       3
> [   12.205846]  root_lnum      461
> [   12.208990]  root_offs      74096
> [   12.212319]  root_len       128
> [   12.215461]  gc_lnum        460
> [   12.218602]  ihead_lnum     461
> [   12.221758]  ihead_offs     77824
> [   12.225073]  index_size     210120
> [   12.228476]  lpt_lnum       10
> [   12.231530]  lpt_offs       94430
> [   12.234859]  nhead_lnum     10
> [   12.237914]  nhead_offs     98304
> [   12.241229]  ltab_lnum      10
> [   12.244298]  ltab_offs      94208
> [   12.247613]  lsave_lnum     0
> [   12.250581]  lsave_offs     0
> [   12.253562]  lscan_lnum     460
> [   12.256705]  leb_cnt        7820
> [   12.259933]  empty_lebs     7705
> [   12.263174]  idx_lebs       10
> [   12.266231]  total_free     1957130240
> [   12.269980]  total_dirty    6846968
> [   12.273482]  total_used     18161984
> [   12.277058]  total_dead     88160
> [   12.280374]  total_dark     63299584
> [   12.284022] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" stops
> [   12.290714] mount_root: failed to mount -t ubifs /dev/ubi0_2
> /tmp/overlay: Invalid argument
> [   12.303451] blk_update_request: I/O error, dev mtdblock0, sector 0
> [   12.313183] blk_update_request: I/O error, dev mtdblock0, sector 0
> [   12.319374] Buffer I/O error on dev mtdblock0, logical block 0,
> async page read
> [   12.389844] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" started, =
PID 638
> [   12.412129] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry
> [   12.435259] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry
> [   12.458336] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry
> [   12.482116] ubi0 error: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read 253952 bytes
> ...
>
>>> >> The kernel they are using is a bit out of date but does have
>>> >> 'gpmi-nand: Handle ECC Errors in erased pages' [1] patch
>>> >>
>>> >> I'm wondering if the 'unstable bits issue' [2] is still an issue or =
if
>>> >> the UBI/UBFS Documentation is out of date and this has been resolved=
.
>>> >> If it has been resolved, can anyone point me to the patches.
>>> >
>>> > This issue is highly theoretical and I never actually saw it in the w=
ild.
>>> > Every single time someone claimed to suffer from that, it turned out =
to be
>>> > something else. Currently UBI/UBIFS has no counter measurement, for t=
he
>>> > said reasons.
>>> > This reminds me that we have to update the website...
>>> >
>>> > So did you verify (with your NAND vendor) that this really is the nam=
ed
>>> > issue?
>>> I have no idea if what the user reported is the unstable bits issue
>>> but the fact you've never seen it occur in the wild tells me probably
>>> not.
>>
>> I'd be surprised, but you never know. :-)
>>
>> Just to be sure, this is SLC NAND, right?
>
> No, its a MT29F16G08 16GB MLC
>
> Tim
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--=20
Sincerely,

Han XU

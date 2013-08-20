Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBmnS-0005mR-Ho
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 14:20:38 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: ubifs: Mean crash when dumping orphan node
Date: Tue, 20 Aug 2013 14:19:57 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FCDCECE@post.tritech.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Problem:=0A=
Found when running integck with power-cut emulation.=0A=
An orphan node ended up with a corrupted (huge) "len" field. The error is=
=0A=
detected by ubifs_check_node() that calls ubifs_dump_node(). This in turn=
=0A=
does not check the len and tries to dump from outside the leb buffer.=0A=
--> Kernel oops.=0A=
--> note: flush-ubifs_1_0[2143] exited with preempt_count 1=0A=
--> ubifs_bgt1_0 stuck in uninterruptible sleep.=0A=
=0A=
Solution:=0A=
ubifs_dump_node() doesn't have access to leb number or offset, also it is=
=0A=
called from many places so adding those as arguments is not pleasing.=0A=
The following ugly patch limits the buffer len field in ubifs_check_node() =
in=0A=
case the len is out of range. Perhaps someone see a better alternative?=0A=
=0A=
=0A=
diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c=0A=
index e18b988..0e6b1df 100644=0A=
--- a/fs/ubifs/io.c=0A=
+++ b/fs/ubifs/io.c=0A=
@@ -261,8 +261,11 @@ int ubifs_check_node(const struct ubifs_info *c, const=
 void *buf, int lnum,=0A=
        }=0A=
 =0A=
        node_len =3D le32_to_cpu(ch->len);=0A=
-       if (node_len + offs > c->leb_size)=0A=
+       if (node_len + offs > c->leb_size) {=0A=
+               /* Prevent crash when dumping node */=0A=
+               ch->len =3D cpu_to_le32(c->leb_size - offs);=0A=
                goto out_len;=0A=
+       }=0A=
 =0A=
        if (c->ranges[type].max_len =3D=3D 0) {=0A=
                if (node_len !=3D c->ranges[type].len)=0A=
=0A=
=0A=
----------------------- Console log ---------------------------=0A=
=0A=
UBI: attaching mtd1 to ubi1=0A=
UBI: physical eraseblock size:   131072 bytes (128 KiB)=0A=
UBI: logical eraseblock size:    130944 bytes=0A=
UBI: smallest flash I/O unit:    1=0A=
UBI: VID header offset:          64 (aligned 64)=0A=
UBI: data offset:                128=0A=
UBI: max. sequence number:       511497=0A=
UBI: attached mtd1 to ubi1=0A=
UBI: MTD device name:            "integ_chk"=0A=
UBI: MTD device size:            11 MiB=0A=
UBI: number of good PEBs:        95=0A=
UBI: number of bad PEBs:         0=0A=
UBI: number of corrupted PEBs:   0=0A=
UBI: max. allowed volumes:       128=0A=
UBI: wear-leveling threshold:    4096=0A=
UBI: number of internal volumes: 1=0A=
UBI: number of user volumes:     1=0A=
UBI: available PEBs:             0=0A=
UBI: total number of reserved PEBs: 95=0A=
UBI: number of PEBs reserved for bad PEB handling: 0=0A=
UBI: max/mean erase counter: 30449/29798=0A=
UBI: image sequence number:  537117096=0A=
UBI: background thread "ubi_bgt1d" started, PID 2141=0A=
UBIFS: background thread "ubifs_bgt1_0" started, PID 2142=0A=
UBIFS: recovery needed=0A=
UBIFS: recovery completed=0A=
UBIFS: mounted UBI device 1, volume 0, name "integ_chk"(null)=0A=
UBIFS: LEB size: 130944 bytes (127 KiB), min./max. I/O unit sizes: 8 bytes/=
512 bytes=0A=
UBIFS: FS size: 10606464 bytes (10 MiB, 81 LEBs), journal size 1047553 byte=
s (0 MiB, 6 LEBs)=0A=
UBIFS: reserved for root: 500969 bytes (489 KiB)=0A=
UBIFS: media format: w4/r0 (latest is w4/r0), UUID 23ADF8B1-A415-4349-9ED5-=
E8348AFA64BF, small LPT model=0A=
UBIFS: background thread "ubifs_bgt1_0" stops=0A=
UBIFS: background thread "ubifs_bgt1_0" started, PID 2148=0A=
UBIFS warning (pid 21052): power_cut_emulated: failing after 6062 calls=0A=
UBIFS warning (pid 2143): power_cut_emulated: failing in GC head LEB 49=0A=
UBIFS warning (pid 2143): power_cut_emulated: =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Power cut emulated =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
Call Trace:=0A=
[ce54da50] [c000884c] show_stack+0x48/0x168 (unreliable)=0A=
[ce54da90] [c011927c] power_cut_emulated+0x2d8/0x668=0A=
[ce54dab0] [c011980c] dbg_leb_write+0x64/0x1b4=0A=
[ce54dae0] [c00f1df8] ubifs_leb_write+0x64/0x124=0A=
[ce54db00] [c00f2568] ubifs_wbuf_write_nolock+0x4a0/0xa00=0A=
[ce54db50] [c010096c] move_node+0x40/0xb4=0A=
[ce54db80] [c0101118] ubifs_garbage_collect_leb+0x608/0x874=0A=
[ce54dbe0] [c010150c] ubifs_garbage_collect+0x188/0x704=0A=
[ce54dc60] [c00e2c04] make_reservation+0x110/0x64c=0A=
[ce54dcd0] [c00e59e4] ubifs_jnl_write_data+0x124/0x354=0A=
[ce54dd40] [c00e7ae4] do_writepage+0x88/0x1e0=0A=
[ce54dd80] [c006226c] __writepage+0x24/0x8c=0A=
[ce54dd90] [c0062ce4] write_cache_pages+0x200/0x38c=0A=
[ce54de30] [c00aa380] writeback_single_inode+0xfc/0x364=0A=
[ce54de60] [c00aabc0] writeback_sb_inodes+0x160/0x270=0A=
[ce54dea0] [c00ab4ec] wb_writeback+0x224/0x2dc=0A=
[ce54df20] [c00ab648] wb_do_writeback+0xa4/0x1a8=0A=
[ce54df70] [c00ab79c] bdi_writeback_task+0x50/0x124=0A=
[ce54dfa0] [c0070074] bdi_start_fn+0x8c/0x114=0A=
[ce54dfc0] [c003ca3c] kthread+0x78/0x7c=0A=
[ce54dff0] [c00119a8] kernel_thread+0x4c/0x68=0A=
UBIFS warning (pid 2143): corrupt_data: filled bytes 346-511 with random da=
ta=0A=
UBIFS warning (pid 2143): dbg_leb_write: actually write 512 bytes to LEB 49=
:110592 (the buffer was corrupted)=0A=
UBIFS error (pid 2143): ubifs_leb_write: writing 512 bytes to LEB 49:110592=
 failed, error -30=0A=
UBIFS warning (pid 2143): ubifs_ro_mode: switched to read-only mode, error =
-30=0A=
Call Trace:=0A=
[ce54da90] [c000884c] show_stack+0x48/0x168 (unreliable)=0A=
[ce54dad0] [c00f0ef4] ubifs_ro_mode+0x70/0x74=0A=
[ce54dae0] [c00f1e84] ubifs_leb_write+0xf0/0x124=0A=
[ce54db00] [c00f2568] ubifs_wbuf_write_nolock+0x4a0/0xa00=0A=
[ce54db50] [c010096c] move_node+0x40/0xb4=0A=
[ce54db80] [c0101118] ubifs_garbage_collect_leb+0x608/0x874=0A=
[ce54dbe0] [c010150c] ubifs_garbage_collect+0x188/0x704=0A=
[ce54dc60] [c00e2c04] make_reservation+0x110/0x64c=0A=
[ce54dcd0] [c00e59e4] ubifs_jnl_write_data+0x124/0x354=0A=
[ce54dd40] [c00e7ae4] do_writepage+0x88/0x1e0=0A=
[ce54dd80] [c006226c] __writepage+0x24/0x8c=0A=
[ce54dd90] [c0062ce4] write_cache_pages+0x200/0x38c=0A=
[ce54de30] [c00aa380] writeback_single_inode+0xfc/0x364=0A=
[ce54de60] [c00aabc0] writeback_sb_inodes+0x160/0x270=0A=
[ce54dea0] [c00ab4ec] wb_writeback+0x224/0x2dc=0A=
[ce54df20] [c00ab648] wb_do_writeback+0xa4/0x1a8=0A=
[ce54df70] [c00ab79c] bdi_writeback_task+0x50/0x124=0A=
[ce54dfa0] [c0070074] bdi_start_fn+0x8c/0x114=0A=
[ce54dfc0] [c003ca3c] kthread+0x78/0x7c=0A=
[ce54dff0] [c00119a8] kernel_thread+0x4c/0x68=0A=
Call Trace:=0A=
[ce54daa0] [c000884c] show_stack+0x48/0x168 (unreliable)=0A=
[ce54dae0] [c00f1e88] ubifs_leb_write+0xf4/0x124=0A=
[ce54db00] [c00f2568] ubifs_wbuf_write_nolock+0x4a0/0xa00=0A=
[ce54db50] [c010096c] move_node+0x40/0xb4=0A=
[ce54db80] [c0101118] ubifs_garbage_collect_leb+0x608/0x874=0A=
[ce54dbe0] [c010150c] ubifs_garbage_collect+0x188/0x704=0A=
[ce54dc60] [c00e2c04] make_reservation+0x110/0x64c=0A=
[ce54dcd0] [c00e59e4] ubifs_jnl_write_data+0x124/0x354=0A=
[ce54dd40] [c00e7ae4] do_writepage+0x88/0x1e0=0A=
[ce54dd80] [c006226c] __writepage+0x24/0x8c=0A=
[ce54dd90] [c0062ce4] write_cache_pages+0x200/0x38c=0A=
[ce54de30] [c00aa380] writeback_single_inode+0xfc/0x364=0A=
[ce54de60] [c00aabc0] writeback_sb_inodes+0x160/0x270=0A=
[ce54dea0] [c00ab4ec] wb_writeback+0x224/0x2dc=0A=
[ce54df20] [c00ab648] wb_do_writeback+0xa4/0x1a8=0A=
[ce54df70] [c00ab79c] bdi_writeback_task+0x50/0x124=0A=
[ce54dfa0] [c0070074] bdi_start_fn+0x8c/0x114=0A=
[ce54dfc0] [c003ca3c] kthread+0x78/0x7c=0A=
[ce54dff0] [c00119a8] kernel_thread+0x4c/0x68=0A=
UBIFS error (pid 2143): ubifs_wbuf_write_nolock: cannot write 63 bytes to L=
EB 49:110592, error -30=0A=
        magic          0x6101831=0A=
        crc            0x5e5c8e6c=0A=
        node_type      2 (direntry node)=0A=
        group_type     1 (in node group)=0A=
        sqnum          27165524=0A=
        len            63=0A=
        key            (1019352, direntry, 0x258e374)=0A=
        inum           1019371=0A=
        type           1=0A=
        nlen           6=0A=
        name           522879=0A=
Call Trace:=0A=
[ce54dac0] [c000884c] show_stack+0x48/0x168 (unreliable)=0A=
[ce54db00] [c00f24b0] ubifs_wbuf_write_nolock+0x3e8/0xa00=0A=
[ce54db50] [c010096c] move_node+0x40/0xb4=0A=
[ce54db80] [c0101118] ubifs_garbage_collect_leb+0x608/0x874=0A=
[ce54dbe0] [c010150c] ubifs_garbage_collect+0x188/0x704=0A=
[ce54dc60] [c00e2c04] make_reservation+0x110/0x64c=0A=
[ce54dcd0] [c00e59e4] ubifs_jnl_write_data+0x124/0x354=0A=
[ce54dd40] [c00e7ae4] do_writepage+0x88/0x1e0=0A=
[ce54dd80] [c006226c] __writepage+0x24/0x8c=0A=
[ce54dd90] [c0062ce4] write_cache_pages+0x200/0x38c=0A=
[ce54de30] [c00aa380] writeback_single_inode+0xfc/0x364=0A=
[ce54de60] [c00aabc0] writeback_sb_inodes+0x160/0x270=0A=
[ce54dea0] [c00ab4ec] wb_writeback+0x224/0x2dc=0A=
[ce54df20] [c00ab648] wb_do_writeback+0xa4/0x1a8=0A=
[ce54df70] [c00ab79c] bdi_writeback_task+0x50/0x124=0A=
[ce54dfa0] [c0070074] bdi_start_fn+0x8c/0x114=0A=
[ce54dfc0] [c003ca3c] kthread+0x78/0x7c=0A=
[ce54dff0] [c00119a8] kernel_thread+0x4c/0x68=0A=
(pid 2143) start dumping LEB 49=0A=
UBIFS error (pid 2143): ubifs_check_node: bad node length 673382463=0A=
UBIFS error (pid 2143): ubifs_check_node: bad node at LEB 49:110920=0A=
        magic          0x6101831=0A=
        crc            0xa416d062=0A=
        node_type      11 (orphan node)=0A=
        group_type     64 (unknown)=0A=
        sqnum          27165548=0A=
        len            673382463=0A=
        commit number  65620158181089514=0A=
        last node flag 0=0A=
        84172803 orphan inode numbers:=0A=
          ino 3562129533828147616=0A=
          ino 8117303588418149870=0A=
          ino 4640262820834542106=0A=
          ino 6726456995349585035=0A=
          ino 14489074808184778633=0A=
          ino 13946985241486444853=0A=
          ino 10749874589530534200=0A=
          ino 6464459056807361480=0A=
          ino 6626419564033690030=0A=
          ino 11788878205927043913=0A=
          ino 6555818361502561268=0A=
          ino 17704711455940586508=0A=
          ino 14549808009372943550=0A=
          ino 8481426162481423107=0A=
          ino 10339464532359928517=0A=
          ino 3645254393624201195=0A=
          ino 14333515036885505844=0A=
          ino 13565517142754118993=0A=
          ino 16678727471166591753=0A=
          ino 18446744073709551615=0A=
          ino 18446744073709551615=0A=
//snip//=0A=
          ino 18446744073709551615=0A=
          ino 18446744073709551615=0A=
          ino 18446744073709551615=0A=
          ino 9821846592259568493=0A=
          ino 11102932228019499002=0A=
          ino 12626009155550599837=0A=
          ino 2895740556906901342=0A=
          ino 3426259527302190334=0A=
          ino 4358966078677474170=0A=
          ino 10542940169215034251=0A=
          ino 13900150150557332777=0A=
          ino 2325828422616975107=0A=
          ino 6561521274669858056=0A=
          ino 16499483703353557986=0A=
          ino 8672796104748479605=0A=
          ino 11865067532203562597=0A=
          ino 4607242104969698445=0A=
          ino 17031714597478032265=0A=
          ino 11075308794197177645=0A=
Unable to handle kernel paging request for data at address 0xd6d92000=0A=
Faulting instruction address: 0xc011be34=0A=
Oops: Kernel access of bad area, sig: 11 [#1]=0A=
PREEMPT MPC5125=0A=
last sysfs file: /sys/devices/virtual/ubi/ubi1/mtd_num=0A=
Modules linked in: xt_tcpudp nf_conntrack_ipv4 nf_defrag_ipv4 xt_state nf_c=
onntr=0A=
ack iptable_filter ip_tables x_tables rfcomm l2cap bluetooth ext2 vfat fat =
sg sd=0A=
_mod usb_storage scsi_mod usb_libusual ehci_hcd usbcore=0A=
NIP: c011be34 LR: c011be6c CTR: c01829f4=0A=
REGS: ce54d910 TRAP: 0300   Tainted: G        W    (2.6.35.14-debug-3)=0A=
MSR: 00009032 <EE,ME,IR,DR>  CR: 44002024  XER: 20000000=0A=
DAR: d6d92000, DSISR: 20000000=0A=
TASK =3D cf30e7f0[2143] 'flush-ubifs_1_0' THREAD: ce54c000=0A=
GPR00: c011be6c ce54d9c0 cf30e7f0 00000022 120f6f8a ffffffff c03265e2 00010=
000=0A=
GPR08: c03269c8 00000001 00000004 120f6f8a 44002022 00000000 c029ec2c c02a6=
350=0A=
GPR16: c0262094 c029ec2c 00100100 00200200 c02a499c c0318c80 c03222b0 c0322=
2a8=0A=
GPR24: cf325ca0 00000031 00000031 c02ada68 000009d3 d6d91fe0 ce54c000 05046=
003=0A=
NIP [c011be34] ubifs_dump_node+0x310/0x1700=0A=
LR [c011be6c] ubifs_dump_node+0x348/0x1700=0A=
Call Trace:=0A=
[ce54d9c0] [c011be6c] ubifs_dump_node+0x348/0x1700 (unreliable)=0A=
[ce54da40] [c00f171c] ubifs_check_node+0x1a8/0x2b8=0A=
[ce54da60] [c00fad7c] ubifs_scan_a_node+0x1b0/0x388=0A=
[ce54da90] [c00faff0] ubifs_scan+0x9c/0x394=0A=
[ce54dad0] [c011ea9c] ubifs_dump_leb+0x5c/0x158=0A=
[ce54db00] [c00f24bc] ubifs_wbuf_write_nolock+0x3f4/0xa00=0A=
[ce54db50] [c010096c] move_node+0x40/0xb4=0A=
[ce54db80] [c0101118] ubifs_garbage_collect_leb+0x608/0x874=0A=
[ce54dbe0] [c010150c] ubifs_garbage_collect+0x188/0x704=0A=
[ce54dc60] [c00e2c04] make_reservation+0x110/0x64c=0A=
[ce54dcd0] [c00e59e4] ubifs_jnl_write_data+0x124/0x354=0A=
[ce54dd40] [c00e7ae4] do_writepage+0x88/0x1e0=0A=
[ce54dd80] [c006226c] __writepage+0x24/0x8c=0A=
[ce54dd90] [c0062ce4] write_cache_pages+0x200/0x38c=0A=
[ce54de30] [c00aa380] writeback_single_inode+0xfc/0x364=0A=
[ce54de60] [c00aabc0] writeback_sb_inodes+0x160/0x270=0A=
[ce54dea0] [c00ab4ec] wb_writeback+0x224/0x2dc=0A=
[ce54df20] [c00ab648] wb_do_writeback+0xa4/0x1a8=0A=
[ce54df70] [c00ab79c] bdi_writeback_task+0x50/0x124=0A=
[ce54dfa0] [c0070074] bdi_start_fn+0x8c/0x114=0A=
[ce54dfc0] [c003ca3c] kthread+0x78/0x7c=0A=
[ce54dff0] [c00119a8] kernel_thread+0x4c/0x68=0A=
Instruction dump:=0A=
5009421e 5009c00e 3929ffe0 553fe8fe 7fe4fb78 48134761 2f9f0000 419efe94=0A=
3d20c02b 7f9de378 3b69da68 3b800000 <813d0020> 3b9c0001 7f63db78 801d0024=
=0A=
---[ end trace 47de3350cfddc1f3 ]---=0A=
note: flush-ubifs_1_0[2143] exited with preempt_count 1=0A=
^Z[1]+  Stopped                    time ./integck.2 -eP /sys/kernel/debug/u=
bifs/ubi1_0/tst_recovery -m 1 /home/root/ubifs=0A=
root@debug:~# ps=0A=
  PID USER       VSZ STAT COMMAND=0A=
    1 root      1884 S    init [5]=0A=
    2 root         0 SW   [kthreadd]=0A=
    3 root         0 SW   [ksoftirqd/0]=0A=
    4 root         0 SW   [events/0]=0A=
    5 root         0 SW   [khelper]=0A=
    6 root         0 SW   [async/mgr]=0A=
    7 root         0 SW   [sync_supers]=0A=
    8 root         0 SW   [bdi-default]=0A=
    9 root         0 SW   [kblockd/0]=0A=
   10 root         0 SW   [kswapd0]=0A=
   11 root         0 SW   [aio/0]=0A=
   18 root         0 SW   [mtdblock0]=0A=
   19 root         0 SW   [mtdblock1]=0A=
   20 root         0 SW   [mtdblock2]=0A=
   21 root         0 SW   [mtdblock3]=0A=
   22 root         0 SW   [mtdblock4]=0A=
   23 root         0 SW   [mtdblock5]=0A=
   24 root         0 SW   [mtdblock6]=0A=
   25 root         0 SW   [mtdblock7]=0A=
   26 root         0 SW   [mtdblock8]=0A=
   27 root         0 SW   [80011200.spi]=0A=
   28 root         0 DW   [80011900.spi]=0A=
   29 root         0 SW   [ubi_bgt0d]=0A=
   30 root         0 SW   [ubifs_bgt0_0]=0A=
   67 root         0 DW   [spi_receive_thr]=0A=
   81 root         0 SW   [khubd]=0A=
   93 root      2468 S <  /sbin/udevd -d=0A=
  671 root         0 SW   [l2cap]=0A=
  672 root         0 SW<  [krfcommd]=0A=
  772 messageb  2912 S    /usr/bin/dbus-daemon --system=0A=
  857 root      3764 S    /bin/login --=0A=
  959 root      3488 S    -sh=0A=
 1076 root      3292 S    /sbin/syslogd -n -C64 -m 20=0A=
 2141 root         0 SW   [ubi_bgt1d]=0A=
 2148 root         0 DW   [ubifs_bgt1_0]=0A=
10938 root      2464 S <  /sbin/udevd -d=0A=
19488 root      2464 S <  /sbin/udevd -d=0A=
21051 root      3096 T    time ./integck.2 -eP /sys/kernel/debug/ubifs/ubi1=
_0/=0A=
21052 root      2060 D    ./integck.2 -eP /sys/kernel/debug/ubifs/ubi1_0/ts=
t_r=0A=
29046 root      3488 R    ps=0A=

Received: from mail-oln040092075071.outbound.protection.outlook.com
 ([40.92.75.71] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLwbH-0004Lf-HY
 for linux-mtd@lists.infradead.org; Thu, 24 May 2018 20:12:41 +0000
From: martin bayern <Martinbayern@outlook.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: power loss results in mounting failure on SLC NAND
Date: Thu, 24 May 2018 20:12:25 +0000
Message-ID: <CWLP265MB0721CEEAD78F72406192B523D26A0@CWLP265MB0721.GBRP265.PROD.OUTLOOK.COM>
References: <CWLP265MB0721344DBE1B7785E7D2C6A5D2DE0@CWLP265MB0721.GBRP265.PROD.OUTLOOK.COM>
 <22711116.lYnEpaWOtA@blindfold>
 <CAFLxGvzZNYiqQy2GnkyOfcZ+fnx1SVisVc=ntL90vk1gFf2YyA@mail.gmail.com>,
 <CAFLxGvxaYo9TfCMZPr4su6y7opQgeodK98r5rb5UU9O4H0Ff_Q@mail.gmail.com>,
 <CWLP265MB072103268B9C8C1834D61C8AD2A90@CWLP265MB0721.GBRP265.PROD.OUTLOOK.COM>,
 <CWLP265MB0721D354333D3492047D68DBD2BC0@CWLP265MB0721.GBRP265.PROD.OUTLOOK.COM>
In-Reply-To: <CWLP265MB0721D354333D3492047D68DBD2BC0@CWLP265MB0721.GBRP265.PROD.OUTLOOK.COM>
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi, Richard =0A=
Finally, we reproduced the issue again the same with before. after enabling=
 the patch, and keep fastmap enabling. once power on, we received following=
 print log. now we can confirm this patch can fix this issue.=0A=
please check.=0A=
Then, is this a preliminary patch for this issue? or do we have other good =
solution for this issue?=0A=
I notice that the parch will introduce tiny inevitable overhead since we ad=
ded fixup_mapping() in both ubi_eba_read_leb() and ubi_eba_write_leb().=0A=
Thanks.=0A=
=0A=
......=0A=
[    2.501501] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OO=
B size: 64=0A=
[    2.501657] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme=0A=
[    2.501760] 2 ofpart partitions found on MTD device 8000000.nand=0A=
[    2.501778] Creating 2 MTD partitions on "8000000.nand":=0A=
[    2.501830] 0x000000000000-0x000000080000 : "MTD_0"=0A=
[    2.501849] mtd: skip badblock stats collection for "MTD_0"=0A=
[    2.504808] 0x000000080000-0x000010000000 : "MTD_1"=0A=
[    2.504841] mtd: skip badblock stats collection for "MTD_1"=0A=
=0A=
[    4.386929] ubi0: default fastmap pool size: 100=0A=
[    4.386976] ubi0: default fastmap WL pool size: 50=0A=
[    4.387172] ubi0: attaching mtd1=0A=
=0A=
[    4.651907] ubi0: attached by fastmap=0A=
[    4.651956] ubi0: fastmap pool size: 100=0A=
[    4.651972] ubi0: fastmap WL pool size: 50=0A=
[    4.703131] ubi0: attached mtd1 (name "MTD_1", size 255 MiB)=0A=
[    4.703180] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 129024 byt=
es=0A=
[    4.703198] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 512=
=0A=
[    4.703215] ubi0: VID header offset: 512 (aligned 512), data offset: 204=
8=0A=
[    4.703232] ubi0: good PEBs: 2044, bad PEBs: 0, corrupted PEBs: 0=0A=
[    4.703249] ubi0: user volume: 8, internal volumes: 1, max. volumes coun=
t: 128=0A=
[    4.703270] ubi0: max/mean erase counter: 71/30, WL threshold: 4096, ima=
ge sequence number: 3772622085=0A=
[    4.703288] ubi0: available PEBs: 433, total reserved PEBs: 1611, PEBs r=
eserved for bad PEB handling: 40=0A=
[    4.712462] ubi0: background thread "ubi_bgt0d" started, PID 838=0A=
[    4.718508] ubi0 error: ubi_attach_mtd_dev: mtd1 is already attached to =
ubi0=0A=
[    4.728041] UPDATE.SH: Mounting swdl partition=0A=
[    4.824993] UBIFS (ubi0:10): background thread "ubifs_bgt0_10" started, =
PID 844=0A=
[    4.889128] UBIFS (ubi0:10): recovery needed=0A=
[    4.917378] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    4.923654] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    4.929970] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    4.936196] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    4.942486] ubi0 warning: ubi_io_read: error -74 (ECC error) while readi=
ng 512 bytes from PEB 2038:512, read only 512 bytes, retry=0A=
[    4.952264] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    4.958649] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    4.964878] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    4.971160] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    4.977447] ubi0 warning: ubi_io_read: error -74 (ECC error) while readi=
ng 512 bytes from PEB 2038:512, read only 512 bytes, retry=0A=
[    4.979118] cpsw 4a100000.ethernet eth0: Link is Up - 100Mbps/Full - flo=
w control off=0A=
[    4.979195] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready=0A=
[    4.993113] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    5.000646] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    5.007786] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    5.014016] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    5.020305] ubi0 warning: ubi_io_read: error -74 (ECC error) while readi=
ng 512 bytes from PEB 2038:512, read only 512 bytes, retry=0A=
[    5.030132] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    5.036403] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    5.042712] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    5.048979] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    5.055223] ubi0 error: ubi_io_read: error -74 (ECC error) while reading=
 512 bytes from PEB 2038:512, read 512 bytes=0A=
[    5.065856] CPU: 0 PID: 841 Comm: mount Not tainted 4.4.14 #Rel_Elina_J5=
Entry_TUNERGEN2_18013A=0A=
[    5.065876] Hardware name: Generic AM33XX (Flattened Device Tree)=0A=
[    5.065893] Backtrace:=0A=
[    5.065973] [<c0014a88>] (dump_backtrace) from [<c0014cd8>] (show_stack+=
0x20/0x24)=0A=
[    5.065988]  r7:00000200 r6:000007f6 r5:c71c6000 r4:ffffffb6=0A=
[    5.066042] [<c0014cb8>] (show_stack) from [<c02b0784>] (dump_stack+0x24=
/0x28)=0A=
[    5.066086] [<c02b0760>] (dump_stack) from [<c038e6f8>] (ubi_io_read+0x1=
6c/0x3bc)=0A=
[    5.066117] [<c038e58c>] (ubi_io_read) from [<c038ef00>] (ubi_io_read_vi=
d_hdr+0x70/0x338)=0A=
[    5.066131]  r10:c8322000 r9:00000000 r8:c4a07e00 r7:000007f6 r6:c13414d=
8 r5:c71c6000=0A=
[    5.066171]  r4:c71c6000=0A=
[    5.066204] [<c038ee90>] (ubi_io_read_vid_hdr) from [<c038b770>] (fixup_=
mapping.part.1+0x60/0xf0)=0A=
[    5.066219]  r10:c8322000 r9:c4a8c800 r8:00000003 r7:c4a85be4 r6:c4a8c80=
0 r5:c4a07e00=0A=
[    5.066259]  r4:c71c6000=0A=
[    5.066290] [<c038b710>] (fixup_mapping.part.1) from [<c038bba4>] (ubi_e=
ba_read_leb+0x234/0x4d4)=0A=
[    5.066304]  r10:c8322000 r9:c8322000 r8:00000003 r7:0000000a r6:c4a8c80=
0 r5:c71c6000=0A=
[    5.066343]  r4:c4a8c800=0A=
[    5.066374] [<c038b970>] (ubi_eba_read_leb) from [<c038a66c>] (ubi_leb_r=
ead+0xa4/0x138)=0A=
[    5.066388]  r10:c8322000 r9:c71c6000 r8:00000003 r7:00000000 r6:c494a5c=
0 r5:0001f800=0A=
[    5.066427]  r4:c4a8c800=0A=
[    5.066463] [<c038a5c8>] (ubi_leb_read) from [<c022a5e4>] (ubifs_leb_rea=
d+0x3c/0xa8)=0A=
[    5.066477]  r10:00000001 r9:00000003 r8:00000000 r7:00000003 r6:0001f80=
0 r5:c71cf000=0A=
[    5.066515]  r4:c494ad40=0A=
[    5.066549] [<c022a5a8>] (ubifs_leb_read) from [<c0233a14>] (ubifs_start=
_scan+0xa0/0x148)=0A=
[    5.066563]  r8:c8322000 r7:c71cf000 r6:00000003 r5:00000000 r4:c494ad40=
=0A=
[    5.066616] [<c0233974>] (ubifs_start_scan) from [<c0233de8>] (ubifs_sca=
n+0x38/0x3f8)=0A=
[    5.066630]  r8:00000109 r7:c71cf000 r6:00000000 r5:c8322000 r4:0001f800=
=0A=
[    5.066682] [<c0233db0>] (ubifs_scan) from [<c0234620>] (ubifs_replay_jo=
urnal+0x140/0x185c)=0A=
[    5.066696]  r10:c71cf000 r9:00002000 r8:00000109 r7:c494a8c0 r6:0000000=
0 r5:00000003=0A=
[    5.066735]  r4:c8322000=0A=
[    5.066764] [<c02344e0>] (ubifs_replay_journal) from [<c0227dd8>] (ubifs=
_mount+0x1340/0x21f0)=0A=
[    5.066779]  r10:00000000 r9:00000000 r8:c71cf000 r7:c4a8dc00 r6:c133d2a=
8 r5:c494a280=0A=
[    5.066818]  r4:00000000=0A=
[    5.066855] [<c0226a98>] (ubifs_mount) from [<c0122e40>] (mount_fs+0x54/=
0x170)=0A=
[    5.066869]  r10:00000000 r9:c494a080 r8:00000000 r7:00000000 r6:c130a1f=
4 r5:00000000=0A=
[    5.066909]  r4:c0226a98=0A=
[    5.066947] [<c0122dec>] (mount_fs) from [<c013c048>] (vfs_kern_mount+0x=
58/0x104)=0A=
[    5.066961]  r10:00000000 r9:c130a1f4 r8:00000000 r7:c130a1f4 r6:0000000=
0 r5:c494a080=0A=
[    5.067052]  r4:c49f4240=0A=
[    5.067089] [<c013bff0>] (vfs_kern_mount) from [<c013ed84>] (do_mount+0x=
1f4/0xbf4)=0A=
[    5.067105]  r9:c130a1f4 r8:c12d237c r7:c494a0c0 r6:c494a080 r5:00000020=
 r4:00000000=0A=
[    5.067161] [<c013eb90>] (do_mount) from [<c013fb14>] (SyS_mount+0xa4/0x=
d0)=0A=
[    5.067175]  r10:00000000 r9:c4a84000 r8:c0ed0000 r7:00028188 r6:0000000=
0 r5:c494a080=0A=
[    5.067214]  r4:c494a0c0=0A=
[    5.067249] [<c013fa70>] (SyS_mount) from [<c0010620>] (ret_fast_syscall=
+0x0/0x1c)=0A=
[    5.067263]  r8:c00107c4 r7:00000015 r6:c0ed0000 r5:491667d8 r4:00000000=
=0A=
[    5.090761] ubi0: run torture test for PEB 2038=0A=
[    5.092590] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    5.098969] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    5.105202] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    5.111486] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    5.127448] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    5.133721] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    5.140028] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    5.146256] omap2-nand 8000000.nand: uncorrectable bit-flips found=0A=
[    5.455349] ubi0: PEB 2038 passed torture test, do not mark it as bad=0A=
[    5.641511] UBIFS (ubi0:10): recovery completed=0A=
[    5.642180] UBIFS (ubi0:10): UBIFS: mounted UBI device 0, volume 10, nam=
e "SWDL"=0A=
[    5.642213] UBIFS (ubi0:10): LEB size: 129024 bytes (126 KiB), min./max.=
 I/O unit sizes: 2048 bytes/2048 bytes=0A=
[    5.642240] UBIFS (ubi0:10): FS size: 62705664 bytes (59 MiB, 486 LEBs),=
 journal size 8386560 bytes (7 MiB, 65 LEBs)=0A=
[    5.642257] UBIFS (ubi0:10): reserved for root: 0 bytes (0 KiB)=0A=
[    5.642288] UBIFS (ubi0:10): media format: w4/r0 (latest is w4/r0), UUID=
 0BD13516-3CBA-494F-8511-57064C646591, small LPT model=0A=
[    6.072556] UBIFS (ubi0:5): UBIFS: mounted UBI device 0, volume 5, name =
"APERS", R/O mode=0A=
[    6.072612] UBIFS (ubi0:5): LEB size: 129024 bytes (126 KiB), min./max. =
I/O unit sizes: 2048 bytes/2048 bytes=0A=
[    6.072639] UBIFS (ubi0:5): FS size: 2967552 bytes (2 MiB, 23 LEBs), jou=
rnal size 1161217 bytes (1 MiB, 8 LEBs)=0A=
[    6.072657] UBIFS (ubi0:5): reserved for root: 0 bytes (0 KiB)=0A=
[    6.072686] UBIFS (ubi0:5): media format: w4/r0 (latest is w4/r0), UUID =
265A1070-E271-4122-B8AF-AA3A210A1D74, small LPT model=0A=
=0A=

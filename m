Received: from nm20-vm4.bullet.mail.ne1.yahoo.com ([98.138.91.180])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RUymm-0001OM-7Y
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2011 10:50:09 +0000
Message-ID: <1322477406.67671.YahooMailNeo@web121512.mail.ne1.yahoo.com>
Date: Mon, 28 Nov 2011 02:50:06 -0800 (PST)
From: Karsten Jeppesen <arm9263@yahoo.com>
Subject: [UBI] Unable to recover corrupted filesystem, debug included,
 link included
To: ubifs <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Reply-To: Karsten Jeppesen <arm9263@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Guys,=0A=0ASince I didn't get any response last time, I assume the reaso=
n to be lack of debugging.=0AAs the subject says: I have 3 units out of som=
e hundreds showing this problem and to me that is of course a major issue.=
=0A=0AArchitecture is ARM9(263), kernel: 2.6.32.8 patched including the rec=
over.c patch which I hoped would solve this issue. It didn't.=0AAn image of=
 the root partition is available at http://download.gnist.skov.com/corrupt_=
ubifs.img=0A=0AThere are 2 sources of debug: Main console and dmesg.=0A=0AM=
ain console:=0A[=A0=A0 67.710000] UBI: attaching mtd4 to ubi0=0A[=A0=A0 67.=
710000] UBI: physical eraseblock size:=A0=A0 131072 bytes (128 KiB)=0A[=A0=
=A0 67.720000] UBI: logical eraseblock size:=A0=A0=A0 130944 bytes=0A[=A0=
=A0 67.720000] UBI: smallest flash I/O unit:=A0=A0=A0 1=0A[=A0=A0 67.730000=
] UBI: VID header offset:=A0=A0=A0=A0=A0=A0=A0=A0=A0 64 (aligned 64)=0A[=A0=
=A0 67.740000] UBI: data offset:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 128=0A[=A0=A0 67.800000] UBI: attached mtd4 to ubi0=0A[=A0=A0 67.800000=
] UBI: MTD device name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "User"=0A[=A0=A0 6=
7.800000] UBI: MTD device size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 28 MiB=0A[=
=A0=A0 67.820000] UBI: number of good PEBs:=A0=A0=A0=A0=A0=A0=A0 230=0A[=A0=
=A0 67.820000] UBI: number of bad PEBs:=A0=A0=A0=A0=A0=A0=A0=A0 0=0A[=A0=A0=
 67.820000] UBI: max. allowed volumes:=A0=A0=A0=A0=A0=A0 128=0A[=A0=A0 67.8=
40000] UBI: wear-leveling threshold:=A0=A0=A0 4096=0A[=A0=A0 67.840000] UBI=
: number of internal volumes: 1=0A[=A0=A0 67.870000] UBI: number of user vo=
lumes:=A0=A0=A0=A0 1=0A[=A0=A0 67.900000] UBI: available PEBs:=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 0=0A[=A0=A0 67.900000] UBI: total number of reserv=
ed PEBs: 230=0A[=A0=A0 67.900000] UBI: number of PEBs reserved for bad PEB =
handling: 0=0A[=A0=A0 67.930000] UBI: max/mean erase counter: 2/0=0A[=A0=A0=
 67.930000] UBI: image sequence number: 1748877991=0A[=A0=A0 67.930000] UBI=
: background thread "ubi_bgt0d" started, PID 2412=0AUBI device number 0, to=
tal 230 LEBs (30117120 bytes, 28.7 MiB), available 0 LEBs (0 bytes), LEB si=
ze 130944 bytes (127.9 KiB)=0A[=A0=A0 68.370000] UBIFS: recovery needed=0A[=
=A0=A0 68.380000] UBIFS error (pid 2418): ubifs_check_node: bad CRC: calcul=
ated 0x7d62d42c, read 0x1173c109=0A[=A0=A0 68.390000] UBIFS error (pid 2418=
): ubifs_check_node: bad node at LEB 84:50696=0A[=A0=A0 68.400000] [<c0030e=
74>] (unwind_backtrace+0x0/0xdc) from [<c02ee22c>] (dump_stack+0x18/0x1c)=
=0A[=A0=A0 68.410000] [<c02ee22c>] (dump_stack+0x18/0x1c) from [<c01566c4>]=
 (ubifs_check_node+0x2b4/0x2fc)=0A[=A0=A0 68.410000] [<c01566c4>] (ubifs_ch=
eck_node+0x2b4/0x2fc) from [<c015698c>] (ubifs_read_node+0x280/0x384)=0A[=
=A0=A0 68.420000] [<c015698c>] (ubifs_read_node+0x280/0x384) from [<c017c99=
c>] (ubifs_load_znode+0xc8/0x788)=0A[=A0=A0 68.430000] [<c017c99c>] (ubifs_=
load_znode+0xc8/0x788) from [<c017f80c>] (dbg_walk_index+0x80/0x294)=0A[=A0=
=A0 68.440000] [<c017f80c>] (dbg_walk_index+0x80/0x294) from [<c017fa64>] (=
dbg_check_idx_size+0x44/0xdc)=0A[=A0=A0 68.450000] [<c017fa64>] (dbg_check_=
idx_size+0x44/0xdc) from [<c0152808>] (ubifs_fill_super+0xd04/0x1e50)=0A[=
=A0=A0 68.460000] [<c0152808>] (ubifs_fill_super+0xd04/0x1e50) from [<c0153=
c30>] (ubifs_get_sb+0x2dc/0x350)=0A[=A0=A0 68.470000] [<c0153c30>] (ubifs_g=
et_sb+0x2dc/0x350) from [<c00c8328>] (vfs_kern_mount+0x58/0xe8)=0A[=A0=A0 6=
8.480000] [<c00c8328>] (vfs_kern_mount+0x58/0xe8) from [<c00c8414>] (do_ker=
n_mount+0x3c/0xe0)=0A[=A0=A0 68.490000] [<c00c8414>] (do_kern_mount+0x3c/0x=
e0) from [<c00e1a10>] (do_mount+0x720/0x78c)=0A[=A0=A0 68.500000] [<c00e1a1=
0>] (do_mount+0x720/0x78c) from [<c00e1b08>] (sys_mount+0x8c/0xcc)=0A[=A0=
=A0 68.510000] [<c00e1b08>] (sys_mount+0x8c/0xcc) from [<c002af40>] (ret_fa=
st_syscall+0x0/0x28)=0A[=A0=A0 68.520000] UBIFS error (pid 2418): ubifs_rea=
d_node: expected node type 9=0A[=A0=A0 68.520000] UBIFS error (pid 2418): d=
bg_check_idx_size: error -117 while walking the index=0A=0A=0Admesg output:=
=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:68608=
 (62336 bytes left)=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan_a=
_node: scanning master node=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubif=
s_scan: look at LEB 2:69120 (61824 bytes left)=0A[=A0=A0 68.360000] UBIFS D=
BG (pid 2418): ubifs_scan_a_node: scanning master node=0A[=A0=A0 68.360000]=
 UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:69632 (61312 bytes left)=
=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning mas=
ter node=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB=
 2:70144 (60800 bytes left)=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubif=
s_scan_a_node: scanning master node=0A[=A0=A0 68.360000] UBIFS DBG (pid 241=
8): ubifs_scan: look at LEB 2:70656 (60288 bytes left)=0A[=A0=A0 68.360000]=
 UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning master node=0A[=A0=A0 68=
.360000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:71168 (59776 bytes=
 left)=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanni=
ng master node=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan: look =
at LEB 2:71680 (59264 bytes left)=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418)=
: ubifs_scan_a_node: scanning master node=0A[=A0=A0 68.360000] UBIFS DBG (p=
id 2418): ubifs_scan: look at LEB 2:72192 (58752 bytes left)=0A[=A0=A0 68.3=
60000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning master node=0A[=A0=
=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:72704 (58240=
 bytes left)=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan_a_node: =
scanning master node=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan:=
 look at LEB 2:73216 (57728 bytes left)=0A[=A0=A0 68.360000] UBIFS DBG (pid=
 2418): ubifs_scan_a_node: scanning master node=0A[=A0=A0 68.360000] UBIFS =
DBG (pid 2418): ubifs_scan: look at LEB 2:73728 (57216 bytes left)=0A[=A0=
=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning master nod=
e=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:7424=
0 (56704 bytes left)=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan_=
a_node: scanning master node=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubi=
fs_scan: look at LEB 2:74752 (56192 bytes left)=0A[=A0=A0 68.360000] UBIFS =
DBG (pid 2418): ubifs_scan_a_node: scanning master node=0A[=A0=A0 68.360000=
] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:75264 (55680 bytes left)=
=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning mas=
ter node=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB=
 2:75776 (55168 bytes left)=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubif=
s_scan_a_node: scanning master node=0A[=A0=A0 68.360000] UBIFS DBG (pid 241=
8): ubifs_scan: look at LEB 2:76288 (54656 bytes left)=0A[=A0=A0 68.360000]=
 UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning master node=0A[=A0=A0 68=
.360000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:76800 (54144 bytes=
 left)=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanni=
ng master node=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan: look =
at LEB 2:77312 (53632 bytes left)=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418)=
: ubifs_scan_a_node: scanning master node=0A[=A0=A0 68.360000] UBIFS DBG (p=
id 2418): ubifs_scan: look at LEB 2:77824 (53120 bytes left)=0A[=A0=A0 68.3=
60000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning master node=0A[=A0=
=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:78336 (52608=
 bytes left)=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan_a_node: =
scanning master node=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan:=
 look at LEB 2:78848 (52096 bytes left)=0A[=A0=A0 68.360000] UBIFS DBG (pid=
 2418): ubifs_scan_a_node: scanning master node=0A[=A0=A0 68.360000] UBIFS =
DBG (pid 2418): ubifs_scan: look at LEB 2:79360 (51584 bytes left)=0A[=A0=
=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning master nod=
e=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:7987=
2 (51072 bytes left)=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan_=
a_node: scanning master node=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubi=
fs_scan: look at LEB 2:80384 (50560 bytes left)=0A[=A0=A0 68.360000] UBIFS =
DBG (pid 2418): ubifs_scan_a_node: scanning master node=0A[=A0=A0 68.360000=
] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:80896 (50048 bytes left)=
=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning mas=
ter node=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB=
 2:81408 (49536 bytes left)=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubif=
s_scan_a_node: scanning master node=0A[=A0=A0 68.360000] UBIFS DBG (pid 241=
8): ubifs_scan: look at LEB 2:81920 (49024 bytes left)=0A[=A0=A0 68.360000]=
 UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning master node=0A[=A0=A0 68=
.360000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:82432 (48512 bytes=
 left)=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanni=
ng master node=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan: look =
at LEB 2:82944 (48000 bytes left)=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418)=
: ubifs_scan_a_node: scanning master node=0A[=A0=A0 68.360000] UBIFS DBG (p=
id 2418): ubifs_scan: look at LEB 2:83456 (47488 bytes left)=0A[=A0=A0 68.3=
60000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning master node=0A[=A0=
=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:83968 (46976=
 bytes left)=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan_a_node: =
scanning master node=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan:=
 look at LEB 2:84480 (46464 bytes left)=0A[=A0=A0 68.360000] UBIFS DBG (pid=
 2418): ubifs_scan_a_node: scanning master node=0A[=A0=A0 68.360000] UBIFS =
DBG (pid 2418): ubifs_scan: look at LEB 2:84992 (45952 bytes left)=0A[=A0=
=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning master nod=
e=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:8550=
4 (45440 bytes left)=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan_=
a_node: scanning master node=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubi=
fs_scan: look at LEB 2:86016 (44928 bytes left)=0A[=A0=A0 68.360000] UBIFS =
DBG (pid 2418): ubifs_scan_a_node: scanning master node=0A[=A0=A0 68.360000=
] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:86528 (44416 bytes left)=
=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning mas=
ter node=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB=
 2:87040 (43904 bytes left)=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubif=
s_scan_a_node: scanning master node=0A[=A0=A0 68.360000] UBIFS DBG (pid 241=
8): ubifs_scan: look at LEB 2:87552 (43392 bytes left)=0A[=A0=A0 68.360000]=
 UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning master node=0A[=A0=A0 68=
.360000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:88064 (42880 bytes=
 left)=0A[=A0=A0 68.360000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanni=
ng master node=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan: look =
at LEB 2:88576 (42368 bytes left)=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418)=
: ubifs_scan_a_node: scanning master node=0A[=A0=A0 68.370000] UBIFS DBG (p=
id 2418): ubifs_scan: look at LEB 2:89088 (41856 bytes left)=0A[=A0=A0 68.3=
70000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning master node=0A[=A0=
=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:89600 (41344=
 bytes left)=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan_a_node: =
scanning master node=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan:=
 look at LEB 2:90112 (40832 bytes left)=0A[=A0=A0 68.370000] UBIFS DBG (pid=
 2418): ubifs_scan_a_node: scanning master node=0A[=A0=A0 68.370000] UBIFS =
DBG (pid 2418): ubifs_scan: look at LEB 2:90624 (40320 bytes left)=0A[=A0=
=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning master nod=
e=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:9113=
6 (39808 bytes left)=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan_=
a_node: scanning master node=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubi=
fs_scan: look at LEB 2:91648 (39296 bytes left)=0A[=A0=A0 68.370000] UBIFS =
DBG (pid 2418): ubifs_scan_a_node: scanning master node=0A[=A0=A0 68.370000=
] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:92160 (38784 bytes left)=
=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning mas=
ter node=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB=
 2:92672 (38272 bytes left)=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubif=
s_scan_a_node: scanning master node=0A[=A0=A0 68.370000] UBIFS DBG (pid 241=
8): ubifs_scan: look at LEB 2:93184 (37760 bytes left)=0A[=A0=A0 68.370000]=
 UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning master node=0A[=A0=A0 68=
.370000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:93696 (37248 bytes=
 left)=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanni=
ng master node=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan: look =
at LEB 2:94208 (36736 bytes left)=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418)=
: ubifs_scan_a_node: scanning master node=0A[=A0=A0 68.370000] UBIFS DBG (p=
id 2418): ubifs_scan: look at LEB 2:94720 (36224 bytes left)=0A[=A0=A0 68.3=
70000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning master node=0A[=A0=
=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:95232 (35712=
 bytes left)=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan_a_node: =
scanning master node=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan:=
 look at LEB 2:95744 (35200 bytes left)=0A[=A0=A0 68.370000] UBIFS DBG (pid=
 2418): ubifs_scan_a_node: scanning master node=0A[=A0=A0 68.370000] UBIFS =
DBG (pid 2418): ubifs_scan: look at LEB 2:96256 (34688 bytes left)=0A[=A0=
=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning master nod=
e=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:9676=
8 (34176 bytes left)=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan_=
a_node: scanning master node=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubi=
fs_scan: look at LEB 2:97280 (33664 bytes left)=0A[=A0=A0 68.370000] UBIFS =
DBG (pid 2418): ubifs_scan_a_node: scanning master node=0A[=A0=A0 68.370000=
] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:97792 (33152 bytes left)=
=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning mas=
ter node=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB=
 2:98304 (32640 bytes left)=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubif=
s_scan_a_node: scanning master node=0A[=A0=A0 68.370000] UBIFS DBG (pid 241=
8): ubifs_scan: look at LEB 2:98816 (32128 bytes left)=0A[=A0=A0 68.370000]=
 UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning master node=0A[=A0=A0 68=
.370000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:99328 (31616 bytes=
 left)=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanni=
ng master node=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan: look =
at LEB 2:99840 (31104 bytes left)=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418)=
: ubifs_scan_a_node: scanning master node=0A[=A0=A0 68.370000] UBIFS DBG (p=
id 2418): ubifs_scan: look at LEB 2:100352 (30592 bytes left)=0A[=A0=A0 68.=
370000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning master node=0A[=
=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:100864 (3=
0080 bytes left)=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan_a_no=
de: scanning master node=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_s=
can: look at LEB 2:101376 (29568 bytes left)=0A[=A0=A0 68.370000] UBIFS DBG=
 (pid 2418): ubifs_scan_a_node: scanning master node=0A[=A0=A0 68.370000] U=
BIFS DBG (pid 2418): ubifs_scan: look at LEB 2:101888 (29056 bytes left)=0A=
[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan_a_node: scanning master=
 node=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_scan: look at LEB 2:=
102400 (28544 bytes left)=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_=
scan_a_node: hit empty space=0A[=A0=A0 68.370000] UBIFS DBG (pid 2418): ubi=
fs_end_scan: stop scanning LEB 2 at offset 102400=0A[=A0=A0 68.370000] UBIF=
S DBG (pid 2418): ubifs_read_node: LEB 84:58672, indexing node, length 188=
=0A[=A0=A0 68.370000] UBIFS: recovery needed=0A[=A0=A0 68.370000] UBIFS DBG=
 (pid 2418): ubifs_recover_inl_heads: checking index head at 84:58864=0A[=
=A0=A0 68.370000] UBIFS DBG (pid 2418): ubifs_recover_inl_heads: checking L=
PT head at 6:13792=0A[=A0=A0 68.380000] UBIFS DBG (pid 2418): lpt_init_rd: =
space_bits 14=0A[=A0=A0 68.380000] UBIFS DBG (pid 2418): lpt_init_rd: lpt_l=
num_bits 2=0A[=A0=A0 68.380000] UBIFS DBG (pid 2418): lpt_init_rd: lpt_offs=
_bits 17=0A[=A0=A0 68.380000] UBIFS DBG (pid 2418): lpt_init_rd: lpt_spc_bi=
ts 17=0A[=A0=A0 68.380000] UBIFS DBG (pid 2418): lpt_init_rd: pcnt_bits 6=
=0A[=A0=A0 68.380000] UBIFS DBG (pid 2418): lpt_init_rd: lnum_bits 8=0A[=A0=
=A0 68.380000] UBIFS DBG (pid 2418): lpt_init_rd: pnode_sz 17=0A[=A0=A0 68.=
380000] UBIFS DBG (pid 2418): lpt_init_rd: nnode_sz 12=0A[=A0=A0 68.380000]=
 UBIFS DBG (pid 2418): lpt_init_rd: ltab_sz 11=0A[=A0=A0 68.380000] UBIFS D=
BG (pid 2418): lpt_init_rd: lsave_sz 259=0A[=A0=A0 68.380000] UBIFS DBG (pi=
d 2418): lpt_init_rd: lsave_cnt 256=0A[=A0=A0 68.380000] UBIFS DBG (pid 241=
8): lpt_init_rd: lpt_hght 3=0A[=A0=A0 68.380000] UBIFS DBG (pid 2418): lpt_=
init_rd: big_lpt 0=0A[=A0=A0 68.380000] UBIFS DBG (pid 2418): lpt_init_rd: =
LPT root is at 6:13777=0A[=A0=A0 68.380000] UBIFS DBG (pid 2418): lpt_init_=
rd: LPT head is at 6:13792=0A[=A0=A0 68.380000] UBIFS DBG (pid 2418): lpt_i=
nit_rd: LPT ltab is at 6:13696=0A[=A0=A0 68.380000] UBIFS DBG (pid 2418): u=
bifs_read_node: LEB 84:58672, indexing node, length 188=0A[=A0=A0 68.380000=
] UBIFS DBG (pid 2418): read_znode: LEB 84:58672, level 4, 8 branch=0A[=A0=
=A0 68.380000] UBIFS DBG (pid 2418): ubifs_read_node: LEB 84:52280, indexin=
g node, length 108=0A[=A0=A0 68.380000] UBIFS DBG (pid 2418): read_znode: L=
EB 84:52280, level 3, 4 branch=0A[=A0=A0 68.380000] UBIFS DBG (pid 2418): u=
bifs_read_node: LEB 84:51800, indexing node, length 128=0A[=A0=A0 68.380000=
] UBIFS DBG (pid 2418): read_znode: LEB 84:51800, level 2, 5 branch=0A[=A0=
=A0 68.380000] UBIFS DBG (pid 2418): ubifs_read_node: LEB 84:51112, indexin=
g node, length 108=0A[=A0=A0 68.380000] UBIFS DBG (pid 2418): read_znode: L=
EB 84:51112, level 1, 4 branch=0A[=A0=A0 68.380000] UBIFS DBG (pid 2418): u=
bifs_read_node: LEB 84:50696, indexing node, length 148=0A[=A0=A0 68.380000=
] UBIFS error (pid 2418): ubifs_check_node: bad CRC: calculated 0x7d62d42c,=
 read 0x1173c109=0A[=A0=A0 68.390000] UBIFS error (pid 2418): ubifs_check_n=
ode: bad node at LEB 84:50696=0A[=A0=A0 68.400000]=A0 magic=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 0x6101831=0A[=A0=A0 68.400000]=A0 crc=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 0x1173c109=0A[=A0=A0 68.400000]=A0 node_type=A0=A0=A0=A0=A0 9 (in=
dexing node)=0A[=A0=A0 68.400000]=A0 group_type=A0=A0=A0=A0 0 (no node grou=
p)=0A[=A0=A0 68.400000]=A0 sqnum=A0=A0=A0=A0=A0=A0=A0=A0=A0 29080=0A[=A0=A0=
 68.400000]=A0 len=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 148=0A[=A0=A0 68.400000=
]=A0 child_cnt=A0=A0=A0=A0=A0 6=0A[=A0=A0 68.400000]=A0 level=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 0=0A[=A0=A0 68.400000]=A0 Branches:=0A[=A0=A0 68.400000]=A0=
 0: LEB 95:49264 len 160 key (1, inode)=0A[=A0=A0 68.400000]=A0 1: LEB 13:3=
4792 len 60 key (1, direntry, 0x23605a)=0A[=A0=A0 68.400000]=A0 2: LEB 12:9=
1760 len 60 key (1, direntry, 0x23ee05)=0A[=A0=A0 68.400000]=A0 3: LEB 10:9=
36 len 60 key (1, direntry, 0x24a603)=0A[=A0=A0 68.400000]=A0 4: LEB 12:960=
48 len 60 key (1, direntry, 0x2697fa)=0A[=A0=A0 68.400000]=A0 5: LEB 13:340=
16 len 60 key (1, direntry, 0x271d65)=0A[=A0=A0 68.400000] [<c0030e74>] (un=
wind_backtrace+0x0/0xdc) from [<c02ee22c>] (dump_stack+0x18/0x1c)=0A[=A0=A0=
 68.410000] [<c02ee22c>] (dump_stack+0x18/0x1c) from [<c01566c4>] (ubifs_ch=
eck_node+0x2b4/0x2fc)=0A[=A0=A0 68.410000] [<c01566c4>] (ubifs_check_node+0=
x2b4/0x2fc) from [<c015698c>] (ubifs_read_node+0x280/0x384)=0A[=A0=A0 68.42=
0000] [<c015698c>] (ubifs_read_node+0x280/0x384) from [<c017c99c>] (ubifs_l=
oad_znode+0xc8/0x788)=0A[=A0=A0 68.430000] [<c017c99c>] (ubifs_load_znode+0=
xc8/0x788) from [<c017f80c>] (dbg_walk_index+0x80/0x294)=0A[=A0=A0 68.44000=
0] [<c017f80c>] (dbg_walk_index+0x80/0x294) from [<c017fa64>] (dbg_check_id=
x_size+0x44/0xdc)=0A[=A0=A0 68.450000] [<c017fa64>] (dbg_check_idx_size+0x4=
4/0xdc) from [<c0152808>] (ubifs_fill_super+0xd04/0x1e50)=0A[=A0=A0 68.4600=
00] [<c0152808>] (ubifs_fill_super+0xd04/0x1e50) from [<c0153c30>] (ubifs_g=
et_sb+0x2dc/0x350)=0A[=A0=A0 68.470000] [<c0153c30>] (ubifs_get_sb+0x2dc/0x=
350) from [<c00c8328>] (vfs_kern_mount+0x58/0xe8)=0A[=A0=A0 68.480000] [<c0=
0c8328>] (vfs_kern_mount+0x58/0xe8) from [<c00c8414>] (do_kern_mount+0x3c/0=
xe0)=0A[=A0=A0 68.490000] [<c00c8414>] (do_kern_mount+0x3c/0xe0) from [<c00=
e1a10>] (do_mount+0x720/0x78c)=0A[=A0=A0 68.500000] [<c00e1a10>] (do_mount+=
0x720/0x78c) from [<c00e1b08>] (sys_mount+0x8c/0xcc)=0A[=A0=A0 68.510000] [=
<c00e1b08>] (sys_mount+0x8c/0xcc) from [<c002af40>] (ret_fast_syscall+0x0/0=
x28)=0A[=A0=A0 68.520000] UBIFS error (pid 2418): ubifs_read_node: expected=
 node type 9=0A[=A0=A0 68.520000] UBIFS error (pid 2418): dbg_check_idx_siz=
e: error -117 while walking the index=0A[=A0=A0 68.530000] UBIFS DBG (pid 2=
421): ubifs_bg_thread: background thread "ubifs_bgt0_0" stops=0A[SKOV]\$=0A=
=A0=0AI hope this will enable you to device a solution, if one exists.=0A=
=0ASincerely,=0AKarsten Jeppesen=0A=0A=0A=0A=0A=A0=A0=A0=A0=A0 =0A=0AI hope=
 this will enable you =0A

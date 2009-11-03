Received: from ey-out-1920.google.com ([74.125.78.150])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N5LOm-00051u-NR
	for linux-mtd@lists.infradead.org; Tue, 03 Nov 2009 15:34:21 +0000
Received: by ey-out-1920.google.com with SMTP id 5so1107482eyb.26
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 Nov 2009 07:34:17 -0800 (PST)
MIME-Version: 1.0
From: Ricardo <ricardo.ribalda@gmail.com>
Date: Tue, 3 Nov 2009 16:32:38 +0100
Message-ID: <aa76a2be0911030732n74406409v62ae64244ef358a6@mail.gmail.com>
Subject: Corrupted ubifs after reboot (from the debugger)
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

   I am using ubifs on a custom board with a Spansion 128 MB NOR
flash. I am using the last kernel sources and the patch from Eric
Holmberg to reduce the MaxBufWriteSize to 8 (
http://lists.infradead.org/pipermail/linux-mtd/2009-May/025657.html ).

   After rebooting the board with the debug cable I could not bring
back the rfs again. Attach you will find the log from the kernel.

   This is the first corruption in months of normal use, after
applying the MaxBufWriteSize patch.  Any idea about how can I do to
solve this problem? Do you need more info from the flash?


            Best regards and thanks


[ 2448.758755] Number of erase regions: 1
[ 2448.761316] Warning:  Overriding MaxBufWriteSize from 2^6to 2^3
[ 2448.767116] Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
[ 2448.773338] Primary Algorithm Table at 0040
[ 2448.777470] Alternative Vendor Command Set: 0000 (None)
[ 2448.782656] No Alternate Algorithm Table
[ 2448.786541] Vcc Minimum:  2.7 V
[ 2448.789647] Vcc Maximum:  3.6 V
[ 2448.792756] No Vpp line
[ 2448.795167] Typical byte/word write timeout: 64 =B5s
[ 2448.800027] Maximum byte/word write timeout: 512 =B5s
[ 2448.804948] Typical full buffer write timeout: 64 =B5s
[ 2448.809959] Maximum full buffer write timeout: 2048 =B5s
[ 2448.815144] Typical block erase timeout: 512 ms
[ 2448.819640] Maximum block erase timeout: 4096 ms
[ 2448.824212] Typical chip erase timeout: 524288 ms
[ 2448.828879] Maximum chip erase timeout: 2097152 ms
[ 2448.833633] Device size: 0x8000000 bytes (128 MiB)
[ 2448.838383] Flash Device Interface description: 0x0002
[ 2448.843482]   - supports x8 and x16 via BYTE# with asynchronous interfac=
e
[ 2448.850234] Max. bytes in buffer write: 0x8
[ 2448.854365] Number of Erase Block Regions: 1
[ 2448.858602]   Erase Region #0: BlockSize 0x20000 bytes, 1024 blocks
[ 2448.864837] f0000000.flash: Found 1 x16 devices at 0x0 in 16-bit bank
[ 2448.871243]  Amd/Fujitsu Extended Query Table at 0x0040
[ 2448.876421] f0000000.flash: CFI does not contain boot bank
location. Assuming top.
[ 2448.883945] number of CFI chips: 1
[ 2448.887275] cfi_cmdset_0002: Disabling erase-suspend-program due to
code brokenness.
[ 2448.895331] cmdlinepart partition parsing not available
[ 2448.900476] RedBoot partition parsing not available
[ 2448.905115] Creating 8 MTD partitions on "f0000000.flash":
[ 2448.910460] 0x000000000000-0x000000800000 : "FallBack Bitstream"
[ 2448.917314] 0x000000800000-0x000001000000 : "Default Bitstream"
[ 2448.923254] 0x000001000000-0x000001800000 : "Alt1 Bitstream"
[ 2448.928914] 0x000001800000-0x000002000000 : "Alt2 Bitstream"
[ 2448.934518] 0x000002000000-0x000007f40000 : "UBI Partition"
[ 2448.940121] 0x000007f40000-0x000007f60000 : "Das U-Boot Environment"
[ 2448.946406] 0x000007f60000-0x000008000000 : "Das U-Boot"
[ 2448.951867] 0x000000000000-0x000008000000 : "Full FLASH"
[ 2448.958058] UBI: attaching mtd4 to ubi0
[ 2448.960715] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[ 2448.966839] UBI: logical eraseblock size:    130944 bytes
[ 2448.972203] UBI: smallest flash I/O unit:    1
[ 2448.976599] UBI: VID header offset:          64 (aligned 64)
[ 2448.982217] UBI: data offset:                128
[ 2449.010914] UBI: attached mtd4 to ubi0
[ 2449.013449] UBI: MTD device name:            "UBI Partition"
[ 2449.019050] UBI: MTD device size:            95 MiB
[ 2449.023853] UBI: number of good PEBs:        762
[ 2449.028421] UBI: number of bad PEBs:         0
[ 2449.032826] UBI: max. allowed volumes:       128
[ 2449.037406] UBI: wear-leveling threshold:    4096
[ 2449.042071] UBI: number of internal volumes: 1
[ 2449.046476] UBI: number of user volumes:     1
[ 2449.050883] UBI: available PEBs:             0
[ 2449.055290] UBI: total number of reserved PEBs: 762
[ 2449.060135] UBI: number of PEBs reserved for bad PEB handling: 0
[ 2449.066096] UBI: max/mean erase counter: 3/1
[ 2449.070321] UBI: image sequence number: 0
[ 2449.074544] irq: irq 20 on host
/plb@0/interrupt-controller@87000000 mapped to virtual irq 23
[ 2449.082942] UBI: background thread "ubi_bgt0d" started, PID 285
[ 2449.089179] xilinx-xps-spi 89000000.xps-spi: at 0x89000000 mapped
to 0xD90A0000, irq=3D23
[ 2449.101582] irq: irq 19 on host
/plb@0/interrupt-controller@87000000 mapped to virtual irq 24
[ 2449.109468] xilinx-xps-spi 8a000000.xps-spi: at 0x8A000000 mapped
to 0xD90C0000, irq=3D24
[ 2449.121918] mice: PS/2 mouse device common for all mice
[ 2449.125922] i2c /dev entries driver
[ 2449.130396] Device Tree Probing 'i2c'
[ 2449.133097] irq: irq 18 on host
/plb@0/interrupt-controller@87000000 mapped to virtual irq 25
[ 2449.142423] xilinx_iic #0 at 0x84000000 mapped to 0xD90E0000, irq=3D25
[ 2449.147842] Device Tree Probing 'i2c'
[ 2449.151424] irq: irq 17 on host
/plb@0/interrupt-controller@87000000 mapped to virtual irq 26
[ 2449.160800] xilinx_iic #0 at 0x85000000 mapped to 0xD9100000, irq=3D26
[ 2449.166238] Device Tree Probing 'i2c'
[ 2449.169865] irq: irq 16 on host
/plb@0/interrupt-controller@87000000 mapped to virtual irq 27
[ 2449.179175] xilinx_iic #0 at 0x8E000000 mapped to 0xD9120000, irq=3D27
[ 2449.186865] TCP cubic registered
[ 2449.188905] NET: Registered protocol family 17
[ 2449.193820] RPC: Registered udp transport module.
[ 2449.197950] RPC: Registered tcp transport module.
[ 2449.207987] UBIFS DBG (pid 1): ubifs_start_scan: scan LEB 1:0
[ 2449.226578] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:0 (130944
bytes left)
[ 2449.232618] UBIFS DBG (pid 339): ubifs_bg_thread: background thread
"ubifs_bgt0_0" started, PID 339
[ 2449.241585] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.248034] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:512
(130432 bytes left)
[ 2449.255371] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.261842] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:1024
(129920 bytes left)
[ 2449.269265] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.275732] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:1536
(129408 bytes left)
[ 2449.283150] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.289636] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:2048
(128896 bytes left)
[ 2449.297064] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.303543] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:2560
(128384 bytes left)
[ 2449.310974] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.317458] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:3072
(127872 bytes left)
[ 2449.324885] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.331364] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:3584
(127360 bytes left)
[ 2449.338796] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.345278] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:4096
(126848 bytes left)
[ 2449.352705] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.359184] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:4608
(126336 bytes left)
[ 2449.366616] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.373100] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:5120
(125824 bytes left)
[ 2449.380528] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.387005] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:5632
(125312 bytes left)
[ 2449.394437] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.400921] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:6144
(124800 bytes left)
[ 2449.408348] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.414826] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:6656
(124288 bytes left)
[ 2449.422260] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.428742] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:7168
(123776 bytes left)
[ 2449.436169] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.442647] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:7680
(123264 bytes left)
[ 2449.450080] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.456563] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:8192
(122752 bytes left)
[ 2449.463990] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.470468] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:8704
(122240 bytes left)
[ 2449.477903] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.484383] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:9216
(121728 bytes left)
[ 2449.491813] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.498290] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:9728
(121216 bytes left)
[ 2449.505721] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.512204] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:10240
(120704 bytes left)
[ 2449.519726] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.526196] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:10752
(120192 bytes left)
[ 2449.533714] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.540196] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:11264
(119680 bytes left)
[ 2449.547713] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.554189] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:11776
(119168 bytes left)
[ 2449.561707] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.568191] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:12288
(118656 bytes left)
[ 2449.575705] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.582183] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:12800
(118144 bytes left)
[ 2449.589701] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.596183] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:13312
(117632 bytes left)
[ 2449.603699] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.610177] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:13824
(117120 bytes left)
[ 2449.617695] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.624185] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:14336
(116608 bytes left)
[ 2449.631694] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.638170] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:14848
(116096 bytes left)
[ 2449.645688] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.652171] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:15360
(115584 bytes left)
[ 2449.659686] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.666164] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:15872
(115072 bytes left)
[ 2449.673682] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.680165] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:16384
(114560 bytes left)
[ 2449.687680] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.694157] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:16896
(114048 bytes left)
[ 2449.701676] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.708158] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:17408
(113536 bytes left)
[ 2449.715674] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.722151] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:17920
(113024 bytes left)
[ 2449.729670] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.736152] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:18432
(112512 bytes left)
[ 2449.743667] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.750144] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:18944
(112000 bytes left)
[ 2449.757664] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.764146] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:19456
(111488 bytes left)
[ 2449.771661] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.778137] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:19968
(110976 bytes left)
[ 2449.785656] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.792140] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:20480
(110464 bytes left)
[ 2449.799654] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.806131] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:20992
(109952 bytes left)
[ 2449.813650] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.820132] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:21504
(109440 bytes left)
[ 2449.827648] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.834125] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:22016
(108928 bytes left)
[ 2449.841645] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.848128] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:22528
(108416 bytes left)
[ 2449.855642] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.862119] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:23040
(107904 bytes left)
[ 2449.869637] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.876121] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:23552
(107392 bytes left)
[ 2449.883635] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.890112] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:24064
(106880 bytes left)
[ 2449.897633] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.904114] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:24576
(106368 bytes left)
[ 2449.911629] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.918106] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:25088
(105856 bytes left)
[ 2449.925628] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.932108] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:25600
(105344 bytes left)
[ 2449.939623] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.946100] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:26112
(104832 bytes left)
[ 2449.953620] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.960101] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:26624
(104320 bytes left)
[ 2449.967611] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.974098] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:27136
(103808 bytes left)
[ 2449.981612] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2449.988096] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:27648
(103296 bytes left)
[ 2449.995605] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.002091] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:28160
(102784 bytes left)
[ 2450.009606] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.016088] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:28672
(102272 bytes left)
[ 2450.023598] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.030086] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:29184
(101760 bytes left)
[ 2450.037601] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.044083] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:29696
(101248 bytes left)
[ 2450.051591] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.058079] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:30208
(100736 bytes left)
[ 2450.065593] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.072075] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:30720
(100224 bytes left)
[ 2450.079584] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.086072] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:31232
(99712 bytes left)
[ 2450.093499] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.099983] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:31744
(99200 bytes left)
[ 2450.107404] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.113892] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:32256
(98688 bytes left)
[ 2450.121321] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.127803] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:32768
(98176 bytes left)
[ 2450.135230] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.141714] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:33280
(97664 bytes left)
[ 2450.149143] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.155625] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:33792
(97152 bytes left)
[ 2450.163047] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.169534] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:34304
(96640 bytes left)
[ 2450.176962] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.183440] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:34816
(96128 bytes left)
[ 2450.190872] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.197355] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:35328
(95616 bytes left)
[ 2450.204782] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.211261] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:35840
(95104 bytes left)
[ 2450.218692] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.225175] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:36352
(94592 bytes left)
[ 2450.232604] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.239081] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:36864
(94080 bytes left)
[ 2450.246515] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.252997] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:37376
(93568 bytes left)
[ 2450.260425] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.266903] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:37888
(93056 bytes left)
[ 2450.274338] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.280818] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:38400
(92544 bytes left)
[ 2450.288246] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.294724] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:38912
(92032 bytes left)
[ 2450.302156] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.308638] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:39424
(91520 bytes left)
[ 2450.316066] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.322544] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:39936
(91008 bytes left)
[ 2450.329978] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.336460] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:40448
(90496 bytes left)
[ 2450.343889] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.350365] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:40960
(89984 bytes left)
[ 2450.357799] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.364281] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:41472
(89472 bytes left)
[ 2450.371709] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.378187] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:41984
(88960 bytes left)
[ 2450.385620] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.392103] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:42496
(88448 bytes left)
[ 2450.399526] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.406012] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:43008
(87936 bytes left)
[ 2450.413440] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.419922] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:43520
(87424 bytes left)
[ 2450.427345] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.433832] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:44032
(86912 bytes left)
[ 2450.441259] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.447743] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:44544
(86400 bytes left)
[ 2450.455165] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.461658] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:45056
(85888 bytes left)
[ 2450.469081] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.475559] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:45568
(85376 bytes left)
[ 2450.482992] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.489474] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:46080
(84864 bytes left)
[ 2450.496902] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.503379] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:46592
(84352 bytes left)
[ 2450.510812] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.517294] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:47104
(83840 bytes left)
[ 2450.524722] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.531201] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:47616
(83328 bytes left)
[ 2450.538633] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.545115] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:48128
(82816 bytes left)
[ 2450.552543] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.559021] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:48640
(82304 bytes left)
[ 2450.566453] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.572936] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:49152
(81792 bytes left)
[ 2450.580364] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.586841] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:49664
(81280 bytes left)
[ 2450.594274] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.600756] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:50176
(80768 bytes left)
[ 2450.608184] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.614663] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:50688
(80256 bytes left)
[ 2450.622095] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.628578] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:51200
(79744 bytes left)
[ 2450.636006] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.642484] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:51712
(79232 bytes left)
[ 2450.649915] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.656400] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:52224
(78720 bytes left)
[ 2450.663829] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.670303] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:52736
(78208 bytes left)
[ 2450.677736] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.684220] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:53248
(77696 bytes left)
[ 2450.691648] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.698126] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:53760
(77184 bytes left)
[ 2450.705558] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.712040] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:54272
(76672 bytes left)
[ 2450.719463] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.725951] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:54784
(76160 bytes left)
[ 2450.733380] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.739861] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:55296
(75648 bytes left)
[ 2450.747284] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.753772] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:55808
(75136 bytes left)
[ 2450.761200] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.767682] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:56320
(74624 bytes left)
[ 2450.775106] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.781592] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:56832
(74112 bytes left)
[ 2450.789021] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.795499] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:57344
(73600 bytes left)
[ 2450.802932] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.809413] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:57856
(73088 bytes left)
[ 2450.816842] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.823319] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:58368
(72576 bytes left)
[ 2450.830751] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.837234] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:58880
(72064 bytes left)
[ 2450.844661] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.851140] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:59392
(71552 bytes left)
[ 2450.858573] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.865055] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:59904
(71040 bytes left)
[ 2450.872483] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.878961] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:60416
(70528 bytes left)
[ 2450.886393] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.892875] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:60928
(70016 bytes left)
[ 2450.900303] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.906782] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:61440
(69504 bytes left)
[ 2450.914214] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.920696] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:61952
(68992 bytes left)
[ 2450.928124] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.934602] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:62464
(68480 bytes left)
[ 2450.942034] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.948527] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:62976
(67968 bytes left)
[ 2450.956080] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.962473] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:63488
(67456 bytes left)
[ 2450.969868] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.976339] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:64000
(66944 bytes left)
[ 2450.983766] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2450.990242] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:64512
(66432 bytes left)
[ 2450.997675] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.004158] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:65024
(65920 bytes left)
[ 2451.011583] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.018068] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:65536
(65408 bytes left)
[ 2451.025496] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.031979] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:66048
(64896 bytes left)
[ 2451.039403] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.045888] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:66560
(64384 bytes left)
[ 2451.053317] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.059798] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:67072
(63872 bytes left)
[ 2451.067222] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.073710] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:67584
(63360 bytes left)
[ 2451.081138] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.087616] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:68096
(62848 bytes left)
[ 2451.095048] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.101530] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:68608
(62336 bytes left)
[ 2451.108959] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.115435] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:69120
(61824 bytes left)
[ 2451.122869] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.129351] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:69632
(61312 bytes left)
[ 2451.136780] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.143256] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:70144
(60800 bytes left)
[ 2451.150689] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.157172] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:70656
(60288 bytes left)
[ 2451.164600] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.171078] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:71168
(59776 bytes left)
[ 2451.178511] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.184993] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:71680
(59264 bytes left)
[ 2451.192421] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.198898] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:72192
(58752 bytes left)
[ 2451.206330] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.212813] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:72704
(58240 bytes left)
[ 2451.220241] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.226719] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:73216
(57728 bytes left)
[ 2451.234152] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.240635] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:73728
(57216 bytes left)
[ 2451.248061] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.254539] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:74240
(56704 bytes left)
[ 2451.261972] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.268455] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:74752
(56192 bytes left)
[ 2451.275883] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.282361] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:75264
(55680 bytes left)
[ 2451.289793] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.296283] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:75776
(55168 bytes left)
[ 2451.303705] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.310181] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:76288
(54656 bytes left)
[ 2451.317614] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.324096] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:76800
(54144 bytes left)
[ 2451.331520] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.338007] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:77312
(53632 bytes left)
[ 2451.345434] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.351917] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:77824
(53120 bytes left)
[ 2451.359344] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.365828] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:78336
(52608 bytes left)
[ 2451.373256] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.379739] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:78848
(52096 bytes left)
[ 2451.387163] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.393650] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:79360
(51584 bytes left)
[ 2451.401079] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.407556] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:79872
(51072 bytes left)
[ 2451.414988] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.421470] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:80384
(50560 bytes left)
[ 2451.428897] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.435375] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:80896
(50048 bytes left)
[ 2451.442808] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.449290] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:81408
(49536 bytes left)
[ 2451.456719] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.463196] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:81920
(49024 bytes left)
[ 2451.470629] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.477111] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:82432
(48512 bytes left)
[ 2451.484539] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.491017] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:82944
(48000 bytes left)
[ 2451.498450] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.504932] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:83456
(47488 bytes left)
[ 2451.512359] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.518837] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:83968
(46976 bytes left)
[ 2451.526270] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.532752] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:84480
(46464 bytes left)
[ 2451.540181] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.546658] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:84992
(45952 bytes left)
[ 2451.554091] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.560574] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:85504
(45440 bytes left)
[ 2451.568001] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.574479] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:86016
(44928 bytes left)
[ 2451.581912] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.588395] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:86528
(44416 bytes left)
[ 2451.595822] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.602300] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:87040
(43904 bytes left)
[ 2451.609732] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.616216] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:87552
(43392 bytes left)
[ 2451.623642] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.630120] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:88064
(42880 bytes left)
[ 2451.637554] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.644036] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:88576
(42368 bytes left)
[ 2451.651460] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.657946] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:89088
(41856 bytes left)
[ 2451.665374] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.671856] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:89600
(41344 bytes left)
[ 2451.679279] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.685768] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:90112
(40832 bytes left)
[ 2451.693194] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.699677] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:90624
(40320 bytes left)
[ 2451.707101] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.713588] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:91136
(39808 bytes left)
[ 2451.721016] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.727494] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:91648
(39296 bytes left)
[ 2451.734926] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.741409] UBIFS DBG (pid 1): ubifs_scan: look at LEB 1:92160
(38784 bytes left)
[ 2451.748837] UBIFS DBG (pid 1): ubifs_scan_a_node: hit empty space
[ 2451.754873] UBIFS DBG (pid 1): ubifs_end_scan: stop scanning LEB 1
at offset 92160
[ 2451.762726] UBIFS DBG (pid 1): ubifs_start_scan: scan LEB 2:0
[ 2451.782118] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:0 (130944
bytes left)
[ 2451.788105] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.794550] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:512
(130432 bytes left)
[ 2451.801894] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.808369] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:1024
(129920 bytes left)
[ 2451.815797] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.822275] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:1536
(129408 bytes left)
[ 2451.829707] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.836191] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:2048
(128896 bytes left)
[ 2451.843613] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.850100] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:2560
(128384 bytes left)
[ 2451.857528] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.864010] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:3072
(127872 bytes left)
[ 2451.871434] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.877920] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:3584
(127360 bytes left)
[ 2451.885348] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.891831] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:4096
(126848 bytes left)
[ 2451.899254] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.905742] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:4608
(126336 bytes left)
[ 2451.913169] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.919652] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:5120
(125824 bytes left)
[ 2451.927075] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.933562] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:5632
(125312 bytes left)
[ 2451.940990] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.947469] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:6144
(124800 bytes left)
[ 2451.954900] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.961383] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:6656
(124288 bytes left)
[ 2451.968811] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.975290] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:7168
(123776 bytes left)
[ 2451.982721] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2451.989204] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:7680
(123264 bytes left)
[ 2451.996632] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.003110] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:8192
(122752 bytes left)
[ 2452.010542] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.017025] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:8704
(122240 bytes left)
[ 2452.024453] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.030931] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:9216
(121728 bytes left)
[ 2452.038363] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.044846] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:9728
(121216 bytes left)
[ 2452.052273] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.058751] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:10240
(120704 bytes left)
[ 2452.066270] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.072753] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:10752
(120192 bytes left)
[ 2452.080268] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.086745] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:11264
(119680 bytes left)
[ 2452.094264] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.100746] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:11776
(119168 bytes left)
[ 2452.108261] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.114739] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:12288
(118656 bytes left)
[ 2452.122258] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.128740] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:12800
(118144 bytes left)
[ 2452.136255] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.142732] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:13312
(117632 bytes left)
[ 2452.150253] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.156735] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:13824
(117120 bytes left)
[ 2452.164248] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.170726] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:14336
(116608 bytes left)
[ 2452.178247] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.184732] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:14848
(116096 bytes left)
[ 2452.192245] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.198724] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:15360
(115584 bytes left)
[ 2452.206243] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.212722] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:15872
(115072 bytes left)
[ 2452.220238] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.226714] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:16384
(114560 bytes left)
[ 2452.234235] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.240716] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:16896
(114048 bytes left)
[ 2452.248234] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.254707] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:17408
(113536 bytes left)
[ 2452.262228] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.268707] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:17920
(113024 bytes left)
[ 2452.276222] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.282700] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:18432
(112512 bytes left)
[ 2452.290219] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.296702] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:18944
(112000 bytes left)
[ 2452.304216] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.310694] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:19456
(111488 bytes left)
[ 2452.318212] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.324695] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:19968
(110976 bytes left)
[ 2452.332209] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.338687] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:20480
(110464 bytes left)
[ 2452.346206] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.352689] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:20992
(109952 bytes left)
[ 2452.360203] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.366681] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:21504
(109440 bytes left)
[ 2452.374200] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.380682] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:22016
(108928 bytes left)
[ 2452.388197] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.394675] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:22528
(108416 bytes left)
[ 2452.402193] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.408676] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:23040
(107904 bytes left)
[ 2452.416191] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.422668] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:23552
(107392 bytes left)
[ 2452.430187] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.436670] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:24064
(106880 bytes left)
[ 2452.444184] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.450662] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:24576
(106368 bytes left)
[ 2452.458181] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.464663] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:25088
(105856 bytes left)
[ 2452.472178] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.478656] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:25600
(105344 bytes left)
[ 2452.486174] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.492658] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:26112
(104832 bytes left)
[ 2452.500171] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.506651] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:26624
(104320 bytes left)
[ 2452.514168] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.520651] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:27136
(103808 bytes left)
[ 2452.528164] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.534642] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:27648
(103296 bytes left)
[ 2452.542161] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.548644] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:28160
(102784 bytes left)
[ 2452.556159] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.562637] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:28672
(102272 bytes left)
[ 2452.570157] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.576639] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:29184
(101760 bytes left)
[ 2452.584152] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.590630] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:29696
(101248 bytes left)
[ 2452.598150] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.604632] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:30208
(100736 bytes left)
[ 2452.612148] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.618625] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:30720
(100224 bytes left)
[ 2452.626144] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.632625] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:31232
(99712 bytes left)
[ 2452.640055] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.646531] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:31744
(99200 bytes left)
[ 2452.653965] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.660447] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:32256
(98688 bytes left)
[ 2452.667873] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.674352] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:32768
(98176 bytes left)
[ 2452.681786] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.688267] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:33280
(97664 bytes left)
[ 2452.695697] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.702173] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:33792
(97152 bytes left)
[ 2452.709606] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.716088] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:34304
(96640 bytes left)
[ 2452.723511] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.729999] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:34816
(96128 bytes left)
[ 2452.737426] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.743908] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:35328
(95616 bytes left)
[ 2452.751331] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.757818] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:35840
(95104 bytes left)
[ 2452.765246] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.771728] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:36352
(94592 bytes left)
[ 2452.779152] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.785639] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:36864
(94080 bytes left)
[ 2452.793067] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.799545] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:37376
(93568 bytes left)
[ 2452.806976] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.813459] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:37888
(93056 bytes left)
[ 2452.820887] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.827365] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:38400
(92544 bytes left)
[ 2452.834798] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.841281] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:38912
(92032 bytes left)
[ 2452.848710] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.855187] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:39424
(91520 bytes left)
[ 2452.862619] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.869102] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:39936
(91008 bytes left)
[ 2452.876529] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.883007] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:40448
(90496 bytes left)
[ 2452.890440] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.896923] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:40960
(89984 bytes left)
[ 2452.904350] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.910827] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:41472
(89472 bytes left)
[ 2452.918261] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.924744] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:41984
(88960 bytes left)
[ 2452.932171] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.938649] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:42496
(88448 bytes left)
[ 2452.946082] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.952582] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:43008
(87936 bytes left)
[ 2452.960199] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.966526] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:43520
(87424 bytes left)
[ 2452.973907] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.980387] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:44032
(86912 bytes left)
[ 2452.987812] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2452.994290] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:44544
(86400 bytes left)
[ 2453.001723] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.008212] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:45056
(85888 bytes left)
[ 2453.015633] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.022111] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:45568
(85376 bytes left)
[ 2453.029543] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.036026] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:46080
(84864 bytes left)
[ 2453.043449] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.049937] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:46592
(84352 bytes left)
[ 2453.057365] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.063847] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:47104
(83840 bytes left)
[ 2453.071270] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.077758] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:47616
(83328 bytes left)
[ 2453.085186] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.091668] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:48128
(82816 bytes left)
[ 2453.099090] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.105578] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:48640
(82304 bytes left)
[ 2453.113006] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.119484] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:49152
(81792 bytes left)
[ 2453.126916] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.133408] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:49664
(81280 bytes left)
[ 2453.140873] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.147319] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:50176
(80768 bytes left)
[ 2453.154741] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.161220] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:50688
(80256 bytes left)
[ 2453.168649] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.175126] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:51200
(79744 bytes left)
[ 2453.182560] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.189041] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:51712
(79232 bytes left)
[ 2453.196469] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.202947] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:52224
(78720 bytes left)
[ 2453.210379] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.216862] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:52736
(78208 bytes left)
[ 2453.224290] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.230767] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:53248
(77696 bytes left)
[ 2453.238200] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.244683] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:53760
(77184 bytes left)
[ 2453.252111] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.258588] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:54272
(76672 bytes left)
[ 2453.266020] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.272504] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:54784
(76160 bytes left)
[ 2453.279930] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.286408] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:55296
(75648 bytes left)
[ 2453.293841] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.300324] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:55808
(75136 bytes left)
[ 2453.307752] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.314230] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:56320
(74624 bytes left)
[ 2453.321662] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.328145] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:56832
(74112 bytes left)
[ 2453.335570] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.342056] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:57344
(73600 bytes left)
[ 2453.349485] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.355970] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:57856
(73088 bytes left)
[ 2453.363391] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.369880] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:58368
(72576 bytes left)
[ 2453.377305] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.383788] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:58880
(72064 bytes left)
[ 2453.391212] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.397698] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:59392
(71552 bytes left)
[ 2453.405125] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.411603] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:59904
(71040 bytes left)
[ 2453.419035] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.425518] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:60416
(70528 bytes left)
[ 2453.432944] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.439423] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:60928
(70016 bytes left)
[ 2453.446855] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.453337] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:61440
(69504 bytes left)
[ 2453.460766] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.467243] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:61952
(68992 bytes left)
[ 2453.474677] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.481159] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:62464
(68480 bytes left)
[ 2453.488587] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.495065] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:62976
(67968 bytes left)
[ 2453.502498] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.508982] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:63488
(67456 bytes left)
[ 2453.516407] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.522885] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:64000
(66944 bytes left)
[ 2453.530317] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.536801] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:64512
(66432 bytes left)
[ 2453.544228] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.550706] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:65024
(65920 bytes left)
[ 2453.558139] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.564622] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:65536
(65408 bytes left)
[ 2453.572049] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.578528] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:66048
(64896 bytes left)
[ 2453.585960] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.592442] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:66560
(64384 bytes left)
[ 2453.599870] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.606348] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:67072
(63872 bytes left)
[ 2453.613780] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.620263] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:67584
(63360 bytes left)
[ 2453.627691] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.634169] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:68096
(62848 bytes left)
[ 2453.641602] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.648084] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:68608
(62336 bytes left)
[ 2453.655506] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.661994] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:69120
(61824 bytes left)
[ 2453.669422] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.675905] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:69632
(61312 bytes left)
[ 2453.683329] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.689815] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:70144
(60800 bytes left)
[ 2453.697243] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.703725] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:70656
(60288 bytes left)
[ 2453.711149] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.717636] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:71168
(59776 bytes left)
[ 2453.725064] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.731542] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:71680
(59264 bytes left)
[ 2453.738974] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.745457] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:72192
(58752 bytes left)
[ 2453.752884] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.759363] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:72704
(58240 bytes left)
[ 2453.766798] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.773278] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:73216
(57728 bytes left)
[ 2453.780706] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.787183] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:73728
(57216 bytes left)
[ 2453.794619] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.801099] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:74240
(56704 bytes left)
[ 2453.808528] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.815005] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:74752
(56192 bytes left)
[ 2453.822438] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.828920] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:75264
(55680 bytes left)
[ 2453.836347] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.842831] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:75776
(55168 bytes left)
[ 2453.850261] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.856740] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:76288
(54656 bytes left)
[ 2453.864168] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.870645] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:76800
(54144 bytes left)
[ 2453.878078] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.884561] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:77312
(53632 bytes left)
[ 2453.891989] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.898466] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:77824
(53120 bytes left)
[ 2453.905899] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.912381] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:78336
(52608 bytes left)
[ 2453.919810] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.926287] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:78848
(52096 bytes left)
[ 2453.933720] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.940202] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:79360
(51584 bytes left)
[ 2453.947631] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.954109] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:79872
(51072 bytes left)
[ 2453.961540] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.968023] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:80384
(50560 bytes left)
[ 2453.975447] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.981933] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:80896
(50048 bytes left)
[ 2453.989361] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2453.995843] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:81408
(49536 bytes left)
[ 2454.003267] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.009754] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:81920
(49024 bytes left)
[ 2454.017182] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.023664] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:82432
(48512 bytes left)
[ 2454.031087] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.037575] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:82944
(48000 bytes left)
[ 2454.045003] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.051481] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:83456
(47488 bytes left)
[ 2454.058913] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.065396] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:83968
(46976 bytes left)
[ 2454.072824] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.079302] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:84480
(46464 bytes left)
[ 2454.086734] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.093216] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:84992
(45952 bytes left)
[ 2454.100644] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.107122] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:85504
(45440 bytes left)
[ 2454.114556] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.121038] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:86016
(44928 bytes left)
[ 2454.128465] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.134944] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:86528
(44416 bytes left)
[ 2454.142376] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.148860] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:87040
(43904 bytes left)
[ 2454.156287] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.162765] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:87552
(43392 bytes left)
[ 2454.170198] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.176680] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:88064
(42880 bytes left)
[ 2454.184108] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.190587] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:88576
(42368 bytes left)
[ 2454.198017] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.204501] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:89088
(41856 bytes left)
[ 2454.211929] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.218406] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:89600
(41344 bytes left)
[ 2454.225840] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.232322] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:90112
(40832 bytes left)
[ 2454.239751] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.246228] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:90624
(40320 bytes left)
[ 2454.253659] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.260142] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:91136
(39808 bytes left)
[ 2454.267565] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.274052] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:91648
(39296 bytes left)
[ 2454.281480] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning master node
[ 2454.287963] UBIFS DBG (pid 1): ubifs_scan: look at LEB 2:92160
(38784 bytes left)
[ 2454.295386] UBIFS DBG (pid 1): ubifs_scan_a_node: hit empty space
[ 2454.301430] UBIFS DBG (pid 1): ubifs_end_scan: stop scanning LEB 2
at offset 92160
[ 2454.309342] UBIFS: recovery needed
[ 2454.312349] UBIFS DBG (pid 1): ubifs_recover_inl_heads: checking
index head at 107:35088
[ 2454.320376] UBIFS DBG (pid 1): ubifs_recover_inl_heads: checking
LPT head at 7:57216
[ 2454.353239] UBIFS DBG (pid 1): ubifs_start_scan: scan LEB 3:0
[ 2454.371800] UBIFS DBG (pid 1): ubifs_scan: look at LEB 3:0 (130944
bytes left)
[ 2454.377767] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning commit start =
node
[ 2454.384738] UBIFS DBG (pid 1): ubifs_scan: look at LEB 3:32 (130912
bytes left)
[ 2454.391994] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning reference nod=
e
[ 2454.398726] UBIFS DBG (pid 1): ubifs_scan: look at LEB 3:96 (130848
bytes left)
[ 2454.405992] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning reference nod=
e
[ 2454.412728] UBIFS DBG (pid 1): ubifs_scan: look at LEB 3:160
(130784 bytes left)
[ 2454.420074] UBIFS DBG (pid 1): ubifs_scan_a_node: hit empty space
[ 2454.426109] UBIFS DBG (pid 1): ubifs_end_scan: stop scanning LEB 3
at offset 160
[ 2454.433486] UBIFS error (pid 1): ubifs_scan: corrupt empty space at
LEB 3:2600
[ 2454.440639] UBIFS error (pid 1): ubifs_scanned_corruption:
corruption at LEB 3:2600
[ 2454.448244] UBIFS error (pid 1): ubifs_scanned_corruption: first
8192 bytes from LEB 3:2600
[ 2454.456559] 00000000: 31181006 536ceb69 84210000 00000000 a0000000
00010000 24040000 00000000  1...Sl.i.!..............$.......
[ 2454.467973] 00000020: 00000000 00000000 46190000 00000000 00000000
00000000 e33b564a 00000000  ........F................;VJ....
[ 2454.479372] 00000040: 795a564a 00000000 795a564a 00000000 00000000
00000000 00000000 01000000  yZVJ....yZVJ....................
[ 2454.490782] 00000060: 00000000 00000000 a4810000 01000000 00000000
00000000 00000000 00000000  ................................
[ 2454.502188] 00000080: 00000000 02000000 00000000 00000000 00000000
00000000 00000000 00000000  ................................
[ 2454.513592] 000000a0: 31181006 13300920 85210000 00000000 38000000
04020000 24040000 00000000  1....0. .!......8.......$.......
[ 2454.524996] 000000c0: 00000000 00000000 bd000000 00000000 00000000
00000000 ffffffff ffffffff  ................................
[ 2454.536402] 000000e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.547807] 00000100: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.559207] 00000120: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.570618] 00000140: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.582021] 00000160: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.593426] 00000180: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.604832] 000001a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.616237] 000001c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.627642] 000001e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.639041] 00000200: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.650451] 00000220: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.661856] 00000240: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.673260] 00000260: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.684665] 00000280: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.696070] 000002a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.707471] 000002c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.718880] 000002e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.730285] 00000300: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.741689] 00000320: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.753094] 00000340: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.764499] 00000360: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.775904] 00000380: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.787303] 000003a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.798712] 000003c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.810117] 000003e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.821523] 00000400: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.832928] 00000420: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.844331] 00000440: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.855737] 00000460: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.867137] 00000480: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.878547] 000004a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.889952] 000004c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.901356] 000004e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.912761] 00000500: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.924166] 00000520: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.935566] 00000540: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.946975] 00000560: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.958397] 00000580: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.969800] 000005a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.981200] 000005c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2454.992603] 000005e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.004008] 00000600: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.015408] 00000620: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.026817] 00000640: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.038222] 00000660: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.049628] 00000680: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.061032] 000006a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.072437] 000006c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.083841] 000006e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.095242] 00000700: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.106651] 00000720: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.118056] 00000740: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.129460] 00000760: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.140868] 00000780: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.152275] 000007a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.163675] 000007c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.175075] 000007e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.186484] 00000800: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.197890] 00000820: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.209295] 00000840: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.220699] 00000860: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.232104] 00000880: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.243503] 000008a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.254914] 000008c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.266317] 000008e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.277725] 00000900: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.289128] 00000920: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.300532] 00000940: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.311937] 00000960: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.323337] 00000980: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.334747] 000009a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.346153] 000009c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.357557] 000009e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.368963] 00000a00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.380366] 00000a20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.391771] 00000a40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.403171] 00000a60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.414581] 00000a80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.425985] 00000aa0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.437392] 00000ac0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.448796] 00000ae0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.460200] 00000b00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.471601] 00000b20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.483011] 00000b40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.494415] 00000b60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.505820] 00000b80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.517224] 00000ba0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.528630] 00000bc0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.540033] 00000be0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.551433] 00000c00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.562843] 00000c20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.574249] 00000c40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.585654] 00000c60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.597058] 00000c80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.608463] 00000ca0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.619868] 00000cc0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.631267] 00000ce0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.642677] 00000d00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.654082] 00000d20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.665486] 00000d40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.676892] 00000d60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.688296] 00000d80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.699701] 00000da0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.711100] 00000dc0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.722510] 00000de0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.733916] 00000e00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.745320] 00000e20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.756725] 00000e40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.768129] 00000e60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.779529] 00000e80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.790939] 00000ea0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.802344] 00000ec0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.813749] 00000ee0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.825154] 00000f00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.836557] 00000f20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.847964] 00000f40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.859362] 00000f60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.870773] 00000f80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.882178] 00000fa0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.893582] 00000fc0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.904987] 00000fe0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.916392] 00001000: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.927796] 00001020: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.939197] 00001040: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.950611] 00001060: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.962013] 00001080: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.973418] 000010a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.984820] 000010c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2455.996225] 000010e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.007631] 00001100: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.019030] 00001120: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.030439] 00001140: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.041844] 00001160: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.053249] 00001180: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.064653] 000011a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.076058] 000011c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.087458] 000011e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.098868] 00001200: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.110273] 00001220: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.121678] 00001240: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.133083] 00001260: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.144488] 00001280: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.155892] 000012a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.167292] 000012c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.178702] 000012e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.190108] 00001300: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.201511] 00001320: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.212917] 00001340: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.224322] 00001360: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.235727] 00001380: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.247125] 000013a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.258536] 000013c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.269941] 000013e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.281345] 00001400: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.292750] 00001420: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.304154] 00001440: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.315554] 00001460: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.326965] 00001480: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.338369] 000014a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.349775] 000014c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.361178] 000014e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.372584] 00001500: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.383988] 00001520: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.395388] 00001540: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.406798] 00001560: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.418203] 00001580: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.429607] 000015a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.441013] 000015c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.452417] 000015e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.463823] 00001600: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.475222] 00001620: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.486631] 00001640: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.498037] 00001660: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.509442] 00001680: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.520846] 000016a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.532252] 000016c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.543657] 000016e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.555056] 00001700: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.566466] 00001720: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.577871] 00001740: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.589275] 00001760: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.600681] 00001780: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.612085] 000017a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.623485] 000017c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.634894] 000017e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.646300] 00001800: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.657704] 00001820: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.669109] 00001840: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.680513] 00001860: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.691919] 00001880: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.703317] 000018a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.714728] 000018c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.726132] 000018e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.737538] 00001900: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.748941] 00001920: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.760347] 00001940: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.771752] 00001960: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.783153] 00001980: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.794562] 000019a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.805966] 000019c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.817372] 000019e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.828775] 00001a00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.840180] 00001a20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.851580] 00001a40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.862990] 00001a60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.874395] 00001a80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.885800] 00001aa0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.897204] 00001ac0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.908610] 00001ae0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.920015] 00001b00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.931414] 00001b20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.942824] 00001b40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.954229] 00001b60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.965633] 00001b80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.977040] 00001ba0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.988444] 00001bc0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2456.999848] 00001be0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.011247] 00001c00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.022659] 00001c20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.034063] 00001c40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.045467] 00001c60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.056872] 00001c80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.068279] 00001ca0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.079682] 00001cc0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.091082] 00001ce0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.102492] 00001d00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.113896] 00001d20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.125303] 00001d40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.136707] 00001d60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.148111] 00001d80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.159510] 00001da0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.170921] 00001dc0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.182325] 00001de0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.193730] 00001e00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.205136] 00001e20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.216540] 00001e40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.227944] 00001e60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.239344] 00001e80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.250753] 00001ea0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.262159] 00001ec0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.273564] 00001ee0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.284968] 00001f00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.296373] 00001f20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.307777] 00001f40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.319178] 00001f60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.330587] 00001f80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.341992] 00001fa0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.353397] 00001fc0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.364801] 00001fe0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.376193] UBIFS error (pid 1): ubifs_scan: LEB 3 scanning failed
[ 2457.382293] UBIFS DBG (pid 1): ubifs_recover_log_leb: LEB 3
[ 2457.387826] UBIFS DBG (pid 1): ubifs_start_scan: scan LEB 4:0
[ 2457.394091] UBIFS DBG (pid 1): ubifs_scan: look at LEB 4:0 (130944
bytes left)
[ 2457.400961] UBIFS DBG (pid 1): ubifs_scan_a_node: hit empty space
[ 2457.406768] UBIFS DBG (pid 1): ubifs_end_scan: stop scanning LEB 4
at offset 0
[ 2457.414789] UBIFS DBG (pid 1): ubifs_recover_leb: 3:0
[ 2457.418940] UBIFS DBG (pid 1): ubifs_start_scan: scan LEB 3:0
[ 2457.438607] UBIFS DBG (pid 1): ubifs_recover_leb: look at LEB 3:0
(130944 bytes left)
[ 2457.445210] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning commit start =
node
[ 2457.452159] UBIFS DBG (pid 1): ubifs_recover_leb: look at LEB 3:32
(130912 bytes left)
[ 2457.460020] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning reference nod=
e
[ 2457.466747] UBIFS DBG (pid 1): ubifs_recover_leb: look at LEB 3:96
(130848 bytes left)
[ 2457.474618] UBIFS DBG (pid 1): ubifs_scan_a_node: scanning reference nod=
e
[ 2457.481351] UBIFS DBG (pid 1): ubifs_recover_leb: look at LEB 3:160
(130784 bytes left)
[ 2457.489306] UBIFS DBG (pid 1): ubifs_scan_a_node: hit empty space
[ 2457.495505] UBIFS error (pid 1): ubifs_recover_leb: corrupt empty
space LEB 3:160, corruption starts at 2440
[ 2457.505129] UBIFS error (pid 1): ubifs_scanned_corruption:
corruption at LEB 3:2440
[ 2457.512722] UBIFS error (pid 1): ubifs_scanned_corruption: first
8192 bytes from LEB 3:2440
[ 2457.521039] 00000000: 31181006 536ceb69 84210000 00000000 a0000000
00010000 24040000 00000000  1...Sl.i.!..............$.......
[ 2457.532456] 00000020: 00000000 00000000 46190000 00000000 00000000
00000000 e33b564a 00000000  ........F................;VJ....
[ 2457.543856] 00000040: 795a564a 00000000 795a564a 00000000 00000000
00000000 00000000 01000000  yZVJ....yZVJ....................
[ 2457.555256] 00000060: 00000000 00000000 a4810000 01000000 00000000
00000000 00000000 00000000  ................................
[ 2457.566664] 00000080: 00000000 02000000 00000000 00000000 00000000
00000000 00000000 00000000  ................................
[ 2457.578072] 000000a0: 31181006 13300920 85210000 00000000 38000000
04020000 24040000 00000000  1....0. .!......8.......$.......
[ 2457.589475] 000000c0: 00000000 00000000 bd000000 00000000 00000000
00000000 ffffffff ffffffff  ................................
[ 2457.600881] 000000e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.612286] 00000100: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.623690] 00000120: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.635090] 00000140: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.646500] 00000160: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.657905] 00000180: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.669310] 000001a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.680715] 000001c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.692119] 000001e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.703520] 00000200: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.714929] 00000220: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.726334] 00000240: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.737739] 00000260: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.749144] 00000280: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.760548] 000002a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.771953] 000002c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.783353] 000002e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.794762] 00000300: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.806168] 00000320: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.817572] 00000340: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.828977] 00000360: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.840381] 00000380: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.851786] 000003a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.863186] 000003c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.874596] 000003e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.886002] 00000400: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.897407] 00000420: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.908810] 00000440: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.920215] 00000460: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.931616] 00000480: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.943025] 000004a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.954430] 000004c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.965835] 000004e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.977240] 00000500: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2457.988645] 00000520: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.000048] 00000540: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.011449] 00000560: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.022858] 00000580: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.034263] 000005a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.045668] 000005c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.057073] 000005e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.068479] 00000600: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.079882] 00000620: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.091283] 00000640: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.102692] 00000660: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.114097] 00000680: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.125502] 000006a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.136909] 000006c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.148324] 000006e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.159728] 00000700: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.171128] 00000720: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.182535] 00000740: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.193939] 00000760: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.205345] 00000780: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.216749] 000007a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.228154] 000007c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.239553] 000007e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.250963] 00000800: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.262368] 00000820: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.273772] 00000840: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.285178] 00000860: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.296582] 00000880: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.307988] 000008a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.319386] 000008c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.330797] 000008e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.342202] 00000900: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.353607] 00000920: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.365011] 00000940: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.376417] 00000960: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.387821] 00000980: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.399221] 000009a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.410631] 000009c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.422035] 000009e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.433441] 00000a00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.444845] 00000a20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.456250] 00000a40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.467655] 00000a60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.479054] 00000a80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.490464] 00000aa0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.501869] 00000ac0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.513273] 00000ae0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.524678] 00000b00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.536083] 00000b20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.547483] 00000b40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.558893] 00000b60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.570299] 00000b80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.581703] 00000ba0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.593107] 00000bc0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.604512] 00000be0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.615919] 00000c00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.627317] 00000c20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.638726] 00000c40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.650133] 00000c60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.661537] 00000c80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.672942] 00000ca0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.684346] 00000cc0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.695751] 00000ce0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.707151] 00000d00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.718561] 00000d20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.729966] 00000d40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.741370] 00000d60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.752775] 00000d80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.764180] 00000da0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.775580] 00000dc0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.786988] 00000de0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.798394] 00000e00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.809798] 00000e20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.821204] 00000e40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.832609] 00000e60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.844013] 00000e80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.855412] 00000ea0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.866823] 00000ec0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.878227] 00000ee0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.889632] 00000f00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.901036] 00000f20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.912442] 00000f40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.923846] 00000f60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.935246] 00000f80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.946656] 00000fa0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.958060] 00000fc0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.969465] 00000fe0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.980871] 00001000: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2458.992275] 00001020: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.003680] 00001040: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.015080] 00001060: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.026489] 00001080: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.037895] 000010a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.049299] 000010c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.060705] 000010e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.072109] 00001100: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.083509] 00001120: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.094919] 00001140: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.106323] 00001160: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.117728] 00001180: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.129133] 000011a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.140538] 000011c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.151942] 000011e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.163342] 00001200: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.174752] 00001220: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.186157] 00001240: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.197562] 00001260: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.208966] 00001280: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.220371] 000012a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.231776] 000012c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.243175] 000012e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.254586] 00001300: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.265990] 00001320: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.277395] 00001340: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.288800] 00001360: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.300205] 00001380: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.311605] 000013a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.323015] 000013c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.334419] 000013e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.345824] 00001400: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.357228] 00001420: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.368635] 00001440: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.380039] 00001460: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.391438] 00001480: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.402848] 000014a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.414253] 000014c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.425658] 000014e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.437062] 00001500: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.448468] 00001520: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.459872] 00001540: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.471267] 00001560: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.482682] 00001580: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.494086] 000015a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.505492] 000015c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.516896] 000015e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.528301] 00001600: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.539705] 00001620: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.551105] 00001640: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.562516] 00001660: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.573920] 00001680: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.585325] 000016a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.596729] 000016c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.608134] 000016e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.619535] 00001700: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.630944] 00001720: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.642349] 00001740: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.653753] 00001760: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.665158] 00001780: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.676564] 000017a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.687967] 000017c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.699368] 000017e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.710777] 00001800: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.722182] 00001820: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.733587] 00001840: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.744992] 00001860: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.756397] 00001880: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.767801] 000018a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.779201] 000018c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.790611] 000018e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.802016] 00001900: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.813420] 00001920: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.824825] 00001940: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.836230] 00001960: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.847637] 00001980: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.859035] 000019a0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.870445] 000019c0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.881850] 000019e0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.893253] 00001a00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.904658] 00001a20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.916063] 00001a40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.927463] 00001a60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.938874] 00001a80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.950286] 00001aa0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.961686] 00001ac0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.973089] 00001ae0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.984493] 00001b00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2459.995897] 00001b20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.007298] 00001b40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.018708] 00001b60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.030113] 00001b80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.041517] 00001ba0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.052922] 00001bc0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.064327] 00001be0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.075731] 00001c00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.087132] 00001c20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.098541] 00001c40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.109947] 00001c60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.121351] 00001c80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.132756] 00001ca0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.144162] 00001cc0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.155559] 00001ce0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.166970] 00001d00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.178374] 00001d20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.189780] 00001d40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.201185] 00001d60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.212589] 00001d80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.223995] 00001da0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.235395] 00001dc0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.246803] 00001de0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.258208] 00001e00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.269614] 00001e20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.281020] 00001e40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.292424] 00001e60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.303827] 00001e80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.315227] 00001ea0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.326639] 00001ec0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.338043] 00001ee0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.349448] 00001f00: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.360852] 00001f20: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.372257] 00001f40: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.383661] 00001f60: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.395060] 00001f80: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.406470] 00001fa0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.417876] 00001fc0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.429281] 00001fe0: ffffffff ffffffff ffffffff ffffffff ffffffff
ffffffff ffffffff ffffffff  ................................
[ 2460.440672] UBIFS error (pid 1): ubifs_recover_leb: LEB 3 scanning faile=
d
[ 2460.449124] UBIFS DBG (pid 339): ubifs_bg_thread: background thread
"ubifs_bgt0_0" stops
[ 2460.456559] VFS: Cannot open root device "ubi0_0" or unknown-block(1,0)
[ 2460.462551] Please append a correct "root=3D" boot option; here are
the available partitions:
[ 2460.470823] Kernel panic - not syncing: VFS: Unable to mount root
fs on unknown-block(1,0)
[ 2460.479004] Call Trace:
[ 2460.481421] [ce831ed0] [c0005dbc] show_stack+0x4c/0x16c (unreliable)
[ 2460.487716] [ce831f10] [c002f698] panic+0xa0/0x168
[ 2460.492454] [ce831f60] [c034bd38] mount_block_root+0x12c/0x244
[ 2460.498236] [ce831fb0] [c034bfc8] prepare_namespace+0x68/0x208
[ 2460.504024] [ce831fd0] [c034b220] kernel_init+0x104/0x130
[ 2460.509385] [ce831ff0] [c000daf8] kernel_thread+0x4c/0x68
[ 2460.514732] Rebooting in 180 seconds..




--=20
Ricardo Ribalda
http://www.eps.uam.es/~rribalda/

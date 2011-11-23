Received: from nm35.bullet.mail.ne1.yahoo.com ([98.138.229.28])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RTCGu-0004fN-Tc
 for linux-mtd@lists.infradead.org; Wed, 23 Nov 2011 12:49:53 +0000
Message-ID: <1322052589.58154.YahooMailNeo@web121503.mail.ne1.yahoo.com>
Date: Wed, 23 Nov 2011 04:49:49 -0800 (PST)
From: Karsten Jeppesen <arm9263@yahoo.com>
Subject: Corrupted UBIFS, bad CRC
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

Hi Artem,=0A=0AFirst: I love the UBIFS. It performs really really well.=0A=
=0AAmongst many well functioning targets (ARM 9263 based) this sucker had t=
he nerves to act up:=0A=0A=0A=0AUncompressing Linux........... done, bootin=
g the kernel.=0A[=A0=A0=A0 1.570000] UBIFS error (pid 1): ubifs_check_node:=
 bad CRC: calculated 0x7d62d42c, read 0x1173c109=0A[=A0=A0=A0 1.580000] UBI=
FS error (pid 1): ubifs_check_node: bad node at LEB 84:50696=0A[=A0=A0=A0 1=
.580000] UBIFS error (pid 1): ubifs_read_node: expected node type 9=0A[=A0=
=A0=A0 1.590000] Kernel panic - not syncing: VFS: Unable to mount root fs o=
n unknown-block(0,0)=0A=0A=0A=0AI am running a kernel 2.6.32.8 with most pa=
tches applied. Especially the recovery.c patch and the mtd (8 byte write bu=
ffer patch) applied. The target that showed this error does not have these =
patches applied.=0A=0AEven so... I copied the FLASH content to a target wit=
h these patches and tried again in order to see if these patches would allo=
w the kernel to rectify the problem. No cigar.=0AOf course I ran with debug=
 enabled so here are the output (but even better I hope - here is the flash=
 image for download: http://download.gnist.skov.com/corrupt_ubifs.img )=0A=
=0A----=0A[=A0=A0=A0 1.570000] atmel_usart.3: ttyS3 at MMIO 0xfff94000 (irq=
 =3D 9) is a ATMEL_SERIAL=0A[=A0=A0=A0 1.630000] brd: module loaded=0A[=A0=
=A0=A0 1.660000] loop: module loaded=0A[=A0=A0=A0 1.670000] physmap platfor=
m flash device: 04000000 at 10000000=0A[=A0=A0=A0 1.680000] Number of erase=
 regions: 1=0A[=A0=A0=A0 1.680000] Warning:=A0 Overriding MaxBufWriteSize f=
rom 2^6 to 2^3=0A[=A0=A0=A0 1.690000] Primary Vendor Command Set: 0002 (AMD=
/Fujitsu Standard)=0A[=A0=A0=A0 1.690000] Primary Algorithm Table at 0040=
=0A[=A0=A0=A0 1.700000] Alternative Vendor Command Set: 0000 (None)=0A[=A0=
=A0=A0 1.700000] No Alternate Algorithm Table=0A[=A0=A0=A0 1.710000] Vcc Mi=
nimum:=A0 2.7 V=0A[=A0=A0=A0 1.710000] Vcc Maximum:=A0 3.6 V=0A[=A0=A0=A0 1=
.710000] No Vpp line=0A[=A0=A0=A0 1.720000] Typical byte/word write timeout=
: 64 =C2=C2=B5s=0A[=A0=A0=A0 1.720000] Maximum byte/word write timeout: 512=
 =C2=C2=B5s=0A[=A0=A0=A0 1.730000] Typical full buffer write timeout: 64 =
=C2=C2=B5s=0A[=A0=A0=A0 1.730000] Maximum full buffer write timeout: 2048 =
=C2=C2=B5s=0A[=A0=A0=A0 1.740000] Typical block erase timeout: 512 ms=0A[=
=A0=A0=A0 1.740000] Maximum block erase timeout: 4096 ms=0A[=A0=A0=A0 1.750=
000] Typical chip erase timeout: 131072 ms=0A[=A0=A0=A0 1.750000] Maximum c=
hip erase timeout: 524288 ms=0A[=A0=A0=A0 1.760000] Device size: 0x2000000 =
bytes (32 MiB)=0A[=A0=A0=A0 1.760000] Flash Device Interface description: 0=
x0002=0A[=A0=A0=A0 1.770000]=A0=A0 - supports x8 and x16 via BYTE# with asy=
nchronous interface=0A[=A0=A0=A0 1.770000] Max. bytes in buffer write: 0x8=
=0A[=A0=A0=A0 1.780000] Number of Erase Block Regions: 1=0A[=A0=A0=A0 1.780=
000]=A0=A0 Erase Region #0: BlockSize 0x20000 bytes, 256 blocks=0A[=A0=A0=
=A0 1.790000] physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank=0A=
[=A0=A0=A0 1.790000]=A0 Amd/Fujitsu Extended Query Table at 0x0040=0A[=A0=
=A0=A0 1.800000] physmap-flash.0: CFI does not contain boot bank location. =
Assuming top.=0A[=A0=A0=A0 1.810000] number of CFI chips: 1=0A[=A0=A0=A0 1.=
810000] cfi_cmdset_0002: Disabling erase-suspend-program due to code broken=
ness.=0A[=A0=A0=A0 1.820000] 5 cmdlinepart partitions found on MTD device p=
hysmap-flash.0=0A=0A----=0A# skovsetup mountflash=0A[=A0 165.940000] UBI: a=
ttaching mtd4 to ubi0=0A[=A0 165.950000] UBI: physical eraseblock size:=A0=
=A0 131072 bytes (128 KiB)=0A[=A0 165.950000] UBI: logical eraseblock size:=
=A0=A0=A0 130944 bytes=0A[=A0 165.960000] UBI: smallest flash I/O unit:=A0=
=A0=A0 1=0A[=A0 165.960000] UBI: VID header offset:=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 64 (aligned 64)=0A[=A0 165.970000] UBI: data offset:=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 128=0A[=A0 166.040000] UBI: attached mtd4 to ub=
i0=0A[=A0 166.060000] UBI: MTD device name:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 "User"=0A[=A0 166.060000] UBI: MTD device size:=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 28 MiB=0A[=A0 166.120000] UBI: number of good PEBs:=A0=A0=A0=A0=
=A0=A0=A0 230=0A[=A0 166.120000] UBI: number of bad PEBs:=A0=A0=A0=A0=A0=A0=
=A0=A0 0=0A[=A0 166.120000] UBI: max. allowed volumes:=A0=A0=A0=A0=A0=A0 12=
8=0A[=A0 166.150000] UBI: wear-leveling threshold:=A0=A0=A0 4096=0A[=A0 166=
.150000] UBI: number of internal volumes: 1=0A[=A0 166.150000] UBI: number =
of user volumes:=A0=A0=A0=A0 1=0A[=A0 166.170000] UBI: available PEBs:=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=0A[=A0 166.170000] UBI: total number of=
 reserved PEBs: 230=0A[=A0 166.190000] UBI: number of PEBs reserved for bad=
 PEB handling: 0=0A[=A0 166.230000] UBI: max/mean erase counter: 2/0=0A[=A0=
 166.230000] UBI: image sequence number: 1748877991=0A[=A0 166.260000] UBI:=
 background thread "ubi_bgt0d" started, PID 2170=0AUBI device number 0, tot=
al 230 LEBs (30117120 bytes, 28.7 MiB), available 0 LEBs (0 bytes), LEB siz=
e 130944 bytes (127.9 KiB)=0A[=A0 166.520000] UBIFS: recovery needed=0A[=A0=
 166.680000] UBIFS error (pid 2177): ubifs_check_node: bad CRC: calculated =
0x7d62d42c, read 0x1173c109=0A[=A0 166.690000] UBIFS error (pid 2177): ubif=
s_check_node: bad node at LEB 84:50696=0A[=A0 166.700000] UBIFS error (pid =
2177): ubifs_read_node: expected node type 9=0Amount: mounting ubi0:rootfs =
on /skov/mnt/rootfs failed: Structure needs cleaning=0A#=0A---=0A=0ASo the =
question is if UBI can made to recover this situation???=0A=0A=0ASincerely,=
=0A=0ADr. Karsten Jeppesen,=0ASKOV AS

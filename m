Received: from wproxy.gmail.com ([64.233.184.196])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DXs6b-00032q-NL
	for linux-mtd@lists.infradead.org; Mon, 16 May 2005 22:46:51 -0400
Received: by wproxy.gmail.com with SMTP id 57so1667384wri
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 May 2005 19:46:52 -0700 (PDT)
Message-ID: <c2bc1f40505161946b00566e@mail.gmail.com>
Date: Tue, 17 May 2005 10:46:52 +0800
From: jeanwelly <jeanwelly@gmail.com>
To: yaffs@stoneboat.aleph1.co.uk, linux-mtd@lists.infradead.org,
	Balloon@balloonboard.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Cc: 
Subject: Real bad blocks of nand flash?
Reply-To: jeanwelly <jeanwelly@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am running 2.6.11. 7 on S3C2410 ARM platform, using nand flash
K9F1208, root fs =3Dyaffs....

Why occured so many bad blocks of nand. Are these blocks real bad? How
can I take a test in another way?


#./eraseall /dev/mtd/3=20
.................=20
Erasing 16 KibytMTD_ioctl=20
e @ 230000 -- 72MTD_ioctl=20
EraMTD_ioctl=20
sing 16 Kibyte @MTD_ioctl=20
234000 -- 73 % MTD_ioctl=20
ErasinMTD_ioctl=20
g 16 Kibyte @ 23MTD_ioctl=20
8000 -- 73 % comMTD_ioctl=20
Erasing 1MTD_ioctl=20
6 Kibyte @ 23c000 -- 74 % compleMTD_close=20
Erasing 16 Kibyte @ 278000 -- 82 % complete.=20
./eraseall: /dev/mtd/3: MTD Erase failure: Input/output error=20
Erasing 16 Kibyte @ 27c000 -- 82 % complete.=20
./eraseall: /dev/mtd/3: MTD Erase failure: Input/output error=20
Erasing 16 Kibyte @ 280000 -- 83 % complete.=20
./eraseall: /dev/mtd/3: MTD Erase failure: Input/output error=20
Erasing 16 Kibyte @ 284000 -- 83 % complete.=20
./eraseall: /dev/mtd/3: MTD Erase failure: Input/output error=20
Erasing 16 Kibyte @ 288000 -- 84 % complete.=20
./eraseall: /dev/mtd/3: MTD Erase failure: Input/output error=20
Erasing 16 Kibyte @ 28c000 -- 84 % complete.=20
./eraseall: /dev/mtd/3: MTD Erase failure: Input/output error=20
Erasing 16 Kibyte @ 290000 -- 85 % complete.=20
./eraseall: /dev/mtd/3: MTD Erase failure: Input/output error=20
Erasing 16 Kibyte @ 2ac000 -- 89 % complete.=20
./eraseall: /dev/mtd/3: MTD Erase failure: Input/output error=20
Erased 3072 Kibyte @ 0 -- 100% complete.=20
#=20

The following is my booting info:

S3C2410 NAND Driver, (c) 2004 Simtec Electronics=20
s3c2410-nand: mapped registers at c4a00000=20
s3c2410-nand: timing: Tacls 10ns, Twrph0 40ns, Twrph1 10ns=20
NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB
3,3V 8-bit)
NAND_ECC_NONE selected by board driver. This is not recommended !!=20
Scanning device for bad blocks=20
Bad eraseblock 129 at 0x00204000   <--- REAL BAD BLOCK ????
Bad eraseblock 130 at 0x00208000=20
Bad eraseblock 146 at 0x00248000=20
Bad eraseblock 147 at 0x0024c000=20
Bad eraseblock 148 at 0x00250000=20
Bad eraseblock 149 at 0x00254000=20
Bad eraseblock 158 at 0x00278000=20
Bad eraseblock 161 at 0x00284000=20
Bad eraseblock 174 at 0x002b8000=20
Bad eraseblock 178 at 0x002c8000=20
Bad eraseblock 286 at 0x00478000=20
Bad eraseblock 287 at 0x0047c000=20
Bad eraseblock 288 at 0x00480000=20
Bad eraseblock 289 at 0x00484000=20
Bad eraseblock 290 at 0x00488000=20
Bad eraseblock 291 at 0x0048c000=20
Bad eraseblock 292 at 0x00490000=20
Bad eraseblock 294 at 0x00498000=20
Bad eraseblock 295 at 0x0049c000=20
Bad eraseblock 296 at 0x004a0000=20
Bad eraseblock 297 at 0x004a4000=20
Bad eraseblock 298 at 0x004a8000=20
Bad eraseblock 299 at 0x004ac000=20
Bad eraseblock 300 at 0x004b0000=20
Bad eraseblock 301 at 0x004b4000=20
Bad eraseblock 305 at 0x004c4000=20
Creating 5 MTD partitions on "NAND 64MiB 3,3V 8-bit":=20
0x00000000-0x00020000 : "vivi"=20
mtd: Giving out device 0 to vivi=20
0x00020000-0x00030000 : "param"=20
mtd: Giving out device 1 to param=20
0x00030000-0x00200000 : "kernel"=20
mtd: Giving out device 2 to kernel=20
0x00200000-0x00600000 : "root"=20
mtd: Giving out device 3 to root=20
0x00600000-0x04000000 : "usr"=20
mtd: Giving out device 4 to usr=20
mice: PS/2 mouse device common for all mice=20
NET: Registered protocol family 2=20
IP: routing cache hash table of 512 buckets, 4Kbytes=20
TCP established hash table entries: 4096 (order: 3, 32768 bytes)=20
TCP bind hash table entries: 4096 (order: 2, 16384 bytes)=20
TCP: Hash tables configured (established 4096 bind 4096)=20
NET: Registered protocol family 1=20
Root-NFS: No NFS server available, giving up.=20
VFS: Unable to mount root fs via NFS, trying floppy.=20
Reading data from NAND FLASH without ECC is not recommended=20
yaffs: dev is 32505859 name is "(unavailable)"=20
VFS: Mounted root (yaffs filesystem).=20
Mounted devfs on /dev=20
Freeing init memory: 80K=20
Reading data from NAND FLASH without ECC is not recommended=20
zw: mount /etc as ramfs=20
zw: /bin/mount -t yaffs /dev/mtdblock/4 /usr=20
yaffs: dev is 32505860 name is "(unavailable)"=20
Reading data from NAND FLASH without ECC is not recommended=20
Reading data from NAND FLASH without ECC is not recommended=20
Reading data from NAND FLASH without ECC is not recommended=20
exec /sbin/init=20
console=3D/dev/console=20
init started: BusyBox v0.60.3 (2002.05.13-08:36+0000) multi-call binary=20
Starting pid 20, console /dev/console: '/etc/init.d/rcS'=20
mount: Mounting tmpfs on /dev/shm failed: No such file or directory=20
Thu Jan 1 00:00:00 UTC 2004=20
mount: Mounting ramfs on /.kde failed: No such file or directory=20
Reading data from NAND FLASH without ECC is not recommended=20
calibrate: error while loading shared libraries: liblinuetteapp.so.1:
cannot load shayserver: error while loading shared libraries:
liblinuettemodule.so.1: cannot load shayWaiting for enter to start
'/bin/sh' (pid 38, terminal /dev/console)

Please press Enter to activate this console.=20
Starting pid 38, console /dev/console: '/bin/sh'=20


BusyBox v0.60.3 (2002.05.13-08:36+0000) Built-in shell (ash)=20
Enter 'help' for a list of built-in commands.=20

# ls=20
Reading data from NAND FLASH without ECC is not recommended=20
aa.c etc linuxrc proc tmp=20
bin lib lost+found qt usr=20
dev linuette mnt sbin var=20
# ls /usr=20
Reading data from NAND FLASH without ECC is not recommended=20
bin lib lost+found sample=20
etc linuette qt sbin=20

BTW:=20
In bootloader vivi, I use  # bon part , there are no bad blocks found. WHY?


--=20
jeanwelly
Email:  jeanwelly@gmail.com
China

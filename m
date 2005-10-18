Received: from [203.199.83.35] (helo=rediffmail.com)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ERpI9-0003bu-Bq
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2005 07:06:09 -0400
Date: 18 Oct 2005 10:59:12 -0000
Message-ID: <20051018105912.12648.qmail@webmail49.rediffmail.com>
MIME-Version: 1.0
From: "sai krishna sai" <gajula_kittu@rediffmail.com>
To: linux-mtd@lists.infradead.org
Content-type: multipart/alternative;
	boundary="Next_1129633151---0-203.199.83.35-12575"
Subject: Please append a correct "root=" boot option
Reply-To: sai krishna sai <gajula_kittu@rediffmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 This is a multipart mime message


--Next_1129633151---0-203.199.83.35-12575
Content-type: text/plain;
	charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

  =0AHi,=0A=0A  I am using versatile PB FPGA by ARM, and i am trying to mak=
e one partition on flash (NOR intel 64Mb) for jffs2 file system.=0A=0AI am =
trying to do(partitioning n making of jffs2) that by using a file versatile=
.c which is kept in drivers/mtd/maps/ directory.=0A=0Asee the partitioning =
below as per the file,=0A=0A=0A#define WINDOW_ADDR 0x34000000=0A#define WIN=
DOW_SIZE 0x04000000=0A#define BUSWIDTH    1=0A=0A=0Astatic struct mtd_info =
*mymtd;=0A=0A=0Astruct map_info physmap_map =3D {=0A        .name =3D "vers=
atile_flash",=0A        .size =3D WINDOW_SIZE,=0A        .phys =3D WINDOW_A=
DDR,=0A        .bankwidth =3D BUSWIDTH=0A};=0A=0A#ifdef CONFIG_MTD_PARTITIO=
NS=0Astatic struct mtd_partition *mtd_parts;=0Astatic int                  =
mtd_parts_nb;=0A=0A//#define FLASH_BLOCK_SIZE 0x20000=0A=0Astatic struct mt=
d_partition physmap_partitions[] =3D {=0A/* Partition information for versa=
tile flash */=0A        {=0A          .name =3D              "Boot monitor"=
, /* 256K boot loader */=0A                .size =3D        2*FLASH_BLOCK_S=
IZE,=0A                .offset =3D      0,=0A                .mask_flags =
=3D  MTD_WRITEABLE,  /* force read-only */=0A        }, {=0A          .name=
 =3D              "u-boot", /* 128K enviroment */=0A                .size =
=3D        2*FLASH_BLOCK_SIZE,=0A                .offset =3D      MTDPART_O=
FS_APPEND,=0A        }, {=0A.name =3D              "bZimage",      /* kerne=
l image */=0A                .size =3D        18*FLASH_BLOCK_SIZE,=0A      =
          .offset =3D      MTDPART_OFS_APPEND,=0A                .mask_flag=
s =3D  MTD_WRITEABLE,  /* force read-only */=0A        }=0A        ,{=0A   =
       .name =3D              "UserFStst",    /* cramfs for testing */=0A  =
        .size =3D              152*FLASH_BLOCK_SIZE,=0A          .offset =
=3D            MTDPART_OFS_APPEND,=0A        }=0A        ,{=0A          .na=
me =3D              "NFU",    /* NFU for loading images */=0A          .siz=
e =3D              2*FLASH_BLOCK_SIZE,=0A          .offset =3D            M=
TDPART_OFS_APPEND,=0A        }=0A        , {=0A          .name =3D         =
     "UserFS",    /* jffs2 until end */=0A                .size =3D        =
MTDPART_SIZ_FULL,=0A                .offset =3D      MTDPART_OFS_APPEND,=0A=
              // .mask_flags =3D  MTD_WRITEABLE, /* May be need or need not=
 */=0A        }=0A};=0A=0A#define NUM_PARTITIONS  (sizeof(physmap_partition=
s)/sizeof(struct mtd_partition))=0Aconst char *part_probes[] =3D {"cmdlinep=
art", NULL};=0A=0A=0A=0A=0A=0A=0Ai am making the partitions like above and =
giving the bootargs as=0A=0A  setenv bootargs root=3D/dev/mtdblock5 rw root=
fstype=3Djffs2 console=3DttyAMA0,38400n8 mem=3D128M=0A=0A  mtdblock5 is for=
 jffs2 binary.=0A=0AHere is the part of .config=0A=0A=0A=0A=0A# Memory Tech=
nology Devices (MTD)=0A#=0ACONFIG_MTD=3Dy=0A# CONFIG_MTD_DEBUG is not set=
=0A# CONFIG_MTD_CONCAT is not set=0ACONFIG_MTD_PARTITIONS=3Dy=0A=0A# User M=
odules And Translation Layers=0A#=0ACONFIG_MTD_CHAR=3Dy=0ACONFIG_MTD_BLOCK=
=3Dy=0A# CONFIG_FTL is not set=0A# CONFIG_NFTL is not set=0A# CONFIG_INFTL =
is not set=0A=0A# RAM/ROM/Flash chip drivers=0A#=0ACONFIG_MTD_CFI=3Dy=0A# C=
ONFIG_MTD_JEDECPROBE is not set=0ACONFIG_MTD_GEN_PROBE=3Dy=0ACONFIG_MTD_CFI=
_ADV_OPTIONS=3Dy=0ACONFIG_MTD_CFI_NOSWAP=3Dy=0A# CONFIG_MTD_CFI_BE_BYTE_SWA=
P is not set=0A# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set=0A# CONFIG_MTD_CFI_=
GEOMETRY is not set=0ACONFIG_MTD_MAP_BANK_WIDTH_1=3Dy=0ACONFIG_MTD_MAP_BANK=
_WIDTH_2=3Dy=0ACONFIG_MTD_MAP_BANK_WIDTH_4=3Dy=0A# CONFIG_MTD_MAP_BANK_WIDT=
H_8 is not set=0A# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set=0A# CONFIG_MTD_M=
AP_BANK_WIDTH_32 is not set=0ACONFIG_MTD_CFI_I1=3Dy=0ACONFIG_MTD_CFI_I2=3Dy=
=0A# CONFIG_MTD_CFI_I4 is not set=0A# CONFIG_MTD_CFI_I8 is not set=0ACONFIG=
_MTD_CFI_INTELEXT=3Dy=0A# CONFIG_MTD_CFI_AMDSTD is not set=0A# CONFIG_MTD_C=
FI_STAA is not set=0ACONFIG_MTD_CFI_UTIL=3Dy=0A# CONFIG_MTD_RAM is not set=
=0ACONFIG_MTD_ROM=3Dy=0A# CONFIG_MTD_ABSENT is not set=0A# CONFIG_MTD_XIP i=
s not set=0A=0A#=0A# Mapping drivers for chip access=0A#=0ACONFIG_MTD_COMPL=
EX_MAPPINGS=3Dy=0A# CONFIG_MTD_PHYSMAP is not set=0A# CONFIG_MTD_ARM_INTEGR=
ATOR is not set=0ACONFIG_MTD_ARM_VERSATILE=3Dy=0A# CONFIG_MTD_EDB7312 is no=
t set=0A# CONFIG_MTD_PCI is not set=0A=0A# Miscellaneous filesystems=0A#=0A=
# CONFIG_ADFS_FS is not set=0A# CONFIG_AFFS_FS is not set=0A# CONFIG_HFS_FS=
 is not set=0A# CONFIG_HFSPLUS_FS is not set=0A# CONFIG_BEFS_FS is not set=
=0A# CONFIG_BFS_FS is not set=0A# CONFIG_EFS_FS is not set=0A# CONFIG_JFFS_=
FS is not set=0ACONFIG_JFFS2_FS=3Dy=0ACONFIG_JFFS2_FS_DEBUG=3D0=0A# CONFIG_=
JFFS2_FS_NAND is not set=0A# CONFIG_JFFS2_FS_NOR_ECC is not set=0A# CONFIG_=
JFFS2_COMPRESSION_OPTIONS is not set=0ACONFIG_JFFS2_ZLIB=3Dy=0ACONFIG_JFFS2=
_RTIME=3Dy=0A# CONFIG_JFFS2_RUBIN is not set=0ACONFIG_CRAMFS=3Dy=0A# CONFIG=
_VXFS_FS is not set=0A# CONFIG_HPFS_FS is not set=0A# CONFIG_QNX4FS_FS is n=
ot set=0A# CONFIG_SYSV_FS is not set=0A# CONFIG_UFS_FS is not set=0A=0A#=0A=
# Partition Types=0A#=0ACONFIG_PARTITION_ADVANCED=3Dy=0A# CONFIG_ACORN_PART=
ITION is not set=0A=0A=0A=0A=0A=0A=0A=0AWhen i boot the board the following=
 messages are coming.=0A=0Ajffs2_scan_eraseblock(): Magic bitmask 0x1985 no=
t found at 0x009e0020: 0xffff in stead=0Ajffs2_scan_eraseblock(): Magic bit=
mask 0x1985 not found at 0x009e0024: 0xffff in stead=0AFurther such events =
for this erase block will not be printed=0ACowardly refusing to erase block=
s on filesystem with no valid JFFS2 nodes=0Aempty_blocks 0, bad_blocks 0, c=
->nr_blocks 80=0AVFS: Cannot open root device "mtdblock5" or unknown-block(=
31,5)=0APlease append a correct "root=3D" boot option=0AKernel panic - not =
syncing: VFS: Unable to mount root fs on unknown-block(31,5)=0A=0A=0A=0Ajff=
s2_scan_eraseblock() can be avoided by padding the flash,=0Abut why it is n=
ot able to open/detect the mtdblock5, i dont know?=0A=0Acan any one plz hel=
p to mount jffs2 in this case,=0A=0Aam i doing any partitioning mistakes or=
 root option mistakes?=0A=0AThanks in advance,=0A=0AThanks & Regards,=0ASai=
krishna Gajula
--Next_1129633151---0-203.199.83.35-12575
Content-type: text/html;
	charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<P>=0A&nbsp; <BR>=0AHi,<BR>=0A<BR>=0A&nbsp; I am using versatile PB FPGA by=
 ARM, and i am trying to make one partition on flash (NOR intel 64Mb) for j=
ffs2 file system.<BR>=0A<BR>=0AI am trying to do(partitioning n making of j=
ffs2) that by using a file versatile.c which is kept in drivers/mtd/maps/ d=
irectory.<BR>=0A<BR>=0Asee the partitioning below as per the file,<BR>=0A<B=
R>=0A<BR>=0A#define WINDOW_ADDR 0x34000000<BR>=0A#define WINDOW_SIZE 0x0400=
0000<BR>=0A#define BUSWIDTH&nbsp; &nbsp; 1<BR>=0A<BR>=0A<BR>=0Astatic struc=
t mtd_info *mymtd;<BR>=0A<BR>=0A<BR>=0Astruct map_info physmap_map =3D {<BR=
>=0A&nbsp; &nbsp; &nbsp; &nbsp; .name =3D &quot;versatile_flash&quot;,<BR>=
=0A&nbsp; &nbsp; &nbsp; &nbsp; .size =3D WINDOW_SIZE,<BR>=0A&nbsp; &nbsp; &=
nbsp; &nbsp; .phys =3D WINDOW_ADDR,<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp; .bank=
width =3D BUSWIDTH<BR>=0A};<BR>=0A<BR>=0A#ifdef CONFIG_MTD_PARTITIONS<BR>=
=0Astatic struct mtd_partition *mtd_parts;<BR>=0Astatic int&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; mtd_parts_nb;<BR>=0A<BR>=0A/=
/#define FLASH_BLOCK_SIZE 0x20000<BR>=0A<BR>=0Astatic struct mtd_partition =
physmap_partitions[] =3D {<BR>=0A/* Partition information for versatile fla=
sh */<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp; {<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; .name =3D&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;Boo=
t monitor&quot;, /* 256K boot loader */<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; .size =3D&nbsp; &nbsp; &nbsp; &nbsp; 2*FLASH_BLO=
CK_SIZE,<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .off=
set =3D&nbsp; &nbsp; &nbsp; 0,<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; .mask_flags =3D&nbsp; MTD_WRITEABLE,&nbsp; /* force read-=
only */<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp; }, {<BR>=0A&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; .name =3D&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quo=
t;u-boot&quot;, /* 128K enviroment */<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; .size =3D&nbsp; &nbsp; &nbsp; &nbsp; 2*FLASH_BLOCK=
_SIZE,<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .offse=
t =3D&nbsp; &nbsp; &nbsp; MTDPART_OFS_APPEND,<BR>=0A&nbsp; &nbsp; &nbsp; &n=
bsp; }, {<BR>=0A.name =3D&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
quot;bZimage&quot;,&nbsp; &nbsp; &nbsp; /* kernel image */<BR>=0A&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .size =3D&nbsp; &nbsp; &nbsp;=
 &nbsp; 18*FLASH_BLOCK_SIZE,<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; .offset =3D&nbsp; &nbsp; &nbsp; MTDPART_OFS_APPEND,<BR>=0A&=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .mask_flags =3D&nbsp=
; MTD_WRITEABLE,&nbsp; /* force read-only */<BR>=0A&nbsp; &nbsp; &nbsp; &nb=
sp; }<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp; ,{<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; .name =3D&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;Us=
erFStst&quot;,&nbsp; &nbsp; /* cramfs for testing */<BR>=0A&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; .size =3D&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; 152*FLASH_BLOCK_SIZE,<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .offset =
=3D&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MTDPART_OFS_APPEND,<BR>=0A&nbs=
p; &nbsp; &nbsp; &nbsp; }<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp; ,{<BR>=0A&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; .name =3D&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &quot;NFU&quot;,&nbsp; &nbsp; /* NFU for loading images */<BR>=
=0A&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .size =3D&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; 2*FLASH_BLOCK_SIZE,<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; .offset =3D&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MTDPART_OFS_APP=
END,<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp; }<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp; =
, {<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .name =3D&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &quot;UserFS&quot;,&nbsp; &nbsp; /* jffs2 until=
 end */<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .size=
 =3D&nbsp; &nbsp; &nbsp; &nbsp; MTDPART_SIZ_FULL,<BR>=0A&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .offset =3D&nbsp; &nbsp; &nbsp; MTDPAR=
T_OFS_APPEND,<BR>=0A&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // .ma=
sk_flags =3D&nbsp; MTD_WRITEABLE, /* May be need or need not */<BR>=0A&nbsp=
; &nbsp; &nbsp; &nbsp; }<BR>=0A};<BR>=0A<BR>=0A#define NUM_PARTITIONS&nbsp;=
 (sizeof(physmap_partitions)/sizeof(struct mtd_partition))<BR>=0Aconst char=
 *part_probes[] =3D {&quot;cmdlinepart&quot;, NULL};<BR>=0A<BR>=0A<BR>=0A<B=
R>=0A<BR>=0A<BR>=0A<BR>=0Ai am making the partitions like above and giving =
the bootargs as<BR>=0A<BR>=0A&nbsp; setenv bootargs root=3D/dev/mtdblock5 r=
w rootfstype=3Djffs2 console=3DttyAMA0,38400n8 mem=3D128M<BR>=0A<BR>=0A&nbs=
p; mtdblock5 is for jffs2 binary.<BR>=0A<BR>=0AHere is the part of .config<=
BR>=0A<BR>=0A<BR>=0A<BR>=0A<BR>=0A# Memory Technology Devices (MTD)<BR>=0A#=
<BR>=0ACONFIG_MTD=3Dy<BR>=0A# CONFIG_MTD_DEBUG is not set<BR>=0A# CONFIG_MT=
D_CONCAT is not set<BR>=0ACONFIG_MTD_PARTITIONS=3Dy<BR>=0A<BR>=0A# User Mod=
ules And Translation Layers<BR>=0A#<BR>=0ACONFIG_MTD_CHAR=3Dy<BR>=0ACONFIG_=
MTD_BLOCK=3Dy<BR>=0A# CONFIG_FTL is not set<BR>=0A# CONFIG_NFTL is not set<=
BR>=0A# CONFIG_INFTL is not set<BR>=0A<BR>=0A# RAM/ROM/Flash chip drivers<B=
R>=0A#<BR>=0ACONFIG_MTD_CFI=3Dy<BR>=0A# CONFIG_MTD_JEDECPROBE is not set<BR=
>=0ACONFIG_MTD_GEN_PROBE=3Dy<BR>=0ACONFIG_MTD_CFI_ADV_OPTIONS=3Dy<BR>=0ACON=
FIG_MTD_CFI_NOSWAP=3Dy<BR>=0A# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set<BR>=
=0A# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set<BR>=0A# CONFIG_MTD_CFI_GEOMETRY=
 is not set<BR>=0ACONFIG_MTD_MAP_BANK_WIDTH_1=3Dy<BR>=0ACONFIG_MTD_MAP_BANK=
_WIDTH_2=3Dy<BR>=0ACONFIG_MTD_MAP_BANK_WIDTH_4=3Dy<BR>=0A# CONFIG_MTD_MAP_B=
ANK_WIDTH_8 is not set<BR>=0A# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set<BR>=
=0A# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set<BR>=0ACONFIG_MTD_CFI_I1=3Dy<BR=
>=0ACONFIG_MTD_CFI_I2=3Dy<BR>=0A# CONFIG_MTD_CFI_I4 is not set<BR>=0A# CONF=
IG_MTD_CFI_I8 is not set<BR>=0ACONFIG_MTD_CFI_INTELEXT=3Dy<BR>=0A# CONFIG_M=
TD_CFI_AMDSTD is not set<BR>=0A# CONFIG_MTD_CFI_STAA is not set<BR>=0ACONFI=
G_MTD_CFI_UTIL=3Dy<BR>=0A# CONFIG_MTD_RAM is not set<BR>=0ACONFIG_MTD_ROM=
=3Dy<BR>=0A# CONFIG_MTD_ABSENT is not set<BR>=0A# CONFIG_MTD_XIP is not set=
<BR>=0A<BR>=0A#<BR>=0A# Mapping drivers for chip access<BR>=0A#<BR>=0ACONFI=
G_MTD_COMPLEX_MAPPINGS=3Dy<BR>=0A# CONFIG_MTD_PHYSMAP is not set<BR>=0A# CO=
NFIG_MTD_ARM_INTEGRATOR is not set<BR>=0ACONFIG_MTD_ARM_VERSATILE=3Dy<BR>=
=0A# CONFIG_MTD_EDB7312 is not set<BR>=0A# CONFIG_MTD_PCI is not set<BR>=0A=
<BR>=0A# Miscellaneous filesystems<BR>=0A#<BR>=0A# CONFIG_ADFS_FS is not se=
t<BR>=0A# CONFIG_AFFS_FS is not set<BR>=0A# CONFIG_HFS_FS is not set<BR>=0A=
# CONFIG_HFSPLUS_FS is not set<BR>=0A# CONFIG_BEFS_FS is not set<BR>=0A# CO=
NFIG_BFS_FS is not set<BR>=0A# CONFIG_EFS_FS is not set<BR>=0A# CONFIG_JFFS=
_FS is not set<BR>=0ACONFIG_JFFS2_FS=3Dy<BR>=0ACONFIG_JFFS2_FS_DEBUG=3D0<BR=
>=0A# CONFIG_JFFS2_FS_NAND is not set<BR>=0A# CONFIG_JFFS2_FS_NOR_ECC is no=
t set<BR>=0A# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set<BR>=0ACONFIG_JFFS=
2_ZLIB=3Dy<BR>=0ACONFIG_JFFS2_RTIME=3Dy<BR>=0A# CONFIG_JFFS2_RUBIN is not s=
et<BR>=0ACONFIG_CRAMFS=3Dy<BR>=0A# CONFIG_VXFS_FS is not set<BR>=0A# CONFIG=
_HPFS_FS is not set<BR>=0A# CONFIG_QNX4FS_FS is not set<BR>=0A# CONFIG_SYSV=
_FS is not set<BR>=0A# CONFIG_UFS_FS is not set<BR>=0A<BR>=0A#<BR>=0A# Part=
ition Types<BR>=0A#<BR>=0ACONFIG_PARTITION_ADVANCED=3Dy<BR>=0A# CONFIG_ACOR=
N_PARTITION is not set<BR>=0A<BR>=0A<BR>=0A<BR>=0A<BR>=0A<BR>=0A<BR>=0A<BR>=
=0AWhen i boot the board the following messages are coming.<BR>=0A<BR>=0Ajf=
fs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009e0020: 0xffff=
 in stead<BR>=0Ajffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at =
0x009e0024: 0xffff in stead<BR>=0AFurther such events for this erase block =
will not be printed<BR>=0ACowardly refusing to erase blocks on filesystem w=
ith no valid JFFS2 nodes<BR>=0Aempty_blocks 0, bad_blocks 0, c-&gt;nr_block=
s 80<BR>=0AVFS: Cannot open root device &quot;mtdblock5&quot; or unknown-bl=
ock(31,5)<BR>=0APlease append a correct &quot;root=3D&quot; boot option<BR>=
=0AKernel panic - not syncing: VFS: Unable to mount root fs on unknown-bloc=
k(31,5)<BR>=0A<BR>=0A<BR>=0A<BR>=0Ajffs2_scan_eraseblock() can be avoided b=
y padding the flash,<BR>=0Abut why it is not able to open/detect the mtdblo=
ck5, i dont know?<BR>=0A<BR>=0Acan any one plz help to mount jffs2 in this =
case,<BR>=0A<BR>=0Aam i doing any partitioning mistakes or root option mist=
akes?<BR>=0A<BR>=0AThanks in advance,<BR>=0A<BR>=0AThanks &amp; Regards,<BR=
>=0ASaikrishna Gajula=0A</P>=0A<br><br>=0A<a href=3D"http://adworks.rediff.=
com/cgi-bin/AdWorks/sigclick.cgi/www.rediff.com/signature-home.htm/15071914=
90@Middle5?PARTNER=3D3"><IMG SRC=3D"http://adworks.rediff.com/cgi-bin/AdWor=
ks/sigimpress.cgi/www.rediff.com/signature-home.htm/1963059423@Middle5?OAS_=
query=3Dnull&PARTNER=3D3" BORDER=3D0 VSPACE=3D0 HSPACE=3D0></a>=0A
--Next_1129633151---0-203.199.83.35-12575--

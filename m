Received: from dsl-205-210-52-208.kingston.net ([205.210.52.208] helo=linux.interlinx.bc.ca)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 188hlV-00065o-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Nov 2002 13:59:42 +0000
Date: Mon, 4 Nov 2002 09:29:51 -0500
To: linux-mtd@lists.infradead.org
Subject: Re: MTD Config.in items not escaped by bus availability
Message-ID: <20021104142950.GO16306@pc.ilinx>
References: <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net> <20021030185507.GA31547@wohnheim.fh-wedel.de> <20021030193834.GE27880@pc.ilinx> <20021030201608.GA28523@wohnheim.fh-wedel.de> <20021030204937.GG27880@pc.ilinx> <200211041
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JKGvNdIvrY8Ovf7Z"
Content-Disposition: inline
In-Reply-To: <20021104141747.GA31683@wohnheim.fh-wedel.de>
From: "Brian J. Murrell" <0c9fc0b0347685d368eb3e4aecd72738@interlinx.bc.ca>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--JKGvNdIvrY8Ovf7Z
Content-Type: multipart/mixed; boundary="qd/SZIFVu+MYwfCR"
Content-Disposition: inline


--qd/SZIFVu+MYwfCR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2002 at 03:17:47PM +0100, J=F6rn Engel wrote:
>=20
> Could you also send the patch to David and to this list?
>=20
> Usually, patches should go through the maintainer, which is David
> Woodhouse in this case. Unless David ignores the patch completely for
> some time, I would not send it directly to Marcelo.

Of course, you are absolutely correct.  I guess the reason I jumped
the gun was that the last time I did this dance, there was no active
maintainer so I went ahead and sent my patch to Marcelo my self.  I
guess I was just following the footsteps of my last time around with
this sort of thing.

> And I would like to see the patch as well, as might some others. :-)

Attached.

b.

--=20
Brian J. Murrell

--qd/SZIFVu+MYwfCR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="memory_bus.patch"
Content-Transfer-Encoding: quoted-printable

diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -ur linux-2.4.19-1=
6mdkcustom.virgin/arch/alpha/defconfig linux-2.4.19-16mdkcustom.memory_bus/=
arch/alpha/defconfig
--- linux-2.4.19-16mdkcustom.virgin/arch/alpha/defconfig	2002-09-20 09:45:4=
8.000000000 -0400
+++ linux-2.4.19-16mdkcustom.memory_bus/arch/alpha/defconfig	2002-11-01 18:=
50:35.000000000 -0500
@@ -51,6 +51,7 @@
 # CONFIG_ALPHA_TAKARA is not set
 # CONFIG_ALPHA_TITAN is not set
 # CONFIG_ALPHA_WILDFIRE is not set
+CONFIG_MEMORY_BUS=3Dy
 CONFIG_ISA=3Dy
 CONFIG_EISA=3Dy
 # CONFIG_SBUS is not set
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -ur linux-2.4.19-1=
6mdkcustom.virgin/arch/i386/defconfig linux-2.4.19-16mdkcustom.memory_bus/a=
rch/i386/defconfig
--- linux-2.4.19-16mdkcustom.virgin/arch/i386/defconfig	2002-09-20 09:45:04=
000000000 -0400
+++ linux-2.4.19-16mdkcustom.memory_bus/arch/i386/defconfig	2002-11-01 18:5=
0:44.000000000 -0500
@@ -67,6 +67,7 @@
 CONFIG_X86_LOCAL_APIC=3Dy
 CONFIG_X86_IO_APIC=3Dy
 CONFIG_ISA=3Dy
+CONFIG_MEMORY_BUS=3Dy
=20
 #
 # General setup
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -ur linux-2.4.19-1=
6mdkcustom.virgin/arch/ia64/defconfig linux-2.4.19-16mdkcustom.memory_bus/a=
rch/ia64/defconfig
--- linux-2.4.19-16mdkcustom.virgin/arch/ia64/defconfig	2002-09-20 09:46:16=
.000000000 -0400
+++ linux-2.4.19-16mdkcustom.memory_bus/arch/ia64/defconfig	2002-11-01 18:5=
0:51.000000000 -0500
@@ -18,6 +18,7 @@
 # General setup
 #
 CONFIG_IA64=3Dy
+CONFIG_MEMORY_BUS=3Dy
 # CONFIG_ISA is not set
 # CONFIG_EISA is not set
 # CONFIG_MCA is not set
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -ur linux-2.4.19-1=
6mdkcustom.virgin/arch/ppc/defconfig linux-2.4.19-16mdkcustom.memory_bus/ar=
ch/ppc/defconfig
--- linux-2.4.19-16mdkcustom.virgin/arch/ppc/defconfig	2002-09-20 09:46:00.=
000000000 -0400
+++ linux-2.4.19-16mdkcustom.memory_bus/arch/ppc/defconfig	2002-11-01 18:50=
:57.000000000 -0500
@@ -47,6 +47,7 @@
 # CONFIG_EISA is not set
 # CONFIG_SBUS is not set
 # CONFIG_MCA is not set
+CONFIG_MEMORY_BUS=3Dy
 CONFIG_PCI=3Dy
 CONFIG_NET=3Dy
 CONFIG_SYSCTL=3Dy
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -ur linux-2.4.19-1=
6mdkcustom.virgin/arch/x86_64/defconfig linux-2.4.19-16mdkcustom.memory_bus=
/arch/x86_64/defconfig
--- linux-2.4.19-16mdkcustom.virgin/arch/x86_64/defconfig	2002-09-20 09:46:=
34.000000000 -0400
+++ linux-2.4.19-16mdkcustom.memory_bus/arch/x86_64/defconfig	2002-11-01 18=
:51:03.000000000 -0500
@@ -3,6 +3,7 @@
 #
 CONFIG_X86_64=3Dy
 CONFIG_X86=3Dy
+CONFIG_MEMORY_BUS=3Dy
 # CONFIG_ISA is not set
 # CONFIG_SBUS is not set
 CONFIG_UID16=3Dy
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -ur linux-2.4.19-1=
6mdkcustom.virgin/drivers/mtd/chips/Config.in linux-2.4.19-16mdkcustom.memo=
ry_bus/drivers/mtd/chips/Config.in
--- linux-2.4.19-16mdkcustom.virgin/drivers/mtd/chips/Config.in	2001-10-04 =
18:13:18.000000000 -0400
+++ linux-2.4.19-16mdkcustom.memory_bus/drivers/mtd/chips/Config.in	2002-11=
-01 21:15:14.000000000 -0500
@@ -6,52 +6,53 @@
=20
 comment 'RAM/ROM/Flash chip drivers'
=20
-dep_tristate '  Detect flash chips by Common Flash Interface (CFI) probe' =
CONFIG_MTD_CFI $CONFIG_MTD
-#dep_tristate '  Detect non-CFI Intel-compatible flash chips' CONFIG_MTD_I=
NTELPROBE $CONFIG_MTD
-dep_tristate '  Detect non-CFI AMD/JEDEC-compatible flash chips' CONFIG_MT=
D_JEDECPROBE $CONFIG_MTD
-
-if [ "$CONFIG_MTD_CFI" =3D "y" -o "$CONFIG_MTD_INTELPROBE" =3D "y" -o "$CO=
NFIG_MTD_JEDECPROBE" =3D "y" ]; then
-   define_bool CONFIG_MTD_GEN_PROBE y
-else
-   if [ "$CONFIG_MTD_CFI" =3D "m" -o "$CONFIG_MTD_INTELPROBE" =3D "m" -o "=
$CONFIG_MTD_JEDECPROBE" =3D "m" ]; then
-      define_bool CONFIG_MTD_GEN_PROBE m
+if [ "$CONFIG_MEMORY_BUS" =3D "y" ]; then
+   dep_tristate '  Detect flash chips by Common Flash Interface (CFI) prob=
e' CONFIG_MTD_CFI $CONFIG_MTD
+   #dep_tristate '  Detect non-CFI Intel-compatible flash chips' CONFIG_MT=
D_INTELPROBE $CONFIG_MTD
+   dep_tristate '  Detect non-CFI AMD/JEDEC-compatible flash chips' CONFIG=
_MTD_JEDECPROBE $CONFIG_MTD
+
+   if [ "$CONFIG_MTD_CFI" =3D "y" -o "$CONFIG_MTD_INTELPROBE" =3D "y" -o "=
$CONFIG_MTD_JEDECPROBE" =3D "y" ]; then
+      define_bool CONFIG_MTD_GEN_PROBE y
    else
-      define_bool CONFIG_MTD_GEN_PROBE n
+      if [ "$CONFIG_MTD_CFI" =3D "m" -o "$CONFIG_MTD_INTELPROBE" =3D "m" -=
o "$CONFIG_MTD_JEDECPROBE" =3D "m" ]; then
+         define_bool CONFIG_MTD_GEN_PROBE m
+      else
+         define_bool CONFIG_MTD_GEN_PROBE n
+      fi
    fi
-fi
-if [ "$CONFIG_MTD_GEN_PROBE" =3D "y" -o "$CONFIG_MTD_GEN_PROBE" =3D "m" ];=
 then
-   bool '  Flash chip driver advanced configuration options' CONFIG_MTD_CF=
I_ADV_OPTIONS
-   if [ "$CONFIG_MTD_CFI_ADV_OPTIONS" =3D "y" ]; then
-     choice 'Flash cmd/query data swapping'			\
-	"NO			CONFIG_MTD_CFI_NOSWAP		\
-	 BIG_ENDIAN_BYTE	CONFIG_MTD_CFI_BE_BYTE_SWAP	\
-	 LITTLE_ENDIAN_BYTE	CONFIG_MTD_CFI_LE_BYTE_SWAP"	NO
-     bool '  Specific CFI Flash geometry selection' CONFIG_MTD_CFI_GEOMETRY
-     if [ "$CONFIG_MTD_CFI_GEOMETRY" =3D "y" ]; then
-       bool '    Support  8-bit buswidth' CONFIG_MTD_CFI_B1
-       bool '    Support 16-bit buswidth' CONFIG_MTD_CFI_B2
-       bool '    Support 32-bit buswidth' CONFIG_MTD_CFI_B4
-	 if [ "$CONFIG_MTD_CFI_B1" =3D "y" ]; then
-	   define_bool CONFIG_MTD_CFI_I1 y
-         else
-           bool '    Support 1-chip flash interleave' CONFIG_MTD_CFI_I1
-	 fi
-       bool '    Support 2-chip flash interleave' CONFIG_MTD_CFI_I2
-       bool '    Support 4-chip flash interleave' CONFIG_MTD_CFI_I4
+   if [ "$CONFIG_MTD_GEN_PROBE" =3D "y" -o "$CONFIG_MTD_GEN_PROBE" =3D "m"=
 ]; then
+      bool '  Flash chip driver advanced configuration options' CONFIG_MTD=
_CFI_ADV_OPTIONS
+      if [ "$CONFIG_MTD_CFI_ADV_OPTIONS" =3D "y" ]; then
+        choice 'Flash cmd/query data swapping'			\
+   	"NO			CONFIG_MTD_CFI_NOSWAP		\
+   	 BIG_ENDIAN_BYTE	CONFIG_MTD_CFI_BE_BYTE_SWAP	\
+   	 LITTLE_ENDIAN_BYTE	CONFIG_MTD_CFI_LE_BYTE_SWAP"	NO
+        bool '  Specific CFI Flash geometry selection' CONFIG_MTD_CFI_GEOM=
ETRY
+        if [ "$CONFIG_MTD_CFI_GEOMETRY" =3D "y" ]; then
+          bool '    Support  8-bit buswidth' CONFIG_MTD_CFI_B1
+          bool '    Support 16-bit buswidth' CONFIG_MTD_CFI_B2
+          bool '    Support 32-bit buswidth' CONFIG_MTD_CFI_B4
+   	 if [ "$CONFIG_MTD_CFI_B1" =3D "y" ]; then
+   	   define_bool CONFIG_MTD_CFI_I1 y
+   	 else
+   	   bool '    Support 1-chip flash interleave' CONFIG_MTD_CFI_I1
+   	 fi
+          bool '    Support 2-chip flash interleave' CONFIG_MTD_CFI_I2
+          bool '    Support 4-chip flash interleave' CONFIG_MTD_CFI_I4
+        fi
      fi
-  fi
-fi
-dep_tristate '  Support for Intel/Sharp flash chips' CONFIG_MTD_CFI_INTELE=
XT $CONFIG_MTD_GEN_PROBE
-dep_tristate '  Support for AMD/Fujitsu flash chips' CONFIG_MTD_CFI_AMDSTD=
 $CONFIG_MTD_GEN_PROBE
-
-dep_tristate '  Support for RAM chips in bus mapping' CONFIG_MTD_RAM $CONF=
IG_MTD
-dep_tristate '  Support for ROM chips in bus mapping' CONFIG_MTD_ROM $CONF=
IG_MTD
-dep_tristate '  Support for absent chips in bus mapping' CONFIG_MTD_ABSENT=
 $CONFIG_MTD
-
-bool '  Older (theoretically obsoleted now) drivers for non-CFI chips' CON=
FIG_MTD_OBSOLETE_CHIPS
-dep_tristate '  AMD compatible flash chip support (non-CFI)' CONFIG_MTD_AM=
DSTD $CONFIG_MTD $CONFIG_MTD_OBSOLETE_CHIPS
-dep_tristate '  pre-CFI Sharp chip support' CONFIG_MTD_SHARP $CONFIG_MTD $=
CONFIG_MTD_OBSOLETE_CHIPS
-dep_tristate '  JEDEC device support' CONFIG_MTD_JEDEC $CONFIG_MTD $CONFIG=
_MTD_OBSOLETE_CHIPS
+   fi
+   dep_tristate '  Support for Intel/Sharp flash chips' CONFIG_MTD_CFI_INT=
ELEXT $CONFIG_MTD_GEN_PROBE
+   dep_tristate '  Support for AMD/Fujitsu flash chips' CONFIG_MTD_CFI_AMD=
STD $CONFIG_MTD_GEN_PROBE
=20
+   dep_tristate '  Support for RAM chips in bus mapping' CONFIG_MTD_RAM $C=
ONFIG_MTD
+   dep_tristate '  Support for ROM chips in bus mapping' CONFIG_MTD_ROM $C=
ONFIG_MTD
+   dep_tristate '  Support for absent chips in bus mapping' CONFIG_MTD_ABS=
ENT $CONFIG_MTD
+
+   bool '  Older (theoretically obsoleted now) drivers for non-CFI chips' =
CONFIG_MTD_OBSOLETE_CHIPS
+   dep_tristate '  AMD compatible flash chip support (non-CFI)' CONFIG_MTD=
_AMDSTD $CONFIG_MTD $CONFIG_MTD_OBSOLETE_CHIPS
+   dep_tristate '  pre-CFI Sharp chip support' CONFIG_MTD_SHARP $CONFIG_MT=
D $CONFIG_MTD_OBSOLETE_CHIPS
+   dep_tristate '  JEDEC device support' CONFIG_MTD_JEDEC $CONFIG_MTD $CON=
FIG_MTD_OBSOLETE_CHIPS
+fi
=20
 endmenu
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -ur linux-2.4.19-1=
6mdkcustom.virgin/drivers/mtd/devices/Config.in linux-2.4.19-16mdkcustom.me=
mory_bus/drivers/mtd/devices/Config.in
--- linux-2.4.19-16mdkcustom.virgin/drivers/mtd/devices/Config.in	2002-09-2=
0 09:44:23.000000000 -0400
+++ linux-2.4.19-16mdkcustom.memory_bus/drivers/mtd/devices/Config.in	2002-=
11-01 21:15:14.000000000 -0500
@@ -10,7 +10,7 @@
    bool '    PMC551 256M DRAM Bugfix' CONFIG_MTD_PMC551_BUGFIX
    bool '    PMC551 Debugging' CONFIG_MTD_PMC551_DEBUG
 fi
-dep_tristate '  Uncached system RAM' CONFIG_MTD_SLRAM $CONFIG_MTD
+dep_tristate '  Uncached system RAM' CONFIG_MTD_SLRAM $CONFIG_MTD "$CONFIG=
_MEMORY_BUS"
 if [ "$CONFIG_SA1100_LART" =3D "y" ]; then
   dep_tristate '  28F160xx flash driver for LART' CONFIG_MTD_LART $CONFIG_=
MTD
 fi
@@ -24,7 +24,8 @@
 fi
 dep_tristate '  MTD emulation using block device' CONFIG_MTD_BLKMTD $CONFI=
G_MTD
=20
-comment 'Disk-On-Chip Device Drivers'
+if [ "$CONFIG_MEMORY_BUS" =3D "y" ]; then
+   comment 'Disk-On-Chip Device Drivers'
    if [ "$CONFIG_SMP" !=3D "y" ]; then
       dep_tristate '  M-Systems Disk-On-Chip 1000' CONFIG_MTD_DOC1000 $CON=
FIG_MTD
    fi
@@ -52,6 +53,7 @@
          bool '    Probe for 0x55 0xAA BIOS Extension Signature' CONFIG_MT=
D_DOCPROBE_55AA
       fi
    fi
+fi
=20
=20
 endmenu
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -ur linux-2.4.19-1=
6mdkcustom.virgin/drivers/mtd/nand/Config.in linux-2.4.19-16mdkcustom.memor=
y_bus/drivers/mtd/nand/Config.in
--- linux-2.4.19-16mdkcustom.virgin/drivers/mtd/nand/Config.in	2001-10-04 1=
8:13:18.000000000 -0400
+++ linux-2.4.19-16mdkcustom.memory_bus/drivers/mtd/nand/Config.in	2002-11-=
01 21:15:14.000000000 -0500
@@ -6,7 +6,7 @@
=20
 comment 'NAND Flash Device Drivers'
=20
-dep_tristate '  NAND Device Support' CONFIG_MTD_NAND $CONFIG_MTD
+dep_tristate '  NAND Device Support' CONFIG_MTD_NAND $CONFIG_MTD "$CONFIG_=
MEMORY_BUS"
 if [ "$CONFIG_MTD_NAND" =3D "y" -o "$CONFIG_MTD_NAND" =3D "m" ]; then
    bool '    Enable ECC correction algorithm'  CONFIG_MTD_NAND_ECC
    bool '    Verify NAND page writes' CONFIG_MTD_NAND_VERIFY_WRITE

--qd/SZIFVu+MYwfCR--

--JKGvNdIvrY8Ovf7Z
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9xoRel3EQlGLyuXARAlKkAJ9OpdJ/MzuZNh3ksjoATwPmqlHfHwCggzDA
5OXWZ81KeC04ETmfLj2rimI=
=V7sX
-----END PGP SIGNATURE-----

--JKGvNdIvrY8Ovf7Z--

Received: from dsl-206-47-80-143.kingston.net ([206.47.80.143] helo=linux.interlinx.bc.ca)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189WaC-0003fv-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2002 20:15:24 +0000
Date: Wed, 6 Nov 2002 15:45:30 -0500
To: linux-mtd@lists.infradead.org
Subject: Re: MTD Config.in items not escaped by bus availability
Message-ID: <20021106204530.GE12743@pc.ilinx>
References: <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net> <20021030185507.GA31547@wohnheim.fh-wedel.de> <20021030193834.GE27880@pc.ilinx> <20021030201608.GA28523@wohnheim.fh-wedel.de> <20021030204937.GG27880@pc.ilinx> <200211041
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="924gEkU1VlJlwnwX"
Content-Disposition: inline
In-Reply-To: <20021104171339.GB13152@wohnheim.fh-wedel.de>
From: "Brian J. Murrell" <f327b61d4f54c7b54025800b32e2ac7c@interlinx.bc.ca>
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

--924gEkU1VlJlwnwX
Content-Type: multipart/mixed; boundary="6e7ZaeXHKrTJCxdu"
Content-Disposition: inline


--6e7ZaeXHKrTJCxdu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2002 at 06:13:39PM +0100, J=F6rn Engel wrote:
>=20
> That is five architectures out of of sixteen. You might argue that
> s390 does not need mtd (which I'm not even sure about), but arm is
> definitely missing and surely some more.

You are absolutely right!  That is what I get for patching my vendor's
kernel-source rather than working with a virgin kernel.org tree.  Find
attached a new patch, covering all 16 architectures.  I don't know
what some of them are (i.e. "sh, "cris") but I am assuming they are
all hardware an all have memory busses.

> Can you add the other architectures or explain for each missing one,
> why this was not necessary? Maybe I am just stupid.

Nope, just me being stupid.  :-)

b.

--=20
Brian J. Murrell

--6e7ZaeXHKrTJCxdu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="this.diff"
Content-Transfer-Encoding: quoted-printable

diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -Nur linux-2.4.19/=
arch/alpha/defconfig linux-2.4.19-memory_bus/arch/alpha/defconfig
--- linux-2.4.19/arch/alpha/defconfig	2002-11-06 13:19:24.000000000 -0500
+++ linux-2.4.19-memory_bus/arch/alpha/defconfig	2002-11-06 13:20:26.000000=
000 -0500
@@ -51,6 +51,7 @@
 # CONFIG_ALPHA_TAKARA is not set
 # CONFIG_ALPHA_TITAN is not set
 # CONFIG_ALPHA_WILDFIRE is not set
+CONFIG_MEMORY_BUS=3Dy
 CONFIG_ISA=3Dy
 CONFIG_EISA=3Dy
 # CONFIG_SBUS is not set
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -Nur linux-2.4.19/=
arch/arm/defconfig linux-2.4.19-memory_bus/arch/arm/defconfig
--- linux-2.4.19/arch/arm/defconfig	2001-05-19 20:43:05.000000000 -0400
+++ linux-2.4.19-memory_bus/arch/arm/defconfig	2002-11-06 13:20:34.00000000=
0 -0500
@@ -71,6 +71,7 @@
 # CONFIG_ANGELBOOT is not set
 CONFIG_PCI_INTEGRATOR=3Dy
 CONFIG_PCI=3Dy
+CONFIG_MEMORY_BUS=3Dy
 # CONFIG_ISA is not set
 # CONFIG_ISA_DMA is not set
 CONFIG_PCI_NAMES=3Dy
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -Nur linux-2.4.19/=
arch/cris/defconfig linux-2.4.19-memory_bus/arch/cris/defconfig
--- linux-2.4.19/arch/cris/defconfig	2002-08-02 20:39:42.000000000 -0400
+++ linux-2.4.19-memory_bus/arch/cris/defconfig	2002-11-06 13:21:41.0000000=
00 -0500
@@ -95,6 +95,7 @@
 # CONFIG_ETRAX_IDE is not set
 CONFIG_ETRAX_AXISFLASHMAP=3Dy
 CONFIG_ETRAX_PTABLE_SECTOR=3D65536
+CONFIG_MEMORY_BUS=3Dy
 CONFIG_MTD=3Dy
 CONFIG_MTD_CFI=3Dy
 # CONFIG_MTD_CFI_INTELEXT is not set
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -Nur linux-2.4.19/=
arch/i386/defconfig linux-2.4.19-memory_bus/arch/i386/defconfig
--- linux-2.4.19/arch/i386/defconfig	2002-08-02 20:39:42.000000000 -0400
+++ linux-2.4.19-memory_bus/arch/i386/defconfig	2002-11-06 13:21:50.0000000=
00 -0500
@@ -71,6 +71,7 @@
 CONFIG_NET=3Dy
 CONFIG_X86_IO_APIC=3Dy
 CONFIG_X86_LOCAL_APIC=3Dy
+CONFIG_MEMORY_BUS=3Dy
 CONFIG_PCI=3Dy
 # CONFIG_PCI_GOBIOS is not set
 # CONFIG_PCI_GODIRECT is not set
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -Nur linux-2.4.19/=
arch/ia64/defconfig linux-2.4.19-memory_bus/arch/ia64/defconfig
--- linux-2.4.19/arch/ia64/defconfig	2002-08-02 20:39:42.000000000 -0400
+++ linux-2.4.19-memory_bus/arch/ia64/defconfig	2002-11-06 13:21:53.0000000=
00 -0500
@@ -65,6 +65,7 @@
 # CONFIG_ACPI_EC is not set
 # CONFIG_ACPI_CMBATT is not set
 # CONFIG_ACPI_THERMAL is not set
+CONFIG_MEMORY_BUS=3Dy
 CONFIG_PCI=3Dy
 CONFIG_PCI_NAMES=3Dy
 # CONFIG_HOTPLUG is not set
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -Nur linux-2.4.19/=
arch/m68k/defconfig linux-2.4.19-memory_bus/arch/m68k/defconfig
--- linux-2.4.19/arch/m68k/defconfig	2000-06-19 15:56:08.000000000 -0400
+++ linux-2.4.19-memory_bus/arch/m68k/defconfig	2002-11-06 13:22:02.0000000=
00 -0500
@@ -24,6 +24,7 @@
 # CONFIG_SUN3X is not set
 # CONFIG_SUN3 is not set
 # CONFIG_Q40 is not set
+CONFIG_MEMORY_BUS=3Dy
=20
 #
 # Processor type
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -Nur linux-2.4.19/=
arch/mips/defconfig linux-2.4.19-memory_bus/arch/mips/defconfig
--- linux-2.4.19/arch/mips/defconfig	2002-08-02 20:39:43.000000000 -0400
+++ linux-2.4.19-memory_bus/arch/mips/defconfig	2002-11-06 13:22:12.0000000=
00 -0500
@@ -90,6 +90,7 @@
 CONFIG_FORWARD_KEYBOARD=3Dy
 # CONFIG_ARC_CONSOLE is not set
 CONFIG_NET=3Dy
+CONFIG_MEMORY_BUS=3Dy
 # CONFIG_PCI is not set
 # CONFIG_ISA is not set
 # CONFIG_EISA is not set
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -Nur linux-2.4.19/=
arch/mips64/defconfig linux-2.4.19-memory_bus/arch/mips64/defconfig
--- linux-2.4.19/arch/mips64/defconfig	2002-08-02 20:39:43.000000000 -0400
+++ linux-2.4.19-memory_bus/arch/mips64/defconfig	2002-11-06 13:22:08.00000=
0000 -0500
@@ -35,6 +35,7 @@
 CONFIG_BOOT_ELF64=3Dy
 CONFIG_ARC64=3Dy
 CONFIG_MAPPED_PCI_IO=3Dy
+CONFIG_MEMORY_BUS=3Dy
 CONFIG_PCI=3Dy
 CONFIG_QL_ISP_A64=3Dy
 CONFIG_L1_CACHE_SHIFT=3D7
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -Nur linux-2.4.19/=
arch/parisc/defconfig linux-2.4.19-memory_bus/arch/parisc/defconfig
--- linux-2.4.19/arch/parisc/defconfig	2000-12-05 15:29:39.000000000 -0500
+++ linux-2.4.19-memory_bus/arch/parisc/defconfig	2002-11-06 13:22:20.00000=
0000 -0500
@@ -17,6 +17,7 @@
 CONFIG_GSC=3Dy
 CONFIG_IOMMU_CCIO=3Dy
 CONFIG_GSC_LASI=3Dy
+CONFIG_MEMORY_BUS=3Dy
 CONFIG_PCI=3Dy
 CONFIG_GSC_DINO=3Dy
 CONFIG_PCI_LBA=3Dy
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -Nur linux-2.4.19/=
arch/ppc/defconfig linux-2.4.19-memory_bus/arch/ppc/defconfig
--- linux-2.4.19/arch/ppc/defconfig	2002-02-25 14:37:55.000000000 -0500
+++ linux-2.4.19-memory_bus/arch/ppc/defconfig	2002-11-06 13:22:27.00000000=
0 -0500
@@ -47,6 +47,7 @@
 # CONFIG_EISA is not set
 # CONFIG_SBUS is not set
 # CONFIG_MCA is not set
+CONFIG_MEMORY_BUS=3Dy
 CONFIG_PCI=3Dy
 CONFIG_NET=3Dy
 CONFIG_SYSCTL=3Dy
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -Nur linux-2.4.19/=
arch/ppc64/defconfig linux-2.4.19-memory_bus/arch/ppc64/defconfig
--- linux-2.4.19/arch/ppc64/defconfig	2002-08-02 20:39:43.000000000 -0400
+++ linux-2.4.19-memory_bus/arch/ppc64/defconfig	2002-11-06 13:22:24.000000=
000 -0500
@@ -40,6 +40,7 @@
 # CONFIG_SBUS is not set
 # CONFIG_MCA is not set
 # CONFIG_EISA is not set
+CONFIG_MEMORY_BUS=3Dy
 CONFIG_PCI=3Dy
 CONFIG_NET=3Dy
 CONFIG_SYSCTL=3Dy
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -Nur linux-2.4.19/=
arch/s390/defconfig linux-2.4.19-memory_bus/arch/s390/defconfig
--- linux-2.4.19/arch/s390/defconfig	2002-08-02 20:39:43.000000000 -0400
+++ linux-2.4.19-memory_bus/arch/s390/defconfig	2002-11-06 13:22:38.0000000=
00 -0500
@@ -9,6 +9,7 @@
 CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
 # CONFIG_GENERIC_BUST_SPINLOCK is not set
 CONFIG_ARCH_S390=3Dy
+CONFIG_MEMORY_BUS=3Dy
=20
 #
 # Code maturity level options
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -Nur linux-2.4.19/=
arch/s390x/defconfig linux-2.4.19-memory_bus/arch/s390x/defconfig
--- linux-2.4.19/arch/s390x/defconfig	2002-08-02 20:39:43.000000000 -0400
+++ linux-2.4.19-memory_bus/arch/s390x/defconfig	2002-11-06 13:22:43.000000=
000 -0500
@@ -9,6 +9,7 @@
 # CONFIG_GENERIC_BUST_SPINLOCK is not set
 CONFIG_ARCH_S390=3Dy
 CONFIG_ARCH_S390X=3Dy
+CONFIG_MEMORY_BUS=3Dy
=20
 #
 # Code maturity level options
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -Nur linux-2.4.19/=
arch/sh/defconfig linux-2.4.19-memory_bus/arch/sh/defconfig
--- linux-2.4.19/arch/sh/defconfig	2001-10-15 16:36:48.000000000 -0400
+++ linux-2.4.19-memory_bus/arch/sh/defconfig	2002-11-06 13:23:12.000000000=
 -0500
@@ -49,6 +49,7 @@
 # CONFIG_KCORE_AOUT is not set
 CONFIG_BINFMT_ELF=3Dy
 # CONFIG_BINFMT_MISC is not set
+CONFIG_MEMORY_BUS=3Dy
=20
 #
 # Parallel port support
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -Nur linux-2.4.19/=
arch/sparc/defconfig linux-2.4.19-memory_bus/arch/sparc/defconfig
--- linux-2.4.19/arch/sparc/defconfig	2002-08-02 20:39:43.000000000 -0400
+++ linux-2.4.19-memory_bus/arch/sparc/defconfig	2002-11-06 13:23:19.000000=
000 -0500
@@ -43,6 +43,7 @@
 CONFIG_SUN_PM=3Dy
 # CONFIG_SUN4 is not set
 # CONFIG_PCI is not set
+CONFIG_MEMORY_BUS=3Dy
 CONFIG_SUN_OPENPROMFS=3Dm
 CONFIG_NET=3Dy
 CONFIG_SYSVIPC=3Dy
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -Nur linux-2.4.19/=
arch/sparc64/defconfig linux-2.4.19-memory_bus/arch/sparc64/defconfig
--- linux-2.4.19/arch/sparc64/defconfig	2002-08-02 20:39:43.000000000 -0400
+++ linux-2.4.19-memory_bus/arch/sparc64/defconfig	2002-11-06 13:23:15.0000=
00000 -0500
@@ -42,6 +42,7 @@
 CONFIG_SUN_CONSOLE=3Dy
 CONFIG_SUN_AUXIO=3Dy
 CONFIG_SUN_IO=3Dy
+CONFIG_MEMORY_BUS=3Dy
 CONFIG_PCI=3Dy
 CONFIG_RTC=3Dy
 # CONFIG_PCI_NAMES is not set
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -Nur linux-2.4.19/=
drivers/mtd/chips/Config.in linux-2.4.19-memory_bus/drivers/mtd/chips/Confi=
g.in
--- linux-2.4.19/drivers/mtd/chips/Config.in	2001-10-04 18:13:18.000000000 =
-0400
+++ linux-2.4.19-memory_bus/drivers/mtd/chips/Config.in	2002-11-06 13:27:39=
.000000000 -0500
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
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -Nur linux-2.4.19/=
drivers/mtd/devices/Config.in linux-2.4.19-memory_bus/drivers/mtd/devices/C=
onfig.in
--- linux-2.4.19/drivers/mtd/devices/Config.in	2001-10-04 18:13:18.00000000=
0 -0400
+++ linux-2.4.19-memory_bus/drivers/mtd/devices/Config.in	2002-11-06 13:27:=
39.000000000 -0500
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
    dep_tristate '  M-Systems Disk-On-Chip 1000' CONFIG_MTD_DOC1000 $CONFIG=
_MTD
    dep_tristate '  M-Systems Disk-On-Chip 2000 and Millennium' CONFIG_MTD_=
DOC2000 $CONFIG_MTD
    dep_tristate '  M-Systems Disk-On-Chip Millennium-only alternative driv=
er (see help)' CONFIG_MTD_DOC2001 $CONFIG_MTD
@@ -50,6 +51,7 @@
          bool '    Probe for 0x55 0xAA BIOS Extension Signature' CONFIG_MT=
D_DOCPROBE_55AA
       fi
    fi
+fi
=20
=20
 endmenu
diff --exclude '*.swp' --exclude '*.orig' --exclude '*~' -Nur linux-2.4.19/=
drivers/mtd/nand/Config.in linux-2.4.19-memory_bus/drivers/mtd/nand/Config.=
in
--- linux-2.4.19/drivers/mtd/nand/Config.in	2001-10-04 18:13:18.000000000 -=
0400
+++ linux-2.4.19-memory_bus/drivers/mtd/nand/Config.in	2002-11-06 13:27:40.=
000000000 -0500
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

--6e7ZaeXHKrTJCxdu--

--924gEkU1VlJlwnwX
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9yX9pl3EQlGLyuXARAqymAKCKaSU3GqQz2Or6Dvy0FP4Gr4uW/wCg/Ytf
AAMpRjAGjEXVNL0Pc4YQhmo=
=nhk5
-----END PGP SIGNATURE-----

--924gEkU1VlJlwnwX--

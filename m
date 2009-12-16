Received: from mailout5.samsung.com ([203.254.224.35])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NKsUf-0002GR-LQ
	for linux-mtd@lists.infradead.org; Wed, 16 Dec 2009 11:56:42 +0000
Received: from epmmp2 (mailout5.samsung.com [203.254.224.35])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KUQ00AVZUI853@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 16 Dec 2009 20:56:33 +0900 (KST)
Received: from Sarathbabu ([107.108.214.67])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KUQ00MKLUI6KQ@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 16 Dec 2009 20:56:32 +0900 (KST)
From: Tadimarri Sarath Babu <sarath.babu@samsung.com>
Subject: OMAP2 issue  while compiling the latest  mtd-2.6 git kernel
To: linux-mtd@lists.infradead.org
Message-id: <B7CE3954677D49918AFD7F04C26CF882@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <20091214121439.GC28375@buzzloop.caiaq.de>
	<1260795633.11112.49.camel@localhost>
	<20091214135614.GC16448@hansolo.jdub.homelinux.org>
	<87zl5lr525.fsf@macbook.be.48ers.dk>
	<20091214155947.GD16448@hansolo.jdub.homelinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Wed, 16 Dec 2009 11:56:42 -0000

Hi ,

I am facing the following problem while compiling the mtd2.6 git kernel .
I used the arch/arm/configs/omap_apollon_2420_defconfig  as the config file
and used the arm-2009q1/arm-none-linux-gnueabi- compiler for compiling.

Log :
# make
  CHK     include/linux/version.h
make[1]: `include/asm-arm/mach-types.h' is up to date.
  CHK     include/linux/utsrelease.h
  SYMLINK include/asm -> include/asm-arm
  CALL    scripts/checksyscalls.sh
<stdin>:1351:2: warning: #warning syscall migrate_pages not implemented
  CHK     include/linux/compile.h
  CC      arch/arm/mach-omap2/devices.o
arch/arm/mach-omap2/devices.c: In function 'omap_init_mcspi':
arch/arm/mach-omap2/devices.c:365: error: 'omap2_mcspi3_resources' undeclared (first use in this 
function)
arch/arm/mach-omap2/devices.c:365: error: (Each undeclared identifier is reported only once
arch/arm/mach-omap2/devices.c:365: error: for each function it appears in.)
arch/arm/mach-omap2/devices.c:367: error: 'omap2_mcspi4_resources' undeclared (first use in this 
function)
make[1]: *** [arch/arm/mach-omap2/devices.o] Error 1
make: *** [arch/arm/mach-omap2] Error 2

Regards,
Sarath. 

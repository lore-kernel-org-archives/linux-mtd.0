Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NSmBL-0005jU-9M
	for linux-mtd@lists.infradead.org; Thu, 07 Jan 2010 06:49:23 +0000
Subject: Re: OMAP2 issue  while compiling the latest  mtd-2.6 git kernel
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tadimarri Sarath Babu <sarath.babu@samsung.com>
In-Reply-To: <B7CE3954677D49918AFD7F04C26CF882@sisodomain.com>
References: <20091214121439.GC28375@buzzloop.caiaq.de>
	<1260795633.11112.49.camel@localhost>
	<20091214135614.GC16448@hansolo.jdub.homelinux.org>
	<87zl5lr525.fsf@macbook.be.48ers.dk>
	<20091214155947.GD16448@hansolo.jdub.homelinux.org>
	<B7CE3954677D49918AFD7F04C26CF882@sisodomain.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 07 Jan 2010 08:47:57 +0200
Message-Id: <1262846877.21915.24.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-12-16 at 17:22 +0530, Tadimarri Sarath Babu wrote:
> Hi ,
> 
> I am facing the following problem while compiling the mtd2.6 git kernel .
> I used the arch/arm/configs/omap_apollon_2420_defconfig  as the config file
> and used the arm-2009q1/arm-none-linux-gnueabi- compiler for compiling.
> 
> Log :
> # make
>   CHK     include/linux/version.h
> make[1]: `include/asm-arm/mach-types.h' is up to date.
>   CHK     include/linux/utsrelease.h
>   SYMLINK include/asm -> include/asm-arm
>   CALL    scripts/checksyscalls.sh
> <stdin>:1351:2: warning: #warning syscall migrate_pages not implemented
>   CHK     include/linux/compile.h
>   CC      arch/arm/mach-omap2/devices.o
> arch/arm/mach-omap2/devices.c: In function 'omap_init_mcspi':
> arch/arm/mach-omap2/devices.c:365: error: 'omap2_mcspi3_resources' undeclared (first use in this 
> function)
> arch/arm/mach-omap2/devices.c:365: error: (Each undeclared identifier is reported only once
> arch/arm/mach-omap2/devices.c:365: error: for each function it appears in.)
> arch/arm/mach-omap2/devices.c:367: error: 'omap2_mcspi4_resources' undeclared (first use in this 
> function)
> make[1]: *** [arch/arm/mach-omap2/devices.o] Error 1
> make: *** [arch/arm/mach-omap2] Error 2

You should CC the OMAP mailing list and the OMAP maintainer. See the
MAINTAINERS file.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

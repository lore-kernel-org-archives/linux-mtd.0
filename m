Date: Wed, 4 Aug 2010 14:41:29 +0200
From: Christian Dietrich <qy03fugy@stud.informatik.uni-erlangen.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Roman Zippel <zippel@linux-m68k.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Finn Thain <fthain@telegraphics.com.au>,
	Greg Kroah-Hartman <gregkh@suse.de>, John Stultz <johnstul@us.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Sam Creasey <sammy@sammy.net>,
	Greg Ungerer <gerg@uclinux.org>, Christoph Hellwig <hch@lst.de>,
	Maxim Kuvyrkov <maxim@codesourcery.com>,
	Lennart Sorensen <lsorense@csclub.uwaterloo.ca>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>, Joe Perches <joe@perches.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier@gentoo.org>, Jiri Kosina <jkosina@suse.cz>,
	Alexander Kurz <linux@kbdbabel.org>, Michael Roth <mroth@nessie.de>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Ralf Baechle <ralf@linux-mips.org>, Manuel Lauss <manuel.lauss@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Wolfram Sang <w.sang@pengutronix.de>,
	Grant Likely <grant.likely@secretlab.ca>,
	Sean MacLennan <smaclennan@pikatech.com>,
	Anatolij Gustschin <agust@denx.de>, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-pcmcia@lists.infradead.org
Subject: [PATCH 0/9] Removing dead code
Message-ID: <cover.1280924671.git.qy03fugy@stud.informatik.uni-erlangen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: vamos-dev@i4.informatik.uni-erlangen.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all!
       
        As part of the VAMOS[0] research project at the University of
Erlangen we are looking at multiple integrity errors in linux'
configuration system.

        I've been running a check on the arch/m68k{,nommu} sourcetree for
config Items not defined in Kconfig and found 9 such cases. Sourcecode
blocks depending on these Items are not reachable from a vanilla
kernel -- dead code. I've seen such dead blocks made on purpose
e.g. while integrating new features into the kernel but generally
they're just useless.

        Each of the patches in this patchset removes on such dead
config Item, I'd be glad if you consider applying them. I've been
doing deeper analysis of such issues before and can do so again but
I'm not so sure they were fastly usefull.

In lack of an m68k cross compiler i was not able to build the kernel
against this patches. I don't think that they will crash the
compiling, but i'm not totally sure.

        Please keep me informed of this patch getting confirmed /
merged so we can keep track of it.

Regards

        Christian Dietrich

[0] http://vamos1.informatik.uni-erlangen.de/

Christian Dietrich (9):
  arch/m68k: Removing dead GG2 config option
  arch/m68k: Removing dead BSEIP config option
  arch/m68k{,nommu}: Removing dead SMP config option
  Removing dead CONFIG_RPX(LITE|CLASSIC)
  arch/m68knommu: Removing dead M68000 config option
  arch/m68knommu: Removing dead RELOCATE config option
  arch/m68knommu: Removing dead M68KFPU_EMU config option
  arch/m68knommu: Removing dead RAM_{16,32}_MB config option
  arch/m68knommu: Removing dead 68328_SERIAL_UART2 config option

 arch/m68k/Kconfig                        |    4 +-
 arch/m68k/include/asm/amigahw.h          |    1 -
 arch/m68k/include/asm/commproc.h         |   39 --------------
 arch/m68k/include/asm/io_mm.h            |   37 --------------
 arch/m68k/include/asm/system_mm.h        |    2 -
 arch/m68k/include/asm/system_no.h        |    9 ---
 arch/m68k/kernel/setup.c                 |    6 --
 arch/m68k/kernel/time.c                  |    2 -
 arch/m68k/sun3/sun3ints.c                |    8 +--
 arch/m68knommu/kernel/ptrace.c           |   18 -------
 arch/m68knommu/kernel/setup.c            |    3 -
 arch/m68knommu/kernel/time.c             |    3 +-
 arch/m68knommu/kernel/traps.c            |   13 -----
 arch/m68knommu/platform/68328/head-de2.S |    6 --
 arch/m68knommu/platform/68328/head-ram.S |   27 ----------
 arch/m68knommu/platform/68VZ328/config.c |    5 --
 drivers/mtd/maps/Kconfig                 |   10 ----
 drivers/mtd/maps/Makefile                |    1 -
 drivers/mtd/maps/rpxlite.c               |   64 -----------------------
 drivers/pcmcia/m8xx_pcmcia.c             |   81 ------------------------------
 drivers/serial/68328serial.h             |    5 --
 21 files changed, 6 insertions(+), 338 deletions(-)
 delete mode 100644 drivers/mtd/maps/rpxlite.c

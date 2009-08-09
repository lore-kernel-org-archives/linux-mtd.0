Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ma2cX-0007Yh-V9
	for linux-mtd@lists.infradead.org; Sun, 09 Aug 2009 07:15:14 +0000
Subject: Re: [PATCH V7] Nand driver for Nomadik 8815 SoC (on NHK8815 board)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alessandro Rubini <rubini-list@gnudd.com>
In-Reply-To: <20090729165156.GA1471@mail.gnudd.com>
References: <20090729165156.GA1471@mail.gnudd.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 09 Aug 2009 10:13:22 +0300
Message-Id: <1249802002.9157.57.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: STEricsson_nomadik_linux@list.st.com, vimal.newwork@gmail.com,
	andrea.gallo@stericsson.com, linux-mtd@lists.infradead.org,
	linux@arm.linux.org.uk
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-07-29 at 18:51 +0200, Alessandro Rubini wrote:
> From: Alessandro Rubini <rubini@unipv.it>
> 
> 
> Signed-off-by: Alessandro Rubini <rubini@unipv.it>
> Acked-by: Andrea Gallo <andrea.gallo@stericsson.com>
> Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
> ---
> 
> The patch applies to rmk's devel tree.
> 
> Changes in V7:
> 	- removed unused static function
> 	- use linux/io.h not asm/io.h
> 	- untabbed a too-tabbed lined
> 	- remove wrong headers in commit message (I made a mess)
> 
> changes in V6:
>         - blindly applied checkpatch suggestions (even if I disagree)
>         - switched to pm_ops
>         - declare soft ecc instead of hard
> 
> The last point makes the driver non-working unless the patch by Vimal Singh
> at http://patchwork.ozlabs.org/patch/13697/ is applied.
> 
> 
>  arch/arm/configs/nhk8815_defconfig        |    2 +-
>  arch/arm/mach-nomadik/board-nhk8815.c     |   92 +++++++++++
>  arch/arm/mach-nomadik/include/mach/fsmc.h |   29 ++++
>  arch/arm/mach-nomadik/include/mach/nand.h |   16 ++
>  drivers/mtd/nand/Kconfig                  |    6 +
>  drivers/mtd/nand/Makefile                 |    1 +
>  drivers/mtd/nand/nomadik_nand.c           |  250 +++++++++++++++++++++++++++++
>  7 files changed, 395 insertions(+), 1 deletions(-)
>  create mode 100644 arch/arm/mach-nomadik/include/mach/fsmc.h
>  create mode 100644 arch/arm/mach-nomadik/include/mach/nand.h
>  create mode 100644 drivers/mtd/nand/nomadik_nand.c

I wanted to put this to my l2-mtd-2.6.git tree, but the patch cannot be
applied because it does not seem to be a standalone patch, e.g.,
arch/arm/configs/nhk8815_defconfig does not exist in my tree.

So you should either split this better or have this merged via some ARM
tree with the rest of the patches.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

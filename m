Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TMZZq-0003JT-Cx
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2012 07:22:35 +0000
Date: Fri, 12 Oct 2012 09:22:21 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] [RFC] mtd/uclinux: support ROM and allow passing the
 base address
Message-ID: <20121012072221.GB639@pengutronix.de>
References: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <50739A2A.9070405@snapgear.com>
 <20121009084418.GH18531@pengutronix.de>
 <5073FE55.2000402@snapgear.com>
 <CAMjpGUe_aTEjGF9q1uraU_ikCif0J-+bSTLkr-X6jEYqjMHOtQ@mail.gmail.com>
 <5077B167.40009@snapgear.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5077B167.40009@snapgear.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Mike Frysinger <vapier.adi@gmail.com>, Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Fri, Oct 12, 2012 at 03:57:59PM +1000, Greg Ungerer wrote:
> >so to be clear, Uwe's patch hasn't been picked up by anyone yet so we
> >can get it fixed first ?
ok, so for blackfin uclinux_ram_map must not be static because it is
used in arch/blackfin/kernel/setup.c. If I tried to introduce such code
for an ARM platform people would run away scared maybe after telling me
I should fix my boot loader.  I really don't know the situation on
blackfin, but this really has potential for generalisation. But I don't
even know if you have/need a boot loader at all there. Here is what I
found quickly:

diff --git a/arch/blackfin/kernel/setup.c b/arch/blackfin/kernel/setup.c
index fb96e60..24478a2 100644
--- a/arch/blackfin/kernel/setup.c
+++ b/arch/blackfin/kernel/setup.c
@@ -583,7 +583,7 @@ static __init void memory_setup(void)
 
 #ifdef CONFIG_MPU
 	/* Round up to multiple of 4MB */
-	memory_start = (_ramstart + 0x3fffff) & ~0x3fffff;
+	memory_start = ALIGN(_ramstart, 0x400000);
 #else
 	memory_start = PAGE_ALIGN(_ramstart);
 #endif
@@ -593,6 +593,13 @@ static __init void memory_setup(void)
 	memory_mtd_end = memory_end;
 
 	mtd_phys = _ramstart;
+
+	/*
+	 * Since the default MTD_UCLINUX has no magic number, we just blindly
+	 * read 8 past the end of the kernel's image, and look at it.
+	 * When no image is attached, mtd_size is set to a random number.
+	 * So do some basic sanity checks before operating on things.
+	 */
 	mtd_size = PAGE_ALIGN(*((unsigned long *)(mtd_phys + 8)));
 
 # if defined(CONFIG_EXT2_FS) || defined(CONFIG_EXT3_FS)
@@ -621,11 +628,6 @@ static __init void memory_setup(void)
 	}
 # endif				/* CONFIG_ROMFS_FS */
 
-	/* Since the default MTD_UCLINUX has no magic number, we just blindly
-	 * read 8 past the end of the kernel's image, and look at it.
-	 * When no image is attached, mtd_size is set to a random number
-	 * Do some basic sanity checks before operating on things
-	 */
 	if (mtd_size == 0 || memory_end <= mtd_size) {
 		pr_emerg("Could not find valid ram mtd attached.\n");
 	} else {

If you had a boot loader, my patch (making the location of the uclinux
map settable by a kernel parameter) should be a move in the right
direction for you, too.

I will fix my patch keeping uclinux_ram_map non-static and resend.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

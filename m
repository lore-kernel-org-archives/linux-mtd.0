Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZMHn-0007XZ-RN
 for linux-mtd@lists.infradead.org; Fri, 26 Feb 2016 17:34:41 +0000
Received: by mail-wm0-x233.google.com with SMTP id a4so79159288wme.1
 for <linux-mtd@lists.infradead.org>; Fri, 26 Feb 2016 09:34:19 -0800 (PST)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 dan.j.williams@intel.com, linux@arm.linux.org.uk
Cc: robert.jarzmik@free.fr,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH v2 0/3] fix memremap on ARM
Date: Fri, 26 Feb 2016 18:34:10 +0100
Message-Id: <1456508053-15015-1-git-send-email-ard.biesheuvel@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is something I ran into while working on support for the UEFI
memory attributes and ESRT tables. In both cases, these tables are
passed to the kernel in memory which is guaranteed to be below 4 GB,
but may be outside of the kernel direct mapping. (UEFI typically
attempts to allocate from the top down, which means such tables are
highly likely to be in highmem for any system with more than 760 MB
of system RAM)

The recently introduced memremap() is a very useful abstraction for
accessing such tables, because it is generic, and already attempts to
do the right thing with respect to regions that may already have been
mapped directly. However, it falls back to ioremap_cache() for mapping
high memory, which is not allowed on ARM for system RAM, and also results
in the region to be mapped with different attributes depending on whether
it is covered by lowmem or not.

So instead, create an arch specific hook 'arch_memremap_wb(), and
implement it for ARM using the same memory attributes used for the
linear mapping. Note that memremap will only call this hook for regions
that are not already mapped permanently.

Since this change results in memremap() to use attributes different from
the ones used by ioremap_cache(), revert the change to pxa2xx-flash that
moved it to memremap.

Changes since v1/rfc:
- new patch #1 that reverts the ioremap_cache->memremap conversion for the
  pxa2xx-flash driver
- added Dan's ack to patch #2

Ard Biesheuvel (3):
  Revert "mtd: pxa2xx-flash: switch from ioremap_cache to memremap"
  memremap: add arch specific hook for MEMREMAP_WB mappings
  ARM: memremap: implement arch_memremap_wb()

 arch/arm/include/asm/io.h       |  3 +++
 arch/arm/mm/ioremap.c           | 11 +++++++++--
 drivers/mtd/maps/pxa2xx-flash.c |  6 +++---
 kernel/memremap.c               | 11 ++++++++---
 4 files changed, 23 insertions(+), 8 deletions(-)

-- 
2.5.0

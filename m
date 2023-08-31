Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8E0C83F01
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Aug 2023 11:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GKl3RY+hUXpMILBLIn93FgG+0QMlrd+Us20pV2xoB8Y=; b=B9mKgT1iwegoLQ
	KhsSpIWudCxLhm1r64H6fpaSn8GKK+VzL0eFjLckYlXn6d+B4UhS7qZu1SBJElzF6Bhu8QszE5jAg
	9LBlgpHK5WKV45ZdOjNesuBeQG20So+ntmxtUeV/UuWv2/egCLbfWIDHhvFO3kYrsqBUXLfxxRimZ
	GruYoMC4aTvexDGSu7ncUkLUyDsgjNsiDVI9cQrBCUagPc/oIQTykFH5Sl9RVe0HRgVoS7ObNXcny
	kjc27EhOheN0kJ60t5qMiaC7ZQk5MZPRBJWL3eYnfZ+n9tHgdqr1wYUfa1fZN5CVdF5MKSYDd6lcF
	CAnNyTSbZFasEdD/uDXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbfgf-00FBRI-2c;
	Thu, 31 Aug 2023 11:18:09 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbfgV-00FBLP-2C
	for linux-mtd@lists.infradead.org;
	Thu, 31 Aug 2023 11:18:03 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
	by xavier.telenet-ops.be with bizsmtp
	id gBHs2A00Y3874jb01BHs0h; Thu, 31 Aug 2023 13:17:53 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qbfgC-0026un-5m;
	Thu, 31 Aug 2023 13:17:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qbfgO-00CHXo-JG;
	Thu, 31 Aug 2023 13:17:52 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/4] ARM: shmobile: Reserve boot area when SMP is enabled
Date: Thu, 31 Aug 2023 13:17:43 +0200
Message-Id: <cover.1693409184.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_041759_895126_CB839202 
X-CRM114-Status: GOOD (  31.67  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

	Hi all,

On Renesas ARM SoCs predating R-Car Gen3, CPU core bringup does not use
a hardware register to program the CPU boot address directly.  Instead,
it uses a set of registers (thus not involving the MMU) to remap any CPU
access to the page(s) at physical address zero to the specified address
block containing the CPU core startup code.  the MMU.  Hence when this
is enabled, any device residing in this low part of physical address
space cannot be accessed.  On some boards, a CFI FLASH lives there.

Hence this causes conflicts between CPU onlining and FLASH operation:
  - Reading the first page(s) of FLASH returns the CPU startup code
    instead of the FLASH contents,
  - CFI FLASH probing fails, as it operates on the RAM that contains the
    CPU startup code.  Moreover, as this probing involves writes, it
    corrupts the CPU startup code, causing any subsequent CPU onlining
    to fail.

CPU cores can be onlined in 3 places:
  A. Secondary core bringup, during early boot (FLASH not yet in use),
  B. Enabling secondary CPUs when resuming after s2ram (FLASH not in
     use),
  C. Manual CPU hotplug (at any time, FLASH may or may not be in use).

Possible solutions:
  1. Disable FLASH in SMP initialization:
       - Simple to implement,
       - Accessing the FLASH from Linux needs a reboot with nosmp.

  2. Disable SMP when FLASH@0 is used:
       - How to check if @0 is actually used/mapped?
         SMP is initialized before FLASH.

  3. Map core startup code only when needed:
      - Unmap core startup code after secondary core bringup,
      - Map/unmap core startup code during s2ram suspend/resume,
      - Call cpu_hotplug_disable() from smp_cpus_done(),
	  - CPU hotplug is broken.
	  - How to check if @0 is actually used/mapped?

  4. As this FLASH is typically used to boot the system, Marek suggested
     to fix this in the boot loader (e.g. put a (modified) copy of the
     CPU bringup code in FLASH).  But I think this is fragile, and cannot
     be a generic solution, as there are other ways to boot the system,
     and the FLASH may be used for other purposes.

This patch series implements solution 1, by marking the boot area region
reserved during SMP initialization (an alternative method would be to
disable any device node in DT that resides in this area).  Subsequent
probing of FLASH will fail with -EBUSY:

    physmap-flash 0.flash: can't request region for resource [mem 0x00000000-0x03ffffff]
    physmap-flash: probe of 0.flash failed with error -16

When CONFIG_SMP is disabled, or when booted with "nosmp", the FLASH
is available again.

The first patch is a small cleanup in code affected by the third patch.
The other three patches fix the issue on R-Car Gen2 (and RZ/G1), R-Car
H1, and SH-Mobile AG5 SoCs.

Other Renesas SoCs:
  - R-Mobile APE6 is also affected, but has no upstream SMP support yet,
  - EMMA Mobile EV2 is unaffected, as it uses internal boot ROM code
    that watches a special general purpose register in the SMU block,
  - RZ/N1 is not affected, as it uses a "cpu-release-addr" property in
    DT,
  - R-Car Gen3 is not affected, as it extended the R-Car Gen2 RST block
    with Cortex-A53/A57 Boot Address Registers for 64-bit mode
    (CA5[37]CPUnBAR[HL]), which control the boot address directly,
  - R-Car Gen4 is not affected, as it has Reset Vector Base Address
    Registers (RVBAR[HL]Cn), which control the boot address directly.

This series has been tested on R-Car V2H (Blanche) and R-Car H1
(Marzen).  With this, the CFI FLASHes on Marzen[1] and Blanche (DTS
patch to be posted) work when booted with nosmp.

Thanks for your comments!

[1] "[PATCH/RFC] ARM: dts: marzen: Add FLASH node"
    https://lore.kernel.org/r/07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be/

Geert Uytterhoeven (4):
  ARM: shmobile: rcar-gen2: Remove unneeded once handling
  ARM: shmobile: rcar-gen2: Reserve boot area when SMP is enabled
  ARM: shmobile: r8a7779: Reserve boot area when SMP is enabled
  ARM: shmobile: sh73a0: Reserve boot area when SMP is enabled

 arch/arm/mach-shmobile/pm-rcar-gen2.c |  5 +++--
 arch/arm/mach-shmobile/smp-r8a7779.c  |  9 ++++++++-
 arch/arm/mach-shmobile/smp-sh73a0.c   | 10 ++++++++--
 3 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

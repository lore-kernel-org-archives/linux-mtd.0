Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1an09C-00055L-8N
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2016 08:46:11 +0000
Received: by mail-oi0-x22e.google.com with SMTP id w85so26880496oiw.0
 for <linux-mtd@lists.infradead.org>; Mon, 04 Apr 2016 01:45:48 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 4 Apr 2016 10:45:48 +0200
Message-ID: <CACRpkdZxrhkL7a6DG3frKeR+=xF6X4nczepAbqj1PGDs3VsmMQ@mail.gmail.com>
Subject: [GIT PULL] move Versatile flash protection to the device tree
From: Linus Walleij <linus.walleij@linaro.org>
To: "arm@kernel.org" <arm@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Russell King - ARM Linux <linux@arm.linux.org.uk>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi ARM SoC folks,

now I'm tired of waiting for the MTD maintainers' word on this patch
series. I sent a question about this approach on february 13:
http://marc.info/?l=linux-arm-kernel&m=145537026603174&w=2

With subsequent pings on feb 22, mar 5, mar 31, and the cleanup
missing the merge window.

As you can see the flash protection patch also caters for the
RealView flash protection bits.

Please pull this into the ARM SoC tree for testing in linux-next
for the v4.7 series. If the MTD people appear again and have issues
you can always drop the branch.

Yours,
Linus Walleij

The following changes since commit 9735a22799b9214d17d3c231fe377fc852f042e9:

  Linux 4.6-rc2 (2016-04-03 09:09:40 -0500)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/versatile-flash-for-arm-soc

for you to fetch changes up to 91011a7605822cd9c16eabcd1cc11ae31d604bfd:

  ARM: integrator: move flash registration to device tree (2016-04-04
10:33:16 +0200)

----------------------------------------------------------------
This is a set of patches removing the board file code
for Versatile flash handling and instead moving it over
to the device tree and a special add-on file.

----------------------------------------------------------------
Linus Walleij (4):
      mtd: physmap_of: add a hook for Versatile write protection
      mtd: augment the "arm,versatile-flash" bindings
      ARM: versatile: move flash registration to the device tree
      ARM: integrator: move flash registration to device tree

 .../devicetree/bindings/mtd/arm-versatile.txt      |  20 +-
 arch/arm/boot/dts/integrator.dtsi                  |   3 +-
 arch/arm/boot/dts/versatile-ab.dts                 |   5 +-
 arch/arm/mach-integrator/integrator_ap.c           |  62 -----
 arch/arm/mach-integrator/integrator_cp.c           |  51 -----
 arch/arm/mach-versatile/versatile_dt.c             |  47 ----
 drivers/mtd/maps/Kconfig                           |  10 +
 drivers/mtd/maps/Makefile                          |   1 +
 drivers/mtd/maps/physmap_of.c                      |   6 +
 drivers/mtd/maps/physmap_of_versatile.c            | 253 +++++++++++++++++++++
 drivers/mtd/maps/physmap_of_versatile.h            |  16 ++
 11 files changed, 310 insertions(+), 164 deletions(-)
 create mode 100644 drivers/mtd/maps/physmap_of_versatile.c
 create mode 100644 drivers/mtd/maps/physmap_of_versatile.h

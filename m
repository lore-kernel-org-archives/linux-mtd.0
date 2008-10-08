Date: Wed, 8 Oct 2008 21:32:55 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org, nico@cam.org
Subject: [RFC/PATCH 0/8] LPDDR a new kind of non-volatile memoriy
Message-ID: <alpine.LFD.1.10.0810082126400.10610@casper.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: vasiliy.leonenko@mail.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi


I'd like to present a  set of patches which introduces support of new kind 
of non-volatile memory intended to work on devices with LPDDR bus.
LPDDR non voliatile memories behavior is described in standard
http://www.jedec.org/Home/press/press_release/07-NV1-Brelease11-29-07.pdf

LPDDR non volatile memory interface is intended to solve the same tasks
as CFI for platforms with LPDDR bus.
The main difference between original CFI chips and non-CFI LPDDR chips
is related to existence of the overlay window (PFOW). All commands, device
information, chip status should be transfered/recieved through the PFOW.

For eaxmple if we are doing erase operation chip will be in
read array mode (no in status mode) and chip status can be recieved by
reading the particular field inside the PFOW. It should bring nice
features in future; as well as grouped and well extendable device
capabilities list based on new standard of quinfo records.

The only serious disadvantage of having overlay window is related to
platform dependency as PFOW could be opened or closed by LPDDR memory 
controller which implementation depends on platform.

Our primary goal was to develop platform independed code. So we decided
to place place memory controller configuration and setting up PFOW window 
on shoulders of bootloader.

In other aspects LPDDR implementation is close to NOR flash chips.
LPDDR memory performs similar functions as CFI chips. As legacy CFI
flashes LPDDR chips needs to be mapped into memory region.

Special thanks to
Roman Borisov for intial enabling,
Vasilliy Leonenko for help in development and validation
Jared Hulbert for code reviews and good advices



 drivers/mtd/Kconfig         |    2 ++
 drivers/mtd/Makefile        |    2 +-
 drivers/mtd/maps/Kconfig    |   14 ++++++++++++--
 drivers/mtd/maps/physmap.c  |   11 ++++++++++-
 include/linux/mtd/map.h     |    1 +
 include/linux/mtd/physmap.h |    1 +
 drivers/mtd/lpddr/Kconfig       |   22 +
 drivers/mtd/lpddr/Makefile      |    6 +
 drivers/mtd/lpddr/lpddr_cmds.c  |  808+++++++++++++++++++++++++++++++++++++++
 drivers/mtd/lpddr/qinfo_probe.c |  255 ++++++++++++
 include/linux/mtd/pfow.h        |  159 ++++++++
 include/linux/mtd/qinfo.h       |   91 +++++
 12 files changed, 1368 insertions(+), 4 deletions(-)

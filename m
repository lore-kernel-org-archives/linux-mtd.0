Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOXq5-0001nY-Pr
 for linux-mtd@lists.infradead.org; Tue, 24 Sep 2013 19:00:02 +0000
Date: Tue, 24 Sep 2013 15:59:34 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 00/21] Armada 370/XP NAND support
Message-ID: <20130924185933.GC5423@localhost>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Thu, Sep 19, 2013 at 01:01:24PM -0300, Ezequiel Garcia wrote:
> Hi everyone,
> 
> As some of you know, I'm working on implementing the long-awaited NAND
> support in Armada 370/XP SoCs.
> 
> The controller is the same as PXA3XX (NFCv1), plus some changes,
> and therefore it's called NFCv2. As expected, it should be supported
> by pxa3xx-nand, plus some changes.
> 
> First of all I'd like to introduce the controller and explain how it
> expects the data, ECC and OOB layout within a page. We might add this
> as documentation inside the driver or in Documentation/mtd, so feel free
> to ask anything that looks suspicious or is not clear enough.
> 
> * Page layout
> 
> The controller has a 2176 bytes FIFO buffer. Therefore, in order to support
> larger pages, I/O operations on 4 KiB and 8 KiB pages is done with a set of
> chunked transfers.
> 
> For instance, if we choose a 2048 data chunk and BCH ECC we will have
> to use this layout in the pages:
> 
>   ------------------------------------------------------------------------------
>   | 2048B data | 32B spare | 30B ECC || 2048B data | 32B spare | 30B ECC | ... |
>   ------------------------------------------------------------------------------
> 
> The last remaining area is unusable (i.e. wasted).
> 
> To match this, my current (already working!) implementation acts like
> a layout "impedance matcher" to produce in an internal driver's buffer
> this layout:
> 
>   ------------------------------------------
>   |     4096B data     |     64B spare     |
>   ------------------------------------------
> 
> In order to achieve reading (for instance), we issue several READ0 commands
> (with some additional controller-specific magic) and read two chunks of 2080B
> (2048 data + 64 spare) each.
> 
> The driver accomodates this data to expose the NAND base a contiguous 4160B buffer
> (4096 data + 64 spare).
> 
> * ECC
> 
> The controller has built-in hardware ECC capabilities. In addition it is completely
> configurable, and we can choose between Hamming and BCH ECC. If we choose BCH ECC
> then the ECC code will be calculated for each transfered chunk and expected to be
> located (when reading/programming) at specific locations.
> 
> So, repeating the above scheme, a 2048B data chunk will be followed by 32B spare,
> and then the ECC controller will read/write the ECC code (30B in this case):
> 
>   ------------------------------------
>   | 2048B data | 32B spare | 30B ECC |
>   ------------------------------------
> 
> * OOB
> 
> Because of the above scheme, and because the "spare" OOB is really located in
> the middle of a page, spare OOB cannot be read or write independently of the
> data area. In other words, in order to read the OOB (aka READOOB), the entire
> page (aka READ0) has to be read.
> 
> In the same sense, in order to write to the spare OOB (aka SEQIN,
> column = 4096 + PAGEPROG) the driver has to read the entire page first to the
> driver's buffer. Then it should fill the OOB, and finally program the entire page,
> data and oob included.
> 
> Notice, that while this is possible, I haven't included OOB only write support
> (i.e. OOB write without data write) in this first patchset. I'm not sure why
> would we need it, so I'd like to know others opinion on this matter.
> 
> Of course, writing to the OOB is supported, as long as this write is done
> *with* data. Following the examples above, writing an entire 4096 + OOB page
> is supported.
> 
> * Clocking and timings
> 
> This first patchset adds a dummy nand-clock to the device tree just to allow
> the driver to get it. Timings configuration is overriden for now using the
> 'keep-config' DT parameter. The next round will likely include proper clock
> support plus timings configuration.
> 
> * About this patchset
> 
> This has been tested on Armada 370 Mirabox and Armada XP GP boards.
> 
> Currently nandtest, mtd_pagetest, mtd_readtest pass while mtd_oobtest fails
> (due to lack of OOB write support). This means that JFFS2 is not supported,
> and UBIFS is a must.
> 
> The patches are based in l2-mtd's master branch and I've pushed a branch
> to our github in case anyone wants to test this:
> 
>   https://github.com/MISL-EBU-System-SW/mainline-public/tree/pxa3xx-armada-nand-v1
> 
> The series is fairy complex and lengthy, so any feedback is more than welcome,
> as well as questions, suggestions or flames. Also, if anyone has a PXA board
> (Daniel?) to test possible regressions I would really appreciate it.
> 
> * A note about Mirabox testing
> 
> As this work is not considered completely stable, be extra careful when trying
> on the Mirabox. The Mirabox has the bootloader at NAND, and there's some risk
> to brick the board.
> 
> That said: I've been using the driver on my Mirabox all morning (with my own
> Buildroot prepared UBIFS image) and so far everything works fine.
> 
> If despite this you happen to brick the board, Willy Tarreau has provided
> excellent instructions to un-brick the Mirabox:
> 
>   http://1wt.eu/articles/mirabox-vs-guruplug/
> 
> Thanks!
> 
> Ezequiel Garcia (21):
>   mtd: nand: pxa3xx: Allocate data buffer on detected flash size
>   mtd: nand: pxa3xx: Disable OOB on arbitrary length commands
>   mtd: nand: pxa3xx: Use a completion to signal device ready
>   mtd: nand: pxa3xx: Add bad block handling
>   mtd: nand: pxa3xx: Add driver-specific ECC BCH support
>   mtd: nand: pxa3xx: Configure detected pages-per-block
>   mtd: nand: pxa3xx: Clear cmd buffer #3 (NDCB3) on command start
>   mtd: nand: pxa3xx: Make config menu show supported platforms
>   mtd: nand: pxa3xx: Split FIFO size from to-be-read FIFO count
>   mtd: nand: pxa3xx: Replace host->page_size by mtd->writesize
>   mtd: nand: pxa3xx: Add helper function to set page address
>   mtd: nand: pxa3xx: Remove READ0 switch/case falltrough
>   mtd: nand: pxa3xx: Split prepare_command_pool() in two stages
>   mtd: nand: pxa3xx: Move the data buffer clean to
>     prepare_start_command()
>   mtd: nand: pxa3xx: Add a read/write buffers markers
>   mtd: nand: pxa3xx: Introduce multiple page I/O support
>   mtd: nand: pxa3xx: Add multiple chunk write support
>   ARM: mvebu: Add a fixed 0Hz clock to represent NAND clock
>   ARM: mvebu: Add support for NAND controller in Armada 370/XP
>   ARM: mvebu: Enable NAND controller in Armada XP GP board
>   ARM: mvebu: Enable NAND controller in Armada 370 Mirabox
> 
>  arch/arm/boot/dts/armada-370-mirabox.dts      |  21 +
>  arch/arm/boot/dts/armada-370-xp.dtsi          |  19 +
>  arch/arm/boot/dts/armada-xp-gp.dts            |   8 +
>  drivers/mtd/nand/Kconfig                      |   4 +-
>  drivers/mtd/nand/pxa3xx_nand.c                | 546 +++++++++++++++++++++-----
>  include/linux/platform_data/mtd-nand-pxa3xx.h |   3 +
>  6 files changed, 493 insertions(+), 108 deletions(-)
> 
> 

If you're not too busy, I'd like you to take a look at the implementation.

I'm preparing a new v2 which some (very minor) improvements, mainly to
add support for timings configuration.

If there's anything to fix or to re-work, don't hesitate in asking!

Thanks,
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com

Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8Kqs-0000F6-63
 for linux-mtd@lists.infradead.org; Tue, 06 Jan 2015 03:30:39 +0000
Received: by mail-pa0-f53.google.com with SMTP id kq14so29613523pab.26
 for <linux-mtd@lists.infradead.org>; Mon, 05 Jan 2015 19:30:16 -0800 (PST)
Date: Mon, 5 Jan 2015 19:30:12 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: Re: [PATCH 0/6] SPI NAND for everyone
Message-ID: <20150106033012.GH9759@ld-irv-0074>
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
Cc: bpqw@micron.com, Qi Wang =?utf-8?B?546L6LW3?= <qiwang@micron.com>,
 Ionela Voinescu <ionela.voinescu@imgtec.com>, frankliu@micron.com,
 Andrew Bresticker <abrestic@chromium.org>, linux-mtd@lists.infradead.org,
 arnaud.mouiche@invoxia.com, James Hartley <james.hartley@imgtec.com>,
 Peter Pan =?utf-8?B?5r2Y5qCLIChwZXRlcnBhbmRvbmcp?= <peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On Tue, Dec 02, 2014 at 09:58:50AM -0300, Ezequiel Garcia wrote:
> During the discussion of Ionela Voinescu's patch to support GD5F SPI NAND
> devices [1], it was decided that a proper SPI NAND framework was needed
> to support the mt29f device (driver currently in staging area) and the new
> gd5f.
> 
> This patchset is a first attempt to address this.

Thanks for this effort. I've finally had a better chance to look through
your implementation and to give it some better thought.

> The SPI NAND framework allows devices to register as NAND drivers. This is
> useful to take advantage of the bad block management code.

I'm not so sure about this choice, but then I'm not so sure about the
alternatives earlier. I understand that you and Qi Wang might have had
some discussion off-list (please feel free to fill me and others in
here, and I can add my thoughts).

The BBT code is something we definitely want to share, but it's actually
not very closely tied to nand_base.c, and it looks pretty easy to adapt
to any MTD that implements mtd_read_oob()/mtd_write_oob(). We'd just
need to parameterize a few relevant device details into a new nand_bbt
struct, rather than using struct nand_chip directly.

It also looks like the identification code (read ID, ONFI / JEDEC
parameter pages) may differ, and SPI NAND may continue to evolve
differently. For instance, I see that Micron SPI NAND has a
(non-standardized) ONFI-like parameter page. It's mostly compatible with
ONFI, except it leaves out N/A fields and doesn't use an official
'revision' bitfield. This probably isn't 100% shareable with parallel
NAND code, if we use it at all.

So, I think we'll need to weigh the options of which one gives more bang
for the buck.

FWIW, I don't think the implementation in this series is that bad. Even
if we want to migrate to have less dependence on the current nand_base
implementation for non-parallel-NAND code, I think it's doable after
merging. We'd just need to keep the drivers/spi/ and DT binding formats
stable, while remaining free to refactor internally.

> Given the
> SPI NAND and the bare NAND commands are different, the SPI NAND framework
> implements its own .cmdfunc callback, which is in charge of calling
> device-specific hooks for each of the flash operations (read, program, erase,
> etc).

I'm not really a big fan of the switch/case remapping of one command set
into another (in this case, translating parallel NAND commands into
their SPI NAND equivalents). At times they may be necessary, but as food
for thought, we might consider alternatives, like additional replaceable
hooks in struct nand_chip.

> The SPI NAND framework does not deal with SPI transactions per-se. Instead,
> the SPI messages should be prepared by the users of the SPI NAND framework
> (those that implement the device-specific hooks).

Sounds reasonable. Does this leave room for hardware that is optimized
for SPI NAND, without implementing a full SPI controller, and therefore
does not use the drivers/spi/ infrastructure? Not sure if such a thing
exists yet (or will exist), but it does pop up in SPI NOR.

> The result can be expressed in the following hierarchy:
> 
>     Userspace
>   ------------------
>     MTD
>   ------------------
>     NAND core
>   ------------------
>     SPI NAND core
>   ------------------
>     SPI NAND device
>   ------------------
>     SPI core
>   ------------------
>     SPI master
>   ------------------
>     Hardware

This is a pretty good description, but some details are not quite right.
e.g., "userspace" should probably be removed or elaborated -- the
hierarchy could just stop at the "MTD API" (mtd_read(), mtd_write(),
mtd_erase(), etc.). Its users might be user-space (via mtdchar) or UBI,
JFFS2, etc.

Also, it might help to either flesh out what these hierarchies actually
mean by pointing to specific files, by additional commentary, or both.
It helps if you can also use the same language as the SPI documentation
for the lower levels of this hierarchy.

We might want to add something like this as official documentation,
possibly to Documentation/mtd/. Short and sweet is fine (i.e., not much
more than a cleaned up version of this cover letter).

Side note: I should probably add something to Documentation/mtd/ to
point to linux-mtd.infradead.org.

> Notice there was a previous attempt to propose an SPI NAND framework,
> by Sourav Poddar and Mona Anonuevo. We didn't find this proposal suitable,
> so this series is a completely new work.
> 
> This series is based on v3.18-rc7.

It has trivial conflicts on v3.19-rc1 now (and l2-mtd.git).

> Tests have been performed with a Gigadevice
> GD5F 4 Gbit device, including nandtest runs and filesystem testing on top
> of UBI. I don't have MT29F devices yet, but the amount of changes required to
> support it should be fairly small.
> 
> I don't intend this first proposal to be complete, but I hope it's a good
> starting point to support SPI NAND properly.
> 
> [1] http://lists.infradead.org/pipermail/linux-mtd/2014-November/056364.html
> [2] https://lkml.org/lkml/2013/6/26/83
> 
> Ezequiel Garcia (6):
>   mtd: nand: Check length of ID before reading bits per cell
>   mtd: nand: Add JEDEC manufacturer ID for Gigadevice
>   mtd: nand: Allow to set a per-device ECC layout
>   mtd: Introduce SPI NAND framework
>   mtd: spi-nand: Add devicetree binding
>   mtd: spi-nand: Support common SPI NAND devices
> 
>  Documentation/devicetree/bindings/mtd/spi-nand.txt |  21 +
>  drivers/mtd/Kconfig                                |   2 +
>  drivers/mtd/Makefile                               |   1 +
>  drivers/mtd/nand/nand_base.c                       |   4 +-
>  drivers/mtd/nand/nand_ids.c                        |   1 +
>  drivers/mtd/spi-nand/Kconfig                       |  18 +
>  drivers/mtd/spi-nand/Makefile                      |   2 +
>  drivers/mtd/spi-nand/spi-nand-base.c               | 530 +++++++++++++++++++++
>  drivers/mtd/spi-nand/spi-nand-device.c             | 500 +++++++++++++++++++
>  include/linux/mtd/nand.h                           |   3 +
>  include/linux/mtd/spi-nand.h                       |  54 +++
>  11 files changed, 1135 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
>  create mode 100644 drivers/mtd/spi-nand/Kconfig
>  create mode 100644 drivers/mtd/spi-nand/Makefile
>  create mode 100644 drivers/mtd/spi-nand/spi-nand-base.c
>  create mode 100644 drivers/mtd/spi-nand/spi-nand-device.c
>  create mode 100644 include/linux/mtd/spi-nand.h

I have some more code review comments, but those aren't as important at
the moment if we're still not sure about the overall approach.

Regards,
Brian

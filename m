Received: from mail-pf0-x234.google.com ([2607:f8b0:400e:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMoh8-0002eR-Hx
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2016 03:16:59 +0000
Received: by mail-pf0-x234.google.com with SMTP id e65so51918503pfe.0
 for <linux-mtd@lists.infradead.org>; Fri, 22 Jan 2016 19:16:38 -0800 (PST)
Date: Fri, 22 Jan 2016 19:16:35 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Mason <slash.tmp@free.fr>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Sebastian Frias <sf84@laposte.net>
Subject: Re: RFC on large number of hacks in mtd core files
Message-ID: <20160123031635.GB90611@google.com>
References: <56A24C22.2050607@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56A24C22.2050607@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 22, 2016 at 04:34:58PM +0100, Mason wrote:
> Hello everyone,
> 
> As I've mentioned in a previous thread, I'm supposed to port a NAND
> controller driver from 3.4 to 4.4. But this is complicated by the
> fact that several core files have been modified along the way.
> 
> Here's the full picture:
> 
> $ git diff --stat v3.4.39 custom-3.4 drivers/mtd
>  drivers/mtd/Kconfig                 |   15 +-
>  drivers/mtd/chips/cfi_cmdset_0002.c |  129 ++-
>  drivers/mtd/devices/Kconfig         |    6 +
>  drivers/mtd/devices/Makefile        |    3 +-
>  drivers/mtd/devices/m25p80.c        |  100 +-
>  drivers/mtd/devices/spiflash.c      | 2131 +++++++++++++++++++++++++++++++++++
>  drivers/mtd/maps/Kconfig            |   11 +-
>  drivers/mtd/maps/physmap.c          |  202 +++-
>  drivers/mtd/mtdchar.c               |   54 +
>  drivers/mtd/mtdcore.c               |   63 +-
>  drivers/mtd/mtdpart.c               |    9 +
>  drivers/mtd/nand/Kconfig            |   46 +-
>  drivers/mtd/nand/Makefile           |   11 +-
>  drivers/mtd/nand/monza_nand.c       |  614 ++++++++++
>  drivers/mtd/nand/nand_base.c        | 1226 +++++++++++++++++++-
>  drivers/mtd/nand/nand_bch_ecc.c     |  311 +++++
>  drivers/mtd/nand/nand_bch_ecc.h     |   11 +
>  drivers/mtd/nand/nand_ids.c         |  253 ++++-
>  drivers/mtd/nand/nandsim.c          |    2 +-
>  drivers/mtd/nand/smp8xxx_nand.c     | 2009 +++++++++++++++++++++++++++++++++
>  drivers/mtd/ubi/misc.c              |    7 +
>  21 files changed, 7164 insertions(+), 49 deletions(-)

^^ This doesn't make sense. You've changed over 7000 lines, but your
entire email is less than 3000 lines. From that alone, I can see you
haven't given us the whole diff...

And just looking at the diff stat, you might want to clear up a few
things:

(1) Are you really just talking about supporting a *NAND* driver? If so,
then you probably don't need your new drivers/mtd/devices/spiflash.c.
You also probably don't need to touch most things outside of
drivers/mtd/nand/, like drivers/mtd/chips/cfi_cmdset_0002.c,
drivers/mtd/maps/physmap.c, drivers/mtd/devices/m25p80.c, etc.

(2) How many NAND drivers do you actually have? I see two "new" NAND
drivers: drivers/mtd/nand/smp8xxx_nand.c and
drivers/mtd/nand/monza_nand.c.

> 
> 
> Here's the actual diff, with non-core changes omitted.

Ah, I see why the diffstat vs diff discrepancy.

Others may feel more inclined to humor you, but by omitting the drivers
themselves, it's hard to really get the whole picture.

[snip the rest]

Brian

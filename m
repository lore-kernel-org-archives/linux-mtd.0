Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRTS9-0006iO-2C
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2013 20:55:26 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: m25p80: Add support for Micron N25Q512A memory
Date: Wed, 2 Oct 2013 22:55:01 +0200
References: <1378270016-9280-1-git-send-email-Priyanka.Jain@freescale.com>
 <201310022202.19877.marex@denx.de>
 <CAN8TOE8ii_fbz77M4HJBvyWwPxe+AGOh-sZW=rrwEKfxGhr61g@mail.gmail.com>
In-Reply-To: <CAN8TOE8ii_fbz77M4HJBvyWwPxe+AGOh-sZW=rrwEKfxGhr61g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201310022255.01344.marex@denx.de>
Cc: Priyanka Jain <Priyanka.Jain@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Brian Norris,

> On Wed, Oct 2, 2013 at 1:02 PM, Marek Vasut <marex@denx.de> wrote:
> > Hi Brian,
> > 
> >>  + Marek for real!
> >> 
> >> On Wed, Oct 2, 2013 at 11:51 AM, Brian Norris
> >> 
> >> <computersforpeace@gmail.com> wrote:
> >> > + Marek
> >> > 
> >> > On Wed, Sep 04, 2013 at 10:16:56AM +0530, Priyanka Jain wrote:
> >> >> Micron N25Q512A is a spi flash memory with following features:
> >> >> -64MB size, 1.8V, Mulitple I/O, 4KB Sector erase memory.
> >> >> -Memory is organised as 1024(64KB) main sectors.
> >> >> -Each sector is divided into 256 pages.
> >> >> -Register set/Opcodes are similar to other N25Q family products.
> >> >> 
> >> >> Signed-off-by: Priyanka Jain <Priyanka.Jain@freescale.com>
> >> >> ---
> >> >> 
> >> >>  drivers/mtd/devices/m25p80.c |    1 +
> >> >>  1 files changed, 1 insertions(+), 0 deletions(-)
> >> >> 
> >> >> diff --git a/drivers/mtd/devices/m25p80.c
> >> >> b/drivers/mtd/devices/m25p80.c index 26b14f9..94e3b53 100644
> >> >> --- a/drivers/mtd/devices/m25p80.c
> >> >> +++ b/drivers/mtd/devices/m25p80.c
> >> >> @@ -774,6 +774,7 @@ static const struct spi_device_id m25p_ids[] = {
> >> >> 
> >> >>       { "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024, 256, 0) },
> >> >>       { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024, 256, 0) },
> >> >>       { "n25q256a", INFO(0x20ba19, 0, 64 * 1024, 512, SECT_4K) },
> >> >> 
> >> >> +     { "n25q512a", INFO(0x20bb20, 0, 64 * 1024, 512, SECT_4K) },
> > 
> > Why does this n25q256a and n25q512a have exactly the same geometry? I
> > mean, those chips differ in size, do they not ? ;-)
> > 
> >> > This device actually has the same ID as Micron's next line
> >> > (MT25QL512A). They have the same geometry, so maybe that's not a
> >> > problem.
> 
> I was referring to Micron n25q512a (which this patch mentions) and
> Micron's new generation of flash MT25QL512A (not mentioned in the
> original code or patch). They are different flash and are named
> differently but have the same ID. Perhaps my usage of the word "line"
> was confusing.

Yes I know. Still, that n25q512a line being the exact copy of n25q256a doesn't 
seem right.

The new ql512a seems line just a compatible replacement part for older lineup. 
Happens all the time.

Best regards,
Marek Vasut

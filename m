Received: from comal.ext.ti.com ([198.47.26.152])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MdL9Q-0001Ee-F9
	for linux-mtd@lists.infradead.org; Tue, 18 Aug 2009 09:38:48 +0000
From: "Sudhakar Rajashekhara" <sudhakar.raj@ti.com>
To: "'Andrew Morton'" <akpm@linux-foundation.org>
References: <1250613244-25447-1-git-send-email-sudhakar.raj@ti.com>
	<20090818011930.765d4895.akpm@linux-foundation.org>
In-Reply-To: <20090818011930.765d4895.akpm@linux-foundation.org>
Subject: RE: [PATCH] [MTD] driver/Makefile: Initialize "mtd" and "spi" before
	"net"
Date: Tue, 18 Aug 2009 15:06:35 +0530
Message-ID: <00df01ca1fe7$60d5c810$22815830$@raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: david-b@pacbell.net, dwmw2@infradead.org,
	davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 18, 2009 at 13:49:30, Andrew Morton wrote:
> On Tue, 18 Aug 2009 12:34:04 -0400 Sudhakar Rajashekhara <sudhakar.raj@ti.com> wrote:
> 
> > On TI's da850/omap-l138 EVM, MAC address is stored in SPI flash.
> > 
> > This patch changes the initialization sequence of the drivers
> > by moving mtd and spi ahead of net in drivers/Makefile thereby
> > enabling da850/omap-l138 ethernet driver to read the MAC address
> > while booting.
> > 
> > Signed-off-by: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
> > ---
> >  drivers/Makefile |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/Makefile b/drivers/Makefile
> > index bc4205d..2a1d41f 100644
> > --- a/drivers/Makefile
> > +++ b/drivers/Makefile
> > @@ -42,6 +42,8 @@ obj-y				+= macintosh/
> >  obj-$(CONFIG_IDE)		+= ide/
> >  obj-$(CONFIG_SCSI)		+= scsi/
> >  obj-$(CONFIG_ATA)		+= ata/
> > +obj-$(CONFIG_MTD)		+= mtd/
> > +obj-$(CONFIG_SPI)		+= spi/
> >  obj-y				+= net/
> >  obj-$(CONFIG_ATM)		+= atm/
> >  obj-$(CONFIG_FUSION)		+= message/
> > @@ -50,8 +52,6 @@ obj-y				+= ieee1394/
> >  obj-$(CONFIG_UIO)		+= uio/
> >  obj-y				+= cdrom/
> >  obj-y				+= auxdisplay/
> > -obj-$(CONFIG_MTD)		+= mtd/
> > -obj-$(CONFIG_SPI)		+= spi/
> >  obj-$(CONFIG_PCCARD)		+= pcmcia/
> >  obj-$(CONFIG_DIO)		+= dio/
> >  obj-$(CONFIG_SBUS)		+= sbus/
> 
> That isn't a particularly maintainable way of fixing this, especially
> as there are no comments in that Makefile to prevent someone from
> rebreaking it in the future.
> 
> A better fix would be to use suitably prioritised initcalls - see
> include/linux/init.h around line 187.
> 

Currently mtd, spi and net subsystems are initialized with module_init.
If I change the way in which these sub-systems are initialized, then
I'll be breaking the support for these sub-systems to work as modules.

There are some comments in drivers/Makefile which say why particular
sub-systems are ahead of others like:

	...
	...
	# PnP must come after ACPI since it will eventually need to check if acpi
	# was used and do nothing if so
	...
	...
	# char/ comes before serial/ etc so that the VT console is the boot-time
	# default.
	...

I'll add comments in the Makefile stating the need of mtd and spi
ahead of net and re-submit the patch.

Regards, Sudhakar

Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhh9v-0001mr-I7
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2018 20:10:21 +0000
Date: Mon, 23 Jul 2018 22:10:02 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr
Subject: Re: [PATCHv3 2/2] mtd: m25p80: restore the status of SPI flash when
 exiting
Message-ID: <20180723221002.736e0830@bbrezillon>
In-Reply-To: <20180723181350.GA58212@ban.mtv.corp.google.com>
References: <20171206025342.7266-1-Zhiqiang.Hou@nxp.com>
 <20171206025342.7266-3-Zhiqiang.Hou@nxp.com>
 <20180723181350.GA58212@ban.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Mon, 23 Jul 2018 11:13:50 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Hello,
> 
> I noticed this got merged, but I wanted to put my 2 cents in here:

I wish you had replied to this thread when it was posted (more than
6 months ago). Reverting the patch now implies making some people
unhappy because they'll have to resort to their old out-of-tree
hacks :-(.

> 
> On Wed, Dec 06, 2017 at 10:53:42AM +0800, Zhiqiang Hou wrote:
> > From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> > 
> > Restore the status to be compatible with legacy devices.
> > Take Freescale eSPI boot for example, it copies (in 3 Byte
> > addressing mode) the RCW and bootloader images from SPI flash
> > without firing a reset signal previously, so the reboot command
> > will fail without reseting the addressing mode of SPI flash.
> > This patch implement .shutdown function to restore the status
> > in reboot process, and add the same operation to the .remove
> > function.  
> 
> We have previously rejected this patch multiple times, because the above
> comment demonstrates a broken product.

If we were to only support working HW parts, I fear Linux would not
support a lot of HW (that's even more true when it comes to flashes :P).

> You cannot guarantee that all
> reboots will invoke the .shutdown() method -- what about crashes? What
> about watchdog resets? IIUC, those will hit the same broken behavior,
> and have unexepcted behavior in your bootloader.

Yes, there are corner cases that are not addressed with this approach,
but it still seems to improve things. Of course, that means the
user should try to re-route all HW reset sources to SW ones (RESET input
pin muxed to the GPIO controller, watchdog generating an interrupt
instead of directly asserting the RESET output pin), which is not always
possible, but even when it's not, isn't it better to have a setup that
works fine 99% of the time instead of 50% of the time?

> 
> I suppose one could argue for doing this in remove(), but AIUI you're
> just papering over system bugs by introducing the shutdown() function
> here. Thus, I'd prefer we drop the shutdown() method to avoid misleading
> other users of this driver.

I understand your point. But if the problem is about making sure people
designing new boards get that right, why not complaining at probe time
when things are wrong?

I mean, spi_nor_restore() seems to only do something on very specific
NORs (those on which a SW RESET does not resets the addressing
mode). So, how about adding a flag that says "my board has the NOR HW
RESET pin wired" (there would be a DT props to set that flag). Then you
add a WARN_ON() when this flag is not set and a NOR chip impacted by
this bug is detected. This way you make sure people are informed that
they're doing something wrong, and for those who can't change their HW
(because it's already widely deployed), you have a fix that improve
things.

Regards,

Boris

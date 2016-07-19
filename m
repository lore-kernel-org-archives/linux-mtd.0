Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPUGx-00049R-EL
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 12:37:16 +0000
Date: Tue, 19 Jul 2016 14:36:52 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH for-4.8] ubifs: silence early error messages if MS_SILENT
 is set
Message-ID: <20160719123651.GB1716@makrotopia.org>
References: <20160718222649.GA17394@makrotopia.org> <578DBCD4.6070305@nod.at>
 <20160719122000.GA1716@makrotopia.org> <578E1D02.3000109@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <578E1D02.3000109@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Tue, Jul 19, 2016 at 02:28:50PM +0200, Richard Weinberger wrote:
> ...
> >> The diff makes sense but not the commit message.
> > 
> > More brief? Less reasoning? Please elaborate, so I know what to
> > improve.
> 
> It confused me a bit. :-)

Feel free to change it or let me know if I should reword it and
resend the patch.

> 
> >> Why would you mount a squashfs on top of UBI as UBIFS?
> >> We have rootfstype= for this.
> > 
> > However, in OpenWrt/LEDE users may choose the fstype (UBIFS and
> > squashfs) used for rootfs and the kernel should auto-probe just like
> > it does for block or MTD devices (we support JFFS2 and squashfs
> > on NOR and SPI flashes). In the case of squashfs being a read-only
> > filesystem, an overlayfs is automatically created and used.
> > Changing kernel command line parameters or anything which would
> > require bootloader access is not an option for most of our users, due
> > to the bootloaders being locked or because not everyone is into hooking
> > up a serial console.
> > Also, many stock bootloaders append stuff to the cmdline unwanted
> > when using vanilla or OpenWrt's kernel. Thus, we often times ignore
> > the bootloader's bootargs.
> > The strategy of probe-mounting is working well as filesystems can
> > easily be identified. The reason for this patch is that some users are
> > getting confused about lines in in their bootlog indicating an error
> > eventhough there wasn't anything bad happening.
> 
> Ah that kind of kludges again...
> 
> Anyway, patch looks good to me.
> 
> BTW: We should rename ubifs_errc(), commit 235c362bd (UBIFS: extend debug/message capabilities)
> added the UBIFS context object to all logging functions.

... or at least the just comment above the macro definition.
'c' could stand for 'conditional' ;)


Cheers


Daniel

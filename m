Received: from web86904.mail.ukl.yahoo.com ([217.12.13.56])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FHtBk-0000a0-TR
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 20:46:40 -0500
Message-ID: <20060311013956.53555.qmail@web86904.mail.ukl.yahoo.com>
Date: Sat, 11 Mar 2006 01:39:56 +0000 (GMT)
From: Adam Ward <adamward2005@yahoo.co.uk>
To: Josh Boyer <jwboyer@gmail.com>, Nicolas Pitre <nico@cam.org>
In-Reply-To: <625fc13d0603100735o37c96bcfl78b213eab41b5e54@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Adam Ward <adamward2005@yahoo.co.uk>
Subject: Re: Read only forced on jffs2 by mtd layer?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Not doing anything beyond what is there for the
Mainstone... I don't know enough about this!

Also, there is enough free space, I do not have any
problem under the 2.6.9 kernel.

There shouldn't be anything special about the hardware
, it uses a stacked SDRAM/flash part (RD38F4470LLYBH0)
but the flash is 2 * 28F256L18B - only difference
being it's 2 * 28F128L18B parts on the Mainstone. (I
think that's on C5 revision processor cards?)

Is anyone having better results with 2.6.15-4 on a
Mainstone? 

I am wondering if the movement of configuration from
drivers/mtd/maps/mainstone-flash.c into
arch/arm/mach-pxa/mainstone.c being incomplete is
indicative of deeper changes that break the former,
but are not far enough to enable the later.


--- Josh Boyer <jwboyer@gmail.com> wrote:

> On 3/10/06, Nicolas Pitre <nico@cam.org> wrote:
> > On Fri, 10 Mar 2006, Adam Ward wrote:
> >
> > > My jffs2 image will mount as ro.
> > > If I do 'mount / -o remount,rw' it appears to be
> > > happy, but I soon get told 'Read-only file
> system' if
> > > I try anything too presumptuous!
> > >
> > > As running mount still declares it as
> read/write, I am
> > > assuming the error is with the mtd block driver
> > > refusing to co-operate.
> > >
> > > Is there anything you guys can suggest that I
> should
> > > pay closer attention to?
> >
> > Did you unlock the flash partition with the
> flash_unlock tool?
> > Some NOR flash parts initialize themselves with
> all sectors locked by
> > default.
> 
> Also, does your JFFS2 filesystem have free space
> available?  If a
> minimum amount of free eraseblocks are not present,
> JFFS2 will mark
> itself as read-only no matter what you do.
> 
> josh
> 



		
___________________________________________________________ 
Yahoo! Photos – NEW, now offering a quality print service from just 8p a photo http://uk.photos.yahoo.com

Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PKTmZ-00023J-In
	for linux-mtd@lists.infradead.org; Mon, 22 Nov 2010 10:38:00 +0000
Received: by wyf22 with SMTP id 22so6999835wyf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Nov 2010 02:37:58 -0800 (PST)
Date: Mon, 22 Nov 2010 11:37:52 +0100
From: =?iso-8859-1?Q?Llu=EDs?= Batlle i Rossell <viriketo@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: block2mtd and ubi
Message-ID: <20101122103751.GM9645@vicerveza.homeunix.net>
References: <20101120175856.GD9645@vicerveza.homeunix.net>
	<20101121000145.GF9645@vicerveza.homeunix.net>
	<1290413562.2289.14.camel@localhost>
	<20101122090940.GK9645@vicerveza.homeunix.net>
	<1290418365.2289.25.camel@localhost>
	<20101122100008.GL9645@vicerveza.homeunix.net>
	<1290421283.2289.32.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1290421283.2289.32.camel@localhost>
Cc: =?iso-8859-1?Q?Llu=EDs?= Batlle i Rossell <viriketo@gmail.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 22, 2010 at 12:21:23PM +0200, Artem Bityutskiy wrote:
> On Mon, 2010-11-22 at 11:00 +0100, Lluís Batlle i Rossell wrote:
> > On Mon, Nov 22, 2010 at 11:32:45AM +0200, Artem Bityutskiy wrote:
> > > On Mon, 2010-11-22 at 10:09 +0100, Lluís Batlle i Rossell wrote:
> > > > On Mon, Nov 22, 2010 at 10:12:42AM +0200, Artem Bityutskiy wrote:
> > > > > On Sun, 2010-11-21 at 01:01 +0100, Lluís Batlle i Rossell wrote:
> > > > > > On Sat, Nov 20, 2010 at 06:58:56PM +0100, Lluís Batlle i Rossell wrote:
> > > > > > It's a pity that the same 'ubinize' cannot do that job automatically, and give
> > > > > > an image filling all the memory blocks. That would easy down a lot the job for
> > > > > > block2mtd.
> > > > > 
> > > > > Use ubiformat - it should get it right:
> > > > > 
> > > > > http://www.linux-mtd.infradead.org/faq/ubi.html#L_flash_img
> > > > 
> > > > I know, but I cannot do that on a block2mtd, if the block2mtd device I use is
> > > > the rootfs of the system. All I have is a kernel, qemu, and a rootfs in a
> > > > 'ubinize' ubi image.
> > > 
> > > Why you can dd buy cannot ubiformat? What is the fundamental difference?
> > ubiformat works on a mtd character device, while dd works on a block device.
> 
> But you can turn a block device into mtd device using block2mtd, so I do
> not still see the fundamental difference.

That requires root access in the machine, which is something I want to avoid.
And quite a complex setup for the host system:
- make a file of the size I want
- set up a loop device
- load a block2mtd for it
- ubiformat it
- unload block2mtd
- detach loop device

Notice that I use block2mtd as rootfs in a qemu guest passing something like
"-hda flash_image -append blockmtd.blockmtd=/dev/hda". Appending 0xff to the
ubinized image is for me a far easier solution than that above requiring road
access.

Regards,
Lluís.

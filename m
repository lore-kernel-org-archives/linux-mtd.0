Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PKTCD-0007Kz-U9
	for linux-mtd@lists.infradead.org; Mon, 22 Nov 2010 10:00:36 +0000
Received: by wwc33 with SMTP id 33so7915232wwc.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Nov 2010 02:00:14 -0800 (PST)
Date: Mon, 22 Nov 2010 11:00:10 +0100
From: =?iso-8859-1?Q?Llu=EDs?= Batlle i Rossell <viriketo@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: block2mtd and ubi
Message-ID: <20101122100008.GL9645@vicerveza.homeunix.net>
References: <20101120175856.GD9645@vicerveza.homeunix.net>
	<20101121000145.GF9645@vicerveza.homeunix.net>
	<1290413562.2289.14.camel@localhost>
	<20101122090940.GK9645@vicerveza.homeunix.net>
	<1290418365.2289.25.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1290418365.2289.25.camel@localhost>
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

On Mon, Nov 22, 2010 at 11:32:45AM +0200, Artem Bityutskiy wrote:
> On Mon, 2010-11-22 at 10:09 +0100, Lluís Batlle i Rossell wrote:
> > On Mon, Nov 22, 2010 at 10:12:42AM +0200, Artem Bityutskiy wrote:
> > > On Sun, 2010-11-21 at 01:01 +0100, Lluís Batlle i Rossell wrote:
> > > > On Sat, Nov 20, 2010 at 06:58:56PM +0100, Lluís Batlle i Rossell wrote:
> > > > It's a pity that the same 'ubinize' cannot do that job automatically, and give
> > > > an image filling all the memory blocks. That would easy down a lot the job for
> > > > block2mtd.
> > > 
> > > Use ubiformat - it should get it right:
> > > 
> > > http://www.linux-mtd.infradead.org/faq/ubi.html#L_flash_img
> > 
> > I know, but I cannot do that on a block2mtd, if the block2mtd device I use is
> > the rootfs of the system. All I have is a kernel, qemu, and a rootfs in a
> > 'ubinize' ubi image.
> 
> Why you can dd buy cannot ubiformat? What is the fundamental difference?
ubiformat works on a mtd character device, while dd works on a block device.
Maybe ubiformat can work on a 'file'? I think I tried and it did not work.

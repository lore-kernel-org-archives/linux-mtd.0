Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PTo5o-0003fn-DD
	for linux-mtd@lists.infradead.org; Sat, 18 Dec 2010 04:08:25 +0000
Received: by gyg4 with SMTP id 4so572402gyg.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Dec 2010 20:08:22 -0800 (PST)
From: Rob Landley <rob@landley.net>
To: dedekind1@gmail.com
Subject: Re: [PATCH] mtd: allow mtd and jffs2 when ARCH=um
Date: Fri, 17 Dec 2010 22:08:16 -0600
References: <22c797d00709272118i33d32b9dy93d5f5ec8f8edd30@mail.gmail.com>
	<201012150031.21417.rob@landley.net>
	<1292512711.2364.85.camel@localhost>
In-Reply-To: <1292512711.2364.85.camel@localhost>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201012172208.17937.rob@landley.net>
Cc: atom ota <atomota@sleepyhammer.com>,
	user-mode-linux-devel@lists.sourceforge.net,
	Denys Vlasenko <vda.linux@googlemail.com>,
	Sam Ravnborg <sam@ravnborg.org>, Jeff Dike <jdike@addtoit.com>,
	Jason Lunz <lunz@acm.org>, lkml <linux-kernel@vger.kernel.org>,
	richard -rw- weinberger <richard.weinberger@gmail.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 16 December 2010 09:18:31 Artem Bityutskiy wrote:
> On Wed, 2010-12-15 at 00:31 -0600, Rob Landley wrote:
> > That is awesome and I'm not finding any documentation on it...  Ah:
> >
> >  
> > http://wiki.maemo.org/Modifying_the_root_image#Block_device_emulating_an_
> >MTD_device
> >
> > Wow that's awkward.  Let's see, that says...
> >
> >   mknod /tmp/mtdblock0 b 31 0
> >   modprobe loop
> >   losetup /dev/loop0 rootfs.jffs2
> >   modprobe mtdblock
> >   modprobe block2mtd
> >   # Note the ,128KiB is needed (on 2.6.26 at least) to set the
> >   # eraseblock  size.
> >   echo "/dev/loop0,128KiB" > /sys/module/block2mtd/parameters/block2mtd
> >   modprobe jffs2
> >   mount -t jffs2 /tmp/mtdblock0 /media/jffs2
>
> You should not need mtdblock in modern kernels, it is legacy. You should
> be abole to mount jffs2 on top of mtd0 with
>
> mount -t jffs2 mtd0 /media/jffs2

How does one associate the mtd0 with the loopback device?  (I thought mtd0 was 
for actual flash memory.)

Rob
-- 
GPLv3: as worthy a successor as The Phantom Menace, as timely as Duke Nukem 
Forever, and as welcome as New Coke.

Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LN6bl-0004Hl-Oi
	for linux-mtd@lists.infradead.org; Wed, 14 Jan 2009 14:20:40 +0000
Subject: Re: Missing ioctl32 for ubi
From: Artem Bityutskiy <dedekind@infradead.org>
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
In-Reply-To: <Pine.LNX.4.64.0901141501240.31703@vixen.sonytel.be>
References: <Pine.LNX.4.64.0901141432590.27302@vixen.sonytel.be>
	<1231941446.5973.69.camel@localhost.localdomain>
	<Pine.LNX.4.64.0901141501240.31703@vixen.sonytel.be>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 14 Jan 2009 16:19:31 +0200
Message-Id: <1231942771.5973.74.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-01-14 at 15:12 +0100, Geert Uytterhoeven wrote:
> 	Hi Артём,
> 
> On Wed, 14 Jan 2009, Artem Bityutskiy wrote:
> > On Wed, 2009-01-14 at 14:48 +0100, Geert Uytterhoeven wrote:
> > > When running ubimkvol (32-bit userland) on a PS3 (ppc64), I get:
> > > 
> > > | # ubimkvol /dev/ubi0 -N test -s 200MiB
> > > | ubimkvol: error!: cannot UBI create volume
> > > |           error 22 (Invalid argument)
> > > | #
> > > 
> > > and in the kernel log:
> > > 
> > > | ioctl32(ubimkvol:2207): Unknown cmd fd(3) cmd(80986f00){t:'o';sz:152} arg(ff88a888) on /dev/ubi0
> > > 
> > > This is on 2.6.29-rc1+.
> > 
> > Hmm, frankly I have no idea what this could be. I'll look and try ti
> > figure out, though.
> 
> When running 32-bit userland on a 64-bit kernel, ioctls have to be translated.
> 
> I noticed the drivers/mtd/ubi/cdev.c:ubi_*cdev_operations structures don't have
> .compat_ioctl entries, which would handle those translations.

Oh, right. This is about implementing compat_ioctl's. I'll put this to
my TODO list and look at this unless you come up with a patch faster :-)

Thank you for noticing this.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)

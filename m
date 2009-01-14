Received: from vervifontaine.sonytel.be ([80.88.33.193]
	helo=vervifontaine.sonycom.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LN6UH-0007ju-Ph
	for linux-mtd@lists.infradead.org; Wed, 14 Jan 2009 14:13:08 +0000
Date: Wed, 14 Jan 2009 15:12:52 +0100 (CET)
From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Sender: geert@sonytel.be
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: Missing ioctl32 for ubi
In-Reply-To: <1231941446.5973.69.camel@localhost.localdomain>
Message-ID: <Pine.LNX.4.64.0901141501240.31703@vixen.sonytel.be>
References: <Pine.LNX.4.64.0901141432590.27302@vixen.sonytel.be>
	<1231941446.5973.69.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

	Hi Артём,

On Wed, 14 Jan 2009, Artem Bityutskiy wrote:
> On Wed, 2009-01-14 at 14:48 +0100, Geert Uytterhoeven wrote:
> > When running ubimkvol (32-bit userland) on a PS3 (ppc64), I get:
> > 
> > | # ubimkvol /dev/ubi0 -N test -s 200MiB
> > | ubimkvol: error!: cannot UBI create volume
> > |           error 22 (Invalid argument)
> > | #
> > 
> > and in the kernel log:
> > 
> > | ioctl32(ubimkvol:2207): Unknown cmd fd(3) cmd(80986f00){t:'o';sz:152} arg(ff88a888) on /dev/ubi0
> > 
> > This is on 2.6.29-rc1+.
> 
> Hmm, frankly I have no idea what this could be. I'll look and try ti
> figure out, though.

When running 32-bit userland on a 64-bit kernel, ioctls have to be translated.

I noticed the drivers/mtd/ubi/cdev.c:ubi_*cdev_operations structures don't have
.compat_ioctl entries, which would handle those translations.

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village · Da Vincilaan 7-D1 · B-1935 Zaventem · Belgium

Phone:    +32 (0)2 700 8453
Fax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 · RPR Brussels
Fortis · BIC GEBABEBB · IBAN BE41293037680010

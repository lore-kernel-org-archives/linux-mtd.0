Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ApnWX-0006eG-Ts
	for linux-mtd@lists.infradead.org; Sun, 08 Feb 2004 11:54:54 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Florian Schirmer <jolt@tuxbox.org>
In-Reply-To: <200402081238.45099.jolt@tuxbox.org>
References: <007301c3ebea$29f96270$9602010a@jingle>
	 <1076236627.12587.212.camel@imladris.demon.co.uk>
	 <200402081238.45099.jolt@tuxbox.org>
Content-Type: text/plain
Message-Id: <1076241213.12587.240.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sun, 08 Feb 2004 11:53:33 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 corruption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2004-02-08 at 12:38 +0100, Florian Schirmer wrote:
> Hi,
> 
> > > i'm having a strange problem with a JFFS2 filesystem: I always get
> > > messages about incorrect CRC values while mounting the filesystem. What i
> > > did:
> >
> > Please set CONFIG_JFFS2_FS_DEBUG=1, then reproduce this with full
> > logging -- you'll need to do it over a serial console to make sure you
> > catch everything.
> 
> Thanks for your suggestion. I'm a little bit further finding this problem. It 
> turns out to be a cmdset2 issue and not a jffs2 problem. I'm still digging 
> what is going on.
> 
> What i've got so far is: jffs2_read_flash returns bogous data. In the case of 
> a bad crc the last odd byte is wrong. Looks like a byte access instead of a 
> word access. (Buswidth of the flash: 2)  If you look at this:

Interesting. That would be a problem in map_copy_from(), which is either
just memcpy_fromio() or a function provided by your map driver,
depending on whether you have CONFIG_MTD_COMPLEX_MAPPINGS enabled.

Can you check what memcpy_fromio() does directly? Try changing the
definition of map_copy_from() in include/linux/mtd/map.h or
drivers/mtd/maps/map_funcs.c or your map driver (depending on your
configuration) to copy a byte at a time, and see if that fixes it.

The '%zd' modifier is the correct way to print a size_t; the old %Z was
a gcc-ism. It's supported by the 2.6 and I thought also the current 2.4
kernels; what kernel are you using, precisely? It's a trivial patch to
add it.

-- 
dwmw2

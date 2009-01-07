Received: from outbound-wa4.frontbridge.com ([216.32.181.16]
	helo=WA4EHSOBE002.bigfish.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKdzz-0001vv-MM
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 19:23:27 +0000
Message-ID: <49650128.8020200@am.sony.com>
Date: Wed, 7 Jan 2009 11:23:20 -0800
From: Geoff Levand <geoffrey.levand@am.sony.com>
MIME-Version: 1.0
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [patch 0/6] ps3vram driver patches
References: <4963CDCA.4080802@am.sony.com> <200901071944.45680.arnd@arndb.de>
In-Reply-To: <200901071944.45680.arnd@arndb.de>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <David.Woodhouse@intel.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Jim Paris <jim@jtan.com>, linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org,
	Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>,
	Vivien Chappelier <vivien.chappelier@free.fr>, cbe-oss-dev@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Arnd Bergmann wrote:
> On Tuesday 06 January 2009, Geoff Levand wrote:
>> Patches 3-6 are minor cleanups suggested by Arnd Bergmann.  I have left two
>> of Arnd's sugestions, implementing the driver as a block device, similar to
>> the axonram driver, and eliminating the need to ioremap.  These will require
>> a significant re-work.
> 
> My complaint about the ioremap was just about the type of the mapping,
> not something fundamental. Please just replace ioremap(addr, size) with
> ioremap_flags(addr, size, _PAGE_NO_CACHE) in order to get a mapping without
> the guarded bit.

OK, I see.  I'll post a patch.

Geert and I were discussing actually removing the direct write to the XDR
memory, and so the need for that ioremap, as the mapping is just used in
ps3vram_erase(), which seems could be removed.

> If everyone else thinks that doing the ps3vram driver as an MTD rather than
> a block device is acceptable, I have no further objections. Thanks for
> following up on my other comments.

I want to get it converted to a block device, and I will work towards
that, but it will take some time.  As it is, it is very useful for typical
systems that are running full desktops like gmome or KDE and do a lot of
swapping.  Many of the distros now use it, and users want it.

-Geoff

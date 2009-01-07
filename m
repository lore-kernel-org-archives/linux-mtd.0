Received: from mout-xforward.kundenserver.de ([212.227.17.5])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKeSz-0000Ls-Lw
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 19:53:26 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: linuxppc-dev@ozlabs.org
Subject: Re: [patch 0/6] ps3vram driver patches
Date: Wed, 7 Jan 2009 20:53:05 +0100
References: <4963CDCA.4080802@am.sony.com> <200901071944.45680.arnd@arndb.de>
	<49650128.8020200@am.sony.com>
In-Reply-To: <49650128.8020200@am.sony.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200901072053.06037.arnd@arndb.de>
Cc: David Woodhouse <David.Woodhouse@intel.com>,
	Geoff Levand <geoffrey.levand@am.sony.com>,
	Jim Paris <jim@jtan.com>, linux-mtd@lists.infradead.org,
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

On Wednesday 07 January 2009, Geoff Levand wrote:

> Geert and I were discussing actually removing the direct write to the XDR
> memory, and so the need for that ioremap, as the mapping is just used in
> ps3vram_erase(), which seems could be removed.

Ah, I see. I also forgot to mention that the ioremap_flags change should
only be done for actual memory regions, but *not* for memory mapped I/O
registers.

> I want to get it converted to a block device, and I will work towards
> that, but it will take some time. =A0As it is, it is very useful for typi=
cal
> systems that are running full desktops like gmome or KDE and do a lot of
> swapping. =A0Many of the distros now use it, and users want it.

Yes, fine by me.

	Arnd <><

Received: from moutng.kundenserver.de ([212.227.126.177])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKdP1-0004Ik-81
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 18:45:15 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Geoff Levand <geoffrey.levand@am.sony.com>
Subject: Re: [patch 0/6] ps3vram driver patches
Date: Wed, 7 Jan 2009 19:44:44 +0100
References: <4963CDCA.4080802@am.sony.com>
In-Reply-To: <4963CDCA.4080802@am.sony.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200901071944.45680.arnd@arndb.de>
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

On Tuesday 06 January 2009, Geoff Levand wrote:
> Patches 3-6 are minor cleanups suggested by Arnd Bergmann. =A0I have left=
 two
> of Arnd's sugestions, implementing the driver as a block device, similar =
to
> the axonram driver, and eliminating the need to ioremap. =A0These will re=
quire
> a significant re-work.

My complaint about the ioremap was just about the type of the mapping,
not something fundamental. Please just replace ioremap(addr, size) with
ioremap_flags(addr, size, _PAGE_NO_CACHE) in order to get a mapping without
the guarded bit.

If everyone else thinks that doing the ps3vram driver as an MTD rather than
a block device is acceptable, I have no further objections. Thanks for
following up on my other comments.

Acked-by: Arnd Bergmann <arnd@arndb.de>

	Arnd <><

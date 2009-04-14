Received: from moutng.kundenserver.de ([212.227.126.171])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Ltjs0-0000mX-Vz
	for linux-mtd@lists.infradead.org; Tue, 14 Apr 2009 14:44:23 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Kevin Cernekee <kpc.mtd@gmail.com>
Subject: Re: [PATCH 3/4] [MTD] compat_ioctl cleanup
Date: Tue, 14 Apr 2009 16:43:47 +0200
References: <a95a62fe0904082253i119f8660y6a73835a163394f5@mail.gmail.com>
In-Reply-To: <a95a62fe0904082253i119f8660y6a73835a163394f5@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200904141643.48345.arnd@arndb.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 09 April 2009, Kevin Cernekee wrote:

>   =C2=A0
> 1) Move the MEMREADOOB/MEMWRITEOOB compat_ioctl wrappers from
> fs/compat_ioctl.c into mtdchar.c . =C2=A0Original request was here:
>=20
> http://lkml.org/lkml/2009/4/1/295

Very nice cleanup, thanks for doing this!

> 2) Add missing COMPATIBLE_IOCTL lines, so that mtd-utils does not error
> out when running in 64/32 compatibility mode.

This looks correct, but I think it would be better to just remove all
those lines from fs/compat_ioctl.c and add a default: statement in
mtd_compat_ioctl that calls mtd_ioctl for all ioctl numbers that
don't have an explicit handler.

	Arnd <><

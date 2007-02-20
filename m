Received: from cl-1816.ham-01.de.sixxs.net ([2001:6f8:900:717::2]
	helo=ds10.mine.nu)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJKin-0001ya-K6
	for linux-mtd@lists.infradead.org; Mon, 19 Feb 2007 21:27:16 -0500
Subject: Re: [PATCH] block2mtd oops in erase function.
From: Felix Fietkau <nbd@openwrt.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>
In-Reply-To: <20070219223023.GF7813@lazybastard.org>
References: <1171920579.4996.8.camel@celeron>
	<20070219222041.GE7813@lazybastard.org>
	<20070219223023.GF7813@lazybastard.org>
Content-Type: text/plain; charset=iso-8859-15
Date: Tue, 20 Feb 2007 03:27:09 +0100
Message-Id: <1171938429.2859.2.camel@NF.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-02-19 at 22:30 +0000, J=F6rn Engel wrote:
> On December 21st 2004 by none other than me.  How embarrassing!
> http://lists.infradead.org/pipermail/linux-mtd/2004-December/011236.html
>=20
> Can you test this patch?
>=20
> diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2=
mtd.c
> [...]

Works :)

- Felix

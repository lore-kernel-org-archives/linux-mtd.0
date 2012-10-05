Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TK2g3-000281-Mp
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2012 07:50:32 +0000
Message-ID: <1349423405.3427.3.camel@coredoba.hi.pengutronix.de>
Subject: Re: [PATCH] mtd: m25p80: Add support for Numonyx N25Q128
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: Michal Simek <monstr@monstr.eu>
Date: Fri, 05 Oct 2012 09:50:05 +0200
In-Reply-To: <1349372416-16925-1-git-send-email-monstr@monstr.eu>
References: <1349372416-16925-1-git-send-email-monstr@monstr.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
Cc: Mike Frysinger <vapier@gentoo.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-kernel@vger.kernel.org, Wendy Liang <wendy.liang@petalogix.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2012-10-04 at 19:40 +0200, Michal Simek wrote:
> From: Wendy Liang <wendy.liang@petalogix.com>
>=20
> Add the id and sector mappings for SPI flash chips.

An equivalent patch is already in David Woodhouse's l2-mtd tree:
http://git.infradead.org/users/dedekind/l2-mtd.git/commitdiff/3105875f6b890=
2628caee2fd7821af43707c6bde

Regards,
Jan
--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

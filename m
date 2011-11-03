Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RLv3t-0006sb-3Q
	for linux-mtd@lists.infradead.org; Thu, 03 Nov 2011 11:02:22 +0000
Date: Thu, 3 Nov 2011 12:02:11 +0100 (CET)
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ivan Djelic <ivan.djelic@parrot.com>
Message-ID: <333650967.4523301320318131386.JavaMail.root@zimbra20-e3.priv.proxad.net>
In-Reply-To: <1388924089.4520961320317174391.JavaMail.root@zimbra20-e3.priv.proxad.net>
Subject: Re: [PATCH v2] mtd: nand: Add driver for M-sys / Sandisk diskonchip G4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: Mike Dunn <mikedunn@newsguy.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

----- Mail Original -----
De: "Ivan Djelic" <ivan.djelic@parrot.com>
=C3=80: "Mike Dunn" <mikedunn@newsguy.com>
Cc: linux-mtd@lists.infradead.org
Envoy=C3=A9: Jeudi 3 Novembre 2011 09h58:24 GMT +01:00 Amsterdam / Berlin /=
 Berne / Rome / Stockholm / Vienne
Objet: Re: [PATCH v2] mtd: nand: Add driver for M-sys / Sandisk diskonchip =
G4

> Using this blank ecc value to detect blank pages after reading them is no=
t that
> reliable, because if a bitflip appears in an erased page, the HW ecc gene=
rator
> will generate a completely different sequence of bytes. Your driver will =
think
> the page is not blank, it will try to correct errors and fail. And UBIFS =
will
> not appreciate that.
> I can see two cleaner alternatives to solve this issue:
>
> 1. When you program a page, before writing hwecc to oob, adjust it like t=
his:
> 2. Use unprotected spare oob byte 15 as a programmming marker: remove it =
from
> ...zip...

I would see a third one:
3. After reading the page, check bit DOC_ECCCONF1_PAGE_IS_WRITTEN in DOC_EC=
CCONF1 register.
   I think this bit is calculated from the Hamming Code (not sure), but I'm=
 pretty sure that
   this bit is 0 when the page is blank, and 1 if the page was written befo=
re.

--
Robert

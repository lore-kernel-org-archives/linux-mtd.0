Received: from ptb-relay03.plus.net ([212.159.14.214])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgR57-0001Me-4U
	for linux-mtd@lists.infradead.org; Mon, 20 Dec 2004 12:12:26 -0500
From: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1103560493.25853.31.camel@weaponx.rchland.ibm.com>
References: <1103232128.15927.70.camel@squizzey.bult.co.uk>
	<41C1FDFF.3020308@us.ibm.com>
	<1103233669.15929.81.camel@squizzey.bult.co.uk>
	<1103288058.3018.4.camel@weaponx.rchland.ibm.com>
	<1103297611.15917.184.camel@squizzey.bult.co.uk>
	<41C3030D.8040607@us.ibm.com>
	<1103302002.15927.198.camel@squizzey.bult.co.uk>
	<41C31307.70909@us.ibm.com>
	<1103304360.15914.210.camel@squizzey.bult.co.uk>
	<41C318C8.4030702@us.ibm.com>
	<20041218160255.GA1083@wohnheim.fh-wedel.de>
	<1103560493.25853.31.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain; charset=iso-8859-7
Date: Mon, 20 Dec 2004 17:12:28 +0000
Message-Id: <1103562748.10800.62.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-12-20 at 10:34 -0600, Josh Boyer wrote:
> Ok, that's why I said "most".  And if your El Cheapo hardware has built
> in wear leveling, then doing wear leveling on top of that is always
> questionable.  It might not make things worse, but it's probably not
> very efficient.

Mmm, if the USB flash micro-controllers have build-in wear levelling,
they'd be quite something .. (!)=20

> Now if you have El Super Cheapo hardware that explicitly states you nee=
d
> to do wear leveling, that's a different story ;).

Here's a quote from a "Kingston" advert;

"Controllers automatically lock out bad memory cells and move the data
to avoid corruption. Controllers also automatically distribute write
cycles across the flash cells to extend the life of the flash memory
card"

What this means exactly in real terms .. [?]
(for example, do you lose some of your key to a bad block table, if so
how much ???)

Here's a bit from "Verbatim";

"For ultra-reliability, Verbatim=A2s new Store =A1n=A2 Go Pro drives feat=
ure
an on-board 32 bit ARM-7 microprocessor that manages I/O operations and
many of the drive=A2s technical features. An advanced wear-leveling
algorithm is used to distribute writes evenly among flash storage cells.
By evenly distributing the writing, Store =A1n=A2 Go Pro achieves an
unprecedented reliability rating of over one million write/erase cycles.
Advanced Error Detection Code/Error Correction Code furthers the Store
=A1n=A2 Go Pro=A2s immunity to failure."

Interesting articles / links;
http://www.digitalmediadesigner.com/articles/viewarticle.jsp?id=3D27727
http://www.techworld.com/features/index.cfm?fuseaction=3Ddisplayfeature&F=
eatureID=3D413

In summary: lots of manufacturers seem to be quoting virtual / physical
block mapping on the fly with integrated wear levelling ... (!)

So maybe wear levelling is out of date at filesystem level ?
The techworld link to the M-Systems chips looks interesting ..

Can anyone with detailed flash experience comment ?

Gareth.

> That's because it was the only removable media for PCs for a long time.=
=20
> At least to the non-geeks.  I can remember buying spare hard drives and
> carrying those from machine to machine if I needed to do big transfers
> ;).
>=20
> josh
>=20

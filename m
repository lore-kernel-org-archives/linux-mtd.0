Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16YnNQ-0001Ve-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Feb 2002 12:10:08 +0000
Subject: Re: chip drivers
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: 
	<Pine.LNX.4.44.0202070041040.1927-100000@lapdancer.baythorne.internal>
References: 
	<Pine.LNX.4.44.0202070041040.1927-100000@lapdancer.baythorne.internal>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Date: 07 Feb 2002 13:20:51 +0100
Message-Id: <1013084451.24991.0.camel@pcjonashg>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, 2002-02-06 at 15:43, David Woodhouse wrote:
> On 6 Feb 2002, Jonas Holmberg wrote:
>=20
> > Do you mean J=F6rn Engels patches
> > (http://wh.fh-wedel.de/~joern/software/kernel/)? Are they expected to b=
e
> > committed to the MTD CVS soon?
>=20
> Yes - I believe they contain support for this. I'm intending to merge the=
m=20
> as soon as I've finished all the destabilising stuff in JFFS2 (eCos=20
> support, NAND flash support) and when I stop ignoring Linus' 2.5 kernel.
>=20
> At that point I'll look at merging J=F6rn's patches into a 2.5 branch, wh=
ich
> should be usable in 2.4 but won't be submitted to Marcelo.

I need a solution that will work in 2.4. It sounds like I shouldn't rely
on J=F6rn's patches working in 2.4.

What really annoys me is that even though different probe funcions will
find two different chips, the same driver will still be used
(cfi_cmdset_0002 in my case) for both chips. So if I could merge the two
mtd_info structs (and everything they point to, like eraseregions and
flchip structs) the result ought to allow me to create devices that
start in one chip and end in the other using the partition code in
current CVS.

This can be done in two ways at least: an ugly merge-function (kind of a
+ operator for mtd_infos), or make the probe functions check the
map->fldrv_priv and use an existing mtd_info before creating a new one.
I prefer the latter. I think it would work if I add an offset field to
map_info that can be used for the second probe (added to all offsets in
eraseregions and flchips for the second probe). The only problem would
be the chipshift field in cfi_private (I think) and it could be removed
and replaced by the start (offset) field in flchip where used.

The second probe with the same map would, of course, have to fail if
there were a mismatch in interleave, device_type etc.

I would like to get your opinion on this. Would it have any chance of
ending up in 2.4 if it works?

/Jonas

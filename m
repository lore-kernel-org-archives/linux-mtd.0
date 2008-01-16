Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JF9np-0005Wt-P1
	for linux-mtd@lists.infradead.org; Wed, 16 Jan 2008 15:03:42 +0000
Subject: Re: [PATCH] UBI: add auto-resize feature
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
In-Reply-To: <20080116150336.16917.1867.sendpatchset@golum>
References: <20080116150336.16917.1867.sendpatchset@golum>
Content-Type: text/plain; charset=utf-8
Date: Wed, 16 Jan 2008 16:29:46 +0200
Message-Id: <1200493786.3956.41.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Frank Haverkamp <haver@vnet.ibm.com>,
	Adrian Hunter <ext-Adrian.Hunter@nokia.com>,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-01-16 at 17:03 +0200, Artem Bityutskiy wrote:
> >From df4d5783bde51db7a213db929252718dbc4381ca Mon Sep 17 00:00:00 2001
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date: Wed, 16 Jan 2008 15:44:24 +0200
> Subject: [PATCH] UBI: add auto-resize feature
>=20
> The problem: NAND flashes have different amount of initial bad physical
> eraseblocks (marked as bad by the manufacturer). For example, for 256MiB
> Samsung OneNAND flash there might be from 0 to 40 bad initial eraseblocks=
,
> which is about 2%. When UBI is used as the base system, one needs to know
> the exact amount of good physical eraseblocks, because this number is
> needed to create the UBI image which is put to the devices during
> production. But this number is not know, which forces us to use the
> minimum number of good physical eraseblocks. And UBI additionally
> reserves some percentage of physical eraseblocks for bad block handling
> (default is 1%), so we have 1-3% of PEBs reserved at the end, depending
> on the amount of initial bad PEBs. But it is desired to always have
> 1% (or more, depending on the configuration).
>=20
> Solution: this patch adds an "auto-resize" flag to the volume table.
> The volume which has the "auto-resize" flag will automatically be re-size=
d
> (enlarged) on the first UBI initialization. UBI clears the flag when
> the volume is re-sized. Only one volume may have the "auto-resize" flag.
>=20
> So, the production UBI image may have one volume with "auto-resize"
> flag set, and its size is automatically adjusted on the first boot
> of the device.

Forgot to note that this is backward-compatible.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

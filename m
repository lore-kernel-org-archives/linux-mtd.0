Received: from mail01.prevas.se ([62.119.151.131])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Isav0-0000U2-IB
	for linux-mtd@lists.infradead.org; Thu, 15 Nov 2007 04:21:56 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Wrong data CRC in data node
Date: Thu, 15 Nov 2007 10:21:45 +0100
Message-ID: <F0D565FB8733054DAF4888820C74C98D234B58@prevas1.prevas.se>
In-Reply-To: <20071114083648.11cc22ac@weaponx>
References: <F0D565FB8733054DAF4888820C74C98D234AE3@prevas1.prevas.se>
	<20071114083648.11cc22ac@weaponx>
From: "Jesper Saxtorph" <Jesper.Saxtorph@prevas.dk>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-
> bounces@lists.infradead.org] On Behalf Of Josh Boyer
> Sent: 14. november 2007 15:37
>=20
> On Wed, 14 Nov 2007 13:23:32 +0100
> "Jesper Saxtorph" <Jesper.Saxtorph@prevas.dk> wrote:
>=20
> > I wonder if there can be some kind of cache active (in 2.6.19 contra
> 2.6.12) we
> > are not aware of, that we should deactivate.
> >
> > Is this a know this issue?
> >
> > Any suggestions to what I could try?
>=20
> Check to see if CONFIG_JFFS2_FS_WRITEBUFFER is set.  If so, you can
try
> turning that off.

The description of the mentioned kernel option states that "This
functionality is required" for DataFlash.
Therefore it is enabled and was it also on kernel 2.6.12

If I try anyway I get:
jffs2: Cannot operate on DataFlash unless jffs2 DataFlash support is
compiled in.
No filesystem could mount root, tried:  jffs2
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(31,2)

So I guess the kernel option describtion is correct.

-Jesper

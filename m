Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Joj9K-0003FD-6A
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 17:52:54 +0000
Subject: Re: JFFS2 powerfail ?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20080423174858.GA12903@shareable.org>
References: <1531E53627F1F749B4FE809BF2A4EB674AF845@WETMEX10.loepfe.com>
	<1208964812.11721.81.camel@sauron>
	<20080423174858.GA12903@shareable.org>
Content-Type: text/plain; charset=utf-8
Date: Wed, 23 Apr 2008 20:52:58 +0300
Message-Id: <1208973178.11721.84.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "Vellemans, Noel" <Noel.Vellemans@visionBMS.com>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-04-23 at 18:48 +0100, Jamie Lokier wrote:
> Artem Bityutskiy wrote:
> > > JFFS2 notice: (791) check_node_data: wrong data CRC in data node at 0=
x01062120: read 0xfac2f85a, calculated 0x9ac0c6d1.
> > > JFFS2 notice: (791) check_node_data: wrong data CRC in data node at 0=
x002b9bf0: read 0x9f182fab, calculated 0x4ad20e5f.
> > > JFFS2 notice: (791) check_node_data: wrong data CRC in data node at 0=
x002b5d60: read 0x79a2a9d8, calculated 0x35234c9a.
> >=20
> > This is normal. It's just half-written nodes which correspond to the
> > last writes you made before the power cut. They are harmless, although
> > spam the syslog. JFFS2 cannot remove them straight after mount, so they
> > may accumulate. Which means each time you see corruption messages for
> > the previous unclean reboots. However, the corrupted nodes will go away
> > some time, when JFFS2 decides to garbage-collect corresponding
> > eraseblocks. IOW, don't worry, this is a feature.
>=20
> If they are going to be removed at the next GC, it would be nice to
> remove them earlier by overwriting them with all-1s - would that work?
>=20

Yes, it is not a big problem to remember such blocks on scan and then
garbage collect them. Its just nobody cared enough to implement this.
You could try :-)

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

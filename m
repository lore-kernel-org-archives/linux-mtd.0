Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K1gci-0003g5-3K
	for linux-mtd@lists.infradead.org; Thu, 29 May 2008 11:48:48 +0000
Subject: RE: [PATCH][JFFS2] Reschedule during scan of partly emptyeraseblock
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nielsen David Marqvar <David.Nielsen@frequentis.com>
In-Reply-To: <B80D0E83691CB840ACE9714151F8638501571080@VIECLEX01.frequentis.frq>
References: <B80D0E83691CB840ACE9714151F863850157100C@VIECLEX01.frequentis.frq>
	<1212054392.31023.66.camel@sauron>
	<B80D0E83691CB840ACE9714151F8638501571080@VIECLEX01.frequentis.frq>
Content-Type: text/plain; charset=utf-8
Date: Thu, 29 May 2008 14:49:29 +0300
Message-Id: <1212061769.31023.68.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 2008-05-29 at 13:40 +0200, Nielsen David Marqvar wrote:
> On Thu, 2008-05-29 at 11:47 +0200, Artem Bityutskiy wrote:
> > > This patch adds rescheduling to the loop that scans an empty area of
> > > an eraseblock.
> > > + /* check for resched - searching an eraseblock may take several ms =
*/
> > > + if ( (ofs & 0x7ff /* for each 2KiB */) =3D=3D 0)
> > > + 	cond_resched();
> > > +
> >=20
> > I would rather add cond_resched() to jffs2_fill_scan_buf()
> > unconditionally. Conditional cond_resched() really looks bad.
>=20
> I don't see how adding cond_resched() to jffs2_fill_scan_buf() will
> remove the long delay imposed by the while() loop that scans an empty
> area of an eraseblock - the loop (placed just after the label
> "more_empty:") will scan from ofs until scan_end unless it finds a
> non-erased area.
> There's an outer while loop around this one and the outer loop=20
> already contains a cond_resched(), so it's not a new thing that
> cond_resched() may be needed during the scan.

Ok, I see.=20

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

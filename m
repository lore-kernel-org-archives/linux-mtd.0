Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16c1yy-0006p1-00
	for <linux-mtd@lists.infradead.org>; Sat, 16 Feb 2002 10:22:16 +0000
Date: Sat, 16 Feb 2002 11:33:22 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: MTD concat layer
In-Reply-To: <20020215194033.B10201@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.21.0202161106310.17237-100000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
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


On Fri, 15 Feb 2002, J=F6rn Engel wrote:

> dwmw2 wrote:=20
> > Fewer wrapper layers to go through. Look at the part_read() call I=20
> > implemented - is that really so bad for the case where people don't hav=
e=20
> > multiple 'sections' in each partition?
>=20
> Are fewer wrapper layers really an advantage? They don't improve
> maintainability or correctness, nor do they give new features.
> An additional wrapper only needs one additional function call, so
> execution time should not degrade much. But it will actually improve,
> whenever you don't need the additional layer.

I fully agree! Nevertheless I am considering to make another attempt to
code it according to David's suggestions. That would give us some
hard data for comparison. Problem is I can't afford to spend much
time on this, so it may take a while.

Could the current code go into CVS in the meantime as a provisional
solution ? (I keep seeing people ask for this functionality)

> Apart from that, it is often quite a good idea to write the same code
> twice. First implementations usually suck, especially mine.

:-)

Actually, for a "first implementation", I'm quite happy with the concat
layer (apart from the erase function bug that David spotted -- I'll
provide a fix for it next week). But then again, this isn't really the
first implementation, only the first one I dared to post :-)

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10

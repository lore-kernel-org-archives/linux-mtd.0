Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18AaKL-0003FZ-00
	for <linux-mtd@lists.infradead.org>; Sat, 09 Nov 2002 18:27:25 +0000
Date: Sat, 9 Nov 2002 19:57:37 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
cc: Asier Santamaria <asier_s@telefonica.net>, linux-mtd@lists.infradead.org
Subject: Re: Compact Flash Reliability Embeded System
In-Reply-To: <20021109155706.GA18502@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.21.0211091927470.25882-100000@dagobert.svc.sysgo.de>
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


On Sat, 9 Nov 2002, J=F6rn Engel wrote:

> On Fri, 8 November 2002 19:47:21 +0100, Asier Santamaria wrote:
> >=20
> > I've read something about the Compact Flash reliability problems on an
> > embedded system. I'm developing an embedded system running Linux and I =
was
> > thinking to use a Compact Flash as storage drive. But I read that Compa=
ct
> > Flash is not the most reliable storage system, that you can have proble=
ms
> > during the power failure or bad shutting down of the system (usual on a=
n
> > embedded system), that the CF can death.
> > Anyone has more information about that?
>=20
> Try http://www.linux-mtd.infradead.org/tech/nand.html
>=20

Hmm, not sure this helps, since the OP asked about Compact Flashes.

Technically, CF devices behave exactly like IDE disks and that is how
Linux deals with them. Therefore, CF's have nothing to do with MTD and
thus they are not really on topic here.

FWIW, I have seen credible reports from people on various mailing lists
saying that they had CFs break after a loss of power, when a write access
was in progress. However, I have yet to see an official statement from a
CF manufacturer about this. BTW, (true) IDE disks may also break if you
remove power while a write is in progress.

Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO AG
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10

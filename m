Received: from sparta.scl.co.uk ([212.38.81.5] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17264M-0006h8-00
	for <linux-mtd@lists.infradead.org>; Mon, 29 Apr 2002 08:59:34 +0100
From: John Sutton <john@scl.co.uk>
To: Ilguiz Latypov <ilatypov@superbt.com>
Subject: Re: GRUB patch won't stick ;-(
Date: Sun, 28 Apr 2002 23:14:53 +0100
In-Reply-To: <02042720331400.31949@diva.localdomain>
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Message-Id: <02042823204800.03654@diva.localdomain>
Content-Transfer-Encoding: quoted-printable
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

Hi Ilguiz

Thanks, that was all that was needed ;-(  I'd not tried changing the -p
option because I figured that if *most* of the patch worked, surely it
must be right!  I'll have to revisit man patch...

> John,
>=20
> There is probably something wrong with the patch.  Meanwhile, have you
> tried to supply the the "-p0" option to the patch utility?
>=20
> Ilguiz
>=20
> On Sat, 27 Apr 2002, John Sutton wrote:
>=20
> > Perhaps you should have used the -p or --strip option?

***************************************************
John Sutton
SCL Internet
URL http://www.scl.co.uk/
Tel. +44 (0) 1239 711 888
***************************************************

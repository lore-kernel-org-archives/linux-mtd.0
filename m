Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JjLrO-0003Q1-1v
	for linux-mtd@lists.infradead.org; Tue, 08 Apr 2008 22:00:10 +0000
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1JjLrG-0000ao-VM
	for linux-mtd@lists.infradead.org; Tue, 08 Apr 2008 22:00:02 +0000
Received: from wireless.queued.net ([66.92.71.179])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2008 22:00:02 +0000
Received: from dilinger by wireless.queued.net with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2008 22:00:02 +0000
To: linux-mtd@lists.infradead.org
From: Andres Salomon <dilinger@queued.net>
Subject: Re: [patch 2/15] fs/logfs/logfs_abi.h
Date: Tue, 8 Apr 2008 17:52:59 -0400
Message-ID: <20080408175259.6f5d3d2c@ephemeral>
References: <20080401181308.512473173@logfs.org>
	<20080401181332.853833002@logfs.org>
	<200804080224.18014.arnd@arndb.de>
	<20080408093946.GA31266@logfs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: news <news@ger.gmane.org>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 8 Apr 2008 11:39:46 +0200
J=C3=B6rn Engel <joern@logfs.org> wrote:

> On Tue, 8 April 2008 02:24:17 +0200, Arnd Bergmann wrote:
> >=20
> > Great to see a new version finally posted again!
>=20
> As Artem already noted, the transition to write-back caching was a
> significant change and initially caused a huge drop in quality.  Took a
> while.
>=20
> > On Tuesday 01 April 2008, joern@logfs.org wrote:
> > > --- /dev/null	2008-04-02 16:29:12.813336657 +0200
> > > +++ linux-2.6.24logfs/fs/logfs/logfs_abi.h	2008-04-01 21:02:34.980239=
877 +0200
> > > @@ -0,0 +1,523 @@
> > > +/*
> > > + * fs/logfs/logfs.h
> >=20
> > The comment doesn't match the file name, and the file name doesn't
> > match the purpose -- you are not defining an "application" binary
> > interface but rather the medium format, with the small exception
> > of the chattr flags.
>=20
> Now it matches the file name.  If you have a better name than "abi",
> I'll use that.
>=20
> > > +#ifndef fs_logfs_logfs_abi_h
> > > +#define fs_logfs_logfs_abi_h
> >=20
> > Everyone else uses capital letters for these.
>=20
> Changed.
>=20

Hm, logfs.patch.771 contains lowercase.  Do you have your latest
patch set somewhere online?  Alternatively, would you mind pushing
your git tree somewhere public?

Received: from moutng.kundenserver.de ([212.227.126.183])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I8j3a-00066p-ID
	for linux-mtd@lists.infradead.org; Wed, 11 Jul 2007 16:45:08 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: =?utf-8?q?J=C3=B6rn_Engel?= <joern@logfs.org>
Subject: Re: [PATCH Take 3] MTD driver for alauda chips
Date: Wed, 11 Jul 2007 22:36:18 +0200
References: <20070709223704.GC18501@lazybastard.org>
	<200707112005.44089.arnd@arndb.de>
	<20070711191741.GA708@lazybastard.org>
In-Reply-To: <20070711191741.GA708@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200707112236.18990.arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 11 July 2007, J=C3=B6rn Engel wrote:
> On Wed, 11 July 2007 20:05:43 +0200, Arnd Bergmann wrote:

> > > +/* Address shifting */
> > > +#define PBA_LO(pba) ((pba & 0xF) << 5)
> > > +#define PBA_HI(pba) (pba >> 3)
> > > +#define PBA_ZONE(pba) (pba >> 11)
> >=20
> > What is PBA?
>=20
> I guess it means "physical block address", as opposed to logical block
> address.  Whatever it means, I didn't see a reason to change the name.

I could have figured that out myself, the comment was more about the
problem that the acronym is neither obvious nor explained in a comment ;-)

	Arnd <><

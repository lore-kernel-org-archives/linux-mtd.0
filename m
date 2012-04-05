Received: from cooperlighting-sw.cooperlighting.com ([216.130.131.68])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SFtDO-0000NV-B5
 for linux-mtd@lists.infradead.org; Thu, 05 Apr 2012 20:23:30 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: RE: nanddump shows all bad blocks
Date: Thu, 5 Apr 2012 16:22:56 -0400
Message-ID: <5D308BD40154E4439D82454FE483A50206619C69@EVS4.nam.ci.root>
In-Reply-To: <5D308BD40154E4439D82454FE483A50206619BAA@EVS4.nam.ci.root>
References: <5D308BD40154E4439D82454FE483A50206619995@EVS4.nam.ci.root>
 <4F7DEF7A.1090100@gmail.com>
 <5D308BD40154E4439D82454FE483A50206619BAA@EVS4.nam.ci.root>
From: "Bishop, Mark" <Mark.Bishop@cooperindustries.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-
> bounces@lists.infradead.org] On Behalf Of Bishop, Mark
> Sent: Thursday, April 05, 2012 3:39 PM
> To: linux-mtd@lists.infradead.org
> Subject: RE: nanddump shows all bad blocks
>=20
> > Sounds as if the kernel is using a different ECC method to read the
> > data
> > than what u-boot used to write it...
> >
>=20
> This has nothing to do with the internal ECC being turned on or off on
> the part?
>=20


Nevermind.  Problem solved.  Thanks everyone, especially Mike.

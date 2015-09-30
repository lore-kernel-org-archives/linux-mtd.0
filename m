Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhBuO-0001oY-Th
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 07:34:37 +0000
Date: Wed, 30 Sep 2015 09:33:55 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Bean Huo =?UTF-8?B?6ZyN5paM5paM?= (beanhuo)" <beanhuo@micron.com>
Cc: Richard Weinberger <richard@nod.at>, "dedekind1@gmail.com"
 <dedekind1@gmail.com>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "baruch@tkos.co.il" <baruch@tkos.co.il>, "asierra@xes-inc.com"
 <asierra@xes-inc.com>, "guz.fnst@cn.fujitsu.com" <guz.fnst@cn.fujitsu.com>,
 "gsi@denx.de" <gsi@denx.de>, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Frank Liu
 =?UTF-8?B?5YiY576k?= (frankliu)" <frankliu@micron.com>, Andrea Scian
 <rnd4@dave-tech.it>, "Karl Zhang =?UTF-8?B?5byg5Y+M6ZSj?= (karlzhang)"
 <karlzhang@micron.com>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>, Stefan Roese <sr@denx.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/9] drivers:mtd:UBI: add bakvol module for MLC NAND
 paired page issue
Message-ID: <20150930093355.3266a4b3@bbrezillon>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF4D4C6@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4CEC3@NTXXIAMBX02.xacn.micron.com>
 <560A59B8.4000701@nod.at>
 <A765B125120D1346A63912DDE6D8B6310BF4D4C6@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 30 Sep 2015 05:31:43 +0000
Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo) <beanhuo@micron.com> wrote:

> > Am 28.09.2015 um 09:02 schrieb Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (be=
anhuo):
> > > Hello,
> > >
> > > This series aims at adding a bakvol module for MLC NAND paired page
> > > Power loss protection.
> > > MLC NAND paired page power loss is a known issue so far, MLC NAND
> > > pages are coupled in a sense that if you cut power while writing to a
> > > page, you corrupt not only this page, but also one of the previous pa=
ges
> > which is paired with the current one.
> > > Currently, there is no a perfect solution for this.
> > > This paired page solution is based on NAND multiple plane program
> > > feature. For this Patch, only used dual plane page program, means two
> > > different plane pages can Be programmed together at the same time.
> > > Dual plane page program only implements in backup operation. Only
> > > lower page data Be duplicated and back up into a internal log volume =
by
> > dual plane program method.
> > >
> > > This patch has been testing on Micron 70s/80s/90s MLC NAND.
> > > Of course there are some places needed to be improved and simplified.
> > >
> > > Any suggestion and comments welcomed.
> >=20
> > As stated before, using OOB in UBI is not going to happen unless proven=
 that
> > there is absolutely no other way to solve the paired pages problem.
> >=20
> > Nacked-by: Richard Weinberger <richard@nod.at>
> >=20
> > Sorry,
> > //Richard
>=20
> Hi, Richard
> Thanks for your concern. I am a new patch submitter.
> Can you tell me Nacked-by means?
>=20
> By the way, Do you review my patches series ? I don't backup duplicated d=
ata in OOB .

That's not what Richard said, he just pointed that you were using the
OOB area, and you're actually using it to store the information about
which page you're backuping.

> Can you specify which sector codes ? so that I can explain it in detail.

And as answered by Richard, check_original_data() and
mtd_write_dual_plane_oob() are filling the OOB buf with the original
page offset, so you're definitely using the OOB area to store metadata.

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

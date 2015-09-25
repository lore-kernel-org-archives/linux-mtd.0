Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfOgK-0001Fd-Qf
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2015 08:48:41 +0000
Date: Fri, 25 Sep 2015 10:48:01 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Bean Huo =?UTF-8?B?6ZyN5paM5paM?= (beanhuo)" <beanhuo@micron.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>, Stefan Roese
 <sr@denx.de>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn
 (jlauruhn)" <jlauruhn@micron.com>, "dedekind1@gmail.com"
 <dedekind1@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "shuangshuo@gmail.com" <shuangshuo@gmail.com>, "rnd4@dave-tech.it"
 <rnd4@dave-tech.it>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "Karl
 Zhang =?UTF-8?B?5byg5Y+M6ZSj?= (karlzhang)" <karlzhang@micron.com>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
Message-ID: <20150925104801.74cd22fe@bbrezillon>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF4CBFC@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4CAA8@NTXXIAMBX02.xacn.micron.com>
 <20150925093023.113ceeb1@bbrezillon>
 <A765B125120D1346A63912DDE6D8B6310BF4CBFC@NTXXIAMBX02.xacn.micron.com>
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

Hi Bean,

On Fri, 25 Sep 2015 08:25:44 +0000
Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo) <beanhuo@micron.com> wrote:

> > Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo) <beanhuo@micron.com> wro=
te:
> >=20
> > > > And 3:
> > > > Only NAND provides an OOB area. Other flash devices like parallel or
> > > > SPI NOR don't. And we definitely want to continue supporting
> > > > platforms with such flash devices and UBI (and UBIFS).
> > > >
> > > > Thanks,
> > > > Stefan
> > > >
> > > For MLC NAND paired pages issue, we have developed two methods to
> > > solve it in UBI layer, We hope that every expert on UBI/UBIFS can giv=
e more
> > suggestions about how to improve and perfect it.
> > > I think ,this week, I can submit first solution patch out. Currently =
do coding
> > style.
> >=20
> > Are you referring to the suggestion proposed by Karl (using the OOB are=
a to
> > store UBI metadata), or is this something else?
> >=20
> > Best Regards,
> >=20
> > Boris
> >=20
> > --
> > Boris Brezillon, Free Electrons
> > Embedded Linux and Kernel engineering
> > http://free-electrons.com
>=20
> Hi, Boris
> For NAND OOB area, it is dedicated for ECC value, at the same time,
> User available area in OOB is not covered by ECC protection mechanism.
> so saving EC or VID information in OOB is not a perfect solution.
> But if there is additional space, and this space can be covered by ECC,
> We can try it.

The problem is, we want the solution to be as generic as possible, and
not all NAND/ECC controllers are able to protect OOB bytes :-/.

> By the way, I want to allocate a new internal volume to solve paired page=
s issue.
> How do you think about this ?

I actually had a similar idea, but instead of creating a new metadata
volume, I wanted to reuse the fastmap one.
My idea was not to duplicate data from already programmed pages in
this volume (not sure this was your idea either, could you tell us
more about what you had in mind?), but instead use it to log UBI
operations like
- PEB erasure: to save the EC counter and recover it if a power-cut
  occurs after the erasure but before the EC header is written to the
  block. Doing that would also partly solve the 'unstable bits' issue,
  since we would be able to know which block was being erased before
  the power-cut occured.
- LEB map: to save the lnum <-> pnum association and recover from VID
  header corruption.
- Last written block (still not happy with that): to log on which block
  the last write operation has taken place. This would help solving the
  'unstable bits' problem, but it would also add a non negligible
  overhead if writes are not consecutive (not done in the same LEB)

Other ideas are welcome.

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

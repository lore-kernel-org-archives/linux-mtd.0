Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfNSw-0000ei-7U
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2015 07:30:46 +0000
Date: Fri, 25 Sep 2015 09:30:23 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Bean Huo =?UTF-8?B?6ZyN5paM5paM?= (beanhuo)" <beanhuo@micron.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>, Stefan Roese
 <sr@denx.de>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn
 (jlauruhn)" <jlauruhn@micron.com>, "dedekind1@gmail.com"
 <dedekind1@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "shuangshuo@gmail.com" <shuangshuo@gmail.com>, "rnd4@dave-tech.it"
 <rnd4@dave-tech.it>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
Message-ID: <20150925093023.113ceeb1@bbrezillon>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF4CAA8@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4CAA8@NTXXIAMBX02.xacn.micron.com>
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

Hi,

On Fri, 25 Sep 2015 00:43:37 +0000
Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo) <beanhuo@micron.com> wrote:

> > And 3:
> > Only NAND provides an OOB area. Other flash devices like parallel
> > or SPI NOR don't. And we definitely want to continue supporting
> > platforms with such flash devices and UBI (and UBIFS).
> >=20
> > Thanks,
> > Stefan
> >=20
> For MLC NAND paired pages issue, we have developed two methods to solve i=
t in UBI layer,
> We hope that every expert on UBI/UBIFS can give more suggestions about ho=
w to improve and perfect it.
> I think ,this week, I can submit first solution patch out. Currently do c=
oding style.

Are you referring to the suggestion proposed by Karl (using the OOB
area to store UBI metadata), or is this something else?

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

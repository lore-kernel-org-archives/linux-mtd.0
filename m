Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgT4R-0005qT-4t
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 07:42:00 +0000
Date: Mon, 28 Sep 2015 09:41:34 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Bean Huo =?UTF-8?B?6ZyN5paM5paM?= (beanhuo)" <beanhuo@micron.com>
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>, "adrian.hunter@intel.com"
 <adrian.hunter@intel.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "baruch@tkos.co.il" <baruch@tkos.co.il>,
 "asierra@xes-inc.com" <asierra@xes-inc.com>, "guz.fnst@cn.fujitsu.com"
 <guz.fnst@cn.fujitsu.com>, "gsi@denx.de" <gsi@denx.de>, "richard@nod.at"
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Frank Liu
 =?UTF-8?B?5YiY576k?= (frankliu)" <frankliu@micron.com>, Andrea Scian
 <rnd4@dave-tech.it>, "Peter Pan =?UTF-8?B?5r2Y5p+P5a6P?= (peterpan)"
 <peterpan@micron.com>, "Karl Zhang =?UTF-8?B?5byg5Y+M6ZSj?= (karlzhang)"
 <karlzhang@micron.com>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>, Stefan Roese <sr@denx.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/9] drivers:mtd:UBI: add bakvol module for MLC NAND
 paired page issue
Message-ID: <20150928094134.2ab8557e@bbrezillon>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF4CEC3@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF4CEC3@NTXXIAMBX02.xacn.micron.com>
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

Next time you send a patch series, could send all the patches in reply
to the cover letter?

On Mon, 28 Sep 2015 07:02:35 +0000
Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo) <beanhuo@micron.com> wrote:

> Hello,
>=20
> This series aims at adding a bakvol module for MLC NAND paired page
> Power loss protection.
> MLC NAND paired page power loss is a known issue so far, MLC NAND pages a=
re
> coupled in a sense that if you cut power while writing to a page, you cor=
rupt not only
> this page, but also one of the previous pages which is paired with the cu=
rrent one.
> Currently, there is no a perfect solution for this.=20
> This paired page solution is based on NAND multiple plane program feature=
. For this
> Patch, only used dual plane page program, means two different plane pages=
 can
> Be programmed together at the same time.
> Dual plane page program only implements in backup operation. Only lower p=
age data
> Be duplicated and back up into a internal log volume by dual plane progra=
m method.

Hm, I'm not very fond of the idea, especially because of the complexity
caused by dual plane program operations (you can't take a random block
to write your backup on it, which means WL is complexified too), and
the fact that you're duplicating data (thus introducing a performance
penalty and storage overhead).

>=20
> This patch has been testing on Micron 70s/80s/90s MLC NAND.
> Of course there are some places needed to be improved and simplified.
>=20
> Any suggestion and comments welcomed.

Sure, I'll try to review it soon.

Thanks for submitting those patches.

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

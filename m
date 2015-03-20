Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYyi1-0006fR-1r
 for linux-mtd@lists.infradead.org; Fri, 20 Mar 2015 15:19:37 +0000
Date: Fri, 20 Mar 2015 16:19:03 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Qi Wang =?UTF-8?B?546L6LW3?= (qiwang)" <qiwang@micron.com>
Subject: Re: detect and manage power cut on MLC NAND
Message-ID: <20150320161903.608a79fc@bbrezillon>
In-Reply-To: <71CF8D7F32C5C24C9CD1D0E02D52498A7717470C@NTXXIAMBX02.xacn.micron.com>
References: <mailman.37706.1426822709.22890.linux-mtd@lists.infradead.org>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7717444D@NTXXIAMBX02.xacn.micron.com>
 <EACD232272DA4849B060F0828564D13B57804E26B6@ntcex01.corp.netcomm.com.au>
 <71CF8D7F32C5C24C9CD1D0E02D52498A771744B0@NTXXIAMBX02.xacn.micron.com>
 <20150320095822.7e1979ff@bbrezillon> <550BE355.8020009@nod.at>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7717470C@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn \(jlauruhn\)" <jlauruhn@micron.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, "rnd4@dave-tech.it" <rnd4@dave-tech.it>,
 "Zoltan Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Frank
 Liu =?UTF-8?B?5YiY576k?= \(frankliu\)" <frankliu@micron.com>,
 "andrea.marson@dave.eu" <andrea.marson@dave.eu>,
 "Bean Huo =?UTF-8?B?6ZyN5paM5paM?= \(beanhuo\)" <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Qi,

On Fri, 20 Mar 2015 15:05:54 +0000
Qi Wang =E7=8E=8B=E8=B5=B7 (qiwang) <qiwang@micron.com> wrote:

> Hi Boris, Richard
>=20
> On Fri, 20 Mar 2015 05:08 PM +0000 Richard Weinberger wrote:
> >
> >Am 20.03.2015 um 09:58 schrieb Boris Brezillon:
> >> Hi Qi,
> >>
> >> On Fri, 20 Mar 2015 07:44:58 +0000
> >> Qi Wang =E7=8E=8B=E8=B5=B7 (qiwang) <qiwang@micron.com> wrote:
> >>
> >>>>
> >>>> I seem to remember a requirement to write pages to a block in a
> >>>> monotonic fashion (low to high). Is that still the case? It
> >>>> seems that the low page backup could violate that rule otherwise.
> >>>
> >>> Yes, pages need to be programmed from low to high. But it is possible
> >>> to skip some pages. Take a example,
> >>>
> >>> below page program ordering is ok.
> >>> Page 0, page 1, page 2, page 4, page 6, page 10, page 15, etc..
> >>> Just make sure don't turn back to program the low page is ok.
> >>
> >> I asked a question regarding the programming sequence in answer to Iwo,
> >> but I'm not sure you were in Cc, so I'm asking it again.
> >>
> >> Say page 1 is paired with page 4, can we program pages in this order:
> >> 1, 4, 2, 5, 3, 6, ..., so that both paired pages are programmed
> >> together (the Jumbo page approach Iwo described in his mail).
> >
> >That's a good question. I was always told that you're not allowed
> >to program pages in a non-linear manner.
> >
>=20
> Yes, you are right. This method isn't allowed. User can only program page
> within a block from low address to high address.

Do you know the reason behind this ?



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

Received: from mail1.bemta8.messagelabs.com ([216.82.243.197])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYpgF-0000xB-0a
 for linux-mtd@lists.infradead.org; Fri, 20 Mar 2015 05:41:11 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: nick <xerofoify@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Andrea Marson <andrea.marson@dave.eu>
Date: Fri, 20 Mar 2015 16:40:31 +1100
Subject: RE: RFC: detect and manage power cut on MLC NAND
Message-ID: <EACD232272DA4849B060F0828564D13B57804E268D@ntcex01.corp.netcomm.com.au>
References: <mailman.37176.1426610573.22890.linux-mtd@lists.infradead.org>
 <mailman.37176.1426610573.22890.linux-mtd.{ec43ae5e-9450-4d5f-9aa7-4de61fefcb43}.0@lists.infradead.org>
 <0D23F1ECC880A74392D56535BCADD7354973E51A@NTXBOIMBX03.micron.com>
 <55093B1E.2050805@dave.eu>
 <0D23F1ECC880A74392D56535BCADD7354973E995@NTXBOIMBX03.micron.com>
 <550A8D19.90404@dave.eu>,<20150319101246.26806e95@bbrezillon>
 <EACD232272DA4849B060F0828564D13B57804E2680@ntcex01.corp.netcomm.com.au>,
 <550B961B.6050407@gmail.com>
In-Reply-To: <550B961B.6050407@gmail.com>
Content-Language: en-AU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Andrea Scian <rnd4@dave-tech.it>,
 "Jeff Lauruhn \(jlauruhn\)" <jlauruhn@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 20 Mar 2015 14:38:03 +1100
nick <xerofoify@gmail.com> wrote:
>=20
>=20
> On 2015-03-19 08:25 PM, Iwo Mergler wrote:
> >=20
> > Get UBI to map the paired pages into a single write unit. Jumbo page
> > if you will.  So, instead of a block with 64 pages, we get 32 pages,
> > twice as large.
> >=20
> > Thus, the paired pages will be written in quick succession. A power
> > cut during this is reduced to the unstable bits issue we already
> > have with SLC.
> >=20
> > UBI could take the risk and split the first page pair between EC and
> > VID headers, replacing the EC info with average in case of unlikely
> > failure.
> >=20
> > Would this work?
> >=20
> >=20
> > Best regards,
> >=20
> > Iwo
> >=20
> >=20
> >=20
> Iwo,
> Not a bad idea but what happens if the power gets cut after the first
> 2 pages then we lose 30 pages worth of data.  Unless the hardware is
> very fast and can move the pages over in a millisecond or less then
> this can't really worth. However if we make these transactions atomic
> in nature this may work better as CPU instruction respond is in the
> nanosecond range even on low cost embedded boards using UBI for raw
> flash embedded on to themselves. Nick

I'm not sure I understand - why would you lose any data outside the
affected paired pages?

Also, write order within the block will still be respected. That is,
when writing the first page pair, the other pages will be erased.


Best regards,

Iwo

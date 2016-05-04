Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ay21L-0008EH-3S
 for linux-mtd@lists.infradead.org; Wed, 04 May 2016 18:59:39 +0000
Date: Wed, 4 May 2016 20:59:06 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Bean Huo =?UTF-8?B?6ZyN5paM5paM?= (beanhuo)" <beanhuo@micron.com>
Cc: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Alexander Kaplan <alex@nextthing.co>,
 David Gstir <david@sigma-star.at>, David Oberhollenzer
 <goliath@sigma-star.at>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [ANNOUNCE] MLC support for UBI/UBIFS
Message-ID: <20160504205906.15d75592@bbrezillon>
In-Reply-To: <20160504111735.33b96d7e@bbrezillon>
References: <57221E28.9050102@nod.at>
 <A765B125120D1346A63912DDE6D8B6310BF700B9@NTXXIAMBX02.xacn.micron.com>
 <5729B259.9010207@nod.at>
 <A765B125120D1346A63912DDE6D8B6310BF70101@NTXXIAMBX02.xacn.micron.com>
 <20160504111735.33b96d7e@bbrezillon>
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

On Wed, 4 May 2016 11:17:35 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Wed, 4 May 2016 08:55:12 +0000
> Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo) <beanhuo@micron.com> wrote:
>=20
> > Hi, Richard
> > Yes , different with "dis6 and dis3", but I think this is not a perfect=
=20
> > Solution on paired-page distance detect. Because different vendor and d=
ifferent series NAND with different such paired-page distance function. as =
a result, this table will be bigger and bigger. I now want to do if we can =
probe this information from DTS. =20
>=20
> Sorry but I'm clearly opposed to that: the NAND infrastructure provides
> a way to uniquely identify the part number, let's not add extra
> information in the DT if it's not needed.
> Just giving a simple use case where putting NAND chip details in the DT
> is a bad idea: some board manufacturers choose 2 or 3 equivalent NANDs
> coming from different vendors (and those NANDs may have different
> pairing scheme). With your solution this means having one DT per NAND
> chip, which is not easy to deal with.
>=20
> For the "the table will keep growing and become unmaintainable"
> argument, I agree. My plan is to provide a per-vendor ->init() hook
> so that each vendor can implement a simpler solution to detect/assign
> the pairing scheme (I'm pretty sure this is correlated to the NAND
> technology...), or other vendor specific stuff (read-retry, HW SLC
> mode, ...).
>=20
> Regarding your initial statement, are you sure your NAND chip does not
> use one of the already defined scheme. I had a look at several NAND
> datasheets (including Micron ones), and all of them were using either
> distance 3 or distance 6.
> Can you share more information about those different pairing scheme?

Okay, I had a closer look at your "driver:mtd:ubi:add new bakvol module
in ubi layer" patch and some Micron datasheet, and it seems your L7X
NANDs are using the "standard" distance 6 scheme, but L8X are actually
using a different scheme.
This being said, I don't see any problem implementing this new scheme
(the question is, is it really used by other vendors or not).


--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

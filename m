Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYslR-0003Zm-Ao
 for linux-mtd@lists.infradead.org; Fri, 20 Mar 2015 08:58:46 +0000
Date: Fri, 20 Mar 2015 09:58:22 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Qi Wang =?UTF-8?B?546L6LW3?= (qiwang)" <qiwang@micron.com>
Subject: Re: detect and manage power cut on MLC NAND
Message-ID: <20150320095822.7e1979ff@bbrezillon>
In-Reply-To: <71CF8D7F32C5C24C9CD1D0E02D52498A771744B0@NTXXIAMBX02.xacn.micron.com>
References: <mailman.37706.1426822709.22890.linux-mtd@lists.infradead.org>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7717444D@NTXXIAMBX02.xacn.micron.com>
 <EACD232272DA4849B060F0828564D13B57804E26B6@ntcex01.corp.netcomm.com.au>
 <71CF8D7F32C5C24C9CD1D0E02D52498A771744B0@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn \(jlauruhn\)" <jlauruhn@micron.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "rnd4@dave-tech.it" <rnd4@dave-tech.it>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Frank Liu =?UTF-8?B?5YiY576k?= \(frankliu\)" <frankliu@micron.com>,
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

On Fri, 20 Mar 2015 07:44:58 +0000
Qi Wang =E7=8E=8B=E8=B5=B7 (qiwang) <qiwang@micron.com> wrote:

> >
> >I seem to remember a requirement to write pages to a block in a
> >monotonic fashion (low to high). Is that still the case? It
> >seems that the low page backup could violate that rule otherwise.
>=20
> Yes, pages need to be programmed from low to high. But it is possible
> to skip some pages. Take a example,
>=20
> below page program ordering is ok.
> Page 0, page 1, page 2, page 4, page 6, page 10, page 15, etc..
> Just make sure don't turn back to program the low page is ok.

I asked a question regarding the programming sequence in answer to Iwo,
but I'm not sure you were in Cc, so I'm asking it again.

Say page 1 is paired with page 4, can we program pages in this order:
1, 4, 2, 5, 3, 6, ..., so that both paired pages are programmed
together (the Jumbo page approach Iwo described in his mail).


[...]
>=20
> >
> >Do you envision to dedicate some blocks for this purpose? Or
> >would the duplicated pages become part of normal storage blocks?
>=20
> I don't want dedicate some blocks for this purpose, in this way,
> these blocks P/E cycle could increase quickly.=20
>=20
> My idea is to allocate low P/E cycle block from UBI block pool=20
> when need backup data. And release this block to UBI block pool
> when the backup data isn't available any more.

But you can't take a random PEB: it has to be an even or odd block
number depending on which block the page you're trying to backup
belongs to, right ?

>=20
> >
> >Naively, I see the cost of this method to be somewhere between
> >a 25% reduction in storage or a 25% increase in erase cycles,
> >depending on the backup block handling.
> >Does that match your own prediction?
>=20
> I think it depends on UBI/UBIFS behavior.=20
>=20
> For example,=20
>=20
> Condition 1 - UBI/UBIFS write a lot blocks partially
> The UBI/UBIFS write order like below:=09
> Program some pages in block0, then block1, block2,3,4,5,6...100..
> Then, UBI/UBIFS turn back to program block0,1,2... again.=20
> =09
> I think this condition need many backup blocks, as a lot data will
> be available at some time. right?

It depends on how you deal with it, but if you're assigning a backup
block for each payload/data block, then you'll have the same number of
backup and data blocks, until some data blocks are completely filled
with data.

>=20
>=20
> Condition 2 - UBI/UBIFS only write several blocks partially
> The UBI/UBIFS write order like below:=09
> Program some pages in block0, then block1, block2, 3.=20
> Then, UBI/UBIFS turn back to program block0,1,2, 3. Until one of the
> blocks is full, UBI/UBIFS will open block4, and write data into it.
>=20
> In this condition, we can only allocate 4 blocks to backup block 0,1,2,3
> data should be ok. Right?

I would say so. IOW, you're loosing half your NAND capacity in the best
case, right ?

BTW, where do you store information about where each block store its
lower pages backup ?

>=20
>=20
> For my understanding, UBI/UBIFS behavior is more like condition 2.=20

Yep, that's my understanding too, but I'm definitely not a UBIFS expert.

> Except EC header written, EC will be written into block initially.=20
> So I don't suggest use this method to backup EC.

It depends. If you want to write on the pages paired with EC and VID
headers, you'll have to somehow same EC/VID information.

>=20
> And also, some of operation don't need to backup operation, such as,
> Wear leveling, refresh etc..

That's true for the wear leveling part (and for all atomic LEB
operations in general), because a CRC is calculated and stored in the
VID header, so that data integrity of the whole LEB can be checked.

What do you mean by refresh ?

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

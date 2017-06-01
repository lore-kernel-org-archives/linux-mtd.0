Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGZCs-0008Hh-Jw
 for linux-mtd@lists.infradead.org; Thu, 01 Jun 2017 23:08:44 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Brian Norris <computersforpeace@gmail.com>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "andrew@lunn.ch"
 <andrew@lunn.ch>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, "Richard
 Weinberger" <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 3/4] mtd: mchp23k256: add partitioning support
Date: Thu, 1 Jun 2017 23:08:08 +0000
Message-ID: <92ffaa3cef7d49aeb9d5abae06e10ddb@svr-chch-ex1.atlnz.lc>
References: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
 <20170517053908.26138-4-chris.packham@alliedtelesis.co.nz>
 <20170517172911.5f926712@bbrezillon> <20170601184340.GA102137@google.com>
 <bba73e6d5f4b41a88423287300d892e5@svr-chch-ex1.atlnz.lc>
 <20170601222320.GE102137@google.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/06/17 10:23, Brian Norris wrote:=0A=
> On Thu, Jun 01, 2017 at 09:30:07PM +0000, Chris Packham wrote:=0A=
>> On 02/06/17 06:43, Brian Norris wrote:=0A=
>>> On Wed, May 17, 2017 at 05:29:11PM +0200, Boris Brezillon wrote:=0A=
>>>> Can we fix allocate_partition() to properly handle the=0A=
>>>> master->erasesize =3D=3D 0 case instead of doing that?=0A=
>>>=0A=
>>> Is everything actually ready for the eraseblock size to be 0?=0A=
>>=0A=
>> That was my initial motivation for faking it.=0A=
> =0A=
> Understood. I think it's probably better to avoid hacking drivers like=0A=
> you were about to, but I was also curious if anyone had thought through=
=0A=
> the implications of *not* forcing a non-zero size.=0A=
> =0A=
>>> That would=0A=
>>> seem surprising to many applications, I would think. Can you, for=0A=
>>> instance, even use UBI on such a device?=0A=
>>=0A=
>> I've tried ext2 and I believe Andrew has tried minix fs. We're talking=
=0A=
>> SRAM so UBI/UBIFS doesn't really provide much benefit for this use-case.=
=0A=
> =0A=
> Right. But that's not necessarily true for all NO_ERASE devices, so we'd=
=0A=
> probably want to think about that before allowing it.=0A=
=0A=
Do we need a flag to indicate SRAM-like properties? I assume there is a =0A=
difference between NO_ERASE on ROM devices where there is just no way of =
=0A=
erasing the data. For {S,F,M}RAM there is no block erase operation but =0A=
you can overwrite data to destroy it (which is actually my use-case with =
=0A=
this SPI SRAM). I was tempted to set erase_size =3D 1 at one point which =
=0A=
in my mind was technically accurate but would probably upset the mtd =0A=
layer just as much as 0.=0A=
=0A=
=0A=

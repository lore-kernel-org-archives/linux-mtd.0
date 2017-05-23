Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dCymi-0001L8-Jb
 for linux-mtd@lists.infradead.org; Tue, 23 May 2017 01:38:54 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Andrew Lunn <andrew@lunn.ch>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 5/5] mtd: mchp23k256: Add support for mchp23lcv1024
Date: Tue, 23 May 2017 01:38:22 +0000
Message-ID: <f2d5f14ab64a412eab5eab5d572cc4a6@svr-chch-ex1.atlnz.lc>
References: <20170523004317.16908-1-chris.packham@alliedtelesis.co.nz>
 <20170523004317.16908-6-chris.packham@alliedtelesis.co.nz>
 <20170523005845.GI13759@lunn.ch>
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

On 23/05/17 12:58, Andrew Lunn wrote:=0A=
> On Tue, May 23, 2017 at 12:43:17PM +1200, Chris Packham wrote:=0A=
>> The mchp23lcv1024 is software compatible with the mchp23k256, the=0A=
>> only difference (from a software point of view) is the size.=0A=
> =0A=
> This is not really true. The size of the address is also different,=0A=
> and the point of the v2 change.=0A=
=0A=
Agreed. How about this revised commit message=0A=
=0A=
--- 8< ---=0A=
mtd: mchp23k256: Add support for mchp23lcv1024=0A=
=0A=
The mchp23lcv1024 is similar to the mchp23k256, the differences (from a =0A=
software point of view) are the capacity of the chip and the size of the =
=0A=
addresses used.=0A=
=0A=
There is no way to detect the specific chip so we must be told via a =0A=
Device Tree or default to mchp23k256 when device tree is not used.=0A=
=0A=
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
Reviewed-by: Andrew Lunn <andrew@lunn.ch>=0A=
--- >8 ---=0A=
=0A=
Can someone fixup the commit message or should I re-send?=0A=
=0A=
> =0A=
>> There=0A=
>> is no way to detect the size so we must be told via a Device Tree.=0A=
> =0A=
> or defaults to 256K when device tree is not used.=0A=
> =0A=
>>=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
> =0A=
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>=0A=
> =0A=
>      Andrew=0A=
> =0A=
=0A=

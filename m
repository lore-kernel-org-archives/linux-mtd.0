Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dJ72v-0002P8-6P
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 23:41:00 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Brian Norris <computersforpeace@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "andrew@lunn.ch" <andrew@lunn.ch>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, "Richard
 Weinberger" <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH v5 4/5] mtd: mchp23k256: add partitioning support
Date: Thu, 8 Jun 2017 23:40:20 +0000
Message-ID: <e399a06cb0f34dc89b13f34006b55baf@svr-chch-ex1.atlnz.lc>
References: <20170602032119.22282-1-chris.packham@alliedtelesis.co.nz>
 <20170602032119.22282-5-chris.packham@alliedtelesis.co.nz>
 <20170608233346.GI102137@google.com>
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

On 09/06/17 11:33, Brian Norris wrote:=0A=
> On Fri, Jun 02, 2017 at 03:21:18PM +1200, Chris Packham wrote:=0A=
>> Setting the of_node for the mtd device allows the generic mtd code to=0A=
>> setup the partitions.=0A=
>>=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>=0A=
>> Tested-by: Andrew Lunn <andrew@lunn.ch>=0A=
> =0A=
> Applied patches 4 and 5, with an editorial note on this one, to note the=
=0A=
> outstanding issue about fixing up the eraseblock-boundary check in the=0A=
> partitioning code.=0A=
> =0A=
> 1 and 2 were already applied, and I had a change request on patch 3.=0A=
=0A=
Thanks Brian,=0A=
=0A=
I'll take a look at the suggestions on patch 3.=0A=
=0A=

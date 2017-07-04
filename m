Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dSEQv-0002mr-3a
 for linux-mtd@lists.infradead.org; Tue, 04 Jul 2017 03:23:27 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "andrew@lunn.ch" <andrew@lunn.ch>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Brian
 Norris" <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH v5 3/5] mtd: handle partitioning on devices with 0
 erasesize
Date: Tue, 4 Jul 2017 03:22:52 +0000
Message-ID: <ec40da4af0be445b9a1f2ed29e61a547@svr-chch-ex1.atlnz.lc>
References: <20170602032119.22282-1-chris.packham@alliedtelesis.co.nz>
 <20170602032119.22282-4-chris.packham@alliedtelesis.co.nz>
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

Hi,=0A=
=0A=
On 02/06/17 15:21, Chris Packham wrote:=0A=
> erasesize is meaningful for flash devices but for SRAM there is no=0A=
> concept of an erase block so erasesize is set to 0. When partitioning=0A=
> these devices instead of ensuring partitions fall on erasesize=0A=
> boundaries we ensure they fall on writesize boundaries.=0A=
> =0A=
> Helped-by: Boris Brezillon <boris.brezillon@free-electrons.com>=0A=
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
=0A=
I had someone mention to me in passing that mtdinfo was failing for them =
=0A=
(crashing with some floating point error). I'm wondering if we've =0A=
created a divide-by-zero problem by reporting 0 erase size in /proc/mtd. =
=0A=
I don't have any other info and right now I don't have access to the =0A=
system I had with the mchp23lcv1024 sram.=0A=
=0A=
Andrew, do you still have access to your device?=0A=

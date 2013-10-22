From: "Gupta, Pekon" <pekon@ti.com>
To: Huang Shijie <shijie8@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>
Subject: RE: [PATCH v3 00/10] About the SLC/MLC
Date: Tue, 22 Oct 2013 05:11:37 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA297AE@DBDE04.ent.ti.com>
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <20130826144153.568f2b1c@skate> <20130827033020.GA2182@gmail.com>
In-Reply-To: <20130827033020.GA2182@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From:  Huang Shijie
> On Mon, Aug 26, 2013 at 02:41:53PM +0200, Thomas Petazzoni wrote:
> > Dear Huang Shijie,
> >
> > On Mon, 26 Aug 2013 17:36:38 +0800, Huang Shijie wrote:
> > > In current mtd code, the MTD_NANDFLASH is used to represent both the
> > > SLC nand MLC(including the TLC). But we already have the
> MTD_MLCNANDFLASH
> > > to stand for the MLC. What is worse is that the JFFS2 may run on the =
MLC
> > > nand with current code. For the reason of READ/WRITE disturbance, the
> JFFS2
> > > should runs on the SLC only,
> >
> > Pardon the probably very silly question, but would you mind giving more
> > details about why JFFS2 is not appropriate on MLC flashes? Is there
> > anything that UBI/UBIFS does that JFFS2 isn't doing to take into
> > account read/write disturbance?
> I try to explain it.
>=20
> For the UBIFS, it will writes the page(including the oob) only one time;
> but for jffs2, it may writes the page(including the oob) twice, one for t=
he
> marker, one for the real data.
>=20
> For the MLC, the write disturbance will cause some bitflips in this
> page. Since you write a page twice, so in the jffs2, you will meet
> uncorrectable
> ECC error.
>=20
But, doesn't JFFS2 checks for the blank page before second-write of data ?
UBI does it here..
File: $KERNEL/drivers/mtd/ubi/io.c
@@ubi_io_write (... )
[...]
	err =3D ubi_self_check_all_ff(ubi, pnum, offset, len);

So, isn't it better to add this check in JFFS2 code so that its more
bit-flips tolerant ?
This way bit-flips caused by first write to OOB (cleanmarker) would be
caught before using that page for data write. And so MLC should also be
good for JFFS2..

with regards, pekon

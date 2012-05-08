Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRm3v-0002xb-JC
 for linux-mtd@lists.infradead.org; Tue, 08 May 2012 15:10:52 +0000
From: "Philip, Avinash" <avinashphilip@ti.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: RE: mtd oob test is failing consistently at same places in NAND flash
Date: Tue, 8 May 2012 15:09:46 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3E934DD0@DBDE01.ent.ti.com>
References: <518397C60809E147AF5323E0420B992E3E934BF1@DBDE01.ent.ti.com>
 <20120508132354.GA16164@parrot.com>
In-Reply-To: <20120508132354.GA16164@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 08, 2012 at 18:53:54, Ivan Djelic wrote:
> On Tue, May 08, 2012 at 01:33:06PM +0100, Philip, Avinash wrote:
> > Hi,
> >=20
> > We are having an 8-bit NAND part (MT29F2G08ABAEAWP from Micron)=20
> > connected to GPMC Module (General purpose memory controller) from TI.
>=20
> Hi,
> How is ecc performed ?
> Using NAND internal ecc ? or with GPMC 1-bit Hamming ? 4-bit/8-bit BCH ?
> Which version of omap2 driver are you using ?
> Is OOB also ECC-protected ?

Hardware ECC is performing.
4-bit BCH ECC scheme is used.
I am using omap2 driver in Linux 3.2.0 Kernel. Don't know omap2 driver vers=
ion.
No, OOB is not ECC protected.

>=20
> > We have been seeing mtd_oobtest failure on a partition size of 248 MB.=
=20
> > Most of the time, test case 2 of mtd_oobtest is failing. On debugging=20
> > further it seems that bit flip is happening on the test case 2 in OOB=20
> > area. It is observed that the failure locations are consistent.
>=20
> If you are able to reproduce failures, then you should be able to tell wh=
ich bits in OOB are failing, by adding a few debugging lines in the code.
>=20

I add debugs and found bit flips from 1 to 0. The location of bit flips mig=
ht vary on
boards. But on the same board it is consistent.

> > To verify further we had tried writing zeros to OOB area and read it ba=
ck.=20
> > This test is passing and confirms that all OOB bits (that are=20
> > programmable) are not bad.
>=20
> It does not confirm anything, bits can fail by remaining stuck at 0.
>

As bit flip is from 1 to 0, you are right. But same experiment with 0x55,
test is passing.
=20
> BR,
> --
> Ivan
>=20

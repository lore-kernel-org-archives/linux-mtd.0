From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Mon, 20 Oct 2014 16:02:52 +1100
Subject: RE: [PATCH v3 0/3] mtd: nand: gpmi: add proper raw access support
Message-ID: <EACD232272DA4849B060F0828564D13B449961CF27@ntcex01.corp.netcomm.com.au>
References: <1411481256-29141-1-git-send-email-boris.brezillon@free-electrons.com>
 <20141008142437.GA9912@localhost.localdomain>
 <20141008171034.1506550f@bbrezillon>
 <20141010144248.GA5107@localhost.localdomain>
 <EACD232272DA4849B060F0828564D13B44955ABE1F@ntcex01.corp.netcomm.com.au>,
 <20141019022035.GA1412@localhost.localdomain>
In-Reply-To: <20141019022035.GA1412@localhost.localdomain>
Content-Language: en-AU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Mike Voytovich <mvoytovich@paypal.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Roy Lee <roylee@paypal.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 19 Oct 2014 13:20:38 +1100 Huang Shijie <shijie8@gmail.com> wrote:=

> On Tue, Oct 14, 2014 at 04:50:27PM +1100, Iwo Mergler wrote:
> >=20
> > >
> > > No, it doesn't seem to be correct.
> > > But it's an MLC flash, so you'll most probably need to apply this
> > > patch to nandbiterrs testsuite:
> > >
> > > http://code.bulix.org/f69wuu-87021
> > >
> > > This patch is flashing the block between each bitflip insertion to
> > > avoid multiple write without erasure (which, AFAIK, is not
> > > supported by MLC flashes).
> >=20
> > Hi Huang,
> >=20
> >=20
> > just out of interest, have you tried this on the MLC NAND without
> > the patch?
> >=20
> > I'm aware that MLC says you shouldn't write multiple times, but
> > that is with a view towards specified data endurance. I would only
> > expect a few additional bit errors during the test.
> >=20
> > Did you try the overwrite test?
> >=20
> The following is the test result for overwrite with this MLC patch:
>=20
> root@imx6qdlsolo:~# insmod mtd_nandbiterrs.ko dev=3D1 mode=3D1
> [ =20762.534714]=20
> [  762.536259] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> [  762.542115] mtd_nandbiterrs: MTD device: 1
> [  762.546326] mtd_nandbiterrs: MTD device size 16777216,
> =09eraseblock=3D2097152, page=3D8192, oob=3D744
> =09[  762.554937] mtd_nandbiterrs: Device uses 1 subpages of 8192
> =09bytes
> =09[  762.561059] mtd_nandbiterrs: Using page=3D0, offset=3D0,
> =09eraseblock=3D0
> =09[  762.571333] mtd_nandbiterrs: overwrite biterrors test
> =09[  762.576715] mtd_nandbiterrs: write_page
> =09[  762.590448] mtd_nandbiterrs: error: read failed at 0x0
> =09[  762.595650] mtd_nandbiterrs: Read reported error -74
> =09[  762.600625] mtd_nandbiterrs: Bit error histogram (0
> =09=09=09operations total):
> =09[  762.608586] mtd_nandbiterrs: finished successfully.
> =09[  762.613501]
> =09=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =09insmod: ERROR: could not insert module mtd_nandbiterrs.ko:
> =09Input/output error
>=20

Thanks. If I read this correctly, this means that writing the same data tw=
ice,
already generates more bit errors than the ECC can fix.


Best regards,

Iwo

______________________________________________________________________
This communication contains information which may be confidential or privi=
leged. The information is intended solely for the use of the individual or=
 entity named above.  If you are not the intended recipient, be aware that=
 any disclosure, copying, distribution or use of the contents of this info=
rmation is prohibited.  If you have received this communication in error, =
please notify me by telephone immediately.
______________________________________________________________________

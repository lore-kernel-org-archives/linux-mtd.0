Received: from smtp1.ascom-ws.com ([195.81.148.76] helo=mail.ascom-ws.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c04M1-00032O-Nj
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 10:25:46 +0000
From: Danesh Daroui <Danesh.Daroui@ascom.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Steve deRosier
 <derosier@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: OOB Test fails
Date: Fri, 28 Oct 2016 10:23:47 +0000
Message-ID: <39BC08CB3FF4C84CB6397533D4FC79095770D803@SEGOTEXCH02.ascom-Resource.ads>
References: <39BC08CB3FF4C84CB6397533D4FC79095770D513@SEGOTEXCH02.ascom-Resource.ads>
 <CALupW3CJ_gXS+7BrZEGTF8o0H8pJ_AOw0JcKOftSVaMVSbP1zQ@mail.gmail.com>
 <20161027093407.53a76657@bbrezillon> <20161027174527.6003fd37@bbrezillon>
In-Reply-To: <20161027174527.6003fd37@bbrezillon>
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

Hi Boris,

I have one question and would appreciate if you can assist me with that. As=
 I wrote we are using a Micron NAND 1GiB 3,3V 8-bit flash memory with UBIFS=
 where we experience some problems. I am wondering whether there are specif=
ic drivers provided by vendor in this case or there are generic drivers wit=
h respect to the hardware architecture given to the Kernel that can be used=
 as we probably did in this case? I have downloaded a driver package from M=
icron which is apparently written for our NAND flash memory but the driver =
uses lots of read/write functions which are platform dependent and not impl=
emented in the driver which makes sense though.

Would you please advise and let us know if we are on the right track e.g. u=
sing the driver with the kernel or we need to find more specific driver so =
the problem that we face now can be related to incorrect driver?

Regards,

Danesh Daroui


-----Original Message-----
From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]=20
Sent: den 27 oktober 2016 17:45
To: Steve deRosier <derosier@gmail.com>
Cc: Danesh Daroui <Danesh.Daroui@ascom.com>; linux-mtd@lists.infradead.org
Subject: Re: OOB Test fails

On Thu, 27 Oct 2016 09:34:07 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi Steve,
>=20
> On Wed, 26 Oct 2016 09:16:42 -0700
> Steve deRosier <derosier@gmail.com> wrote:
>=20
> > Hi Danesh,
> >=20
> >=20
> > On Wed, Oct 26, 2016 at 9:07 AM, Danesh Daroui <Danesh.Daroui@ascom.com=
> wrote: =20
> > > Hello all,
> > >
> > > I have executed MTD tests against an unmounted MTD device which uses =
UBIFS. All MTD tests except OOB test is passed where the OOB test fails fro=
m time to time and from device to device. I have read here:
> > >
> > > http://www.linux-mtd.infradead.org/faq/ubi.html#L_why_no_oob
> > >
> > > that UBIFS does not use OOB area. Therefore wanted to ask if failing =
this test does not need that there is any problem in our system (both HW an=
d SW/configuration) and we can safely ignore the results for this test.
> > >   =20
> >=20
> > UBIFS doesn't use the OOB area, but your MTD driver most likely does.
> > We don't want UBI or UBIFS messing with the OOB area because your=20
> > flash, NAND controller and the MTD driver will use that. Bad block=20
> > markers are set in the OOB area by the manufacturer in most NAND=20
> > flashes and your controller and MTD driver will store and use the=20
> > bits in the OOB to do error correction.
> >=20
> > So, in short - the OOB area does need to function correctly.  As to=20
> > if and why the OOB test is or isn't working is a different issue and=20
> > I have no input on that.  All that depends on your mix of flash,=20
> > controller and driver.

My bad, I misread your sentence. I thought you we saying "the OOB area does=
 *not* need to function correctly".

My apologies for this misunderstanding, it seems we're on the same page.

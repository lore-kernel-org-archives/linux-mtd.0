Received: from smtp1.ascom-ws.com ([195.81.148.76] helo=mail.ascom-ws.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bziJ1-0000dR-9w
 for linux-mtd@lists.infradead.org; Thu, 27 Oct 2016 10:53:11 +0000
From: Danesh Daroui <Danesh.Daroui@ascom.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Steve deRosier <derosier@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: OOB Test fails
Date: Thu, 27 Oct 2016 10:51:14 +0000
Message-ID: <39BC08CB3FF4C84CB6397533D4FC79095770D5E7@SEGOTEXCH02.ascom-Resource.ads>
References: <39BC08CB3FF4C84CB6397533D4FC79095770D513@SEGOTEXCH02.ascom-Resource.ads>
 <CALupW3CJ_gXS+7BrZEGTF8o0H8pJ_AOw0JcKOftSVaMVSbP1zQ@mail.gmail.com>
 <39BC08CB3FF4C84CB6397533D4FC79095770D530@SEGOTEXCH02.ascom-Resource.ads>
 <20161027093801.7695f05e@bbrezillon>
In-Reply-To: <20161027093801.7695f05e@bbrezillon>
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

Thanks for your help. We would really like to upgrade the Kernel and that i=
s a wise approach of course, but we would like to be sure that this is due =
to the outdated Kernel or whether this is a hardware problem since Kernel u=
pgrading is a time consuming and cumbersome task, but definitely necessary =
as you mentioned. Right now I am trying to run UBIFS tests which are includ=
ed in "mtd_utils". I hope these tests will give me some hints if there is a=
ny problem is UBI/UBIFS layers. I had written my own stress test before whi=
ch would test the memory on POSIX level (same as UBI/UBIFS layers more or l=
ess), and I experienced some crashes but could not identify what is the rea=
son. For instance I could not find out if the crash happens due to a bug in=
 driver or file system, etc.=20

The flash memory we are using is a Micron NAND 1GiB 3,3V 8-bit and the driv=
er delivered with Kernel 3.6.39. Have you heard about similar problem befor=
e? Or do you want me to give you more info about the hardware and the syste=
m we have under test?

Thanks again for your help,

Danesh Daroui


-----Original Message-----
From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]=20
Sent: den 27 oktober 2016 09:38
To: Danesh Daroui <Danesh.Daroui@ascom.com>
Cc: Steve deRosier <derosier@gmail.com>; linux-mtd@lists.infradead.org
Subject: Re: OOB Test fails

Hi Danesh,

On Wed, 26 Oct 2016 16:28:43 +0000
Danesh Daroui <Danesh.Daroui@ascom.com> wrote:

> Hi Steve,
>=20
> Thank you for your prompt answer. When I run OOB test (mtd_oobtest), for =
instance, one of devices always return verification failed error on a certa=
in address. This is all we know and all the test reports. We use a quite ol=
d kernel i.e. 2.6.39 and this is one of the things that we suspect as a sou=
rce of the problem that the kernel is outdated. Also, we consider the hardw=
are failure since on some devices no error is shown on OOB test while on ot=
hers more errors are shown and the address is changed randomly sometimes.

Yes, please, try with a newer kernel: I won't help debugging such an old th=
ing.

>=20
> Our main problem is that sometimes UBIFS forces the device into read-only=
 mode due to "bad CRC" error at startup when the device is booted. I am now=
 running tests which are in "mtd_utils" for testing file system. I have sta=
rted running two tests which are "simple/test_1" and "simple/test_2" which =
simply write until the drive is full and the read the data back and verify =
the correctness. During the test, I see lots of:
>=20
> UBI: scrubbed PEB 585 (LEB 3:770), data moved to PEB 1772
> UBI: scrubbed PEB 1045 (LEB 3:1261), data moved to PEB 828
> UBI: scrubbed PEB 1493 (LEB 3:664), data moved to PEB 814
> UBI: scrubbed PEB 751 (LEB 3:1260), data moved to PEB 1772
>=20
> In my mind, this is related to problematic hardware that the data is corr=
upted on many cells that UBIFS tries to move the data when a corruption is =
detected. My question is, whether this guess can be valid or this is mostly=
 due to old kernel that we are using and upgrading to a new kernel would mo=
st likely solve the problems?

Well, I can't tell. It can be caused by a buggy NAND controller driver, a b=
ug in the UBI layer or maybe your NAND is simply worn.

Try with a newer kernel, and let's see what the MTD tests and MTD utils tes=
ts say.

BTW, which NAND and NAND controller are your testing on?

Regards,

Boris

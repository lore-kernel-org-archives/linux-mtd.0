Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eYZNp-0004dD-QC
 for linux-mtd@lists.infradead.org; Mon, 08 Jan 2018 15:30:43 +0000
Date: Mon, 8 Jan 2018 16:30:29 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: gregkh <gregkh@linuxfoundation.org>, "kernelci.org bot"
 <bot@kernelci.org>, Kernel Build Reports Mailman List
 <kernel-build-reports@lists.linaro.org>, Sean =?UTF-8?B?Tnlla2rDpnI=?=
 <sean.nyekjaer@prevas.dk>, Willy Tarreau <w@1wt.eu>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Richard Weinberger <richard@nod.at>, linux-mtd
 <linux-mtd@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "# 4.4.x" <stable@vger.kernel.org>
Subject: Re: stable-rc/linux-4.4.y build: 178 builds: 4 failed, 174 passed,
 8 errors (v4.4.110-18-g5da3d9af3a4b)
Message-ID: <20180108163029.369f8041@bbrezillon>
In-Reply-To: <CAK8P3a2YFJmdiw=0BgG1JkoQYLiD=em6N97AgB_4=Z2DDkY5dg@mail.gmail.com>
References: <5a535545.93b5df0a.a7ca3.53c1@mx.google.com>
 <CAK8P3a1U9Q2RzXiE2qdD-zU0u+=fm66V6Aw8RR8YSXd5Gbiq3A@mail.gmail.com>
 <20180108134415.GA11707@kroah.com>
 <CAK8P3a2YFJmdiw=0BgG1JkoQYLiD=em6N97AgB_4=Z2DDkY5dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 8 Jan 2018 15:01:38 +0100
Arnd Bergmann <arnd@arndb.de> wrote:

> On Mon, Jan 8, 2018 at 2:44 PM, gregkh <gregkh@linuxfoundation.org> wrote:
> > On Mon, Jan 08, 2018 at 02:16:25PM +0100, Arnd Bergmann wrote: =20
> >> On Mon, Jan 8, 2018 at 12:25 PM, kernelci.org bot <bot@kernelci.org> w=
rote: =20
> >> >
> >> > stable-rc/linux-4.4.y build: 178 builds: 4 failed, 174 passed, 8 err=
ors (v4.4.110-18-g5da3d9af3a4b)
> >> > Full Build Summary: https://kernelci.org/build/stable-rc/branch/linu=
x-4.4.y/kernel/v4.4.110-18-g5da3d9af3a4b/
> >> > Tree: stable-rc
> >> > Branch: linux-4.4.y
> >> > Git Describe: v4.4.110-18-g5da3d9af3a4b
> >> > Git Commit: 5da3d9af3a4b90d3c5ab19f9ad1dbb7d237edcf9
> >> > Git URL: http://git.kernel.org/pub/scm/linux/kernel/git/stable/linux=
-stable-rc.git
> >> > Built: 4 unique architectures
> >> >
> >> > Build Failures Detected:
> >> >
> >> > arm: gcc version 5.3.1 20160412 (Linaro GCC 5.3-2016.05)
> >> > cm_x300_defconfig FAIL
> >> > mvebu_v7_defconfig FAIL
> >> > pxa3xx_defconfig FAIL
> >> > raumfeld_defconfig FAIL
> >> >
> >> > mvebu_v7_defconfig (arm) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sec=
tion mismatches
> >> >
> >> > Errors:
> >> > drivers/mtd/nand/pxa3xx_nand.c:918:2: error: duplicate case value
> >> > drivers/mtd/nand/pxa3xx_nand.c:915:2: error: previously used here =20
> >>
> >> Hi Greg,
> >>
> >> Commit fee4380f368e ("mtd: nand: pxa3xx: Fix READOOB implementation") =
was
> >> apparently backported in error, it looks like it should just be
> >> dropped here in 4.4.y.
> >>
> >> The commit lists 'Fixes: 43bcfd2bb24a ("mtd: nand: pxa3xx: Add driver-=
specific
> >> ECC BCH support")', that commit was merged into v4.14, so backporting =
the
> >> fix further is probably not appropriate for 4.9 or earlier kernels eit=
her. =20
> >
> > $ git describe --contains 43bcfd2bb24a
> > v3.14-rc1~65^2~127
> >
> > That is why I backported these patches this far.
> >
> > I'll drop the patch now, but the Fixes line is the problem here :) =20
>=20
> I think my mistake in the report was misreading v3.14 as v4.14. That mean=
s we
> still need the fix, just as Boris explained, it just needs to be done
> differently
> for older kernels.

Hm, actually I was wrong with my Fixes tag, it seems the bug has been
introduced by 'c2cdace755b5 ("mtd: nand: pxa3xx_nand: add support for
partial chunks")', so the fix is not needed for pre-4.6 kernels.

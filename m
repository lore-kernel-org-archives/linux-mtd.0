Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYXiy-00044q-MY
 for linux-mtd@lists.infradead.org; Mon, 08 Jan 2018 13:44:26 +0000
Date: Mon, 8 Jan 2018 14:44:15 +0100
From: gregkh <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "kernelci.org bot" <bot@kernelci.org>,
 Kernel Build Reports Mailman List <kernel-build-reports@lists.linaro.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Sean =?iso-8859-1?Q?Nyekj=E6r?= <sean.nyekjaer@prevas.dk>,
 Willy Tarreau <w@1wt.eu>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "# 4.4.x" <stable@vger.kernel.org>
Subject: Re: stable-rc/linux-4.4.y build: 178 builds: 4 failed, 174 passed, 8
 errors (v4.4.110-18-g5da3d9af3a4b)
Message-ID: <20180108134415.GA11707@kroah.com>
References: <5a535545.93b5df0a.a7ca3.53c1@mx.google.com>
 <CAK8P3a1U9Q2RzXiE2qdD-zU0u+=fm66V6Aw8RR8YSXd5Gbiq3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8P3a1U9Q2RzXiE2qdD-zU0u+=fm66V6Aw8RR8YSXd5Gbiq3A@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 08, 2018 at 02:16:25PM +0100, Arnd Bergmann wrote:
> On Mon, Jan 8, 2018 at 12:25 PM, kernelci.org bot <bot@kernelci.org> wrote:
> >
> > stable-rc/linux-4.4.y build: 178 builds: 4 failed, 174 passed, 8 errors (v4.4.110-18-g5da3d9af3a4b)
> > Full Build Summary: https://kernelci.org/build/stable-rc/branch/linux-4.4.y/kernel/v4.4.110-18-g5da3d9af3a4b/
> > Tree: stable-rc
> > Branch: linux-4.4.y
> > Git Describe: v4.4.110-18-g5da3d9af3a4b
> > Git Commit: 5da3d9af3a4b90d3c5ab19f9ad1dbb7d237edcf9
> > Git URL: http://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
> > Built: 4 unique architectures
> >
> > Build Failures Detected:
> >
> > arm: gcc version 5.3.1 20160412 (Linaro GCC 5.3-2016.05)
> > cm_x300_defconfig FAIL
> > mvebu_v7_defconfig FAIL
> > pxa3xx_defconfig FAIL
> > raumfeld_defconfig FAIL
> >
> > mvebu_v7_defconfig (arm) — FAIL, 2 errors, 0 warnings, 0 section mismatches
> >
> > Errors:
> > drivers/mtd/nand/pxa3xx_nand.c:918:2: error: duplicate case value
> > drivers/mtd/nand/pxa3xx_nand.c:915:2: error: previously used here
> 
> Hi Greg,
> 
> Commit fee4380f368e ("mtd: nand: pxa3xx: Fix READOOB implementation") was
> apparently backported in error, it looks like it should just be
> dropped here in 4.4.y.
> 
> The commit lists 'Fixes: 43bcfd2bb24a ("mtd: nand: pxa3xx: Add driver-specific
> ECC BCH support")', that commit was merged into v4.14, so backporting the
> fix further is probably not appropriate for 4.9 or earlier kernels either.

$ git describe --contains 43bcfd2bb24a
v3.14-rc1~65^2~127

That is why I backported these patches this far.

I'll drop the patch now, but the Fixes line is the problem here :)

thanks,

greg k-h

From: "Manjunathappa, Prakash" <prakash.pm@ti.com>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: RE: [RESEND PATCH] arm:davinci: prepare to move aemif driver to
 drivers/mfd
Date: Tue, 24 Jan 2012 05:24:00 +0000
Message-ID: <A73F36158E33644199EB82C5EC81C7BC3175A568@DBDE01.ent.ti.com>
References: <1327331552-9913-1-git-send-email-prakash.pm@ti.com>
 <20120123170436.GZ1068@n2100.arm.linux.org.uk>
In-Reply-To: <20120123170436.GZ1068@n2100.arm.linux.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "davinci-linux-open-source@linux.davincidsp.com"
 <davinci-linux-open-source@linux.davincidsp.com>,
 Samuel Ortiz <sameo@linux.intel.com>, "Nori, Sekhar" <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

Hi Russell King,

On Mon, Jan 23, 2012 at 22:34:36, Russell King - ARM Linux wrote:
> On Mon, Jan 23, 2012 at 08:42:32PM +0530, Manjunathappa, Prakash wrote:
> > Adding: MFD maintainer and mailing list.
> >=20
> >  arch/arm/mach-davinci/aemif.c              |    2 +-
> >  arch/arm/mach-davinci/board-da830-evm.c    |    2 +-
> >  arch/arm/mach-davinci/board-da850-evm.c    |    2 +-
> >  arch/arm/mach-davinci/include/mach/aemif.h |   36 --------------------=
--------
> >  drivers/mtd/nand/davinci_nand.c            |    2 +-
> >  include/linux/mfd/davinci_aemif.h          |   36 ++++++++++++++++++++=
++++++++
> >  6 files changed, 40 insertions(+), 40 deletions(-)
> >  delete mode 100644 arch/arm/mach-davinci/include/mach/aemif.h
> >  create mode 100644 include/linux/mfd/davinci_aemif.h
>=20
> As Linus has requested on many occasions, and it's a damned good
> idea, use -M when generating diffstat - and its also a *really* good
> idea to use -M if you're submitting patches which rename files for
> review as well.
>=20
> Obviously arch/arm/mach-davinci/include/mach/aemif.h was moved to
> include/linux/mfd/davinci_aemif.h, but were there any changes to its
> contents?  Without -M, there only way of knowing is to compare each
> file line by line.  With -M, it'll tell us that it was renamed and
> produce a diff between the old and new location.
>=20

Yes, I will make it a point to do this in next version and in future.

Thanks,
Prakash

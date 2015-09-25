Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfMte-0006ii-9M
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2015 06:54:19 +0000
Date: Fri, 25 Sep 2015 08:53:55 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Peter Pan =?UTF-8?B?5r2Y5qCL?= (peterpandong)" <peterpandong@micron.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, "fransklaver@gmail.com"
 <fransklaver@gmail.com>, "wsa@the-dreams.de" <wsa@the-dreams.de>,
 "zajec5@gmail.com" <zajec5@gmail.com>, "baruch@tkos.co.il"
 <baruch@tkos.co.il>, "ezequiel.garcia@free-electrons.com"
 <ezequiel.garcia@free-electrons.com>, "kdasu.kdev@gmail.com"
 <kdasu.kdev@gmail.com>, "rogerq@ti.com" <rogerq@ti.com>,
 "asierra@xes-inc.com" <asierra@xes-inc.com>, bpqw <bpqw@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Frank Liu
 =?UTF-8?B?5YiY576k?= (frankliu)" <frankliu@micron.com>, Kamil Debski
 <Kamil.Debski@imgtec.com>, "Ionela Voinescu" <Ionela.Voinescu@imgtec.com>,
 "Bean Huo =?UTF-8?B?6ZyN5paM5paM?= (beanhuo)" <beanhuo@micron.com>
Subject: Re: [PATCH 00/12] mtd: nand_bbt: introduce independent nand BBT
Message-ID: <20150925085355.122a3884@bbrezillon>
In-Reply-To: <87F60714EC601C4C83DFF1D2E3D390A0326CC82E@NTXXIAMBX02.xacn.micron.com>
References: <87F60714EC601C4C83DFF1D2E3D390A0326CC7C2@NTXXIAMBX02.xacn.micron.com>
 <87F60714EC601C4C83DFF1D2E3D390A0326CC82E@NTXXIAMBX02.xacn.micron.com>
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

Hi Peter,

This comment is not related to the code itself, but next time you send a
patch series, could you send all patches as a reply to the cover letter?
This is automatically done when you use git send-email unless you pass
the --no-thread option.
The following command should do the trick:

git send-email <path-to-your-patchset-dir>/*.patch

Best Regards,

Boris

On Fri, 25 Sep 2015 06:34:34 +0000
Peter Pan =E6=BD=98=E6=A0=8B (peterpandong) <peterpandong@micron.com> wrote:

> Currently nand_bbt.c is tied with struct nand_chip, and it makes other
> NAND family chips hard to use nand_bbt.c. Maybe it's the reason why
> onenand has own bbt(onenand_bbt.c).
>=20
> Separate struct nand_chip from BBT code can make current BBT shareable.
> We create struct nand_bbt to take place of nand_chip in nand_bbt.c.
> Struct nand_bbt contains all the information BBT needed from outside and
> it should be embedded into NAND family chip struct (such as struct nand_c=
hip).
> NAND family driver should allocate, initialize and free struct nand_bbt.
>=20
> Below is mtd folder structure we want:
> 	mtd
> 	=E2=94=9C=E2=94=80=E2=94=80 Kconfig
> 	=E2=94=9C=E2=94=80=E2=94=80 Makefile
> 	=E2=94=9C=E2=94=80=E2=94=80 ...
> 	=E2=94=9C=E2=94=80=E2=94=80 nand_bbt.c
> 	=E2=94=9C=E2=94=80=E2=94=80 nand
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 Kconfig
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 Makefile
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 nand_base.c
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 nand_ids.c
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 ...
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 xway_nand.c
> 	=E2=94=9C=E2=94=80=E2=94=80 spi-nand
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 Kconfig
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 Makefile
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 spi-nand-base.c
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 ...
> 	=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 spi-nand-device.c
> 	=E2=94=94=E2=94=80=E2=94=80 ...
>=20
> Most of the patch is borrowed from Brian Norris <computersforpeace@gmail.=
com>.
> http://git.infradead.org/users/norris/linux-mtd.git/shortlog/refs/heads/n=
and-bbt
> Based on Brian's suggestion, I make my previous BBT patch into 12 indepen=
dent
> patches. Previous patch is http://patchwork.ozlabs.org/patch/492066/
> Beside the patch split, I also moved nand_bbt.c to mtd folder, which didn=
't in
> previous patch.
>=20
> Patch 3, 7, 8, 9, 10 and 11 are totally borrowed from Brian's git tree. I=
 just
> test and split the code into independent patch. Patch 1, 2, 5 and 6 are p=
artial
> borrowed. I make some changes from Brian's git tree and the changes are r=
ecorded
> in commit log. Patch 4 and 12 are written by me.
>=20
> The patch is tested on Zed board. This version of this series is based on=
 master
> branch of l2-mtd.git (commit e1305df1283cbe1aa57093f8766b2dfe650ed5ff).
>=20
> Brian Norris (6):
> 	mtd: nand_bbt: add new API definitions
> 	mtd: nand: make nand_erase_nand() static
> 	mtd: nand_bbt: remove struct nand_chip from nand_bbt.c
> 	mtd: nand_bbt: remove old API definitions
> 	mtd: nand_bbt: remove NAND_BBT_DYNAMICSTRUCT macro
> 	mtd: nand: remove nand_chip.bbt
> Brian Norris and Peter Pan (4):
> 	mtd: nand_bbt: new header for nand family BBT
> 	mtd: nand_bbt: introduce struct nand_bbt
> 	mtd: nand: use new BBT API instead of old ones
> 	mtd: nand_bbt: use erase() and is_bad_bbm() hook in BBT
> Peter Pan (2):
> 	mtd: nand_bbt: add nand_bbt_markbad_factory() interface
> 	mtd: nand-bbt: move nand_bbt.c to mtd folder
>=20
> ---
>  drivers/mtd/Kconfig          |    7 +
>  drivers/mtd/Makefile         |    1 +
>  drivers/mtd/nand/Kconfig     |    2 +-
>  drivers/mtd/nand/Makefile    |    2 +-
>  drivers/mtd/nand/docg4.c     |    6 +-
>  drivers/mtd/nand/nand_base.c |  145 ++++-
>  drivers/mtd/nand/nand_bbt.c  | 1377 ------------------------------------=
------
>  drivers/mtd/nand_bbt.c       | 1289 ++++++++++++++++++++++++++++++++++++=
+++
>  include/linux/mtd/bbm.h      |   96 +--
>  include/linux/mtd/nand.h     |   16 +-
>  include/linux/mtd/nand_bbt.h |  177 ++++++
>  11 files changed, 1624 insertions(+), 1494 deletions(-)
>  delete mode 100644 drivers/mtd/nand/nand_bbt.c
>  create mode 100644 drivers/mtd/nand_bbt.c
>  create mode 100644 include/linux/mtd/nand_bbt.h



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

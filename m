Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ddXSo-00070Y-4n
 for linux-mtd@lists.infradead.org; Fri, 04 Aug 2017 07:56:08 +0000
Date: Fri, 4 Aug 2017 09:55:34 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org,
 mark.rutland@arm.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andy.gross@linaro.org,
 architt@codeaurora.org, sricharan@codeaurora.org
Subject: Re: [PATCH v2 00/25] Add QCOM QPIC NAND support
Message-ID: <20170804095534.79fa9e96@bbrezillon>
In-Reply-To: <20170804095305.6492a2d3@bbrezillon>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <20170804095305.6492a2d3@bbrezillon>
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

On Fri, 4 Aug 2017 09:53:05 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi Abhishek,
>=20
> On Wed, 19 Jul 2017 17:17:48 +0530
> Abhishek Sahu <absahu@codeaurora.org> wrote:
>=20
> > v2:
> >=20
> > 1. Addressed the review comments given in v1
> > 2. Removed the DMA coherent buffer for register read and used
> >    streaming DMA API=E2=80=99s
> > 3. Reorganized the NAND read and write functions
> > 4. Separated patch for driver and documentation changes
> > 5. Changed the compatible string for EBI2
> >=20
> > v1:
> >=20
> > http://www.spinics.net/lists/devicetree/msg183706.html
> >=20
> > Abhishek Sahu (25):
> >   mtd: nand: qcom: fix config error for BCH
> >   mtd: nand: qcom: program NAND_DEV_CMD_VLD register
> >   mtd: nand: qcom: change compatible string for EBI2 NANDC
> >   dt-bindings: qcom_nandc: change compatible string for EBI2 NANDC
> >   mtd: nand: qcom: remove redundant chip select compatible string
> >   dt-bindings: qcom_nandc: remove chip select compatible string
> >   mtd: nand: qcom: reorganize nand page read
> >   mtd: nand: qcom: reorganize nand page write
> >   mtd: nand: qcom: remove memset for clearing read register buffer
> >   mtd: nand: qcom: reorganize nand devices probing
> >   mtd: nand: qcom: support for NAND controller properties
> >   dt-bindings: qcom_nandc: QPIC NAND documentation
> >   mtd: nand: qcom: add QPIC NAND compatible string
> >   mtd: nand: qcom: add and initialize QPIC DMA resources
> >   mtd: nand: qcom: DMA mapping support for register read buffer
> >   mtd: nand: qcom: allocate BAM transaction
> >   mtd: nand: qcom: add BAM DMA descriptor handling
> >   mtd: nand: qcom: support for passing flags in transfer functions
> >   mtd: nand: qcom: support for read location registers
> >   mtd: nand: qcom: erased codeword detection configuration
> >   mtd: nand: qcom: support for QPIC page read/write
> >   mtd: nand: qcom: QPIC raw write support
> >   mtd: nand: qcom: change register offset defines with enums
> >   dt-bindings: qcom_nandc: compatible string for version 1.5.0
> >   mtd: nand: qcom: support for QPIC version 1.5.0 =20
>=20
> Applied patch 1 and 5 to 11 to nand/next [1].
>=20

My bad, it's 5 to 10, patch 11 did not apply cleanly. And I also forgot
the link. Please rebase on this branch before sending your v3.

Thanks,

Boris

[1]http://git.infradead.org/l2-mtd.git/shortlog/refs/heads/nand/next

> >=20
> >  .../devicetree/bindings/mtd/qcom_nandc.txt         |   56 +-
> >  drivers/mtd/nand/qcom_nandc.c                      | 1157 ++++++++++++=
++++----
> >  2 files changed, 1010 insertions(+), 203 deletions(-)
> >  =20
>=20

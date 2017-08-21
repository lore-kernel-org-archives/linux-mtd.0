Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1djt6m-0007BL-LN
 for linux-mtd@lists.infradead.org; Mon, 21 Aug 2017 20:15:39 +0000
Date: Mon, 21 Aug 2017 22:15:04 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Archit Taneja <architt@codeaurora.org>, Richard Weinberger
 <richard@nod.at>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Andy Gross <andy.gross@linaro.org>, Sricharan
 R <sricharan@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v5 00/16] Add QCOM QPIC NAND support
Message-ID: <20170821221504.0d4d8d00@bbrezillon>
In-Reply-To: <1502971674-13810-1-git-send-email-absahu@codeaurora.org>
References: <1502971674-13810-1-git-send-email-absahu@codeaurora.org>
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

Le Thu, 17 Aug 2017 17:37:38 +0530,
Abhishek Sahu <absahu@codeaurora.org> a =C3=A9crit :

> * v5:
>=20
> 1. Removed the patches already applied to linux-next and rebased the
>    remaining patches on [3]
> 2. Addressed the review comments in v4 and Added Archit Reviewed
>    by tag.
>=20
> [3] http://git.infradead.org/l2-mtd.git/shortlog/refs/heads/nand/next
>=20
> * v4:
>=20
> 1. Added Acked-by from Rob for DT documentation patches
> 2. Removed ipq8074 compatible string from ipq4019 DT example.
> 2. Used the BIT macro for NAND_CMD_VLD bits and consistent names
>    as suggested by Boris in v3.
>=20
> * v3:
>=20
> 1. Removed the patches already applied to linux-next and
>    rebased the remaining patches on [1]
> 2. Reordered the patches and put the BAM DMA changes [2]
>    dependent patches and compatible string patches in last
> 3. Removed the register offsets array and used the dev_cmd offsets
> 4. Changed some macro names to small letters for better code readability
> 5. Changed the compatible string to SoC specific
> 6. Did minor code changes for adding comment, error handling, structure n=
ames
> 7. Combined raw write (patch#18) and passing flag parameter (patch#22) pa=
tch
>    into one
> 8. Made separate patch for compatible string and NAND properties
> 9. Made separate patch for BAM command descriptor and data descriptors ha=
ndling
> 10. Changed commit message for some of the patches
> 11. Addressed review comments given in v2
> 12. Added Reviewed-by of Archit for some of the patches from v2
> 13. All the MTD tests are working fine for IPQ8064 AP148, IPQ4019 DK04 and
>     IPQ8074 HK01 boards for v3 patches
>=20
> [1] http://git.infradead.org/l2-mtd.git/shortlog/refs/heads/nand/next
> [2] http://www.spinics.net/lists/dmaengine/msg13662.html
>=20
> * v2:
>=20
> 1. Addressed the review comments given in v1
> 2. Removed the DMA coherent buffer for register read and used
>    streaming DMA API=E2=80=99s
> 3. Reorganized the NAND read and write functions
> 4. Separated patch for driver and documentation changes
> 5. Changed the compatible string for EBI2
>=20
> * v1:
>=20
> http://www.spinics.net/lists/devicetree/msg183706.html
>=20
>=20
> Abhishek Sahu (16):
>   mtd: nand: qcom: DMA mapping support for register read buffer
>   mtd: nand: qcom: allocate BAM transaction
>   mtd: nand: qcom: add BAM DMA descriptor handling
>   mtd: nand: qcom: support for passing flags in DMA helper functions
>   mtd: nand: qcom: support for read location registers
>   mtd: nand: qcom: erased codeword detection configuration
>   mtd: nand: qcom: enable BAM or ADM mode
>   mtd: nand: qcom: QPIC data descriptors handling
>   mtd: nand: qcom: support for different DEV_CMD register offsets
>   mtd: nand: qcom: add command elements in BAM transaction
>   mtd: nand: qcom: support for command descriptor formation
>   dt-bindings: qcom_nandc: fix the ipq806x device tree example
>   dt-bindings: qcom_nandc: IPQ4019 QPIC NAND documentation
>   dt-bindings: qcom_nandc: IPQ8074 QPIC NAND documentation
>   mtd: nand: qcom: support for IPQ4019 QPIC NAND controller
>   mtd: nand: qcom: Support for IPQ8074 QPIC NAND controller

Applied everything to nand/next except patch 10 and 11. Let me know
when the dmaengine dependency is merged and I'll take the remaining
patches.

Thanks,

Boris

>=20
>  .../devicetree/bindings/mtd/qcom_nandc.txt         |  63 +-
>  drivers/mtd/nand/qcom_nandc.c                      | 746 +++++++++++++++=
+++---
>  2 files changed, 722 insertions(+), 87 deletions(-)
>=20

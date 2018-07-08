Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcHX8-0008W7-B0
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 21:47:55 +0000
Date: Sun, 8 Jul 2018 23:47:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>, Archit
 Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v5] mtd: rawnand: qcom: erased page bitflips detection
Message-ID: <20180708234742.0d86b9d1@xps13>
In-Reply-To: <1530619563-24712-1-git-send-email-absahu@codeaurora.org>
References: <1530619563-24712-1-git-send-email-absahu@codeaurora.org>
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

Hi Abhishek,

Abhishek Sahu <absahu@codeaurora.org> wrote on Tue,  3 Jul 2018
17:36:03 +0530:

> NAND parts can have bitflips in an erased page due to the
> process technology used. In this case, QCOM NAND controller
> is not able to identify that page as an erased page.
> Currently the driver calls nand_check_erased_ecc_chunk() for
> identifying the erased pages but this won=E2=80=99t work always since the
> checking is being with ECC engine returned data. In case of
> bitflips, the ECC engine tries to correct the data and then it
> generates the uncorrectable error. Now, this data is not equal to
> original raw data. For erased CW identification, the raw data
> should be read again from NAND device and this
> nand_check_erased_ecc_chunk function() should be called for raw
> data only.
>=20
> Now following logic is being added to identify the erased
> codeword bitflips.
>=20
> 1. In most of the cases, not all the codewords will have bitflips
>    and only single CW will have bitflips. So, there is no need to
>    read the complete raw page data. The NAND raw read can be
>    scheduled for any CW in page. The NAND controller works on CW
>    basis and it will update the status register after each CW read.
>    Maintain the bitmask for the CW which generated the uncorrectable
>    error.
> 2. Do raw read for all the CW's which generated the uncorrectable
>    error.
> 3. Both DATA and OOB need to be checked for number of 0. The
>    top-level API can be called with only data buf or OOB buf so use
>    chip->databuf if data buf is null and chip->oob_poi if
>    OOB buf is null for copying the raw bytes temporarily.
> 4. For each CW, check the number of 0 in cw_data and usable
>    oob bytes, The bbm and spare (unused) bytes bit flip won=E2=80=99t
>    affect the ECC so don=E2=80=99t check the number of bitflips in this a=
rea.
>=20
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
> * Changes from v4:
>=20
>  1. Used for_each_set_bit for determining CW=E2=80=99s which generated
>     uncorrectable errors.
>  2. Introduced cw_data_buf and cw_oob_buf which will have starting
>     buffer address for current codeword and used the same in helper
>     functions.
>  3. Added new line before calling of nand_check_erased_ecc_chunk for
>     better code readability.
>=20
> * Changes from v3:
>=20
>  1. Major changes in erased codeword detection for
>     raw read function
>=20
> * Changes from v2:
>   NONE
>=20
> * Changes from v1:
>  1. Minor change in commit message
>  2. invalidate pagebuf if databuf or oob_poi is used
>=20
>  drivers/mtd/nand/raw/qcom_nandc.c | 126 +++++++++++++++++++++++++++-----=
------
>  1 file changed, 89 insertions(+), 37 deletions(-)

Applied to nand/next.

Thanks,
Miqu=C3=A8l

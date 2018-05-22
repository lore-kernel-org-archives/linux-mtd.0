Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fL1M7-00070n-Bt
 for linux-mtd@lists.infradead.org; Tue, 22 May 2018 07:05:31 +0000
Date: Tue, 22 May 2018 09:04:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>, Archit
 Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v2 06/14] mtd: rawnand: qcom: erased page detection for
 uncorrectable errors only
Message-ID: <20180522090459.71d35004@xps13>
In-Reply-To: <1525350041-22995-7-git-send-email-absahu@codeaurora.org>
References: <1525350041-22995-1-git-send-email-absahu@codeaurora.org>
 <1525350041-22995-7-git-send-email-absahu@codeaurora.org>
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

On Thu,  3 May 2018 17:50:33 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> Following is the flow in the HW if controller tries to read erased
> page

Nit:  ^ missing ':'

>=20
> 1. First ECC uncorrectable error will be generated from ECC engine
>    since ECC engine first calculates the ECC with all 0xff and match
>    the calculated ECC with ECC code in OOB (which is again all 0xff).
> 2. After getting ECC error, erased CW detection logic will be
>    applied which is different for BCH and RS ECC
>     a. For BCH, HW checks if all the bytes in page are 0xff and then
>        it updates the status in separate register
>        NAND_ERASED_CW_DETECT_STATUS.
>     b. For RS ECC, the HW reports the same error when reading an
>        erased CW, but it notifies that it is an erased CW by
>        placing special characters at certain offsets in the
>        buffer.
>=20
> So the erased CW detect status should be checked only if ECC engine
> generated the uncorrectable error.
>=20
> Currently for all other operational errors also (like TIMEOUT, MPU
> errors, etc.), the erased CW detect logic is being applied so fix this
> and return EIO for other operational errors.
>=20
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
> * Changes from v1:
>=20
>   1. Added more detail in commit message
>   2. Added comment before each if/else

Thanks for that, it's much more ease to review :)

>   3. Removed redundant check for BS_UNCORRECTABLE_BIT
>=20
>  drivers/mtd/nand/raw/qcom_nandc.c | 65 ++++++++++++++++++++++++++-------=
------
>  1 file changed, 43 insertions(+), 22 deletions(-)
>=20

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

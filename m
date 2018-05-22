Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fL1XY-0005SR-9l
 for linux-mtd@lists.infradead.org; Tue, 22 May 2018 07:17:02 +0000
Date: Tue, 22 May 2018 09:16:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>, Archit
 Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v2 07/14] mtd: rawnand: qcom: fix null pointer access
 for erased page detection
Message-ID: <20180522091647.74884137@xps13>
In-Reply-To: <1525350041-22995-8-git-send-email-absahu@codeaurora.org>
References: <1525350041-22995-1-git-send-email-absahu@codeaurora.org>
 <1525350041-22995-8-git-send-email-absahu@codeaurora.org>
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

On Thu,  3 May 2018 17:50:34 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> parse_read_errors can be called with only oob_buf in which case
> data_buf will be NULL.  If data_buf is NULL, then don=E2=80=99t
> treat this page as completely erased in case of ECC uncorrectable
> error for RS ECC. For BCH ECC, the controller itself tells
> regarding erased page in status register.
>=20
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
> * Changes from v1:
>=20
>   1. Added more detail in commit message
>   2. Added comment before each if/else

Again, thanks for that.

>=20
>  drivers/mtd/nand/raw/qcom_nandc.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>



--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

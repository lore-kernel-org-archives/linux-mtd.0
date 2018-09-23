Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g42fI-000440-Rn
 for linux-mtd@lists.infradead.org; Sun, 23 Sep 2018 11:35:06 +0000
Date: Sun, 23 Sep 2018 13:34:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <christophe.kerello@st.com>
Cc: <boris.brezillon@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash
 controller driver
Message-ID: <20180923133451.78c95cef@xps13>
In-Reply-To: <1537199260-7280-3-git-send-email-christophe.kerello@st.com>
References: <1537199260-7280-1-git-send-email-christophe.kerello@st.com>
 <1537199260-7280-3-git-send-email-christophe.kerello@st.com>
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

Hi Christophe,

<christophe.kerello@st.com> wrote on Mon, 17 Sep 2018 17:47:39 +0200:

> From: Christophe Kerello <christophe.kerello@st.com>
>=20
> The driver adds the support for the STMicroelectronics FMC2 NAND
> Controller found on STM32MP SOCs.
>=20
> This patch is based on FMC2 command sequencer.
> The purpose of the command sequencer is to facilitate the programming
> and the reading of NAND flash pages with the ECC and to free the CPU
> of sequencing tasks.
> It requires one DMA channel for write and two DMA channels for read
> operations.
>=20
> Only NAND_ECC_HW mode is actually supported.
> The driver supports a maximum 8k page size.
> The following ECC strength and step size are currently supported:
>  - nand-ecc-strength =3D <8>, nand-ecc-step-size =3D <512> (BCH8)
>  - nand-ecc-strength =3D <4>, nand-ecc-step-size =3D <512> (BCH4)
>  - nand-ecc-strength =3D <1>, nand-ecc-step-size =3D <512> (Extended ecc
>    based on HAMMING)
>=20
> This patch has been tested on Micron MT29F8G08ABACAH4 and
> MT29F8G16ABACAH4
>=20
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---


[...]

> +/* NAND callbacks setup */
> +static void stm32_fmc2_nand_callbacks_setup(struct stm32_fmc2 *fmc2)
> +{
> +	struct nand_chip *chip =3D &fmc2->chip;
> +
> +	/* Specific callbacks to read/write a page */
> +	chip->ecc.correct =3D stm32_fmc2_ham_correct;
> +	chip->ecc.write_page =3D stm32_fmc2_sequencer_write_page;
> +	chip->ecc.read_page =3D stm32_fmc2_sequencer_read_page;
> +	chip->ecc.write_page_raw =3D stm32_fmc2_sequencer_write_page_raw;
> +	chip->ecc.read_page_raw =3D stm32_fmc2_sequencer_read_page_raw;

Are you sure all the tests in mtd-utils are successful?


Thanks,
Miqu=C3=A8l

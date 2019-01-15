Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjRzM-0005OU-SA
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2019 16:54:58 +0000
Date: Tue, 15 Jan 2019 17:54:42 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Cc: <boris.brezillon@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH v4 0/3] mtd: rawnand: add STM32 FMC2 NAND flash
 controller driver
Message-ID: <20190115175442.6b553a84@xps13>
In-Reply-To: <1544781488-18723-1-git-send-email-christophe.kerello@st.com>
References: <1544781488-18723-1-git-send-email-christophe.kerello@st.com>
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

Christophe Kerello <christophe.kerello@st.com> wrote on Fri, 14 Dec
2018 10:58:05 +0100:

> This patchset adds the support for the STMicroelectronics FMC2 NAND flash
> controller found on STM32MP SOCs.
>=20
> This patchset supports:
>   - the command sequencer feature, a hardware accelerator for read/write
>     within a page
>   - the manual mode feature, useful for debug purpose
>   - a maximum 8k page size
>   - following ECC strength and step size
> 	- nand-ecc-strength =3D <8>, nand-ecc-step-size =3D <512> (BCH8)
> 	- nand-ecc-strength =3D <4>, nand-ecc-step-size =3D <512> (BCH4)
> 	- nand-ecc-strength =3D <1>, nand-ecc-step-size =3D <512> (Extended
> 	  ecc based on HAMMING)
>    =20
> This patchset has been tested on Micron MT29F8G08ABACAH4 (8-bit SLC NAND)
> and MT29F8G16ABACAH4 (16-bit SLC NAND)

Series applied on nand/next.


Thanks,
Miqu=C3=A8l

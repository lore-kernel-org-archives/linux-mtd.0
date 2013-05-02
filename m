From: "Gupta, Pekon" <pekon@ti.com>
To: Huang Shijie <b32955@freescale.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>
Subject: RE: [PATCH V4 2/9] mtd: add data structures for Extended Parameter
 Page
Date: Thu, 2 May 2013 07:42:58 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9C0A84@DBDE04.ent.ti.com>
References: <1366967337-5534-1-git-send-email-b32955@freescale.com>
 <1366967337-5534-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1366967337-5534-3-git-send-email-b32955@freescale.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Since the ONFI 2.1, the onfi spec adds the Extended Parameter Page
> to store the ECC info.
>=20
> The onfi spec tells us that if the nand chip's recommended ECC codeword
> size is not 512 bytes, then the @ecc_bits is 0xff. The host _SHOULD_
> then
> read the Extended ECC information that is part of the extended
> parameter
> page to retrieve the ECC requirements for this device.
>=20
> This patch adds
>     [1] the neccessary fields for nand_onfi_params{},
>     [2] and adds the onfi_ext_ecc_info{} for Extended ECC information,
>     [3] adds onfi_ext_section{} for extended sections,
>     [4] and adds onfi_ext_param_page{} for the Extended Parameter
> Page.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Acked-by: Pekon Gupta <pekon@ti.com>

Thanks..
with regards, pekon

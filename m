From: "Gupta, Pekon" <pekon@ti.com>
To: Huang Shijie <b32955@freescale.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>
Subject: RE: [PATCH v3 0/7] mtd: spi-nor: add a new framework for SPI NOR
Date: Tue, 17 Dec 2013 04:08:33 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA56ADC@DBDE04.ent.ti.com>
References: <1387184330-14448-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1387184330-14448-1-git-send-email-b32955@freescale.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "marex@denx.de" <marex@denx.de>, "angus.clark@st.com" <angus.clark@st.com>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 "b44548@freescale.com" <b44548@freescale.com>,
 "broonie@linaro.org" <broonie@linaro.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "b18965@freescale.com" <b18965@freescale.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Poddar,
 Sourav" <sourav.poddar@ti.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Shijie,

>From: Huang Shijie [mailto:b32955@freescale.com]
[...]
>Huang Shijie (7):
>  mtd: spi-nor: copy the SPI NOR commands to a new header file
>  mtd: spi-nor: add the basic data structures
>  mtd: spi-nor: add the framework for SPI NOR
>  mtd: m25p80: use the SPI nor framework
>  mtd: spi-nor: add a helper to find the spi_device_id
>  Documentation: add the binding file for Quadspi driver
>  mtd: spi-nor: Add Freescale QuadSpi driver
>
> .../devicetree/bindings/mtd/fsl-quadspi.txt        |   31 +
> drivers/mtd/Kconfig                                |    2 +
> drivers/mtd/Makefile                               |    1 +
> drivers/mtd/devices/Kconfig                        |    2 +-
> drivers/mtd/devices/m25p80.c                       | 1271 ++-------------=
-----

As much base code is copied from m25p90.c,
Do you mind keeping the sign-offs of the original contributors of m25p80.c
at-least in patches where much code is ported ?
This would at-least give some credit to original authors and contributors.

with regards, pekon

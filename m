From: Konstantin Tokarev <annulen@yandex.ru>
To: Huang Shijie <b32955@freescale.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
In-Reply-To: <1393238262-8622-5-git-send-email-b32955@freescale.com>
References: <1393238262-8622-1-git-send-email-b32955@freescale.com>
 <1393238262-8622-5-git-send-email-b32955@freescale.com>
Subject: Re: [PATCH v5 4/8] Documentation: add the document for the SPI NOR
 framework
MIME-Version: 1.0
Message-Id: <203101393255036@web29h.yandex.ru>
Date: Mon, 24 Feb 2014 19:17:16 +0400
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=koi8-r
Cc: "angus.clark@st.com" <angus.clark@st.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "b44548@freescale.com" <b44548@freescale.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "broonie@linaro.org" <broonie@linaro.org>,
 "b18965@freescale.com" <b18965@freescale.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "pekon@ti.com" <pekon@ti.com>, "sourav.poddar@ti.com" <sourav.poddar@ti.com>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
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



24.02.2014, 15:26, "Huang Shijie" <b32955@freescale.com>:
> This patch adds the document for the SPI NOR framework.
>
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
> šDocumentation/mtd/spi-nor.txt | šš59 +++++++++++++++++++++++++++++++++++++++++
> š1 files changed, 59 insertions(+), 0 deletions(-)
> šcreate mode 100644 Documentation/mtd/spi-nor.txt
>
> diff --git a/Documentation/mtd/spi-nor.txt b/Documentation/mtd/spi-nor.txt
> new file mode 100644
> index 0000000..b9585f8
> --- /dev/null
> +++ b/Documentation/mtd/spi-nor.txt
> @@ -0,0 +1,59 @@
> + šššššššššššššššššššššššššSPI NOR framework
> + šššššššššššššš============================================
> +
> +Part I - why we need this framework?
> +-------------------------------------
> +
> +The SPI bus controller only deals with the byte stream.
> +Some controller does not works like a SPI bus controller, it works
> +like a SPI NOR controller instead, such as the Freescale's QuadSPI controller.
> +
> +The Freescale's QuadSPI controller should knows the NOR commands to
> +find the right LUT sequence. Unfortunately, the old code can not meet
> +this requirement.

should know

> +
> +Part II - How does the framework work?
> +-------------------------------------
> +
> +This framework just adds a new layer between the MTD and the SPI bus driver.
> +With this new layer, the SPI NOR controller driver does not depend on the
> +m25p80 code anymore.
> +
> + ššBefore this framework, the layer is like:
> +
> + ššššššššššššššššššMTD
> + šššššššš------------------------
> + šššššššššššššššššm25p80
> + šššššššš------------------------
> + ššššššSPI bus driver
> + šššššššš------------------------
> + šššššššSPI NOR chip
> +
> + ššAfter this framework, the layer is like:
> + ššššššššššššššššššMTD
> + šššššššš------------------------
> + šššššššššššššSPI NOR framework
> + šššššššš------------------------
> + šššššššššššššššššm25p80
> + šššššššš------------------------
> + ššššššSPI bus driver
> + šššššššš------------------------
> + ššššššSPI NOR chip
> +
> + šWith the SPI NOR controller driver(Freescale QuadSPI), it looks like:
> + ššššššššššššššššššMTD
> + šššššššš------------------------
> + šššššššššššššSPI NOR framework
> + šššššššš------------------------
> + šššššššššššššššfsl-quadSPI
> + šššššššš------------------------
> + ššššššSPI NOR chip
> +
> +Part III - How can the drivers use the framework
> +-------------------------------------
> +
> +The main API is the spi_nor_scan(). Before you call the hook, you should
> +initialize the necessary fields for spi_nor{}.
> +Please see the drivers/mtd/spi-nor/spi-nor.c for detail.
> +Please also reference to the fsl-quadspi.c when you want to write a new driver
> +for a SPI NOR controller.
> --
> 1.7.2.rc3
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Regards,
Konstantin

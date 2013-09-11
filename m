Message-ID: <52304BFF.4060007@freescale.com>
Date: Wed, 11 Sep 2013 18:54:55 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
References: <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com>
 <20130905020435.GA3970@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
 <522817D7.1010206@freescale.com> <522D3B79.3060707@freescale.com>
 <20130909151450.GI29403@sirena.org.uk> <522EC33B.9000009@freescale.com>
 <20130910180704.GB29403@sirena.org.uk> <522FD78A.6080900@freescale.com>
 <20130911104126.GN29403@sirena.org.uk>
In-Reply-To: <20130911104126.GN29403@sirena.org.uk>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "b44548@freescale.com" <b44548@freescale.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "b18965@freescale.com" <b18965@freescale.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "lznuaa@gmail.com" <lznuaa@gmail.com>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 Huang Shijie <shijie8@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA09=D4=C211=C8=D5 18:41, Mark Brown =D0=B4=B5=C0:
> So why does the SPI driver have references to the opcodes in it?
I admit that the Freescale's quadspi controller is very special
(it is designed too coupled with the SPI Nor FLASH),
it is driven by the LUT registers.

I just quote the comment from the patch 1:


-------------------------------------------------------------
(2) The definition of the LUT register shows below:

---------------------------------------------------
| INSTR1 | PAD1 | OPRND1 | INSTR0 | PAD0 | OPRND0 |
---------------------------------------------------

There are several types of INSTRx, such as:
CMD : the SPI NOR command.
ADDR : the address for the SPI NOR command.
DUMMY : the dummy cycles needed by the SPI NOR command.
....
-------------------------------------------------------------------

The LUT registers needs to be filled with the SPI NOR command, such
Fast-read/Quad-read.
So the Quadspi driver needs to know the spi commands, and that's why the
SPI driver has
references to the spi command opcodes.

=20
thanks
Huang Shijie

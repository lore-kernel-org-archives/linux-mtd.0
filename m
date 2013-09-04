Message-ID: <522697E9.1050208@freescale.com>
Date: Wed, 4 Sep 2013 10:16:09 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
References: <1377828449-18912-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1377828449-18912-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree@vger.kernel.org, shawn.guo@linaro.org, b44548@freescale.com,
 dedekind1@gmail.com, linux-doc@vger.kernel.org, b18965@freescale.com,
 linux-spi@vger.kernel.org, broonie@kernel.org, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, lznuaa@gmail.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA08=D4=C230=C8=D5 10:07, Huang Shijie =D0=B4=B5=C0:
> (0) What is the Quadspi controller?
>
>     The Quadspi(Quad Serial Peripheral Interface) acts as an interface =
to
>     one single or two external serial flash devices, each with up to 4
>     bidirectional data lines.
>
Hi Mark:

Since this quadspi driver depends on the mtd code, could this driver
goes to the kernel by
the l2-mtd tree?


thanks
Huang Shijie

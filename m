Message-ID: <52270B8E.5080402@freescale.com>
Date: Wed, 4 Sep 2013 18:29:34 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
References: <1377828449-18912-1-git-send-email-b32955@freescale.com>
 <522697E9.1050208@freescale.com> <20130904095523.GT3084@sirena.org.uk>
In-Reply-To: <20130904095523.GT3084@sirena.org.uk>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree@vger.kernel.org, computersforpeace@gmail.com,
 b44548@freescale.com, dedekind1@gmail.com, linux-doc@vger.kernel.org,
 b18965@freescale.com, linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, lznuaa@gmail.com, shawn.guo@linaro.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA09=D4=C204=C8=D5 17:55, Mark Brown =D0=B4=B5=C0:
> On Wed, Sep 04, 2013 at 10:16:09AM +0800, Huang Shijie wrote:
>
>> Since this quadspi driver depends on the mtd code, could this driver
>> goes to the kernel by
>> the l2-mtd tree?
> Why would a SPI driver depend on MTD?
The patch 1-4 are for m25p80.c, and this quadspi controller drivers
depends on the
patch 1-4.



thanks
Huang Shijie

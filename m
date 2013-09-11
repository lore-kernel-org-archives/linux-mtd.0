Message-ID: <522FD833.2060801@freescale.com>
Date: Wed, 11 Sep 2013 10:40:51 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 5/8] spi: Add Freescale QuadSpi driver
References: <1377828449-18912-1-git-send-email-b32955@freescale.com>
 <1377828449-18912-6-git-send-email-b32955@freescale.com>
 <20130910180923.GC29403@sirena.org.uk>
In-Reply-To: <20130910180923.GC29403@sirena.org.uk>
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

=D3=DA 2013=C4=EA09=D4=C211=C8=D5 02:09, Mark Brown =D0=B4=B5=C0:
> On Fri, Aug 30, 2013 at 10:07:26AM +0800, Huang Shijie wrote:
>> (0) What is the Quadspi controller?
>>
>>     The Quadspi(Quad Serial Peripheral Interface) acts as an interface=
 to
>>     one single or two external serial flash devices, each with up to 4
>>     bidirectional data lines.
> For review and merge it would be much easier to send a patch which
> implements just the basic SPI support for this device then add the
> support for quad mode separately.
okay. I can remove the quad-read support in next version.

thanks
Huang Shijie

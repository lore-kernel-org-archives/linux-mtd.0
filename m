MIME-Version: 1.0
In-Reply-To: <cover.1441803609.git.cyrille.pitchen@atmel.com>
References: <cover.1441803609.git.cyrille.pitchen@atmel.com>
From: Jonas Gorski <jogo@openwrt.org>
Date: Thu, 10 Sep 2015 12:36:26 +0200
Message-ID: <CAOiHx=khSdd-Ro8xJ11X+hijMWjyiryfYJtJOoMoK_CrZ_m39A@mail.gmail.com>
Subject: Re: [PATCH linux-next v6 0/8] add driver for Atmel QSPI controller
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: nicolas.ferre@atmel.com, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "Bean Huo (beanhuo)" <beanhuo@micron.com>, Gabor Juhos <juhosg@openwrt.org>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
 Ben Hutchings <ben@decadent.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, Sep 9, 2015 at 3:24 PM, Cyrille Pitchen
<cyrille.pitchen@atmel.com> wrote:
> This series of patches add support for the new Atmel QSPI controller
> embedded inside sama5d2x SoCs.
>
> These patches were first developped for linux-3.18-at91 and tested on a
> sama5d27 Xplained ultra board, which embeds a Micron n25q128a13 QSPI NOR
> flash memory. Then the series was adapted for mainline.

All in all, this looks a lot better now compared to the previous
version. What I'm still missing is some definsive programming to
ensure we don't break existing users, or update the current users to
not break. The issues I currently see are

1) We don't check if a spi-nor controller actually supports a certain
protocol, just if SPI_NOR_DUAL/_QUAD is set
2) We currently set these new protocols, but none of the current
spi-nor controller drivers are aware of the protocols, which has the
possiblity of silently breaking things (or not, since they will then
fail to read correct data)
3) m25p80 currently uses SPI_RX_DUAL -> SPI_NOR_DUAL, but does not
check SPI_TX_DUAL (which is required for any of the != 1_1_x
commands). Although this is more an academical concern, as currently
all spi controller drivers seem to support _RX_ and _TX_, never only
one direction.


Jonas

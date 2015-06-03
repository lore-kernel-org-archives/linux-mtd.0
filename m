From: Marek Vasut <marex@denx.de>
To: Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH 04/11] mtd: ofpart: do not fail probe when no partitions
 exist
Date: Thu, 4 Jun 2015 00:58:52 +0200
References: <cover.1433364398.git.hramrach@gmail.com>
 <36e315552c849a4d22ac0fcff7958f6ffcafb160.1433364398.git.hramrach@gmail.com>
In-Reply-To: <36e315552c849a4d22ac0fcff7958f6ffcafb160.1433364398.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201506040058.52882.marex@denx.de>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-mtd@lists.infradead.org,
 Alison Chaiken <alison_chaiken@mentor.com>, "Bean Huo
 =?utf-8?q?=E9=9C=8D=E6=96=8C=E6=96=8C?= \(beanhuo\)" <beanhuo@micron.com>,
 linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>,
 Vinod Koul <vinod.koul@intel.com>,
 =?utf-8?q?Rafa=C5=82?= =?utf-8?q?_Mi=C5=82ecki?= <zajec5@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, Ben Hutchings <ben@decadent.org.uk>,
 devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Mark Brown <broonie@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 "grmoore@altera.com" <grmoore@altera.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 Rob Herring <robh+dt@kernel.org>, Han Xu <han.xu@freescale.com>,
 Knut Wohlrab <knut.wohlrab@de.bosch.com>, dmaengine@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, June 03, 2015 at 11:26:40 PM, Michal Suchanek wrote:
> On Exynos it is necessary to set SPI controller parameters that apply to
> a SPI slave in a DT subnode of the slave device. The ofpart code returns
> an error when there are subnodes of the SPI flash but no partitions are
> found. Change this condition to a warning so that flash without
> partitions can be accessed on Exynos.

I have to admit the rationale for this patch is not very clear to me, sorry.
Can you please explain this a bit more ?

Best regards,
Marek Vasut

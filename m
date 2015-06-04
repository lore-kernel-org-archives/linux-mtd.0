Message-id: <556FB37E.3000800@samsung.com>
Date: Thu, 04 Jun 2015 11:10:06 +0900
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
MIME-version: 1.0
To: Michal Suchanek <hramrach@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>,
 Kukjin Kim <kgene@kernel.org>, Vinod Koul <vinod.koul@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Marek Vasut <marex@denx.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
 Knut Wohlrab <knut.wohlrab@de.bosch.com>,
 =?UTF-8?B?IkJlYW4gSHVvIOmcjeaWjOaWjCAoYmVhbmh1byki?= <beanhuo@micron.com>,
 "grmoore@altera.com" <grmoore@altera.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH 09/11] dma: pl330: fix wording in mcbufsz message
References: <cover.1433364398.git.hramrach@gmail.com>
 <14872fc6f86b7f4976d539b47a7899904cd954f6.1433364398.git.hramrach@gmail.com>
In-reply-to: <14872fc6f86b7f4976d539b47a7899904cd954f6.1433364398.git.hramrach@gmail.com>
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04.06.2015 06:26, Michal Suchanek wrote:
> The kernel is not trying to increase mcbufsz. It suggests you should try
> doing so. Also print the calculated required size of mcbufsz.
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>

Looks good:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

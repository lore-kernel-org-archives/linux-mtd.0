Date: Mon, 8 Jun 2015 16:37:00 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH 09/11] dma: pl330: fix wording in mcbufsz message
Message-ID: <20150608110700.GI28601@localhost>
References: <cover.1433364398.git.hramrach@gmail.com>
 <14872fc6f86b7f4976d539b47a7899904cd954f6.1433364398.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14872fc6f86b7f4976d539b47a7899904cd954f6.1433364398.git.hramrach@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-mtd@lists.infradead.org,
 Alison Chaiken <alison_chaiken@mentor.com>,
 Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Russell King <linux@arm.linux.org.uk>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
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

On Wed, Jun 03, 2015 at 09:26:41PM +0000, Michal Suchanek wrote:
> The kernel is not trying to increase mcbufsz. It suggests you should try
> doing so. Also print the calculated required size of mcbufsz.
pls use right subsystem name in the patches

I have applied this now

-- 
~Vinod

Date: Thu, 12 Jan 2017 14:28:28 -0800
From: Tony Lindgren <tony@atomide.com>
To: Teresa Remmet <t.remmet@phytec.de>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] ARM: dts: am335x-phycore-som: Remove partition tables
Message-ID: <20170112222827.GO2630@atomide.com>
References: <1483951050-46588-1-git-send-email-t.remmet@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1483951050-46588-1-git-send-email-t.remmet@phytec.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Teresa Remmet <t.remmet@phytec.de> [170109 00:38]:
> As the bootloader passes the NAND and the SPI flash partition tables
> there is no need to keep them in the kernel device tree.
> Removed them.
> 
> Signed-off-by: Teresa Remmet <t.remmet@phytec.de>

Applying into omap-for-v4.11/dt thanks.

Tony

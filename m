From: Arnd Bergmann <arnd@arndb.de>
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v2 00/12] ARM: mxs: move to generic DMA device tree binding
Date: Tue, 5 Mar 2013 19:39:00 +0000
References: <1362486244-24593-1-git-send-email-shawn.guo@linaro.org>
In-Reply-To: <1362486244-24593-1-git-send-email-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201303051939.00808.arnd@arndb.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, alsa-devel@alsa-project.org,
 linux-serial@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 Vinod Koul <vinod.koul@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-mmc@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Wolfram Sang <wsa@the-dreams.de>, Chris Ball <cjb@laptop.org>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 05 March 2013, Shawn Guo wrote:
> The series converts mxs-dma and its clients to generic DMA device tree
> binding/helper.
> 
> I published a branch below to ease people who is willing to help
> testing the series.

Looks all good, aside from the bug I found in the first patch.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

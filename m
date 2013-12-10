Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqP0K-0002PM-O6
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2013 15:13:46 +0000
From: Marek Vasut <marex@denx.de>
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCHv2 00/10] Add memory mapped support for ti qspi,
 m25p80 serial flash.
Date: Tue, 10 Dec 2013 13:49:13 +0100
References: <1386339891-32717-1-git-send-email-sourav.poddar@ti.com>
In-Reply-To: <1386339891-32717-1-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201312101349.13564.marex@denx.de>
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, balbi@ti.com,
 linux-spi@vger.kernel.org, broonie@kernel.org, linux-mtd@lists.infradead.org,
 bcousson@baylibre.com, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, December 06, 2013 at 03:24:41 PM, Sourav Poddar wrote:
> The patch series aims to add memory mapped support for TI qspi
> contoller and also add support for the same in serial flash driver(m25p80).

My question is, shall we not wait for the new SPI NOR framework to be well 
fleshed out and only then implement this controller driver on top of it ?

I have a feeling this patchset adds quite a lot of ad-hoc hacks into the m25p80 
driver, which would become dead code once converted to the SPI NOR framework.

Best regards,
Marek Vasut

Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAvYV-00021W-MB
 for linux-mtd@lists.infradead.org; Mon, 21 Dec 2015 08:10:56 +0000
Subject: Re: [PATCH] mtd: onenand: omap2: Simplify the DMA setup for various
 paths
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>
References: <1450086572-15224-1-git-send-email-peter.ujfalusi@ti.com>
 <20151218181111.GK10460@google.com> <20151218183948.GO23396@atomide.com>
 <20151219133049.GA1611@darkstar.musicnaut.iki.fi>
CC: Brian Norris <computersforpeace@gmail.com>, <kyungmin.park@samsung.com>,
 <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>, Sebastian
 Reichel <sre@kernel.org>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <5677B3C1.9070500@ti.com>
Date: Mon, 21 Dec 2015 10:09:37 +0200
MIME-Version: 1.0
In-Reply-To: <20151219133049.GA1611@darkstar.musicnaut.iki.fi>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/19/2015 03:30 PM, Aaro Koskinen wrote:
> Probably DMA support is not that critical. Looks like with DT boot it's
> not even possible to enable it at the moment.

I think by adding 'dma-channel' property is there to enable the DMA mode via DT.

As for stripping out the DMA support: I'm fine with that if no one objects,
but in the header of the file we have:
 *  Author: Jarkko Lavinen <jarkko.lavinen@nokia.com> and Juha Yrjölä
 *  IRQ and DMA support written by Timo Teras

So I believe the DMA and IRQ code was a big stunt itself to receive it's own
line there...

-- 
Péter

Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vm0Ja-0001tN-Np
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 12:03:27 +0000
Message-ID: <529730F2.5070807@ti.com>
Date: Thu, 28 Nov 2013 17:32:58 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 12/17] spi/qspi: convert driver to enable/disable memory
 mapped.
References: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
 <1385451313-1875-13-git-send-email-sourav.poddar@ti.com>
 <20131126131138.GJ14725@sirena.org.uk> <5296D37C.2020003@ti.com>
 <20131128104922.GK14725@sirena.org.uk> <5297242B.3040807@ti.com>
 <20131128115934.GE27568@sirena.org.uk>
In-Reply-To: <20131128115934.GE27568@sirena.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, computersforpeace@gmail.com, balbi@ti.com,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 bcousson@baylibre.com, linux-omap@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 28 November 2013 05:29 PM, Mark Brown wrote:
> On Thu, Nov 28, 2013 at 04:38:27PM +0530, Sourav Poddar wrote:
>> On Thursday 28 November 2013 04:19 PM, Mark Brown wrote:
>>> Removing the mapping isn't going to stop another context which has
>>> obtained a handle on the map trying to look at the mapping.
>> hmm..so the  'memcpy' part should be made atomic.(if possible?).
> Or holding the memory region should prevent normal SPI use (so any users
> ought to drop the memory region when they don't need it).
hmm.ok i will unmap the memory region when not in use.
> I'm still a bit surprised there's no DMA controllers for this...
Yes, but thats the truth :(

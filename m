Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlGeo-0000dO-FS
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 11:18:18 +0000
Message-ID: <5294835D.5090902@ti.com>
Date: Tue, 26 Nov 2013 16:47:49 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 03/17] spi/qspi: parse register by name.
References: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
 <1385451313-1875-4-git-send-email-sourav.poddar@ti.com>
 <20131126103029.GY14725@sirena.org.uk>
In-Reply-To: <20131126103029.GY14725@sirena.org.uk>
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

On Tuesday 26 November 2013 04:00 PM, Mark Brown wrote:
> On Tue, Nov 26, 2013 at 01:04:59PM +0530, Sourav Poddar wrote:
>> Modify the qspi driver to parse reg information by name.
> This presumably needs an update to the device tree bindings so that
> there's a name defined?
I have added "reg-names" property in dt bindings. (17/17) patch of
this series has that info.

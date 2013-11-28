Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VltTz-0001h4-6x
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 04:45:43 +0000
Message-ID: <5296CA5A.90304@ti.com>
Date: Thu, 28 Nov 2013 10:15:14 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 03/17] spi/qspi: parse register by name.
References: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
 <1385451313-1875-4-git-send-email-sourav.poddar@ti.com>
 <20131126103029.GY14725@sirena.org.uk> <5294835D.5090902@ti.com>
 <20131126122442.GC14725@sirena.org.uk>
In-Reply-To: <20131126122442.GC14725@sirena.org.uk>
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

On Tuesday 26 November 2013 05:54 PM, Mark Brown wrote:
> On Tue, Nov 26, 2013 at 04:47:49PM +0530, Sourav Poddar wrote:
>
>> I have added "reg-names" property in dt bindings. (17/17) patch of
>> this series has that info.
> Do device tree binding changes early on in the series rather than at the
> end, one of the things that gets reviewed for is binding updates.
>
> Your code should also cope with the existing bindings, falling back on
> the current behaviour if it can't get the names or the extra resources.
My current code only has a single resouce, hence "*_byname* variants
was not used. With extra resources, I am switching to "byname" variants,
So, if a particular resource name is not found, it should just bypass 
that, thinking
the resource is not required and should not resort to existing bindings..

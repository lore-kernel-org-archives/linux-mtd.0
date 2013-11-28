Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vlzdc-0000uV-QY
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 11:20:05 +0000
Message-ID: <529726C7.8060005@ti.com>
Date: Thu, 28 Nov 2013 16:49:35 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 03/17] spi/qspi: parse register by name.
References: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
 <1385451313-1875-4-git-send-email-sourav.poddar@ti.com>
 <20131126103029.GY14725@sirena.org.uk> <5294835D.5090902@ti.com>
 <20131126122442.GC14725@sirena.org.uk> <5296CA5A.90304@ti.com>
 <20131128105423.GL14725@sirena.org.uk> <529721BF.4010902@ti.com>
 <20131128111152.GN14725@sirena.org.uk>
In-Reply-To: <20131128111152.GN14725@sirena.org.uk>
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

On Thursday 28 November 2013 04:41 PM, Mark Brown wrote:
> On Thu, Nov 28, 2013 at 04:28:07PM +0530, Sourav Poddar wrote:
>> On Thursday 28 November 2013 04:24 PM, Mark Brown wrote:
>>> That means that if you switch all resources to _byname then the driver
>>> won't find any resources at all and will fail.  This will in turn mean
>>> that any device trees that work with the current code wil start failing,
>>> breaking compatibility.
>> I am changing my code to use *byname for all resources. There is no
>> dts available now in mainline using this code. I have added the dts file
>> as patch 15, 16 of this series to take care of this.
> We're now aiming for DT to be a stable interface and the existing
> binding has been included in a release so you really ought to be keeping
> compatiblity.
Ok. So I will check for *byname, if not found I will switch to 
"platform_get_resource".

Message-ID: <55ACB79A.3010101@atmel.com>
Date: Mon, 20 Jul 2015 10:55:54 +0200
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
MIME-Version: 1.0
To: Paul Bolle <pebolle@tiscali.nl>
CC: <nicolas.ferre@atmel.com>, <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <zajec5@gmail.com>, <beanhuo@micron.com>,
 <juhosg@openwrt.org>, <marex@denx.de>, <shijie.huang@intel.com>,
 <ben@decadent.org.uk>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <pawel.moll@arm.com>, <mark.rutland@arm.com>,
 <ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 7/7] mtd: atmel-quadspi: add driver for Atmel QSPI
 controller
References: <cover.1437059658.git.cyrille.pitchen@atmel.com>	
 <cf2522fc858b72af78d057ac76c4f029e80edf4a.1437059658.git.cyrille.pitchen@atmel.com>
 <1437123868.24981.7.camel@tiscali.nl>
In-Reply-To: <1437123868.24981.7.camel@tiscali.nl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Paul,

I've removed the ".bus = &plaform_bus_type" for the next series.
Thank you for the explanation and the review :)

Best Regards,

Cyrille

Le 17/07/2015 11:04, Paul Bolle a écrit :
> On do, 2015-07-16 at 17:27 +0200, Cyrille Pitchen wrote:
>> --- /dev/null
>> +++ b/drivers/mtd/spi-nor/atmel-quadspi.c
> 
>> +static struct platform_driver atmel_qspi_driver = {
>> +	.driver		= {
>> +		[...]
>> +		.bus	= &platform_bus_type,
>> +		[...]
>> +};
>> +module_platform_driver(atmel_qspi_driver);
> 
> Nit: on module init this will basically do
>     __platform_driver_register(&atmel_qspi_driver, THIS_MODULE);
> 
> which will again set bus to &platform_bus_type. So you might as well
> drop that line.
> 
> 
> Paul Bolle
> 

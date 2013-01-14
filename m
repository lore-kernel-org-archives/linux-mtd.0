Message-ID: <50F3C980.7070507@atmel.com>
Date: Mon, 14 Jan 2013 17:01:52 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH 0/3] at91: PMECC: enable PMECC in dt for at91sam9x5ek,
 at91sam9n12ek
References: <1355912840-29501-1-git-send-email-josh.wu@atmel.com>
In-Reply-To: <1355912840-29501-1-git-send-email-josh.wu@atmel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: plagnioj@jcrosoft.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nicolas.ferre@atmel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Ping? Any feedback for these patches?

On 12/19/2012 6:27 PM, Josh Wu wrote:
> Those patches will enable PMECC in dt parameters for at91sam9x5ek, at91sam9n12ek.
>
> Josh Wu (3):
>    MTD: at91: atmel_nand: for PMECC, add code to choose the ecc bits and
>      sector size according to the ONFI parameter ECC requirement.
>    at91: 9x5: add DT parameters to enable PMECC
>    at91: at91sam9n12: add DT parameters to enable PMECC
>
>   arch/arm/boot/dts/at91sam9n12.dtsi  |    1 +
>   arch/arm/boot/dts/at91sam9n12ek.dts |    5 +-
>   arch/arm/boot/dts/at91sam9x5.dtsi   |    4 ++
>   arch/arm/boot/dts/at91sam9x5cm.dtsi |    5 +-
>   drivers/mtd/nand/atmel_nand.c       |   89 +++++++++++++++++++++++++++++++++++
>   5 files changed, 102 insertions(+), 2 deletions(-)
>

Best Regards,
Josh Wu

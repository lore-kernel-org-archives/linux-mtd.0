From: khalasa@piap.pl (Krzysztof =?utf-8?Q?Ha=C5=82asa?=)
To: Arnd Bergmann <arnd@arndb.de>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Imre Kaloz <kaloz@openwrt.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: ixp4xx: include linux/mtd/platnand.h
References: <20180926130458.2406549-1-arnd@arndb.de>
 <20180926130458.2406549-2-arnd@arndb.de>
Sender: khalasa@piap.pl
Date: Mon, 01 Oct 2018 13:46:13 +0200
In-Reply-To: <20180926130458.2406549-2-arnd@arndb.de> (Arnd Bergmann's message
 of "Wed, 26 Sep 2018 15:04:39 +0200")
Message-ID: <m3in2ldh4q.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Arnd Bergmann <arnd@arndb.de> writes:

> The platform_nand_data structure definition is required for ixdp425
> but has now moved to a new header file:
>
> arch/arm/mach-ixp4xx/ixdp425-setup.c:98:15: error: variable 'ixdp425_flash_nand_data' has initializer but incomplete type
>  static struct platform_nand_data ixdp425_flash_nand_data = {
>                ^~~~~~~~~~~~~~~~~~
> arch/arm/mach-ixp4xx/ixdp425-setup.c:99:3: error: 'struct platform_nand_data' has no member named 'chip'
>
> Fixes: 19cf5dfa3a31 ("mtd: rawnand: Move platform_nand_xxx definitions out of rawnand.h")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-ixp4xx/ixdp425-setup.c | 1 +

Right.
Acked-by: Krzysztof Halasa <khalasa@piap.pl>

-- 
Krzysztof Halasa

Industrial Research Institute for Automation and Measurements PIAP
Al. Jerozolimskie 202, 02-486 Warsaw, Poland

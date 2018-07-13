Subject: Re: [PATCH 2/3] mtd: atmel nand: fix build warning on 64-bit
To: Arnd Bergmann <arnd@arndb.de>, Boris Brezillon
 <boris.brezillon@bootlin.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Wenyou Yang
 <wenyou.yang@microchip.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 <linux-mtd@lists.infradead.org>, Josh Wu <rainyfeeling@outlook.com>, Romain
 Izard <romain.izard.pro@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Peter
 Rosin <peda@axentia.se>, <linux-arm-kernel@lists.infradead.org>
References: <20180709155730.2422841-1-arnd@arndb.de>
 <20180709155730.2422841-2-arnd@arndb.de>
From: Tudor Ambarus <tudor.ambarus@microchip.com>
Message-ID: <0b4ee469-8c37-9002-9067-f37f8dde869e@microchip.com>
Date: Fri, 13 Jul 2018 12:56:01 +0300
MIME-Version: 1.0
In-Reply-To: <20180709155730.2422841-2-arnd@arndb.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Arnd,

On 07/09/2018 06:57 PM, Arnd Bergmann wrote:
> +	nc->ebi_csa_offs = (uintptr_t)match->data;

I guess we should declare ebi_csa_offs as size_t, right?

Best,
ta

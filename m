Received: from exsmtp03.microchip.com ([198.175.253.49]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUYla-0001Mw-Pd
 for linux-mtd@lists.infradead.org; Fri, 20 Jan 2017 12:58:08 +0000
Subject: Re: [PATCH v3] mtd: spi-nor: add dt support for Everspin MRAMs
To: Rob Herring <robh@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>
References: <480df61d-c949-b3b0-61a4-d9db17f09e7d@atmel.com>
 <20170117110338.10756-1-u.kleine-koenig@pengutronix.de>
 <20170119175608.5okfpsfutv7oawoo@rob-hp-laptop>
CC: Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>, Jagan Teki
 <jagan@openedev.com>, Marek Vasut <marex@denx.de>,
 <linux-mtd@lists.infradead.org>, <kernel@pengutronix.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Mark Rutland <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <d33f22ff-f854-aa30-0358-3b7e5c480e93@atmel.com>
Date: Fri, 20 Jan 2017 13:57:41 +0100
MIME-Version: 1.0
In-Reply-To: <20170119175608.5okfpsfutv7oawoo@rob-hp-laptop>
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

Le 19/01/2017 à 18:56, Rob Herring a écrit :
> On Tue, Jan 17, 2017 at 12:03:38PM +0100, Uwe Kleine-König wrote:
>> The MR25 family doesn't support JEDEC, so they need explicit mentioning
>> in the list of supported spi IDs. This makes it possible to add these
>> using for example:
>>
>> 	compatible = "everspin,mr25h40";
>>
>> There was already an entry for mr25h256. Move that one out of the "keep
>> for compatibility" section and put in a new group for Everspin MRAMs.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> ---
>> Changes since (implicit) v1:
>>
>>  - use Kib instead of kib
>>
>> Changes since v2:
>>
>>  - update dt docs
>>  - handle already existing mr25h256 in m25p_ids[]
>>
>> Thanks to Cyrille for catching these.
>>
>>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 2 ++
>>  drivers/mtd/devices/m25p80.c                            | 6 +++++-
>>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 
Applied to git://github.com/spi-nor/linux.git

Thanks!

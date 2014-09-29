MIME-Version: 1.0
In-Reply-To: <20140928222150.GC3248@norris-Latitude-E6410>
References: <1410714624.3040.38.camel@decadent.org.uk>
 <1410714670.3040.39.camel@decadent.org.uk>
 <20140928222150.GC3248@norris-Latitude-E6410>
Date: Mon, 29 Sep 2014 10:37:20 +0200
Message-ID: <CACna6rwxK61zVPNf2ACYj_NfNtkq=fNqdE4Xjjnpb8TVp1hvww@mail.gmail.com>
Subject: Re: [PATCH 1/5] m25p80,spi-nor: Fix module aliases for m25p80
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 Huang Shijie <shijie8@gmail.com>, linux-spi <linux-spi@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ian Campbell <ijc@hellion.org.uk>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ben Hutchings <ben@decadent.org.uk>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 debian-kernel <debian-kernel@lists.debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 29 September 2014 00:21, Brian Norris <computersforpeace@gmail.com> wrote:
> (Honestly, some of this name-matching / ID-matching stuff confuses me;
> there is at least one too many ways to choose a flash device for this
> driver.)

It's not that complex once you track it. It's just ugly to tracks
because of different structs, function calls and code locations.

1) All m25p80 users (arch code, SPI drivers, etc.) register
struct spi_board_info
that contains "modalias". It it used to match a driver to load.
In most (?) cases modalias is set to "m25p80"

2) Some m25p80 users decided to put a flash device name (e.g.
"at25fs010", "mx25l2005a", "m25p05", "w25x10") as modalias of the
struct spi_board_info. I think they are affected by the recent m25p80
change to use spi-not framework.

3) Other m25p80 users provide flash device name (e.g. "at25fs010",
"mx25l2005a", "m25p05", "w25x10") using platform_data in the struct
spi_board_info. It points to the struct flash_platform_data with
"name" and "type" properties. It seems to me that "name" is never
used.


My idea for fixing this:

1) Always use "m25p80" modalias (for m25p80 compatible hw).
This will make m25p80 driver work without this huge id_table

2) Do not use "name" nor "type" in the struct flash_platform_data if
the flash supports JEDEC

3) If the flash is m25p80 compatible, but doesn't support JEDEC, let's
use "type" to let m25p80 work.

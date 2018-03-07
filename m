From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Antoine Tenart <antoine.tenart@bootlin.com>, Nadav Haklai <nadavh@marvell.com>,
 Shadi Ammouri <shadi@marvell.com>, Omri Itach <omrii@marvell.com>,
 Hanna Hawa <hannah@marvell.com>, Igal Liberman <igall@marvell.com>,
 Marcin Wojtas <mw@semihalf.com>
Subject: Re: [PATCH] mtd: nand: marvell: Fix clock resource by adding a
 register clock
References: <20180228143553.12485-1-gregory.clement@bootlin.com>
 <20180301183520.4251439a@bbrezillon> <874llt5ut2.fsf@bootlin.com>
 <20180306134311.7bbf8ce7@bbrezillon>
Date: Wed, 07 Mar 2018 15:23:30 +0100
In-Reply-To: <20180306134311.7bbf8ce7@bbrezillon> (Boris Brezillon's message
 of "Tue, 6 Mar 2018 13:43:11 +0100")
Message-ID: <87woyo3qxp.fsf@bootlin.com>
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

Hi Boris,
 
 On mar., mars 06 2018, Boris Brezillon <boris.brezillon@bootlin.com> wrote:

>> >
>> > Another solution would be to retrieve the reg clk only on platforms
>> > that need it (based on the compatible). This way you won't have to test
>> > for -ENOENT and could simply propagate the error to the upper layer.  
>> 
>> We can't do this because we need to be bacwkard compatible.
>
> I don't get it. If the clock is missing in the DT, the NAND is
> already not working on these platforms, right? How could we break
> something that is already broken?

As you probably know this patch have been tested on an Armada 7K based
board, so it more or less works.

But it works because the second clock used by the nand controller is
also used by other IP and already setup by the drivers of these IP. So
today it is only if you boot a kernel without crypto, i2c, spi and uart
support that the nand won't work.

Then the current representation is wrong, but it is still usable in most
of the case. So that's why we still need to support the case where we
have only one clock in the device tree.

Gregory


>
> Regards,
>
> Boris
>
> -- 
> Boris Brezillon, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Gregory Clement, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

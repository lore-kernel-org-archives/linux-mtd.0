Date: Fri, 17 Oct 2014 09:23:35 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH v2 1/5] m25p80,spi-nor: Fix module aliases for m25p80
Message-ID: <20141017162335.GG22169@norris-Latitude-E6410>
References: <1412043222.9388.81.camel@decadent.org.uk>
 <1412043295.9388.82.camel@decadent.org.uk>
 <20141010045126.GB22169@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141010045126.GB22169@norris-Latitude-E6410>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ian Campbell <ijc@hellion.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Huang Shijie <shijie8@gmail.com>, linux-arm-kernel@lists.infradead.org,
 debian-kernel <debian-kernel@lists.debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 09, 2014 at 09:51:26PM -0700, Brian Norris wrote:
> On Tue, Sep 30, 2014 at 03:14:55AM +0100, Ben Hutchings wrote:
> > m25p80's device ID table is now spi_nor_ids, defined in spi-nor.  The
> > MODULE_DEVICE_TABLE() macro doesn't work with extern definitions, but
> > its use was also removed at the same time.  Now if m25p80 is built as
> > a module it doesn't get the necessary aliases to be loaded
> > automatically.
> > 
> > A clean solution to this will involve defining the list of device
> > IDs in spi-nor.h and removing struct spi_device_id from the spi-nor
> > API, but this is quite a large change.
> > 
> > As a quick fix suitable for stable, copy the device IDs back into
> > m25p80.
> > 
> > Fixes: 03e296f613af ("mtd: m25p80: use the SPI nor framework")
> > Cc: stable <stable@vger.kernel.org> # 3.16.x: 32f1b7c8352f: mtd: move support for struct flash_platform_data into m25p80
> > Cc: stable <stable@vger.kernel.org> # 3.16.x
> > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> 
> Can I get any acks/tested-by's? I'll try to test this out when I get
> back to the office, but I'd like to be able to send this in the 3.18
> cycle still.

Applied this patch to l2-mtd/master. Thanks!

Acks/tested-by's are still welcome. I plan to send this out in 3.18
(maybe for -rc2) if things look good.

Brian

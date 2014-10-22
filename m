Date: Wed, 22 Oct 2014 01:30:01 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH v2 2/5] spi-nor: Remove spi_nor::read_id operation
Message-ID: <20141022083001.GE16128@brian-ubuntu>
References: <1412043222.9388.81.camel@decadent.org.uk>
 <1412043304.9388.83.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1412043304.9388.83.camel@decadent.org.uk>
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

On Tue, Sep 30, 2014 at 03:15:04AM +0100, Ben Hutchings wrote:
> There is currently no useful way to override the default
> implementation of this operation.  The returned struct spi_device_id
> must have a pointer to struct flash_info in its private data, but this
> structure is defined inside spi-nor.
> 
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>

Applied this one to l2-mtd.git. Thanks!

Brian

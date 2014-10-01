Date: Wed, 1 Oct 2014 11:43:03 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Mark Brown <broonie@debian.org>
Subject: Re: [PATCH 1/2] mtd: m25p80: get rid of spi_get_device_id
Message-ID: <20141001184303.GX1193@ld-irv-0074>
References: <1411984074-3850-1-git-send-email-zajec5@gmail.com>
 <20141001182003.GB17974@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20141001182003.GB17974@sirena.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Huang Shijie <shijie8@gmail.com>, Ian Campbell <ijc@hellion.org.uk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 debian-kernel <debian-kernel@lists.debian.org>,
 Ben Hutchings <ben@decadent.org.uk>, linux-arm-kernel@lists.infradead.org,
 Jason Cooper <jason@lakedaemon.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 01, 2014 at 07:20:03PM +0100, Mark Brown wrote:
> On Mon, Sep 29, 2014 at 11:47:53AM +0200, Rafał Miłecki wrote:
> > This simplifies the way we use spi_nor framework and will allow us to
> > drop spi_nor_match_id.
> 
> Please don't CC linux-spi on spi-nor patches that don't have SPI level
> changes, it just clogs up patchwork.

+1 from me. I appreciate the converse, as I don't need unrelated noise
on linux-mtd.

(I feel sorry for people over at linux-arm-kernel and devicetree, since
they get CC'd on a large variety of unrelated things, it seems. I'm sure
the firehose gets to be almost as bad as LKML sometimes.)

Brian

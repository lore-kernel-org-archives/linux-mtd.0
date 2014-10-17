Date: Fri, 17 Oct 2014 09:31:09 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: make spi_nor_scan() take a chip type
 name, not spi_device_id
Message-ID: <20141017163109.GI22169@norris-Latitude-E6410>
References: <1411984074-3850-1-git-send-email-zajec5@gmail.com>
 <1411984074-3850-2-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1411984074-3850-2-git-send-email-zajec5@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
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

On Mon, Sep 29, 2014 at 11:47:54AM +0200, Rafał Miłecki wrote:
> From: Ben Hutchings <ben@decadent.org.uk>
> 
> Drivers currently call spi_nor_match_id() and then spi_nor_scan().
> This adds a dependency on struct spi_device_id which we want to
> avoid.  Make spi_nor_scan() do it for them.
> 
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Pushed to l2-mtd.git/master.

Brian

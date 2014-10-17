Date: Fri, 17 Oct 2014 09:30:23 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 1/2] mtd: m25p80: get rid of spi_get_device_id
Message-ID: <20141017163023.GH22169@norris-Latitude-E6410>
References: <1411984074-3850-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1411984074-3850-1-git-send-email-zajec5@gmail.com>
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

On Mon, Sep 29, 2014 at 11:47:53AM +0200, Rafał Miłecki wrote:
> This simplifies the way we use spi_nor framework and will allow us to
> drop spi_nor_match_id.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Applied to l2-mtd.git/master.

Brian

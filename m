Received: from nm19.bullet.mail.sp2.yahoo.com ([98.139.91.89])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PcQ6H-0007BJ-KM
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2011 22:20:34 +0000
Message-ID: <909411.87280.qm@web180312.mail.gq1.yahoo.com>
Date: Mon, 10 Jan 2011 14:20:21 -0800 (PST)
From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] mtd: sst25l: fix reads with broken spi-masters
To: linux-kernel@vger.kernel.org,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"spi-devel-general@lists.sourceforge.net"
	<spi-devel-general@lists.sourceforge.net>,
	H Hartley Sweeten <hartleys@visionengravers.com>
In-Reply-To: <0D753D10438DA54287A00B027084269764CDF4146A@AUSP01VMBX24.collaborationhost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Likely <grant.likely@secretlab.ca>,
	"Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



--- On Mon, 1/10/11, H Hartley Sweeten <hartleys@visionengravers.com> wrote:

> From: H Hartley Sweeten <hartleys@visionengravers.com>
> Subject: [PATCH] mtd: sst25l: fix reads with broken spi-masters

NAK.  I'm surprised you even thought to submit
such a clearly-wrong patch.

The bug is in the SPI master driver, and thus
so should the fix be.  Or make your system use
the GPIO based SPI master driver.

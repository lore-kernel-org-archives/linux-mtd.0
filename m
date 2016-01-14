Date: Wed, 13 Jan 2016 16:29:00 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Wan ZongShun <mcuos.com@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nuc900_nand: read correct SMISR register
Message-ID: <20160114002900.GA54220@google.com>
References: <9019174.GYajdpGP8V@wuerfel> <20160113215013.GS109450@google.com>
 <5830403.0pR8UVXPRZ@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5830403.0pR8UVXPRZ@wuerfel>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 13, 2016 at 11:02:06PM +0100, Arnd Bergmann wrote:
> On Wednesday 13 January 2016 13:50:13 Brian Norris wrote:
> > 
> > Looks OK to me, though I kinda hate dragging on support for
> > obviously-unused drivers...
> 
> Should we mark that driver in Kconfig as obviously broken then?

Well, it won't be obviously broken if I apply your patch... But if
that's the right step toward removal, then I could be OK with that.

> Let's wait for Wan ZongShun to reply first, it's possible that the
> entire w90x900 platform has come to the point where we are better off
> removing it than fixing ancient bugs.

Sounds good.

Brian

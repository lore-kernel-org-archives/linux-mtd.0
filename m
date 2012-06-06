Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScKTO-0000cz-Uo
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 17:56:47 +0000
Date: Wed, 6 Jun 2012 19:55:07 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: Re: flash bbt broken due to unitialized bitflip_threshold?
Message-ID: <20120606175507.GC17332@parrot.com>
References: <20120605220647.GV30400@pengutronix.de>
 <20120606125013.5897a02d@pixies.home.jungo.com>
 <1338989453.6875.49.camel@sauron.fi.intel.com>
 <20120606181529.291aa9a6@halley>
 <1338997575.6875.72.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1338997575.6875.72.camel@sauron.fi.intel.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mike Dunn <mikedunn@newsguy.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 06, 2012 at 04:46:15PM +0100, Artem Bityutskiy wrote:
> On Wed, 2012-06-06 at 18:15 +0300, Shmulik Ladkani wrote:
> > - By 'add_mtd_device'. Here it defaults to 'ecc_strength' if NOT
> >   previously set by the driver.
> 
> But this is wrong. If I use the old doc2000 driver, with ecc_strength =
> 2, and it works fine for me, and I am happy that UBI scrubs for a single
> bit-flip, why should my system become broken because someone decided
> that now UBI should start scrubbing on 2 bit-flips?
> 
> We should not change the defaults - if I do not set the threshold via
> sysfs of in the driver, it should be 1.
> 
> Unless I am completely confused, we should change this, CC -stable if
> needed, and ask dwmw2 to merge that.
> 

Hi Artem,

The "safest" bitflip_threshold value actually depends on the nand device you are using.
If I want to use today's 4-bit and 8-bit nand devices, a threshold of 1
will make my system unusable (because of constant scrubbing and block torturing).

The rationale behind Mike's patch is that it should be safe to delay block scrubbing
until the nand controller has reached its maximum correction capability; at this point,
any additional bitflip would produce uncorrectable errors, so scrubbing is necessary.
This is the recommended policy in nand datasheets when the device ecc requirement matches
the controller capability. In your doc2000 example, why would it break with a threshold of 2 ?

On the other hand, I agree that we should not force this kind of changes on existing systems.
Let us list use cases:

1. on legacy systems with 1-bit nand and strength = 1, default bitflip_threshold is 1
2. on legacy systems with 1-bit nand and strength > 1, default bitflip_threshold is 'strength'
3. on new systems   with 2+ bit nand and strength > 1, default bitflip_threshold is 'strength'

Case 1 is OK, no change.

Case 2 introduces an unwanted change.

Case 3 (which was not properly handled until Mike's patch) seems OK to me, it fits current datasheet
requirements and the driver still has the possibility to explicitly set bitflip_threshold on a
per-board basis (because it really depends on the nand device).

So rather than reverting to a default bitflip_threshold of 1 for everyone, I suggest we revert the
change on case 2 legacy systems like the doc2000 by explicitly setting bitflip_threshold to 1 in the driver.
What do you think ?

BR,
-- 
Ivan Djelic

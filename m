Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ScIma-00076k-Tw
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 16:08:29 +0000
Received: by werc12 with SMTP id c12so5351766wer.36
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2012 09:08:27 -0700 (PDT)
Date: Wed, 6 Jun 2012 19:08:08 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: artem.bityutskiy@linux.intel.com
Subject: Re: flash bbt broken due to unitialized bitflip_threshold?
Message-ID: <20120606190808.75c1a085@halley>
In-Reply-To: <1338997575.6875.72.camel@sauron.fi.intel.com>
References: <20120605220647.GV30400@pengutronix.de>
 <20120606125013.5897a02d@pixies.home.jungo.com>
 <1338989453.6875.49.camel@sauron.fi.intel.com>
 <20120606181529.291aa9a6@halley>
 <1338997575.6875.72.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Mike Dunn <mikedunn@newsguy.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, 06 Jun 2012 18:46:15 +0300 Artem Bityutskiy <artem.bityutskiy@linux.intel.com> wrote:
> On Wed, 2012-06-06 at 18:15 +0300, Shmulik Ladkani wrote:
> > - By 'add_mtd_device'. Here it defaults to 'ecc_strength' if NOT
> >   previously set by the driver.
> 
> But this is wrong. If I use the old doc2000 driver, with ecc_strength =
> 2, and it works fine for me, and I am happy that UBI scrubs for a single
> bit-flip, why should my system become broken because someone decided
> that now UBI should start scrubbing on 2 bit-flips?

As I remember, the motivation was to reduce unnecessary scrubbing for
devices exposing high rate of bitflips but having strong ECC to
compensate for.
For these users, the system was "broken" in their perspective, as it
performed too many scrubbing...

Anyway, I understand your point preserving the old behavior.
I thought you were aware of this change.

> We should not change the defaults - if I do not set the threshold via
> sysfs of in the driver, it should be 1.

Fair point. This is safer, backwords compatible.

But eventually, wouldn't we end up with all the drivers assigning
bitflip_threshold to ecc_strength?

> Unless I am completely confused, we should change this, CC -stable if
> needed, and ask dwmw2 to merge that.

No you're not confused.
If we'd like to preserve old behavior, the default assignment needs to
be changed.

BTW this is independent of the 'scan_bbt' bug spotted by Sascha.

Regards,
Shmulik

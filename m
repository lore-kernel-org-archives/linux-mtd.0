Message-ID: <1438024797.2313.11.camel@lynxeye.de>
Subject: Re: [Patch v3 2/5] mtd: nand: add NVIDIA Tegra NAND Flash
 controller driver
From: Lucas Stach <dev@lynxeye.de>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Thierry Reding
 <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob
 Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland
 <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Boris
 BREZILLON <boris.brezillon@free-electrons.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Stefan Agner <stefan@agner.ch>, Marcel
 Ziswiler <marcel@ziswiler.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org,  linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Date: Mon, 27 Jul 2015 21:19:57 +0200
In-Reply-To: <20150721212710.GN24125@google.com>
References: <1431282602-7137-1-git-send-email-dev@lynxeye.de>
 <1431282602-7137-3-git-send-email-dev@lynxeye.de>
 <20150721212710.GN24125@google.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag, den 21.07.2015, 14:27 -0700 schrieb Brian Norris:

[...]
> 
> > +		return 0;
> > +	}
> > +
> > +	if (value & DEC_STATUS_ERR_COUNT_MASK) {
> > +		value = (value & DEC_STATUS_ERR_COUNT_MASK) >>
> > +			DEC_STATUS_ERR_COUNT_SHIFT;
> 
> What does this ERR_COUNT represent? The total bitflips seen in this
> page? The max seen per ECC region? Or something else?
> 
> > +		mtd->ecc_stats.corrected += value;
> 
> I ask because this ^^^ should be accounting the total bitflips for the
> page, if possible...
> 
> > +		return value;
> 
> ...and this ^^^ should be returning the max bitflips seen in a single
> correction region (see the mtd_read() API). There is a subtle
> difference.
> 
I've checked this again and unfortunately the DEC_STATUS_ERR_COUNT seems
to be completely bogus. It is certainly only set when there are
bitflips, but it doesn't represent a valid value.

I have another register that seems to accurately reflect the maximum
number of bitflips in any of the 512b ECC blocks, so I'm able to return
the correct amount of bitflips to the upper level.
The downside is that the hardware already does the calculation of max
bitflips, so I'm unable to count bitflips correctly for the stats. All I
can do is to return a pessimistic value that assumes that all 512b
blocks had the returned number of bitflips. Could this be a problem?

Regards,
Lucas

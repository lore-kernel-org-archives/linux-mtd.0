Date: Mon, 27 Jul 2015 13:52:11 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Lucas Stach <dev@lynxeye.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Stefan Agner <stefan@agner.ch>,
 Marcel Ziswiler <marcel@ziswiler.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Patch v3 2/5] mtd: nand: add NVIDIA Tegra NAND Flash controller
 driver
Message-ID: <20150727205211.GR8876@google.com>
References: <1431282602-7137-1-git-send-email-dev@lynxeye.de>
 <1431282602-7137-3-git-send-email-dev@lynxeye.de>
 <20150721212710.GN24125@google.com>
 <1438024797.2313.11.camel@lynxeye.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438024797.2313.11.camel@lynxeye.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 27, 2015 at 09:19:57PM +0200, Lucas Stach wrote:
> Am Dienstag, den 21.07.2015, 14:27 -0700 schrieb Brian Norris:
> I've checked this again and unfortunately the DEC_STATUS_ERR_COUNT seems
> to be completely bogus. It is certainly only set when there are
> bitflips, but it doesn't represent a valid value.

:( HW sucks.

> I have another register that seems to accurately reflect the maximum
> number of bitflips in any of the 512b ECC blocks, so I'm able to return
> the correct amount of bitflips to the upper level.
> The downside is that the hardware already does the calculation of max
> bitflips, so I'm unable to count bitflips correctly for the stats. All I
> can do is to return a pessimistic value that assumes that all 512b
> blocks had the returned number of bitflips. Could this be a problem?

As things currently stand: no, I don't think so. The ecc_stats are
actually mostly just that -- statistics. Some pieces of the codebase use
the fact they increased as a sign, but they don't care about the actual
number. The max_bitflips calculation, however, is very important so that
MTD can determine whether we've reached the reliability threshold.

So I guess you have some flexibility in how to report this, but I think
two main options are sane:

 1. leave as-is; you can only guarantee that max_bitflips occurred in
 total, so only increment ecc_stats.corrected by max_bitflips

 2. change to

     ecc_stats.corrected += max_bitflips * chip->ecc.steps;

 This is the maximum that might have occured on this page read.

IOW, option 1 is optimistic and option 2 is pessimistic. Either way,
this probably deserves a comment in the code.

Regards,
Brian

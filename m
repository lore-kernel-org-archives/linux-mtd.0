Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ysc1T-0006gy-Q8
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 19:08:52 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 00/11] mtd: nand: add Broadcom NAND controller support
Date: Wed, 13 May 2015 21:08:16 +0200
Message-ID: <2064406.2qRO3C7BXX@wuerfel>
In-Reply-To: <20150513181447.GD11598@ld-irv-0074>
References: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
 <5553903B.9030605@gmail.com> <20150513181447.GD11598@ld-irv-0074>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Dan Ehrenberg <dehrenberg@chromium.org>,
 Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, Gregory Fong <gregory.0xf0@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 13 May 2015 11:14:47 Brian Norris wrote:
> On Wed, May 13, 2015 at 10:56:11AM -0700, Florian Fainelli wrote:
> > On 12/05/15 17:53, Brian Norris wrote:
> > > Hi,
> > > 
> > > This is the fourth (and final?) version of support for the Broadcom BCM7xxx
> > > Set-Top Box NAND controller. This controller has been used in a variety of
> > > Broadcom SoCs.
> > > 
> > > Tested to work on Cygnus, BCM7445, and BCM63138.
> > 
> > Applied patches 4, 9 and 10 to devicetree/next, the others should go via
> > your tree, right?
> 
> Yes. Not sure if I'll be reworking the others any more based on Arnd's
> comments, but at least the device tree stuff has stabilized, I expect.

You can always change it with a patch on top, but that's between you
and the drivers/mtd maintainer ;-)

	Arnd

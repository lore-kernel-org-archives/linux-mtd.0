Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsbBd-000520-Dv
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 18:15:18 +0000
Received: by pdbnk13 with SMTP id nk13so59083283pdb.0
 for <linux-mtd@lists.infradead.org>; Wed, 13 May 2015 11:14:56 -0700 (PDT)
Date: Wed, 13 May 2015 11:14:47 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 00/11] mtd: nand: add Broadcom NAND controller support
Message-ID: <20150513181447.GD11598@ld-irv-0074>
References: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
 <5553903B.9030605@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5553903B.9030605@gmail.com>
Cc: devicetree@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>,
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

On Wed, May 13, 2015 at 10:56:11AM -0700, Florian Fainelli wrote:
> On 12/05/15 17:53, Brian Norris wrote:
> > Hi,
> > 
> > This is the fourth (and final?) version of support for the Broadcom BCM7xxx
> > Set-Top Box NAND controller. This controller has been used in a variety of
> > Broadcom SoCs.
> > 
> > Tested to work on Cygnus, BCM7445, and BCM63138.
> 
> Applied patches 4, 9 and 10 to devicetree/next, the others should go via
> your tree, right?

Yes. Not sure if I'll be reworking the others any more based on Arnd's
comments, but at least the device tree stuff has stabilized, I expect.

Thanks,
Brian

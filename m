Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1St70X-0004xR-Oh
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2012 01:00:30 +0000
From: Marek Vasut <marex@denx.de>
To: Rob Herring <rob.herring@calxeda.com>
Subject: Re: [PATCH 1/3] mtd: m25p80: add support for Spansion s25sl064p chip
Date: Mon, 23 Jul 2012 03:00:14 +0200
References: <1341555027-17462-1-git-send-email-marex@denx.de>
 <1342628031.9105.6.camel@brekeke> <500C9393.9060804@calxeda.com>
In-Reply-To: <500C9393.9060804@calxeda.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201207230300.14372.marex@denx.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <david.woodhouse@intel.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Rob Herring,

> On 07/18/2012 11:13 AM, Artem Bityutskiy wrote:
> > On Wed, 2012-07-18 at 18:08 +0200, Marek Vasut wrote:
> >> Dear Artem Bityutskiy,
> >> 
> >>> On Fri, 2012-07-06 at 08:10 +0200, Marek Vasut wrote:
> >>>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>>> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> >>>> Cc: David Woodhouse <david.woodhouse@intel.com>
> >>> 
> >>> Pushed 1/3 and 2/3 to l2-mtd.git, thanks!
> >> 
> >> Thanks, Artem. Could you please suggest where to document the property
> >> added in 3/3 please?
> > 
> > Rob Herring responded to me last time, let's try to ask him. Rob, the
> > question is here:
> > 
> > http://lists.infradead.org/pipermail/linux-mtd/2012-July/042752.html
> > 
> > "NOTE: I'm not sure where to document this property, as m25p80 is
> > 
> >       a simple DT device. Any hints please?"
> 
> Looks like "spansion,m25p80" needs to be documented under
> Documentation/devicetree/bindings/mtd, and then this new property
> documented with it. The only in tree user right now is here:
> 
> arch/powerpc/boot/dts/p2020rdb-pc.dtsi

Roger that, Rob! Will submit a new version of the patch ASAP.

Thanks!

Best regards,
Marek Vasut

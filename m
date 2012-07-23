Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1St83a-0006Km-IB
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2012 02:07:35 +0000
From: Marek Vasut <marex@denx.de>
To: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH V2] mtd: m25p80: Make fast read configurable via DT
Date: Mon, 23 Jul 2012 04:07:18 +0200
References: <1343006437-11669-1-git-send-email-marex@denx.de>
 <500CB097.4000507@gmail.com>
In-Reply-To: <500CB097.4000507@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201207230407.18747.marex@denx.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "devicetree-discuss@lists.ozlabs.org"
 <devicetree-discuss@lists.ozlabs.org>, linux-mtd@lists.infradead.org,
 David Woodhouse <david.woodhouse@intel.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Rob Herring,

> +devicetree-discuss
> 
> On 07/22/2012 08:20 PM, Marek Vasut wrote:
> > Add DT property "m25p,fast-read" that signalises the particular
> > chip supports "fast read" opcode.
> > 
> > NOTE: I'm not sure where to document this property, as m25p80 is
> > 
> >       a simple DT device. Any hints please?
> > 
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> > Cc: David Woodhouse <david.woodhouse@intel.com>
> > ---
> > 
> >  Documentation/devicetree/bindings/mtd/m25p80.txt |   27
> >  ++++++++++++++++++ drivers/mtd/devices/m25p80.c                     |  
> >  32 +++++++++++++--------- 2 files changed, 46 insertions(+), 13
> >  deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/m25p80.txt
> > 
> > V2: Add documentation for the DT property. (Thanks Rob Herring for
> > helping!)
> > 
> >     Supersedes [PATCH 3/3] [RFC] mtd: m25p80: Make fast read configurable
> >     via DT
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt
> > b/Documentation/devicetree/bindings/mtd/m25p80.txt new file mode 100644
> > index 0000000..e05d9b8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
> > @@ -0,0 +1,27 @@
> > +* MTD SPI driver for ST M25Pxx (and similar) serial flash chips
> > +
> > +Required properties:
> > +- #address-cells, #size-cells : Must be present if the device has
> > sub-nodes +  representing partitions.
> > +- compatible : Should be the name of the chip, see the "m25p_ids" table
> > in +               drivers/mtd/devices/m25p80.c
> 
> Two things wrong with this:

Damn, I just sent a V3 a minute ago. Please ignore that V3 then, since V4 will 
come of course, sorry about the noise. Let's discuss this properly.

> - Bindings are not Linux specific, so the docs should not be based on Linux.

Correct. Can you please advise how to formulate the "compatible" property then?

> - This doesn't follow the existing user which is "spansion,m25p80"

It doesn't, but the driver does support many other chips as well. I wasn't quite 
sure how to go about that either. Any help would be appreciated, I gotta admit 
I'm still a bit lost in all the devicetree stuff.

> Rob
[...]

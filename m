Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YZ2MJ-0001Y9-Hb
 for linux-mtd@lists.infradead.org; Fri, 20 Mar 2015 19:13:29 +0000
Received: by pdbop1 with SMTP id op1so116776844pdb.2
 for <linux-mtd@lists.infradead.org>; Fri, 20 Mar 2015 12:13:02 -0700 (PDT)
Date: Fri, 20 Mar 2015 12:12:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec"
 binding
Message-ID: <20150320191258.GW32500@ld-irv-0074>
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
 <20150312105824.GD30145@leverpostej>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150312105824.GD30145@leverpostej>
Cc: Marek Vasut <marex@denx.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 12, 2015 at 10:58:24AM +0000, Mark Rutland wrote:
> On Wed, Mar 11, 2015 at 09:57:25PM +0000, Brian Norris wrote:
> > Almost all flash that are "compatible" with m25p80 support the JEDEC
> > READ ID opcode (0x95), and in fact, that is often the only thing that is
> > used to differentiate them. Let's add a compatible string that
> > represents this lowest common denominator of compatibility.
> > 
> > Device trees can still specify manufacturer/device names in addition,
> > but (until some reason is found to differentiate between them through
> > device tree) software will likely want to bind just against the generic
> > name, and avoid unnecessarily growing its device ID binding tables.
> > 
> > This is related to the work of commit a5b7616c55e1 ("mtd:
> > m25p80,spi-nor: Fix module aliases for m25p80"), which showed that
> > maintaining these device tables as stable device-tree/modalias binding
> > tables is not a worthwhile burden for mostly-comptatible flash.
> > 
> > At the same time, let's update the binding doc to point to the
> > m25p_ids[] ID list instead of spi_nor_ids[]. The former can be used for
> > device tree bindings, but the latter cannot. In the future, we should
> > pare down the m25p_ids[] list to only those IDs which are actually used
> > in device trees.
> 
> We really should not be referring to C files for the binding. The right
> fix is to define the list in the binding document.

Yes, and that is an eventual goal I suppose, but the current list is
excessive and is most likely not currently relied on by any one. So I
don't just want to C&P the entire list into this binding immediately.

I guess my plan looks like this:

1. add "nor-jedec" binding, to provide lowest common denominator binding
(this series)

2. stop adding to the m25p_ids[] table unless necessary (enabled by this
series)

3. gauge whether we can remove certain entries from m25p_ids[] (e.g., if
they were only used in platform_data, not DT; or if they were very
recently added just to synchronize with spi-nor.c)

4. once m25p_ids[] contains a reasonable set, maintain it in the binding
doc, like we really should

I don't feel like step 4 is ready yet.

Is that a reasonable plan in your eyes?

Brian

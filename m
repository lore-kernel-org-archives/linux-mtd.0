Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZxO5o-0000ny-Sn
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2015 23:49:21 +0000
Received: by pacej9 with SMTP id ej9so7363568pac.2
 for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2015 15:48:59 -0800 (PST)
Date: Fri, 13 Nov 2015 15:48:57 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 linux-mtd@lists.infradead.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: spi: OF module autoloading is still broken (was: Re: m25p80:
 Commit "allow arbitrary OF matching for "jedec,spi-nor"" breaks module
 autoloading)
Message-ID: <20151113234857.GK8456@google.com>
References: <56104E88.3040807@gmail.com> <20151112185926.GC8456@google.com>
 <20151113194031.GI8456@google.com>
 <20151113221228.GT12392@sirena.org.uk>
 <20151113225113.GJ8456@google.com>
 <20151113231410.GV12392@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151113231410.GV12392@sirena.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Nov 13, 2015 at 11:14:10PM +0000, Mark Brown wrote:
> On Fri, Nov 13, 2015 at 02:51:13PM -0800, Brian Norris wrote:
> 
> > General problem:
> > ================
> 
> > The SPI core doesn't use the OF compatible property for generating
> > uevent/modalias, and therefore can't autoload modules based on the full
> > compatible property of a device. It *only* can use the 'modalias', which
> > is a castrated version of the compatible property -- it only includes
> > part of the 1st entry in 'compatible'.
> 
> > This forces SPI device drivers to use spi_device_id tables even when
> > they might be better suited for of_match_tables.
> 
> Well, I don't actually see this as that bad a thing - it's good practice
> to include the Linux ID tables even if you also support DT since not all
> the world is DT.

I suppose so, but that's still not the whole story.

(I believe I avoided this in the first place for mostly-aesthetic
reasons; technically this allows people to put garbage in their DT, like
"garbage,spi-nor". It's unclear whether "garbage" becomes part of the
mythical DT ABI [1].)

> > Specifics for m25p80:
> > =====================
> 
> > We support many flash devices and have traditionally been doing so by
> > simply adding more entries to the spi_device_id table. Recently, we have
> > tried to get away from adding new entries and aliases for every single
> > variation by instead supporting a common OF match: "jedec,spi-nor". So
> > we might expect to see nodes like this:
> 
> > 	flash@xxx {
> > 		compatible = "vendor,shiny-new-device", "jedec,spi-nor";
> > 		...
> > 	};
> 
> > We may or may not add "shiny-new-device" to the spi_device_id array. But
> > "jedec,spi-nor" should be sufficient to load the driver and check if the
> > READ ID string matches any known flash. If "shiny-new-device" isn't in
> > the spi_device_id array, then we don't get module autoloading.
> 
> OK, so you're trying to do dynamic enumeration?  Then you don't want
> specific things in any of the ID tables since you'll match it yourself
> at runtime (which is obviously good).

Well, we do have to support existing cases (e.g., existing device trees
without "jedec,spi-nor") so we have to keep some around. But otherwise,
mostly yes.

> > There's also the case of omitting "vendor,shiny-new-device" entirely,
> > which is probably a little more dangerous, but still legal (and also
> > won't autoload modules):
> 
> > 	flash@xxx {
> > 		compatible = "jedec,spi-nor";
> > 		...
> > 	};
> 
> My immediate thought is that I'd expect to see spi-nor and (based on a
> quick scan of the m25p80 driver) nor-jedec to appear in the spi_device_id
> table since regardless of what happens with Javier's patch we want the
> autoprobing mechanism to work for board file based platforms too
> (there's a bunch of architectures that still use them).  That'd also
> have the side effect of solving your immediate problem I think?

No "nor-jedec" -- that was an intermediate name that got replaced
mid-release-cycle due to some late DT review comments.

But yes, I suppose adding "spi-nor" back to the spi_device_id table
fixes *one* of the immediate problems (i.e., 'compatible =
"jedec,spi-nor"'). That would cover Heiner's report. But it doesn't
solve:

  compatible = "vendor,shiny-new-device", "jedec,spi-nor"

I believe that the latter is sometimes the Right Way (TM) to do things
for device tree, so you have a fallback if auto-probing "jedec,spi-nor"
ever doesn't suffice.

(This came up in Heiner's original post: "In case of m25p80 this means
that "jedec,spi-nor" has to be the first "compatible" value. This
constraint might be too strict ..")

> [Snip example with three different prefixes for m25p80 in compatible
> strings]
> 
> > All three are supported by SPI's current modalias code, and so are part
> > of the ABI. Thus, m25p80.c will always contain both a spi_device_id
> > table and an of_match_table. But I think Javier's patch would break
> > these three cases.
> 
> Right, IIRC I think that sort of thing was what I was looking for in
> documentation for his patch.  Now you mention it I'm not sure we can do
> wildcarding with DT which is a bit unfortunate for cases like this.

Yeah, I expect wildcards are a no-go.

> Hrm.  Not sure and it's getting late on a Friday night...

:)

I suspect we'll have to fully support both spi_device_id tables (fully
supported already; if nothing else, to keep wildcard matching) and
of_match_tables (not fully supported for module loading), and in some
cases, the two will have to stay partially in sync.

Brian

[1] "Device Tree as a stable ABI: a fairy tale?"
    http://free-electrons.com/pub/conferences/2015/elc/petazzoni-dt-as-stable-abi-fairy-tale/petazzoni-dt-as-stable-abi-fairy-tale.pdf

Date: Mon, 4 Jan 2016 13:25:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 linux-mtd@lists.infradead.org,
 Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2] ARM: shmobile: alt: Add QSPI device to DT
Message-ID: <20160104212515.GA39910@google.com>
References: <1451903819-19218-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdVFC1TEeTT5Gas8jz0Tvn2HB3EHBo7gp6pthsnOo6x5UQ@mail.gmail.com>
 <20160104203136.GB12748@verge.net.au>
 <CAMuHMdWbFHLKgkn9ShJkyyimpwJAbbL5TjqEp1E9GBteVKQmKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWbFHLKgkn9ShJkyyimpwJAbbL5TjqEp1E9GBteVKQmKg@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 04, 2016 at 09:42:59PM +0100, Geert Uytterhoeven wrote:
> On Mon, Jan 4, 2016 at 9:31 PM, Simon Horman <horms@verge.net.au> wrote:
> > Should we document "spansion,s25fl512s" for the benefit of checkpatch.pl?
> 
> Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt used to point to
> drivers/mtd/devices/m25p80.c for the list of supported chips.
> 
> That seems to have been changed lately. Now jedec,spi-nor.txt includes the
> list, but lacks the manufacturers' names, so checkpatch.pl is still not happpy.
> 
> Brian: Shouldn't the manufacturers's names be added?

We've had some of this discussion recently:

http://lkml.kernel.org/g/20151118194340.GF140057@google.com

I don't think we can reasonably determine a good list of complete
strings, due to historical failures (IMO) in the SPI subsystem. We could
add a separate list of possible manufacturers, so people can do the MxN
pairing themselves.

checkpatch.pl has enough false positives that its author doesn't care to
fix that I'm not personally worried about yet another class of them. But
if you have good reasons and good patches for the documentation, I'm all
ears.

Regards,
Brian

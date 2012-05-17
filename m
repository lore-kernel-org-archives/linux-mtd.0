Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUwuk-0001KI-MY
 for linux-mtd@lists.infradead.org; Thu, 17 May 2012 09:22:31 +0000
Received: by wibhm14 with SMTP id hm14so5219467wib.0
 for <linux-mtd@lists.infradead.org>; Thu, 17 May 2012 02:22:28 -0700 (PDT)
Date: Thu, 17 May 2012 12:22:24 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: Regarding latest EUCLEAN/bitflip_threshold patchset
Message-ID: <20120517122224.061a1084@pixies.home.jungo.com>
In-Reply-To: <4FB3ED51.60706@newsguy.com>
References: <20120509132613.40db5533@pixies.home.jungo.com>
 <1336737075.2625.52.camel@sauron.fi.intel.com>
 <4FAEADF1.50308@newsguy.com> <20120512231350.347c16e9@halley>
 <CAN8TOE8yodhNvGF0ZafL7Jh3jb7B4KarWqk3iLUrrf4P2KTrrA@mail.gmail.com>
 <4FB3ED51.60706@newsguy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian, Mike, thanks,

On Wed, 16 May 2012 11:09:21 -0700 Mike Dunn <mikedunn@newsguy.com> wrote:
> On 05/15/2012 11:49 PM, Brian Norris wrote:
> > Hmm, well 041e4575 was designed without much of a window into how
> > others really needed it, as I didn't know of others who had the same
> > features. My hardware has its own threshold features that can be used
> > to mask bitflips; it has ECC that covers OOB at the same time as the
> > page data; when reading OOB only, it actually reads the page data as
> > well, in order to perform ECC properly. So when I report bitflips from
> > read_oob, I'm reporting the bitflips for the entire page+OOB sector.
> > But due to my hardware-based threshold, this only is reported for a
> > high number of bitflips.
> 
> 
> Ha!  This complicates the issue even more, since reading the whole page *will*
> give you useful information on block wear.
> 
> Based on my (admittedly liimited) knowledge, my impression is that we should
> just not bother with EUCLEAN for oob-only reads.  Reading the whole page for
> oob-only ops is a special case, and using a separate ECC scheme intended for
> oob-only does not provide useful bitflip data.

So leave-as-is seems most reasonable, given that:
- oob-only reads are not yet accounted vis-a-vis eraseblock health
- in-tree drivers' ECC doesn't cover the OOB (they don't increment
  ecc_stats on a chip->ecc.read_oob call). If they do, a supporting
  framework might be implemented
- Brian's out-of-tree driver isn't affected ;)

Regards,
Shmulik

Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1STIhY-0003dd-Bb
 for linux-mtd@lists.infradead.org; Sat, 12 May 2012 20:14:05 +0000
Received: by wgbds1 with SMTP id ds1so2658506wgb.18
 for <linux-mtd@lists.infradead.org>; Sat, 12 May 2012 13:14:02 -0700 (PDT)
Date: Sat, 12 May 2012 23:13:50 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: Regarding latest EUCLEAN/bitflip_threshold patchset
Message-ID: <20120512231350.347c16e9@halley>
In-Reply-To: <4FAEADF1.50308@newsguy.com>
References: <20120509132613.40db5533@pixies.home.jungo.com>
 <1336737075.2625.52.camel@sauron.fi.intel.com>
 <4FAEADF1.50308@newsguy.com>
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

Hi,

On Sat, 12 May 2012 11:37:37 -0700 Mike Dunn <mikedunn@newsguy.com> wrote:
> On 05/11/2012 04:51 AM, Artem Bityutskiy wrote:
> > On Wed, 2012-05-09 at 13:26 +0300, Shmulik Ladkani wrote:
> >> Hi Mike,
> >>
> >> I noticed 'nand_do_read_oob' explicitly tests 'mtd->ecc_stats.corrected'
> >> and returns EUCLEAN - as it was not ported to use the new
> >> 'bitflip_threshold'.
> > 
> > Good point. Mike did you miss this function?
> 
> No, I deliberately left it as-is.  Maybe a litle lazy or sloppy on my part, but
> ignoring it is of no consequence (see below).
> 
> Shmulik, your posts still don't get to my inbox.  Still wondering why.  Anyway,
> pasting from the archive...

No idea why this happens, others seem to get my posts...

> > From nand_base.c:
> >
> > 	if (mtd->ecc_stats.failed - stats.failed)
> > 		return -EBADMSG;
> >
> > 	return  mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
> >
> > - May drivers increment mtd->ecc_stats.{corrected,failed} during their
> >   ecc.read_oob() call?
> 
> Currently no nand drivers increment stats.corrected for oob-only reads.  Since
> nand_do_read_oob() does not read page data, stats never increment and -EUCLEAN
> is never returned.  To avoid complicating the issue, I ignored the case of
> reading oob-only.
> 
> > - If so, can we (should we?) report EUCLEAN according to the
> >   bitflip_threshold in this case?
> 
> I guess it depends on how widespread is the desire or capability of performing
> ecc on oob-only reads.  The new diskonchip devices (docg3, docg4) are capable of
> performing ecc on oob-only data.  These can do one bit corrections over 15 (of
> the 16 total) oob bytes using the hamming algorithm (though neither driver
> supports it currently).  But since in this case only one bitflip can be
> corrected, it will always be below bitflip_threshold.  Then there's the question
> of how do you interpret uncorrectible bitflips vis-a-vis eraseblock health when
> using a weaker ecc algorithm for oob-only.

I see.
So the current bitflip_threshold scheme is probably not applicable to
'nand_do_read_oob' - because the strength over the OOB would probably
differ from the page's ECC strength.

> These questions are currently all theoretical.  I think the threshold test
> should be removed, and replaced with 'return 0', at least for now.

Well, I was also surprised to see that 'nand_do_read_oob' may return
EUCLEAN or EBADMSG at all.

Digging further, I found out it was a relatively recent addition:
[041e4575 mtd: nand: handle ECC errors in OOB] by Brian Norris.

Brian, care to elaborate regarding 041e4575, and comment how do you
think it should be ported to the new bitflip_threshold mechanism, if at
all?

Regards,
Shmulik

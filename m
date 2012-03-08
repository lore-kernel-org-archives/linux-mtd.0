Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5b2a-0001pw-6r
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2012 10:57:50 +0000
Message-ID: <1331204420.7257.3.camel@sauron.fi.intel.com>
Subject: Re: ubi: suspicious calculation in 'ubi_wl_get_peb'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Thu, 08 Mar 2012 13:00:20 +0200
In-Reply-To: <20120307220803.045816fc@halley>
References: <20120217153828.71eba4e4@pixies.home.jungo.com>
 <1331140808.3463.28.camel@sauron.fi.intel.com>
 <20120307220803.045816fc@halley>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <rw@linutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2012-03-07 at 22:08 +0200, Shmulik Ladkani wrote:
> On Wed, 07 Mar 2012 19:20:08 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Fri, 2012-02-17 at 15:38 +0200, Shmulik Ladkani wrote:
> > > -			e = find_wl_entry(&ubi->free, medium_ec);
> > > +			e = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF/2)
> > > 
> > > Did I get something wrong?
> > 
> > Yeah, I think you are right. Now I am completely convinced we should
> > remove this "short/long-term" stuff because this did even work
> > correctly :-)
> 
> I would not jump into this conclusion just yet :-)
> 
> Note the bug affects UBI_UNKNOWN requests, which are supposed to be
> general-purpose 'ubi_wl_get_peb' requests... troubling...
> 
> UBI_LONGTERM/UBI_SHORTTERM seem to work just fine.

UBI_UNKNOWN is used most of the time. And long/short are kind of
optimizations. UBIFS uses them but these are more like guesses and UBIFS
my tell the LEB is short term but it may easily be long term. And this
is not much of an optimization.

-- 
Best Regards,
Artem Bityutskiy

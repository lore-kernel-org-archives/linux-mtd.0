Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5N9j-000875-NI
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 20:08:16 +0000
Received: by wiwc10 with SMTP id c10so3964726wiw.36
 for <linux-mtd@lists.infradead.org>; Wed, 07 Mar 2012 12:08:13 -0800 (PST)
Date: Wed, 7 Mar 2012 22:08:03 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: ubi: suspicious calculation in 'ubi_wl_get_peb'
Message-ID: <20120307220803.045816fc@halley>
In-Reply-To: <1331140808.3463.28.camel@sauron.fi.intel.com>
References: <20120217153828.71eba4e4@pixies.home.jungo.com>
 <1331140808.3463.28.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <rw@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 07 Mar 2012 19:20:08 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Fri, 2012-02-17 at 15:38 +0200, Shmulik Ladkani wrote:
> > -			e = find_wl_entry(&ubi->free, medium_ec);
> > +			e = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF/2)
> > 
> > Did I get something wrong?
> 
> Yeah, I think you are right. Now I am completely convinced we should
> remove this "short/long-term" stuff because this did even work
> correctly :-)

I would not jump into this conclusion just yet :-)

Note the bug affects UBI_UNKNOWN requests, which are supposed to be
general-purpose 'ubi_wl_get_peb' requests... troubling...

UBI_LONGTERM/UBI_SHORTTERM seem to work just fine.

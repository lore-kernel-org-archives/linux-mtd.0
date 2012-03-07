Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5Kl2-0008Tj-T1
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 17:34:37 +0000
Message-ID: <1331141492.3463.35.camel@sauron.fi.intel.com>
Subject: Re: ubi: suspicious calculation in 'ubi_wl_get_peb'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Wed, 07 Mar 2012 19:31:32 +0200
In-Reply-To: <1331140808.3463.28.camel@sauron.fi.intel.com>
References: <20120217153828.71eba4e4@pixies.home.jungo.com>
 <1331140808.3463.28.camel@sauron.fi.intel.com>
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

On Wed, 2012-03-07 at 19:20 +0200, Artem Bityutskiy wrote:
> On Fri, 2012-02-17 at 15:38 +0200, Shmulik Ladkani wrote:
> > -			e = find_wl_entry(&ubi->free, medium_ec);
> > +			e = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF/2)
> > 
> > Did I get something wrong?
> 
> Yeah, I think you are right. Now I am completely convinced we should
> remove this "short/long-term" stuff because this did even work
> correctly :-)

Sorry, s/did even/did NOT even/

-- 
Best Regards,
Artem Bityutskiy

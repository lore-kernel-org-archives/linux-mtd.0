Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sm2IF-0005St-BU
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2012 12:33:23 +0000
Received: by mail-bk0-f49.google.com with SMTP id ji2so1012388bkc.36
 for <linux-mtd@lists.infradead.org>; Tue, 03 Jul 2012 05:33:22 -0700 (PDT)
Date: Tue, 3 Jul 2012 15:33:14 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [Q] ubi->beb_rsvd_pebs calculations
Message-ID: <20120703153314.15948c90@pixies.home.jungo.com>
In-Reply-To: <1341312827.2979.53.camel@sauron.fi.intel.com>
References: <20120701195230.0f141288@pixies.home.jungo.com>
 <1341312827.2979.53.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Tue, 03 Jul 2012 13:53:47 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sun, 2012-07-01 at 19:52 +0300, Shmulik Ladkani wrote:
> > What do you say?
> > Would you consider removing this "beb_rsvd_pebs reclaim" block?
> 
> Yes, sounds like you are right.

Good. This mysterious "reclaim" in 'erase_worker' actually interferes
with my new scheme.

BTW removing it from 'erase_worker' means that every place in the code
(present and future) that produces available PEBs must always attempt
refilling 'beb_rsvd_pebs'.
Currently this is already done in volume remove and volume shrink.

> Also, with your new proposals all the
> "reclaim" blocks should go away at the end, right?

Well, yes, my intention is to remove the "beb_rsvd_pebs reclaim" done in
'erase_worker'.
However, the attempt refilling the 'beb_rsvd_pebs' after volume
remove/shrink will still exist.

I guess the picture is a bit vague ;)
Better the code talk.
I hope to submit the patch series in few days.

BTW dealing with all possible cases and corner cases is remarkebly
delicate. Prepare yourself for a "fun" review ;)

Regards,
Shmulik

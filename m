Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUhoY-00051y-NX
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 19:24:11 +0000
Date: Mon, 31 Mar 2014 21:23:39 +0200
From: Gerhard Sittig <gsi@denx.de>
To: David Mosberger-Tang <dmosberger@gmail.com>
Subject: Re: [PATCH v1 3/3] mtd: nand: introduce a READMODE command
Message-ID: <20140331192339.GK2775@book.gsilab.sittig.org>
References: <1396100184-7110-1-git-send-email-gsi@denx.de>
 <1396100184-7110-4-git-send-email-gsi@denx.de>
 <CACwUX0P+BMgL7ms8oeCKW=DFyvjLK3eGR8zWfRhw-0LpTGwjDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACwUX0P+BMgL7ms8oeCKW=DFyvjLK3eGR8zWfRhw-0LpTGwjDA@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-03-31 at 11:50 -0600, David Mosberger-Tang wrote:
> 
> Would it be cleaner to define READMODE like this:
> 
> #define NAND_CMD_READMODE      (0x100 | NAND_CMD_READ0)

See 'git show 0be718e5525a' (the comments suggest that I took the
DEPLETE1 command as an inspiration), the code was not constructed
there either.  But I'm open to suggestions, let's see what others
think or whether there already is an established preference for
such aggregates.


> I'm updating my patch to take advantage of READMODE.

Can you identify other stuff that could get built in steps, to
chop the big change into pieces that are a little easier to
review and verify, to help getting your on-die-ECC introduction
accepted?

Will the better mapping to the current flow of command emission,
data fetching, and optional ECC handling become "a byproduct" of
constructing the total support from incremental building blocks?
Like starting with the "supported?" check, adding an "enabled?"
check, adding read/write support with mere boolean error
conditions, then add the re-read and bitflip count dance?

Splitting complex changes into logical groups helps in later
maintenance, too (bisection to identify and isolate problems,
extending or fixing clearly identified spots of restricted
functionality).


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de

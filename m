Received: from tuxdriver-1-pt.tunnel.tserv13.ash1.ipv6.he.net
 ([2001:470:7:9c9::2] helo=smtp.tuxdriver.com)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBQXw-0004Cu-KU
 for linux-mtd@lists.infradead.org; Tue, 11 Sep 2012 13:30:34 +0000
Date: Tue, 11 Sep 2012 09:21:17 -0400
From: "John W. Linville" <linville@tuxdriver.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH V2] mtd: basic (read only) driver for BCMA serial flash
Message-ID: <20120911132117.GA7015@tuxdriver.com>
References: <1346699237-414-1-git-send-email-zajec5@gmail.com>
 <1347358840.21359.67.camel@sauron.fi.intel.com>
 <CACna6ryroY=Xbv7+VsRfBYdhRd9P6uz935b9scQqCmTjneM7sQ@mail.gmail.com>
 <1347361186.26206.5.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1347361186.26206.5.camel@sauron.fi.intel.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 11, 2012 at 01:59:46PM +0300, Artem Bityutskiy wrote:
> On Tue, 2012-09-11 at 12:35 +0200, Rafał Miłecki wrote:
> > 2012/9/11 Artem Bityutskiy <dedekind1@gmail.com>:
> > > On Mon, 2012-09-03 at 21:07 +0200, Rafał Miłecki wrote:
> > >> This registers MTD driver for serial flash platform device. Right now it
> > >> supports reading only, writing still has to be implemented.
> > >> At this point it's marked as BROKEN, because it requires code present in
> > >> net tree that wasn't mainlined yet.
> > >>
> > >> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> > >
> > > What are exactly the changes it depends on? URL? Are they staged for
> > > 3.7?
> > 
> > http://git.kernel.org/?p=linux/kernel/git/linville/wireless-testing.git;a=commitdiff;h=23cb3b2121323443834296a8ecb582b8aeb78d75
> > http://git.kernel.org/?p=linux/kernel/git/linville/wireless-testing.git;a=commitdiff;h=d57ef3a6a2eeb88df47e892c66692e3f59722ffe
> > 
> > (Yes, there are queued to be pulled during 3.7 merge window)
> 
> CCing John. I am not 100% sure how the net drivers are handled, but if
> John does not rebase and just sends a pull request to David Miller, who
> also does not rebase, then we could pull John's tree into the MTD tree.

OK, so...never, _ever_ pull from wireless-testing into another tree.
The wireless-testing tree is a community sandbox, and sometimes gets
messy and sometimes gets rebased.

OTOH, those exact commits are already in wireless-next (and in
net-next).  That tree will not be rebased, so you can pull from it
if you so choose.  But, it would generally be better if you only pull
from head commits that are already in net-next "just in case". :-)

Let me know if I can be helpful...

John
-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.

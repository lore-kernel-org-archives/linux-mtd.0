Received: from krynn.se.axis.com ([193.13.178.10])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cwedp-0002OM-NA
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2005 05:55:33 -0500
Date: Thu, 3 Feb 2005 11:55:05 +0100
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20050203105505.GB20345@axis.com>
References: <20050202110715.GH27015@axis.com> <20050203095842.GA20345@axis.com>
	<1107426233.12383.46.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1107426233.12383.46.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Device ID collision in amd_flash.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 03, 2005 at 10:23:52AM +0000, David Woodhouse wrote:
> On Thu, 2005-02-03 at 10:58 +0100, Jonas Holmberg wrote:
> > Silly me, who cares about obsolete drivers...
> > Let me rephrase that question: Any objections before I commit on 
> > friday (tomorrow)?
> 
> Sorry, go ahead.

Thanks.

> 
> > I still would like to know how bugfixes finds their way into Linux 
> > 2.4. As I understand, the main trunk in CVS is for 2.6 and I can't 
> > find any 2.4-branch...
> 
> In general, they don't get in to 2.4. Nobody cares about 2.4 any more.
> If it _works_ for you, all well and good. But if it hasn't already been
> working for you for a year, then why are you trying to make it work now?

I just noticed the bug. It only reveals itself when you try to erase 
the first sector on that particular chip, and we never had to do that, 
until now.

> Use 2.6.

Will do, but need bugfix for old stuff too.

It would be quite nice with a 2.4-branch that we can commit bugfixes 
to that could be sent to Marcelo regularly.  But if I'm the first to 
ask, we probably don't need it.

> 
> Feel free to send this change to Marcelo if you really care.

OK.

/Jonas

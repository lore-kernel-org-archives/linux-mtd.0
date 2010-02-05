Subject: Re: [PATCH] mxc-nand: no need to check for validity of platform
	drive data
From: Artem Bityutskiy <Artem.Bityutskiy@Nokia.com>
To: ext Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20100205134712.GA2774@pengutronix.de>
References: <1263218735-17244-1-git-send-email-u.kleine-koenig@pengutronix.de>
	<1263716754.8276.132.camel@localhost.localdomain>
	<20100205134712.GA2774@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 05 Feb 2010 15:55:31 +0200
Message-ID: <1265378131.7343.170.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vladimir Barinov <vova.barinov@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: Artem.Bityutskiy@Nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, 2010-02-05 at 14:47 +0100, ext Uwe Kleine-König wrote:
> Hello Artem,
> 
> On Sun, Jan 17, 2010 at 10:25:54AM +0200, Artem Bityutskiy wrote:
> > On Mon, 2010-01-11 at 15:05 +0100, Uwe Kleine-König wrote:
> > > The probe function calls platform_set_drvdata with a valid pointer when
> > > the probe is successful.  As mxcnd_suspend and mxcnd_resume are only
> > > called on bound devices, platform_get_drvdata always returns non-NULL.
> > > 
> > > This fix isn't critical as the pointer is always valid so it doesn't
> > > matter if the compiler generated code for it or not.
> > 
> > I've put these patches to my l2-mtd-2.6.git/master
> Up to now this patch didn't hit next.  Maybe you want to ask Steven
> Rothwell to merge your tree, too?

This is up to dwmw2, who is the MTD maintainer. All I do is I am helping
dwmw2 by providing him a git tree with all MTD patches from the mailing
list. So he does not have to go through whole mailing list. I put stuff
I reviewed to "master", and stuff I did/could not review to "dunno"

Hence, my tree is "level 2".

To get into the "next" tree, you should contact dwmw2.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

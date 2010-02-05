Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NdOWn-0001w7-Sj
	for linux-mtd@lists.infradead.org; Fri, 05 Feb 2010 13:47:22 +0000
Date: Fri, 5 Feb 2010 14:47:12 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] mxc-nand: no need to check for validity of platform
	drive data
Message-ID: <20100205134712.GA2774@pengutronix.de>
References: <1263218735-17244-1-git-send-email-u.kleine-koenig@pengutronix.de>
	<1263716754.8276.132.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1263716754.8276.132.camel@localhost.localdomain>
Cc: Vladimir Barinov <vova.barinov@gmail.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem,

On Sun, Jan 17, 2010 at 10:25:54AM +0200, Artem Bityutskiy wrote:
> On Mon, 2010-01-11 at 15:05 +0100, Uwe Kleine-König wrote:
> > The probe function calls platform_set_drvdata with a valid pointer when
> > the probe is successful.  As mxcnd_suspend and mxcnd_resume are only
> > called on bound devices, platform_get_drvdata always returns non-NULL.
> > 
> > This fix isn't critical as the pointer is always valid so it doesn't
> > matter if the compiler generated code for it or not.
> 
> I've put these patches to my l2-mtd-2.6.git/master
Up to now this patch didn't hit next.  Maybe you want to ask Steven
Rothwell to merge your tree, too?

Best regards
Uwe

-- 
Pengutronix e.K.                              | Uwe Kleine-König            |
Industrial Linux Solutions                    | http://www.pengutronix.de/  |

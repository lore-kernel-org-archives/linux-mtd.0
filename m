Received: from rwcrmhc13.comcast.net ([216.148.227.153])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FF6HV-0005mf-Ae
	for linux-mtd@lists.infradead.org; Fri, 03 Mar 2006 04:09:06 -0500
Date: Fri, 3 Mar 2006 01:09:23 -0800
From: Deepak Saxena <dsaxena@plexity.net>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Message-ID: <20060303090923.GA17881@plexity.net>
References: <20060212170441.GA28427@xi.wantstofly.org>
	<20060221135145.GA30056@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060221135145.GA30056@xi.wantstofly.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH,RFC] convert physmap to platform driver
Reply-To: dsaxena@plexity.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Feb 21 2006, at 14:51, Lennert Buytenhek was caught saying:
> Hi,
> 
> On Sun, Feb 12, 2006 at 06:04:41PM +0100, Lennert Buytenhek wrote:
> 
> > After dwmw2 let me know it ought to be done, I rewrote the physmap map
> > driver to be a platform driver.  I know zilch about the driver model,
> > so I probably botched it in some way, but I've done some tests on an
> > ixp23xx board which uses physmap, and it all seems to work.
> 
> I wonder whether anyone had a chance to look at this yet?

/me wonders same. Would like to see this upstream.

~Deepak

-- 
Deepak Saxena - dsaxena@plexity.net - http://www.plexity.net

A starving child in Africa or you in front of your TV?
Where's the real tragedy?

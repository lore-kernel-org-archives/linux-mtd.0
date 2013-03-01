Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBMkJ-00060h-I1
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2013 09:59:20 +0000
Date: Fri, 1 Mar 2013 10:59:14 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH] mtd/nand: don't use {read,write}_buf for 8-bit transfers
Message-ID: <20130301095914.GK22886@pengutronix.de>
References: <1361977852-18233-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <512EC54F.3090400@freescale.com> <513072F5.6010609@parrot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <513072F5.6010609@parrot.com>
Cc: Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 01, 2013 at 10:20:53AM +0100, Matthieu CASTET wrote:
> Huang Shijie a écrit :
> > 于 2013年02月27日 23:10, Uwe Kleine-König 写道:
> >> According to the Open NAND Flash Interface Specification (ONFI) Revision
> >> 3.1 "Parameters are always transferred on the lower 8-bits of the data
> >> bus." for the Get Features and Set Features commands.
> >>
> > yes. the set/get features should works in 8-bit.
> > 
> > I have never met a 16-bit onfi nand yet. :)
> 
> Beagle board got one.
Which part does it have? Would you volunteer to test access to its OTP
area? (Provided you have a Micron chip of course.)

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

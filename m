Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]
	helo=master.linux-sh.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LWQXO-00078k-O3
	for linux-mtd@lists.infradead.org; Mon, 09 Feb 2009 07:26:41 +0000
Date: Mon, 9 Feb 2009 15:56:32 +0900
From: Paul Mundt <lethal@linux-sh.org>
To: Adrian McMenamin <adrian@newgolddream.dyndns.info>
Subject: Re: [PATCH] sh: maple: add support for Visual Memory Card devices,
	and make consequential changes to maple input drivers - 2/3 - v5
Message-ID: <20090209065632.GA21980@linux-sh.org>
References: <1234122069.6736.8.camel@localhost.localdomain>
	<1234123473.6736.29.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1234123473.6736.29.camel@localhost.localdomain>
Cc: linux-sh <linux-sh@vger.kernel.org>, Greg KH <greg@kroah.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>, MTD <linux-mtd@lists.infradead.org>,
	linux-input <linux-input@vger.kernel.org>, dwmw2 <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Feb 08, 2009 at 08:04:33PM +0000, Adrian McMenamin wrote:
> Change the maple bus driver to support the visual memory unit driver.
> 
> The maple bus driver currently only supports synchronous polling of attached devices status. These changes allow
> the bus to handle asynchronous commands such as block reads and writes. 
> 
> Signed-off-by: Adrian McMenamin <adrian@mcmen.demon.co.uk>

The ordering of your patch series is a bit vague. Do the changes to the
maple bus code need to be made before the VMU patch can be applied? Do
the input driver changes have to be made at the same time as the changes
to the bus code, or are they ok to leave as a separate patch after the
bus changes?

All of these seem to have some interdependency issues that haven't been
noted at all, making it incredibly difficult to apply incrementally. Your
subject for the series also seems to imply you have no idea how they
logically structure, and that you simply hacked things up until the point
where everything worked, rather than paying attention to logical
incremental changes to show how you got from point A to point B without
breaking bisection along the way.

We do not want to have the tree in a state where bisection is broken, nor
do we want to apply huge monolothic changes that are unable to be clearly
broken out.

At this point the maple bus stuff I am fine with, and I have no real
objections to the driver patches either, it is more your methodology or
lack thereof that makes dealing with this rather taxing. If you want your
patches applied, small incremental patches that don't leave the tree in a
broken state are the way to go.

Presently I have no idea how to split this series up, and even if the
other subsystem folks add their Acked-bys, this will not be going in as
one large change.

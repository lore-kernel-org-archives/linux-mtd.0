Received: from [2002:d412:e8ba::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EmIE2-000256-HO
	for linux-mtd@lists.infradead.org; Tue, 13 Dec 2005 17:02:43 -0500
Date: Tue, 13 Dec 2005 22:01:57 +0000
From: Russell King <rmk+lkml@arm.linux.org.uk>
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20051213220157.GD24094@flint.arm.linux.org.uk>
References: <20051211192109.GA22537@flint.arm.linux.org.uk>
	<20051211193118.GR23349@stusta.de>
	<20051211194437.GB22537@flint.arm.linux.org.uk>
	<20051213001028.GS23349@stusta.de> <439ECDCC.80707@hogyros.de>
	<20051213140001.GG23349@stusta.de>
	<20051213173112.GA24094@flint.arm.linux.org.uk>
	<20051213180551.GN23349@stusta.de>
	<20051213200106.GC24094@flint.arm.linux.org.uk>
	<20051213201920.GT23349@stusta.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20051213201920.GT23349@stusta.de>
Sender: Russell King <rmk@arm.linux.org.uk>
Cc: tony.luck@intel.com, linux-ia64@vger.kernel.org, grundler@parisc-linux.org,
	matthew@wil.cx, linux-kernel@vger.kernel.org,
	linuxppc-dev@ozlabs.org, lethal@linux-sh.org, paulus@samba.org,
	linux-mtd@lists.infradead.org,
	Simon Richter <Simon.Richter@hogyros.de>, dwmw2@infradead.org,
	kkojima@rr.iij4u.or.jp, parisc-linux@parisc-linux.org
Subject: Re: [2.6 patch] don't allow users to set CONFIG_BROKEN=y
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 13, 2005 at 09:19:20PM +0100, Adrian Bunk wrote:
> On Tue, Dec 13, 2005 at 08:01:06PM +0000, Russell King wrote:
> > That means that the original review was _worthless_.  It wasn't a
> > review at all.
> > 
> > So, what I am trying to get across is the need to show the _full_ set
> > of changes to a default configuratoin when you disable CONFIG_BROKEN,
> > which is trivially producable if you run the script I've already posted.
> > 
> > You can even use that in conjunction with your present patch to produce
> > a patch which shows _exactly_ _everything_ which changes as a result of
> > disabling CONFIG_BROKEN.  Surely giving reviewers the _full_ story is
> > far better than half a story, and should be something that any change
> > to the kernel strives for.
> > 
> > If not, what's the point of the original change?
> 
> The point is that I haven't yet heard any good reason for 
> CONFIG_BROKEN=y in a defconfig.

I'm sorry, I feel like I'm beating my head against a brick wall.  I
have said everything that needs to be said, and made my position on
this patch crystal clear.

The patch to the ARM configuration files is nacked as it stands.
Please go back and rework it along the guidelines I've pointed out
several times in this thread and maybe then it becomes acceptable.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 Serial core

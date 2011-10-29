Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKFct-00086i-9z
	for linux-mtd@lists.infradead.org; Sat, 29 Oct 2011 20:35:39 +0000
Received: by bke11 with SMTP id 11so2685436bke.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 29 Oct 2011 13:35:33 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd: tests: don't use mtd0 as a default
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Sat, 29 Oct 2011 23:35:28 +0300
In-Reply-To: <20111029202809.GA26851@pengutronix.de>
References: <1319533791-32605-1-git-send-email-w.sang@pengutronix.de>
	<1319919909.2126.15.camel@koala>
	<20111029202809.GA26851@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1319920531.2126.21.camel@koala>
Mime-Version: 1.0
Cc: Roland Kletzing <devzero@web.de>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2011-10-29 at 22:28 +0200, Wolfram Sang wrote:
> On Sat, Oct 29, 2011 at 11:25:07PM +0300, Artem Bityutskiy wrote:
> > On Tue, 2011-10-25 at 11:09 +0200, Wolfram Sang wrote:
> > > mtd tests may erase the mtd device, so force the user to specify which
> > > mtd device to test by using the module parameter. Disable the default
> > > (using mtd0) since this may destroy a vital part of the flash if the
> > > module is inserted accidently or carelessly.
> > > 
> > > Reported-by: Roland Kletzing <devzero@web.de>
> > > Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> > 
> > Note, I've pushed this patch to l2-mtd-2.6.git, thanks!
> 
> Ah, I am just about to test V2 of this patch :)

I thought we need to have a fix faster so decided to push your patch as
it is, and then add some printks on top of that.

> You didn't like PATCH 2/2?

Just replied - I am not sure about the EXPERIMENTAL dependency you add.

Artem.

Received: from www.tglx.de ([62.245.132.106])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Px49c-0006u0-MY
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2011 21:09:17 +0000
Date: Tue, 8 Mar 2011 22:08:36 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH/RFC v2 1/3] Shared BCH ECC library
In-Reply-To: <1299587945.2754.32.camel@localhost>
Message-ID: <alpine.LFD.2.00.1103082206270.2787@localhost6.localdomain6>
References: <181c9a1c88b781116615761109cccdf89ea877a1.2296641159.git.ivan.djelic@parrot.com>
	<20110308111548.GA6628@parrot.com>
	<1299587945.2754.32.camel@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 8 Mar 2011, Artem Bityutskiy wrote:

> On Tue, 2011-03-08 at 12:15 +0100, Ivan Djelic wrote:
> > On Mon, Feb 07, 2011 at 02:09:30PM +0000, Ivan Djelic wrote:
> > > Hello,
> > > 
> > > The first patch of this series contains a new generic BCH ECC library.
> > 
> > Hi,
> > 
> > It has been a month since this patch was posted, and I did not receive any
> > comment/review yet.
> 
> I can add it to my l2 tree and may be dwmw2 can merge it then. But could
> you please re-send a version with better Kconfig help messages?

I had a quick look. The code looks pretty clean and well documented,
though I did not dig into the details. There are a few comments
"lifted from ...", I hope the code which is copied does not cause any
license issues.

Thanks,

	tglx

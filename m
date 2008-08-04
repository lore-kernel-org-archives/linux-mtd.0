Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KQ6nM-00042m-ST
	for linux-mtd@lists.infradead.org; Mon, 04 Aug 2008 20:36:48 +0000
Date: Mon, 4 Aug 2008 22:17:15 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] MTD: OMAP2-NAND: Fix partition reading from board info
Message-ID: <20080804201715.GD31974@xi.wantstofly.org>
References: <9c9fda240807011627v60428f9eh3c2bb17cdc8ce6ea@mail.gmail.com>
	<DFEF307E035C8647B119E6A60DB62D4AE47C155A@dlee02.ent.ti.com>
	<20080804142426.GK8885@atomide.com>
	<200808041302.46323.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200808041302.46323.david-b@pacbell.net>
Cc: Tony Lindgren <tony@atomide.com>, "Kamat, Nishant" <nskamat@ti.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	Kyungmin Park <kmpark@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 04, 2008 at 01:02:46PM -0700, David Brownell wrote:

> > Looks like this driver does not exist outside linux-omap tree,
> > care to send the whole driver to MTD list?
> 
> Unless someone created a big-endian OMAP,

Don't they use standard ARM ARM cores, which can all be used in both
LE and BE modes?

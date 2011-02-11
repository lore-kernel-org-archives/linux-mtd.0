Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PnuGC-00083t-JS
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 14:46:13 +0000
In-Reply-To: <1297432936.2760.24.camel@localhost>
References: <1297094831-10330-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1297432936.2760.24.camel@localhost>
Subject: Re: [PATCH] mtd: fix race in cfi_cmdset_0001 driver
To: dedekind1@gmail.com
Message-ID: <OFB4CE4BA6.2B710A36-ONC1257834.0050DBAB-C1257834.00512172@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Fri, 11 Feb 2011 15:46:09 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: Stefan Bigler <stefan.bigler@keymile.com>, linux-mtd@lists.infradead.org,
	Michael Cashwell <mboards@prograde.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> wrote on 2011/02/11 15:02:16:
>
> On Mon, 2011-02-07 at 17:07 +0100, Joakim Tjernlund wrote:
> > As inval_cache_and_wait_for_operation() drop and reclaim the lock
> > to invalidate the cache, some other thread may suspend the operation
> > before reaching the for(;;) loop. Therefore the loop must start with
> > checking the chip->state before reading status from the chip.
> >
> > Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
>
> Am I right that this patch should be ignored and a new patch will be
> created?

No, this is the real thing. Should go to Linus ASAP.

There is a hunt for another flash HW related bug hunt ongoing too
that may result in another patch touching other areas.

 Jocke

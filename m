Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MxIzc-0007pu-PL
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 11:23:12 +0000
Date: Mon, 12 Oct 2009 13:23:04 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] panic.c: export panic_on_oops
Message-ID: <20091012132304.52d4646c@marrow.netinsight.se>
In-Reply-To: <20091012111545.GB8857@elte.hu>
References: <1255241458-11665-1-git-send-email-dedekind1@gmail.com>
	<20091012111545.GB8857@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Aaro Koskinen <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 12 Oct 2009 13:15:45 +0200
Ingo Molnar <mingo@elte.hu> wrote:

> * Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> > We use the mtdoops module which stores oopses on the Flash partition,
> > in order to make it possible to analyze them later. And mtdoops needs
> > to know whether 'panic_on_oops' is on or off. Thus, we need this
> > variable to be exported.
> 
> hm, why does it need it? Could you send the patch please that makes use 
> of it (as an easy way to explain the need for the export) - current 
> upstream drivers/mtd/mtdoops.c doesnt need it so it must be some pending 
> change.

You have the patch that requires it here:

  http://patchwork.ozlabs.org/patch/34732/

it's a fix to allow mtdoops to actually store oopses which happen when
panic_on_oops is set (before these would be missed as the write would
never be done).

// Simon

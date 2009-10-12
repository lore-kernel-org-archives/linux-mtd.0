Received: from mx3.mail.elte.hu ([157.181.1.138])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MxIsc-0003sl-Eq
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 11:15:59 +0000
Date: Mon, 12 Oct 2009 13:15:45 +0200
From: Ingo Molnar <mingo@elte.hu>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] panic.c: export panic_on_oops
Message-ID: <20091012111545.GB8857@elte.hu>
References: <1255241458-11665-1-git-send-email-dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1255241458-11665-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Aaro Koskinen <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
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


* Artem Bityutskiy <dedekind1@gmail.com> wrote:

> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> 
> We use the mtdoops module which stores oopses on the Flash partition,
> in order to make it possible to analyze them later. And mtdoops needs
> to know whether 'panic_on_oops' is on or off. Thus, we need this
> variable to be exported.

hm, why does it need it? Could you send the patch please that makes use 
of it (as an easy way to explain the need for the export) - current 
upstream drivers/mtd/mtdoops.c doesnt need it so it must be some pending 
change.

	Ingo

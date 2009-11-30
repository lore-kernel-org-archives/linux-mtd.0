Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NF2yE-0006iZ-Pk
	for linux-mtd@lists.infradead.org; Mon, 30 Nov 2009 09:55:07 +0000
Date: Mon, 30 Nov 2009 10:54:51 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH/RFC v5 4/5]: core: Add dump device to call on oopses and
	panics
Message-ID: <20091130095451.GA15335@logfs.org>
References: <20091012182346.GH17138@elte.hu>
	<alpine.LFD.2.01.0910121130190.3438@localhost.localdomain>
	<20091013151751.59e217a7@marrow.netinsight.se>
	<20091013152235.188059d2@marrow.netinsight.se>
	<20091126093657.GA25430@logfs.org>
	<1259566071.7518.48.camel@localhost>
	<20091130074603.GA30911@logfs.org>
	<1259571118.7518.56.camel@localhost>
	<20091130093541.GA14254@logfs.org>
	<1259574055.7518.80.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1259574055.7518.80.camel@localhost>
Cc: David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Ingo Molnar <mingo@elte.hu>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 30 November 2009 11:40:55 +0200, Artem Bityutskiy wrote:
> 
> The other alternative I was thinking about was to introduce a boolean
> flag, and set it to one as soon as 'lon_end' becomes larger than
> 'log_buf_len'.

I've thought about that as well.  The drawback is that we would have to
check in the regular printk path - by the time the panic notifier is
running it is too late.  So it adds cost to the regular case.

Jörn

-- 
There are three principal ways to lose money: wine, women, and engineers.
While the first two are more pleasant, the third is by far the more certain.
-- Baron Rothschild

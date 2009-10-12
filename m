Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]
	helo=www.etchedpixels.co.uk)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MxKcR-0008Lx-W1
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 13:07:25 +0000
Date: Mon, 12 Oct 2009 14:08:21 +0100
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] panic.c: export panic_on_oops
Message-ID: <20091012140821.5dfa1598@lxorguk.ukuu.org.uk>
In-Reply-To: <20091012123210.GB22766@elte.hu>
References: <1255241458-11665-1-git-send-email-dedekind1@gmail.com>
	<20091012111545.GB8857@elte.hu>
	<1255346731.9659.31.camel@localhost>
	<20091012113758.GB11035@elte.hu>
	<20091012140149.6789efab@marrow.netinsight.se>
	<20091012120951.GA16799@elte.hu>
	<20091012142714.56362465@marrow.netinsight.se>
	<20091012123210.GB22766@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>, "Koskinen Aaro
	\(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> See my reply to David Woodhouse, i think we should add support for 
> buffering in kernel/printk.c and that would both fix your problems, 
> would simplify the driver (significantly!) and would expose the generic 
> buffering capability to other console drivers as well.

Buffering printk in general is bad. Given a driver needs only to provide
about 6 lines of code using a kfifo is it really that hard for the odd
code that wants to buffer to do that ?

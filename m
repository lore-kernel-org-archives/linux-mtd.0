Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P27Sl-0000Zw-Lo
	for linux-mtd@lists.infradead.org; Sat, 02 Oct 2010 19:09:40 +0000
Date: Sat, 2 Oct 2010 12:10:39 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: dedekind1@gmail.com
Subject: Re: [patch 2/2] jffs2: use cond_resched() instead of yield()
Message-Id: <20101002121039.5e0676f6.akpm@linux-foundation.org>
In-Reply-To: <1286028475.32172.12.camel@brekeke>
References: <201010012116.o91LGSlt021122@imap1.linux-foundation.org>
	<1286028475.32172.12.camel@brekeke>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, dedekind@infradead.org, w.sang@pengutronix.de,
	linux-mtd@lists.infradead.org, mingo@elte.hu, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 02 Oct 2010 17:07:55 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Fri, 2010-10-01 at 14:16 -0700, akpm@linux-foundation.org wrote:
> > From: Wolfram Sang <w.sang@pengutronix.de>
> > 
> > yield() has different semantics meanwhile and even causes RT-kernels to
> > BUG.  Replace the only appearance left in jffs2.
> > 
> 
> This patch is also in my l2-mtd-2.6.git tree.

And I'll keep sending it and you'll keep telling me it's in your tree
until this situation gets fixed.

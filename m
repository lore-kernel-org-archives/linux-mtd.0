Received: from mgw-sa02.nokia.com ([147.243.1.48])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oxg1E-0001Oh-Uk
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2010 13:02:53 +0000
Subject: Re: [RFC] jffs2: use cond_resched() instead of yield()
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Wolfram Sang <w.sang@pengutronix.de>
In-Reply-To: <1283357021-16187-1-git-send-email-w.sang@pengutronix.de>
References: <1283357021-16187-1-git-send-email-w.sang@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 20 Sep 2010 16:00:59 +0300
Message-ID: <1284987659.5258.43.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ingo Molnar <mingo@elte.hu>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-01 at 18:03 +0200, Wolfram Sang wrote:
> yield() has different semantics meanwhile and even causes RT-kernels to
> BUG. Replace the only appearance left in jffs2.
> 
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Cc: Ingo Molnar <mingo@elte.hu>

FYI, I've pushed this patch to my l2-mtd-2.6.git tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

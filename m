Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q5eI-0004V7-Dc
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 14:28:22 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: angainor@evo.evopolska.com
In-Reply-To: <Pine.LNX.4.44.0306111500380.14555-100000@evo.evopolska.com>
References: <Pine.LNX.4.44.0306111500380.14555-100000@evo.evopolska.com>
Message-Id: <1055338133.2097.102.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 11 Jun 2003 14:28:53 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: MTD drivers for DoC Millenium Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-06-11 at 14:13, angainor@evo.evopolska.com wrote:

> Guys, really, has nobody even run this code once
> to see if it works? add_mtd_blktrans_dev is a function.
> It needs arguments. Specifically, it needs to feed on
> &inftl->mbd. So this should actually be:

Oops. Sorry. No -- it wasn't tested. I tested FTL and mtdblock when
converting to the new mtd_blktrans stuff but not NFTL and INFTL. Barring
stupid typos, I expected it to 'just work'.

-- 
dwmw2

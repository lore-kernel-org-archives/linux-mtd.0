Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pruzn-0000Vj-Ej
	for linux-mtd@lists.infradead.org; Tue, 22 Feb 2011 16:21:52 +0000
Date: Tue, 22 Feb 2011 18:21:43 +0200
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 3/3] mtd: Add mtdswap block driver
Message-ID: <20110222162143.GA13529@angel.research.nokia.com>
References: <1297692971-7399-1-git-send-email-jarkko.lavinen@nokia.com>
	<1297692971-7399-4-git-send-email-jarkko.lavinen@nokia.com>
	<1298038470.5623.50.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1298038470.5623.50.camel@localhost>
Cc: linux-mtd@lists.infradead.org
Reply-To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 18, 2011 at 04:14:30PM +0200, ext Artem Bityutskiy wrote:
> ... what's the problem with re-trying the erase operation - it
> looks like over-design.

> Is it please possible to remove this config option?

I have a Hynix SLC OneNand spec which says an erase block with an
erase failure or a write error should not be re-written or erased
again but instead just garbage collected and marked bad.

If I switch permanently to the strict erase failure handling, bad
block marking could be too sensitive for some devices expecting
retries.

If I switch permanently to the lenient mode, mtdswap would retry
failed erases which would be against chip spec of at least the one
OneNand chip I am working with.

If I remove the config option it would then mean strict handling
only.

Jarkko

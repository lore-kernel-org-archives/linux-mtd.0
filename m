Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19V9bq-0002yK-SI
	for <linux-mtd@lists.infradead.org>; Wed, 25 Jun 2003 13:42:46 +0100
From: David Woodhouse <dwmw2@redhat.com>
To: Russell King <rmk@arm.linux.org.uk>
In-Reply-To: <20030623010031.E16537@flint.arm.linux.org.uk>
References: <20030623010031.E16537@flint.arm.linux.org.uk>
Message-Id: <1056544988.24294.9.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 25 Jun 2003 13:43:09 +0100
Sender: David Woodhouse <dwmw2@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Fix mtdblock / mtdpart / mtdconcat
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-06-23 at 01:00, Russell King wrote:
> Dirtily disable ECC support; it doesn't work when mtdpart is layered
> on top of mtdconcat on top of CFI flash.
> 
> There is probably a better fix, but that's for someone else to find.

I had to run 'indent' on mtdconcat.c before I could stand to even look
for it, so I haven't attached the patch here -- but could you try v1.6
from CVS, which should refrain from pretending to have ecc/oob access
functions of none of the subdevices have them, and hence fix the problem
you observed.

-- 
dwmw2

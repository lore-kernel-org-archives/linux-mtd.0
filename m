Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BtZEP-0000mR-H3
	for linux-mtd@lists.infradead.org; Sat, 07 Aug 2004 18:00:02 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Russell King <rmk+lkml@arm.linux.org.uk>
In-Reply-To: <20040807150458.E2805@flint.arm.linux.org.uk>
References: <20040807150458.E2805@flint.arm.linux.org.uk>
Content-Type: text/plain
Message-Id: <1091915997.1438.106.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sat, 07 Aug 2004 22:59:58 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] 2.6.8-rc3 slab corruption (jffs2?)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2004-08-07 at 15:04 +0100, Russell King wrote:
> Any ideas?  I haven't been able to reproduce (presumably because the
> erase succeeded, and we didn't need to re-erase again.)

Hmmm. None right now. Will take a closer look in the morning. Thanks for
the reports.

-- 
dwmw2

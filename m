Received: from sorrow.cyrius.com ([65.19.161.204])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lq8FB-0002z0-6q
	for linux-mtd@lists.infradead.org; Sat, 04 Apr 2009 15:57:23 +0000
Date: Sat, 4 Apr 2009 17:34:33 +0200
From: Martin Michlmayr <tbm@cyrius.com>
To: Peter Horton <zero@colonel-panic.org>
Subject: Re: [PATCH] Fix erase timeout in M25P80 driver
Message-ID: <20090404153433.GA10090@deprecation.cyrius.com>
References: <20090404143848.GA13480@turtle.localnet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090404143848.GA13480@turtle.localnet>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Peter Horton <zero@colonel-panic.org> [2009-04-04 15:38]:
> Extend erase timeout in M25P80 SPI Flash driver.
> 
> The M25P80 drivers fails erasing sectors on a M25P128 because the ready
> wait timeout is too short. Change the timeout from a simple loop count to a
> suitable number of seconds.
> 
> Signed-off-by: Peter Horton <zero@colonel-panic.org>

Tested-by: Martin Michlmayr <tbm@cyrius.com>

This solves the problem I've seen on the QNAP TS-219.
-- 
Martin Michlmayr
http://www.cyrius.com/

Received: from sorrow.cyrius.com ([65.19.161.204])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LtS1V-0001jO-Ob
	for linux-mtd@lists.infradead.org; Mon, 13 Apr 2009 19:41:12 +0000
Date: Mon, 13 Apr 2009 21:33:11 +0200
From: Martin Michlmayr <tbm@cyrius.com>
To: Peter Horton <zero@colonel-panic.org>
Subject: Re: [PATCH] mtd: fix timeout in M25P80 driver
Message-ID: <20090413193311.GA16597@deprecation.cyrius.com>
References: <20090413142633.GA1560@sloth.localnet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090413142633.GA1560@sloth.localnet>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Peter Horton <zero@colonel-panic.org> [2009-04-13 15:26]:
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

Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EcqQn-0006jP-8E
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2005 15:32:34 -0500
Date: Thu, 17 Nov 2005 21:13:56 +0100
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20051117201356.GA25011@xi.wantstofly.org>
References: <20051117194056.GA24824@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20051117194056.GA24824@xi.wantstofly.org>
Cc: tglx@linutronix.de
Subject: Re: [PATCH] fix ixp2000 map driver compile
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 17, 2005 at 08:40:57PM +0100, Lennert Buytenhek wrote:

> The recent platform driver conversion broke the ixp2000 map driver.
> The attached patch attempts to repair it, and now it appears to work
> once again.

Apologies -- I've just been told that a patch to fix this was
already submitted upstream by rmk.


--L

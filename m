Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bk07D-0007wV-K9
	for linux-mtd@lists.infradead.org; Mon, 12 Jul 2004 08:41:03 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: "Robert P. J. Day" <rpjday@mindspring.com>
In-Reply-To: <Pine.LNX.4.60.0407120809110.10442@localhost.localdomain>
References: <Pine.LNX.4.60.0407120809110.10442@localhost.localdomain>
Content-Type: text/plain
Message-Id: <1089636058.2899.18.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 12 Jul 2004 13:40:58 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: eraseall causes kernel panic with newer kernel
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-07-12 at 08:23 -0400, Robert P. J. Day wrote:
> Call backtrace:
> C000D7B0 C0097060 C0099C14 C00980D0 C009819C C0091440 C0092C60
> C0047A4C C000447C 0FF13EF8 10000688 0FEBCE88 00000000
> Kernel panic: Aiee, killing interrupt handler!

Meaningless numbers are not useful. Please enable kksymoops.

-- 
dwmw2

Received: from hex.linuxgrrls.org ([212.18.228.73] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16JbUc-0000bj-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Dec 2001 14:26:46 +0000
Date: Thu, 27 Dec 2001 14:37:36 +0000 (GMT)
From: kira brown <kira@hex.linuxgrrls.org>
To: Chris Fowler <cfowler@outpostsentinel.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: msys/fla
In-Reply-To: <NFBBLCEFBCFEPMJJKOIKAEAKCBAA.cfowler@outpostsentinel.com>
Message-ID: <Pine.LNX.4.33.0112271434101.3571-100000@hex.linuxgrrls.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


On Thu, 27 Dec 2001, Chris Fowler wrote:

> DOC2000.  I use the first for testing.  On the 2nd I appear to get high load
> averages.

Why does this worry you?

Load averages are not really meaningful-  all they signify is the number
of processes that are blocked.  Blocked processes are an indicator that
your IO world isn't fast enough to satisfy your processor;  and indeed, if
you're forcing the flash to write any volume of data, and thus to erase
frequently, your storage is going to be blocking on you as the Flash is
garbage collected, erased and rewritten.

kira.

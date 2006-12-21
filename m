Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GxTRU-0007S6-Aa
	for linux-mtd@lists.infradead.org; Thu, 21 Dec 2006 14:19:03 -0500
Received: from xanadu.home ([74.56.106.175]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0JAN00I3E1NNEA71@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 21 Dec 2006 14:18:59 -0500 (EST)
Date: Thu, 21 Dec 2006 14:18:59 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH/RFC] CFI XIP support on chip with RWW
In-reply-to: <Pine.LNX.4.64.0612211514580.18123@pentafluge.infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
Message-id: <Pine.LNX.4.64.0612211400470.18171@xanadu.home>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <Pine.LNX.4.64.0612211514580.18123@pentafluge.infradead.org>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 21 Dec 2006, Alexey Korolev wrote:

> Hi
> 
> The XIP awareness feature in MTD provides a safe way to use XIP but it
> introduces some significant issues too,
> The issues are following:
> 
> 1.	Large interrupt latency
> 2.	Lower write/erase performance (due to suspend/resume) 3.	~100%
> CPU load during write or erase operations with flash
> 
> In other hands if chip with Read While Write feature (or several chips) are
> used it is possible to avoid all these XIP related issues.

Yep.

> To provide it from s/w it is necessary to separate wait procedures for RWW
> partitions with XIP and without XIP. Idea is simple user specify memory region
> planned for XIP - according to this data, the code marks XIP flag for some RWW
> partitions. RWW partitions with XIP flag are handled by wait procedures with
> XIP awareness. All other RWW partitions are handled by default wait
> procedures. Please see the code below. Your comments are welcom

There are small coding style issues, like "if ( foo )" instead of
"if (foo)", please see Documentation/CodingStyle).

Also wouldn't it be better to identify the XIP-able area(s) with new MTD 
partition flags instead?


Nicolas

Received: from [216.208.38.106] (helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19gQfv-0006Di-9Z
	for <linux-mtd@lists.infradead.org>; Sat, 26 Jul 2003 16:09:35 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <200307261339.13142.tglx@linutronix.de>
References: <a05200f4ebb46f6708c1c@[130.161.115.44]>
	 <1059148567.28255.47.camel@lapdancer.baythorne.internal>
	 <a05200f05bb4803789a4f@[130.161.115.44]>
	 <200307261339.13142.tglx@linutronix.de>
Message-Id: <1059232112.539.5.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Sat, 26 Jul 2003 11:08:34 -0400
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Subject: Re: Handling multiple NAND chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2003-07-26 at 07:39, Thomas Gleixner wrote:
> You can do this, but the question is, if it is really an advantage.

Dunno. In general, interrupt-driven operation is an advantage over
polling -- it lets us get on with something else while we're waiting for
the flash, and come straight back to the flash driver when it's done.
Given the latencies involved on NAND, though, it might not really be
worth the effort -- but I'd like to investigate.

-- 
dwmw2

Received: from [216.208.38.106] (helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19goPC-0003Hh-Cu
	for <linux-mtd@lists.infradead.org>; Sun, 27 Jul 2003 17:29:54 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
In-Reply-To: <a05200f0ebb49894ef8cf@[130.161.115.44]>
References: <a05200f4ebb46f6708c1c@[130.161.115.44]>
	 <1059147413.28255.40.camel@lapdancer.baythorne.internal>
	 <a05200f01bb4700e6ff94@[130.161.115.44]>
	 <1059148567.28255.47.camel@lapdancer.baythorne.internal>
	 <a05200f0cbb497a9284c1@[130.161.115.44]>
	 <1059313332.9895.3.camel@lapdancer.baythorne.internal>
	 <a05200f0ebb49894ef8cf@[130.161.115.44]>
Message-Id: <1059323325.9895.6.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Sun, 27 Jul 2003 12:28:47 -0400
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Handling multiple NAND chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2003-07-27 at 09:58, J.D. Bakker wrote:
> I was wondering what to do when 'chip' is larger than the maximum 
> number of NANDs. Currently I silently deselect all devices when that 
> happens.

Well, it'll never be higher than the maximum number passed into
nand_scan(). It's a should-never-happen case; I'd rather you BUG() if
you're going to check for it at all.

> [just tried to insmod my first cut of the lartcan NAND driver -- blew 
> up with 'partition extends beyond the end of device "<NULL>"' and a 
> bunch of divisions by zero. Back to the drawing board...]

Leave out the partitioning until the basic NAND code is working?

-- 
dwmw2

Received: from dhcp695.linuxsymposium.org ([209.151.10.193]
	helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19g4wd-0003W3-6C
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jul 2003 16:57:23 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
In-Reply-To: <a05200f01bb4700e6ff94@[130.161.115.44]>
References: <a05200f4ebb46f6708c1c@[130.161.115.44]>
	 <1059147413.28255.40.camel@lapdancer.baythorne.internal>
	 <a05200f01bb4700e6ff94@[130.161.115.44]>
Message-Id: <1059148567.28255.47.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Fri, 25 Jul 2003 11:56:09 -0400
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

On Fri, 2003-07-25 at 11:51, J.D. Bakker wrote:
> I have a two-hour old CVS; where should I look ?

The fact that select_chip() now takes a 'chip_number' argument, that
nand_scan() now takes a 'max_chips' argument and probes for up to that
many... next is to fix the read/write/erase functions to select the
_correct_ chip according to the address, etc. 

> Does it *help* to have separate data/CLE/ALE ?

Probably not. What may help, and to be honest I won't be 100% sure till
we actually come to implement it, is having separate FR/B# so you can
happily poll for completion and leave multiple chips _busy_
independently.

-- 
dwmw2

Received: from [216.208.38.106] (helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19gQdt-0006BT-N4
	for <linux-mtd@lists.infradead.org>; Sat, 26 Jul 2003 16:07:29 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
In-Reply-To: <a05200f05bb4803789a4f@[130.161.115.44]>
References: <a05200f4ebb46f6708c1c@[130.161.115.44]>
	 <1059147413.28255.40.camel@lapdancer.baythorne.internal>
	 <a05200f01bb4700e6ff94@[130.161.115.44]>
	 <1059148567.28255.47.camel@lapdancer.baythorne.internal>
	 <a05200f05bb4803789a4f@[130.161.115.44]>
Message-Id: <1059231977.539.2.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Sat, 26 Jul 2003 11:06:19 -0400
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

On Sat, 2003-07-26 at 06:22, J.D. Bakker wrote:
> Ah, I see. Are you planning to always treat the NANDs as a linear 
> array ? 

Yeah -- I think so. Any reason not to?

> As I obviously have access to multi-NAND hardware, I'll 
> happily beta-test this WIP.

Thanks ;)

> Polling should be possible through the Status Read command 
> (0x70/0x71) anyway, right ? Or would you want hardware to generate an 
> interrupt when any of the FR/B# lines change ? Hmmm...

During an erase, polling should be possible -- but what about waiting
for the chip to be ready after a reset, etc.? If another chip is
erasing, your FR/B# line is pulled low, I assume?

-- 
dwmw2
